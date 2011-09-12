---
layout: post
title: Easily add search to a static blog
excerpt:
category: tips
---
Static blog sites like those powered by [Jekyll] use a locally running generator to create static content which is uploaded to your web host.  So with a static site, how are you going to power a search engine?

Leave it to the folks at Google to create a very ajaxy way to add search that integrates quite well with a static site.  Here is a quick tutorial:

First, you need a Google code API key which you can get [here].

Second, you need to add this code before your html head tag:

{% highlight html %}
<script src="http://www.google.com/jsapi?key=your_api_key" 
type="text/javascript"></script>
<script language="Javascript" type="text/javascript">
  
  google.load("search", "1");
  
  function OnLoad() {
    // Create a search control
    var searchControl = new google.search.SearchControl();
    
    // Add in a WebSearch
    var webSearch = new google.search.WebSearch();
    
    // Restrict our search to pages from this site
    webSearch.setSiteRestriction('your site url');
    
    // Add the searcher to the SearchControl
    searchControl.addSearcher(webSearch);
    
    // tell the searcher to draw itself and tell it where to attach
    searchControl.draw(document.getElementById("search"));
  }
  google.setOnLoadCallback(OnLoad);
  
</script>
{% endhighlight %}

Just replace the API key and the site URL.  Lastly add a simple div tag with the ID = search.

{% highlight html %}
<div id="search">loading…</div>
{% endhighlight %}

When you are done you'll get the search box similar to what you see to the left on this site.

Thanks to [Joe Martinez] for the tip.

[here]:http://code.google.com/apis/loader/signup.html
[Jekyll]:http://jekyllrb.com
[Joe Martinez]:http://jrmiii.com/2009/03/03/super-easy-sidebar-search-for-jekyll-powered-sites.html