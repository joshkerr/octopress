--- 
wordpress_id: 2307556833
layout: post
title: Do you encrypt your hard drive?  PGP vs FileVault
wordpress_url: http://joshkerr.com/post/2307556833
---
<p>I just got done with encrypting my notebook's 500GB  hard drive.  It took a little over 6 hours to for PGP to encrypt the whole drive.  I have a Mac so I had the option to use FileVault the built in encryption service, but chose instead to use PGP.</p>
<p><img src="http://joshkerr.s3.amazonaws.com/images/pgp.png" alt="Encrypting my hard drive"/><br/><br/>For me, the big differentiator is that FileVault only encrypts your home folder.  There are so many ways that data can get outside your home folder and that is a glaring security hole. <br/><br/>These are the advantages to PGP Whole Disk Encryption over FileVault: </p>
<ul>
<li>Time Machine Backup's run whilst user is logged into home folder.</li>
<li>You get some extra tools (eg to encrypt external drives.)</li>
<li>You don't need to worry about sensitive data getting outside of the home folder.</li>
<li>You can use the computer while the disk is encrypting.</li>
<li>Your swap file and sleep image are encrypted automatically.</li>
<li>No extra waiting during shutdown for FileVault optimizations.</li>
</ul>
<p>The big advantage of FileVault over PGP WDE is that FileVault is an Apple created technology and will be compatible with future versions of Mac OS X where PGP might not.  Recently users who upgraded to 10.6.5 found their computers unable to boot due to a last minute change made by Apple before the release.  PGP was quick to fix the issue and nobody lost data, but the thought of waiting for a rescue boot disk to use your notebook again is pretty scary.</p>
<p>I consider myself a power user and I was initially worried about performance.  WDE is not supposed to cause any noticeable performance hit to your notebook in normal usage.  (What ever that means.)  For me, I notice that the startup times are a bit longer, but everything else is just as zippy fast as it was before WDE.</p>
<p>I travel quite a bit and feel reassured that my notebook is protected especially in the event of a theft.  If you have the extra cash, I recommend PGP Whole Disk Encryption over using FileVault as it provides a much more secure way to keep your data safe.</p>
