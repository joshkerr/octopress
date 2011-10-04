--- 
layout: post
title: Dropbox is my publish button
link: http://joehewitt.com/2011/10/03/dropbox-is-my-publish-button
tags: []

category: tips
---

<p><a href="http://joehewitt.com/2011/10/03/dropbox-is-my-publish-button">Dropbox is my publish button</a>:</p>
<blockquote>
<p>I flipped the switch on my new blog last night. If you've been here before, you might not notice anything different. The design hasn't changed, but behind the scenes everything is new.  I've written a CMS for the blog in <a href="http://nodejs.org">Node.js</a> and <a href="http://expressjs.com">Express</a>. It's hosted on <a href="http://aws.amazon.com/ec2/">EC2</a>, <a href="http://aws.amazon.com/s3/">S3</a>, and <a href="http://aws.amazon.com/cloudfront/">Cloudfront</a>. All the content is written in <a href="http://daringfireball.net/projects/markdown/syntax">Markdown</a> and pushed to my server using <a href="http://dropbox.com">Dropbox</a>.  All the code is pulled from repositories on <a href="http://github.com">Github</a> and <a href="http://npmjs.org">NPM</a>.  I use <a href="http://www.alistapart.com/articles/responsive-web-design/">responsive design</a> to adapt nicely to all screen sizes, and use feature testing with <a href="https://github.com/phiggins42/has.js/">has.js</a> and <a href="https://github.com/joehewitt/hascan/">hascan</a> to adapt nicely to all browsers.</p>
<p>Like many nerd-minded bloggers, I prefer writing in Markdown in my programming text editor instead of writing in a browser.  Many such systems like <a href="https://github.com/mojombo/jekyll">Jekyll</a> are growing in popularity, but these usually require you to use Git to push your Markdown files to the server.  Call me lazy, but I don't want to have to go down to the command-line.  I just want to save the file to publish it.  This is where Dropbox comes in.</p>
<p>All of my blog posts are now in Markdown files, and those files are synchronized to my Linux EC2 servers with Dropbox. My previous blog used Markdown also, but I had to FTP the files to my former Dreamhost server.  I used <a href="http://www.expandrive.com/">ExpanDrive</a>, which made the FTP process relatively painless, but FTP is still flaky, and ExpanDrive doesn't deal well with flaky connections.  With Dropbox, the synchronization is effortless. A second or two after I save the Markdown file, the post is up on the blog, and I never have to think about it.</p>
<h2>Setting up Dropbox</h2>
<p>I run the Dropbox Linux client on my EC2 server using the default Linux AMI, but this should work on most Linux distros.</p>
<p>Start by installing the <a href="http://wiki.dropbox.com/TipsAndTricks/TextBasedLinuxInstall">Dropbox Linux command line client</a>.  At the end of the install script, it will ask you to link your Dropbox account by copying and pasting a URL into your browser. <strong>Do not do this yet.</strong> If you do, it will link your personal Dropbox account to the server, downloading the hundreds of megabytes of files you may have on Dropbox, and exposing potentially sensitive files to any intrepid hacker who breaks into your server.</p>
<p>You only want to synchronize the files needed by your CMS, so you need to create a new Dropbox account that is dedicated to this purpose. Of course, the Dropbox client only works with one account at a time, and your personal computer is going to be logged into your personal account.  Luckily, Dropbox folder sharing solves this problem nicely.  Once you have your new account, go to your personal account and share the folder containing your CMS files with the new account.  Then you can link the new account to your server.  Be sure you are logged into the new account in your browser, and then load that URL the installer gave you. Done.</p>
<h2>About that CMS</h2>
<p>Dropbox alone does not a blog make.  My new CMS, called <a href="http://github.com/joehewitt/nerve/">Nerve</a>, processes those magically synchronized files and spits out a website.  It's Apache-licensed and hosted on Github, but I'm not recommending that anyone other than me use it at this time.  You can learn from it, though.</p>
<p>Nerve takes advantage of Node.js's <a href="http://nodejs.org/docs/v0.3.1/api/fs.html#fs.watchFile">built-in file watching</a> abilities to monitor changes made by Dropbox and then regenerate pages on the fly.  It asks you for a path to your Markdown file, but this can include asterisk wildcards so you can use as many files as the pattern matches.  My entire blog is two Markdown files. One contains all posts from 2002 to 2010 and the other contains all posts from this year.  The files look something like this:</p>
<pre><code>This is a new post
==================

Blah blah blah.

This is another post [9/30/2011]
================================

Blah blah blah.
</code></pre>
<p>Nerve uses Markdown's level-one header to demarcate the posts.  It then looks for a bracketed timestamp in the header to distinguish posts that are public from ones that are still drafts.  A password-protected drafts page allows me to preview drafts before publishing.  Once they are done, I add the timestamp, save the file, and it's published.</p>
<p>A previous version of Nerve required creating a separate file for each post and giving it a name that contained the timestamp.  I tested this system out on <a href="http://uponahill.com">Laura's blog</a> and found that the chore of creating new files was just enough friction to discourage her from starting new posts.  One day I was talking to my friend, <a href="http://scripting.com">Dave Winer</a>, and he told me that his entire blog is contained in a single OPML outline file.  This was a big aha-moment for me, and I rewrote Nerve so that all posts could be within the same file.  This was a big hit with Laura, and I've found her posting volume has gone up significantly ever since.</p>
<h2>Caveats</h2>
<p>The Dropbox Linux client works pretty well, but on a couple occasions I've found it has stopped syncing for no apparent reason.  It's not the end of the world.  The web server keeps running, but new posts won't get published until I SSH into my EC2 instance and restart the Dropbox daemon.</p>
</blockquote>
<p>(Via <a href="http://news.ycombinator.com/">Hacker News</a>)</p>
