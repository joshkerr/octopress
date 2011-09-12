--- 
wordpress_id: 2072469583
layout: post
title: Prioritizing network connections in Mac OS X Snow Leopard
wordpress_url: http://joshkerr.com/post/2072469583
---
<p>Sometimes it is necessary to connect your Mac to multiple networks at the same time, but which one takes priority?  I just recently moved and my new place doesn’t have Internet yet.  Fortunately for me, I can use my iPhone as a modem until the cable company arrives to install my high speed access.</p>
<p>I connect my notebook to my iPhone and presto, I’m online.  Next I turn on my Airport and connect to my local LAN and boom, I’m offline.  Even though my Mac sees both my iPhone and my Airport as network devices, it gives priority to the Airport network which is not connected to the Internet.  I wish it was possible to prioritize which connection it uses for the Internet.</p>
<p>While snooping around in my Preferences I found this little option: <img src="http://joshkerr.s3.amazonaws.com/wp-content/uploads/System%20Preferences.png" alt="Photo of preferences panel"/> I go ahead and select the “Set Service Order” option and get this dialog: <img src="http://joshkerr.s3.amazonaws.com/wp-content/uploads/Set%20service%20order.png" alt="Service order"/> Now my iPhone is the highest priority and all Internet traffic is flowing through it.  I can also access my LAN if needed.  Problem solved.</p>
