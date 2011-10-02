---
layout: post
title: Using Octopress & Jekyll with MarsEdit
link: http://movieos.org/code/jekyll-metaweblog/
category: tips
tags: []
---

<p><img title="ijFeu.png" src="http://i.imgur.com/ijFeu.png" border="0" alt="ijFeu.png" /></p>
<p>I'm a big fan of Octopress, the static blogging package based on Ruby and <a href="http://jekyllrb.com/">Jekyll</a>, but because it generates static content, how can you use a blog editor like <a href="http://www.red-sweater.com/marsedit/">Mars Edit</a> with what is essentially a static blog?  Introducing <a href="http://movieos.org/code/jekyll-metaweblog/">Jekyll-Metaweblog</a> a server that runs locally and opens up an interface to Octopress so that you can use Mars Edit to write blog entries.</p>
<p>Setting up Jekyll-Metaweblog wasn't straight forward, but once I got it going, it worked just fine.  I'm not a Ruby guru, so my issues could be based on my inexperience with the platform.</p>
<p>Jekyll keeps posts in the _posts directory where Octopress puts posts in the sources/_posts directory, so you need to make sure to start the server using the correct Octopress directory.   Other than that, you should be good to go.</p>
