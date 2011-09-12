--- 
wordpress_id: 2074590362
layout: post
title: Improve blog performance with optimized images
wordpress_url: http://joshkerr.com/post/2074590362
---
<p>Tyler Hall, a web guy over at Yahoo wrote this great script that will automatically sort through your Amazon S3 stored images and run them through Yahoo's autosmash to optimize them for faster web performance.</p>
<p>Why should this concern you?  First, you should not be hosting your blog';s images from your blog web site.  You should be using a CDN (content delivery network) just in case you get a front page link on the New York Times or Reddit which would cause thousands of users to suddenly come visit your site.  Hosting those images from your site would kill your site.  (Think denial of service.)</p>
<p>If you are using Wordpress you should also be using TanTan Noodles Amazon S3<a href="http://tantannoodles.com/toolkit/wordpress-s3/">plugin</a>.  This plugin will automatically place uploaded images on your in your S3 account.  Amazon is a low cost CDN and this plugin makes its use seamless.</p>
<p>Now add in Autosmush and you can have your photos optimized not only in size (without loss of quality,) but to last in your browsers cache for a longer period of time.  So rather than requesting the same image over and over, it will grab the image from its cache thus cutting back on a lot of the requests to your server.</p>
<p>Everything you need to install and use this script is available on Tyler';s github account.  I';ve been using it for a month now and it works great.</p>
<p><a href="http://github.com/tylerhall/Autosmush/blob/master/autosmush"><a href="http://github.com/tylerhall/Autosmush/blob/master/autosmush">http://github.com/tylerhall/Autosmush/blob/master/autosmush</a></a></p>
