---
layout: post
title: Why I switched to Amazon EC2 hosting and then Heroku
excerpt: 
category: opinion
---

I used to host my blog at [Media Temple][] which provided a great virtual dedicated hosting platform called (ve).  The server gives you full control and hosting starts at $30 a month.  Very reasonable and very powerful.  Recently I switched to [Jekyll][] for blogging which allows you to pre-generate content so that you only need to deploy static files to your web server.  With a system like this in place, there is no need for a database or app server, just a simple web server.  You could use a system like [Ngnix][] which reduces your overhead pretty significantly.  

I'm currently using an [Amazon EC2][] micro server to host this blog and I plan to eventually move to S3 for hosting as soon as Amazon allows me to point my DNS A records at it.  (They currently only allow CNAME records.)

Setup is not easy on Amazon, you are going to need to configure a complete server so I don't recommend it for novice users.  There are freely available pre-built servers that are provided by the Amazon community, but I don't recommend those because you really never know what someone else installed.  I've seen root keys embedded in the default profile so that someone could root your box with their own key.  

One of the big advantages of Amazon EC2 over a provider like Media Temple is that you can easily spawn a new site based on your old one, test out some new settings, and then shut it down, all without needing to pay more than the few hours of time that you had the server running.  (Amazon bills hourly for servers.)  With Media Temple, I'm having to throw down a month's worth of cash just to turn on a new box.

I would still recommend [Media Temple][] for those that don't want to mess with managing their own servers.  For me, I'm staying with [Amazon EC2][].

### Update ###

Okay, so I'm not staying with Amazon EC2.  In the end I switched to [Heroku][].  Part of my blog has a feed that shows you my most recent activity across Google Reader, Github, Twitter, etc..  In order to generate that feed, I need to execute a PHP script.  Or do I?  Turns out I don't really need a real-time feed, so I just generate the feed when I deploy another blog posting.  

So, with that, I decided to deploy my blog to [Heroku][].  Wow is this thing fast.  So what is [Heroku][]?  It is a platform to host Ruby apps.  Why would I choose this over Amazon?  Well for one it is cheap as hell.  (Free for small stuff.)  The other consideration is that this platform uses a pure git workflow which is something that I find very appealing.  

I'll post up a "how to host your jekyll blog on Heroku" article in the near future.

[Media Temple]:http://www.mediatemple.com
[Jekyll]:http://github.com/mojombo/jekyll
[Ngnix]:http://www.ngnix.org
[Amazon EC2]:http://aws.amazon.com
[Heroku]:http://www.heroku.com