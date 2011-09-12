--- 
wordpress_id: 2310185409
layout: post
title: Video tagging automation with iFlicks and Hazel
wordpress_url: http://joshkerr.com/post/2310185409
---
<p>The latest beta version of iFlicks will transcode HD versions of mkv files into iTunes compatible mp4 files without re-encoding the video.  With this and Hazel, a Mac automation app, I've got an automated way of converting and tagging my video files.</p>

<p>First, you need to download the beta version of iFlicks.  You can get it from the iFlicks <a href="http://groups.google.com/group/iflicks/topics">Google group</a>.  Just search around and you'll find the link.</p>

<p>Now that iFlicks is installed, you'll need to download and install Hazel.  You can get it from <a href="http://www.noodlesoft.com/hazel.php">here</a>.</p>

<p>Now you'll need to configure your Hazel rules.  Lets pretend that you use a program like <a href="http://www.sabnzbd.org">SABNzbd</a> to download TV shows or Movies (non copyrighted of course) from the Internet.  I would normally have them in either my Movie or TV folder depending on the type.</p>

<p><a href="http://joshkerr.s3.amazonaws.com/images/Finder.png"><img src="http://joshkerr.s3.amazonaws.com/images/Finder.png" alt="Finder"/></a></p>

<p>Now we can configure Hazel to automatically load our mkv files into iFlicks and clean up the folders when it is done.  This is what my list of rules looks like for my Movies folder.</p>

<p><a href="http://joshkerr.s3.amazonaws.com/images/Hazel%20Window.png"><img src="http://joshkerr.s3.amazonaws.com/images/Hazel%20Window.png" alt="Hazel Window"/></a></p>

<p>I've got three rules that you'll need to create:

</p>
<ul>
<li>Encode Video - loads the mkv file into iFlicks for encoding and tagging</li>
<li>Delete NFO files - this cleans out the directory from the left over garbage leaving an empty folder</li>
<li>Process sub folders - this will go into sub folders and run the previous two rules.  If the folder is empty it will delete it</li>
</ul>
<p><a href="http://joshkerr.s3.amazonaws.com/images/Encode%20Video.png"><img src="http://joshkerr.s3.amazonaws.com/images/Encode%20Video.png" alt="Encode Video"/></a></p>

<p>The encode video rule first looks for a file over 500mb that ends in mkv.  It also checks that it does not have a color label.  This is important as the label signifies that a video is being procoessed.  Since processing can take several minutes, you don't want Hazel to keep adding the same video to iFlicks.</p>

<p><a href="http://joshkerr.s3.amazonaws.com/images/Delete%20info%20files.png"><img src="http://joshkerr.s3.amazonaws.com/images/Delete%20info%20files.png" alt="Delete info files"/></a></p>

<p>The delete NFO files rule just removes the meaningless files left over after processing the video.  When done I should have an empty folder.</p>

<p><a href="http://joshkerr.s3.amazonaws.com/images/Remove%20subfolders.png"><img src="http://joshkerr.s3.amazonaws.com/images/Remove%20subfolders.png" alt="Remove subfolders"/></a></p>

<p>The process subfolders rule does two things.  First it dives into subfolders and runs the previous two rules.  Second it looks for empty folders and runs a script to delete them. </p>

<p><code>
tell application "Finder"<br/>
  set theContents to entire contents of theFile<br/>
  if theContents = {} then<br/>
   delete theFile<br/>
  end if<br/>
end tell
</code></p>

<p>If you configure your TV folder to run the same way, you'll end up with an automated way to process your downloaded mkv files using Hazel and iFlicks.  It took me a while to finally come up with a reliable automated solution.  I'd like to see iFlicks handle most of this without the need for using Hazel, but for now this is working pretty well.</p>
