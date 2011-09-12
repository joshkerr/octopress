--- 
wordpress_id: 2355247510
layout: post
title: How to enable FTP uploads to Amazon S3
wordpress_url: http://joshkerr.com/post/2355247510
---
<p>There are many apps which allow you to upload an image to a server which can then be inserted into content.  I keep my images on Amazon S3 storage because of the cost/space benefits.  Many of these apps support ftp but not Amazon S3 leaving me with the added burden of manually copying my images to their destination.</p>
<p>I recently started using myTumblr to create my Tumblr content and wanted to use it with Amazon S3, but it only supports ftp.  No problem, I'll improvise.</p>

<p>I'm a Mac user so I know that I've got built in ftp support.  Great, I'll enable that</p>
<p><img alt="myTumblr Image" src="http://joshkerr.s3.amazonaws.com/images/myTumblr_Image_1292260590.jpg"/></p>
<p>I go into my System Preferences, Sharing and then choose File Sharing and options.  I check the FTP option.  Make sure ftp is enabled.  Now create a folder to host those images on your local machine.  I chose something under:</p>
<p><code>~/Sites/joshkerr.com/images/</code></p>
<p>You cold also enable SSH and then use SFTP (which is what I did,) but that is entirely up to you.</p>
<p>Next, I need a way to sync those files up to Amazon S3.  For more advanced users, you can just write a shell script and use FolderActions to trigger it.  For less advanced users, I recommend using Transmit by Panic.  It has an Automator action that is very easy to setup.</p>
<p>Load up Automator and choose a new folder action.  Then set it up like so:</p>
<p><img alt="myTumblr Image" src="http://joshkerr.s3.amazonaws.com/images/myTumblr_Image_1292260825.jpg"/></p>
<p>Make sure to choose the folder you created in the previous step to execute the folder action on.  Also be sure to choose the right Amazon S3 folder.  At the end, when you copy a new image into this folder, you want to trigger it to launch Transmit and sync the folder.</p>
<p>Next you will need to make sure you have cloud font support enabled on Amazon S3.  This will give you a public URL that you can use that will be consistent for each image you upload to S3.</p>
<p>If you are a bit more sophisticated, you can use a shell script to sync the files.  This has the added benefit of being a background operation.  I would still use Automator and folder actions to set it up, but this time around, do something like this:</p>
<p><a href="http://joshkerr.s3.amazonaws.com/images/Automator%20with%20shell%20script.png"><img alt="Automator with shell script" src="http://joshkerr.s3.amazonaws.com/images/Automator%20with%20shell%20script.png"/></a></p>
<p>I used a ruby script called s3sync to handle the actual syncing.  I am not going to cover the installation of that utility in this article.</p>
<p>The last step is to configure your app to support the new ftp site.  For me, I'm using myTumblr so I configure it like so:</p>
<p><img alt="myTumblr Image" src="http://joshkerr.s3.amazonaws.com/images/myTumblr_Image_1292261061.jpg"/></p>
<p>Make sure to enter your cloud front URL instead of mine.  If everything is configured correctly, when a new image is added to the images folder it should launch a sync on Transmit.  The side effect of this unfortunately is that Transmit will open a new window in the foreground interrupting your workflow.  Still, it saves a bunch of steps that would otherwise complicate something that should be simple.</p>
