---
layout: post
title: Redis, Ohm and Heroku make caching data super fast
excerpt: 
category: 
---
My blog is mostly static content.  I write the articles, pass them through Jekyll which transforms them into static HTML and then they get pushed up to my Heroku box where they are served.  This system works great until you want to have a live activity feed.  I've got one on my main page showing the latest from RSS feeds on Twitter, Google Reader, Github and a few others.  You could probably manage this in javascript, but Heroku and Ruby came calling so this is how I created my feed.

![ScreenShotOfFeed][]

First I thought, okay I'll just parse the feeds after the page loads.  I hooked in some javascript:

{% highlight javascript %}
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/
	libs/jquery/1.3.2/jquery.min.js"></script> 
	<script type="text/javascript">$(document).ready(function()
	{$("#elsewhere").load("/feed/");});</script>
{% endhighlight %}

Next I thought I'd just read the feeds.  I found this great Ruby gem called [Feedzirra][] which fetches and parses RSS and ATOM feeds.  Perfect.  I implemented it and boom, I had feeds.  But I also had a problem.  The feeds took time to load and the more URL's that I add, the longer they will take.  People aren't going to sit around waiting for them.  Time to cache.

At first I thought I would write the feeds to a file on Heroku and then just read that.  Not going to happen.  Heroku does not let you write local files.  So I need to either keep this data in memory, but how?

Enter [Redis][] a key value store with high performance and low overhead.  This will work, but I want to store my Ruby objects in there, how am I going to do that?  Enter [Ohm][] object hash mapping for Redis.  Perfect, now I can write my feed.  (I'm just starting with Ruby, so the following is a hack.)

### Model

{% highlight ruby %}
require 'ohm'
  
  class Feeder < Ohm::Model
    attribute :title
    attribute :published
    attribute :feed_id
    attribute :url
    attribute :content
    attribute :service
    index :published
  end

  
  class FeederContainer < Ohm::Model
    attribute :date
    list :feeds, Feeder
    index :date
  end
{% endhighlight %}

### Controller

{% highlight ruby %}

require 'rubygems' 
require 'nokogiri'
require 'open-uri'
require 'feedzirra'
require 'redis'
require 'time'
require 'feeder'

class FeederController < ApplicationController

  def list
    
    @feedurls = THE_FEED_URLS  # This is a global of just URL's in an array
    @total_feeds = NUM_FEEDS # So is this a global integer
    @n = 0
                              
    Ohm.connect(:url => "redis://your_connection_here")
    
    feedTime = FeederContainer[1].date unless FeederContainer[1] == nil
    feedTime = (Time.now - Time.parse(feedTime)).round unless 
		feedTime == nil
    
    print "Retrieving and combining feeds.\n"
     
    if feedTime == nil or feedTime > 1800 then
    
      puts "Feed is stale, getting new feed."
      
      Ohm.flush
      
      # Create the storage
      feedContainer = FeederContainer.create(:date => Time.now)
      
        @feedurls.each do |feed|
            rawfeed = Feedzirra::Feed.fetch_and_parse(feed)            
            rawfeed.entries.each do |entry|
              feedContainer.feeds << Feeder.create(:content => 
				entry.content, :title => entry.title, :url => entry.url, 
				:published => entry.published, :feed_id => entry.entry_id )
            end
        end

        @feedlist = feedContainer.feeds.all             
        @feedlist.sort! {|a,b| Date.parse(b.published) <=> 
			Date.parse(a.published)}
        print "Total feed items: ", @feedlist.size, "\n"
    else

      puts "Feed is good, getting cached feed."
      @feedlist = FeederContainer[1].feeds.all
      @feedlist.sort! {|a,b| Date.parse(b.published) <=> 
		Date.parse(a.published)}     
      print "Total feed items: ", @feedlist.size, "\n"
    end
  end
end

{% endhighlight %}

### View ###
{% highlight ruby %}
<% @feedlist.each do |entry| %>
    <%

	if @n > NUM_FEEDS then
		break
	end
    if entry.url.include? "twitter.com" then
    	classname="twitter"
    	servicename="Twitter"
    elsif entry.url.include? "github.com" then
    	classname="github"
    	servicename="Github"
    elsif entry.url.include? "flickr.com" then
    	classname="flickr"
    	servicename="Flickr"
    elsif entry.url.include? "youtube.com" then
    	classname="youtube"
    	servicename="YouTube"
    elsif entry.feed_id.include? "google.com" then
    	classname="reader"
    	servicename="Google Reader"
    end
	
	unless entry.content == nil then
		# Display the comments between the blockquote tags
		content = Nokogiri::HTML(entry.content).css("blockquote").map 
		{|blockquote| blockquote.content}	
	end

	@n = @n+1
    %>
    <li>
        <div class="archive-date"><%=Date.parse(entry.published)
			.strftime("%b %d, %Y")%></div>
        <div class="<%=classname%>"></div>
        <div class="archive-link"><a href="<%=entry.url.sanitize%>">
			<%=entry.title%></a></div>
		<% unless content == nil then %>
			<div class="archive-comment"><%=content%></div>
		<% end %>
    </li>
	
<% end %>
{% endhighlight %}

### Conclusion ###

I wrote this code pretty quickly and it would probably scale well.  Heroku and Ruby are a pretty powerful combination.


[ScreenShotOfFeed]:http://joshkerr.s3.amazonaws.com/images/myfeed.png
[Feedzirra]:http://github.com/pauldix/feedzirra
[Redis]:http://redis.io
[Ohm]:http://github.com/soveran/ohm