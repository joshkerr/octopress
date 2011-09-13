---
layout: post
title: Slow computer?  Add two hard drives.
excerpt:
category:
---
I have a Macbook Pro which has 8gigs of RAM, a super fast processor, and runs dog slow.  Knowing that the bottle neck is usually the HD, I went out and bought an SSD drive to replace the existing HD.  This worked for a little bit until the SSD became too fragmented from lack of TRIM support.  Now my notebook is slower than it was with a regular HD.  

I did some research and learned that SSD drives are great for boot devices, but not so good as scratch devices.  Ahhh.   So now I know what to do.  I quickly ordered an OWC [data doubler][] which would let me mount a second HD where my optical drive is.  (I never use my optical drive.)   I used [disk tester][] to recondition my SSD drive.  Lastly I reconfigured my OS to put the /Users folder on my 2nd HD.  

<!-- more -->

Now I've got a small but fast [intel][] SSD drive as a boot device.  I have a 750gig 7200rpm drive as my scratch device (it holds my /Users folder.)  The computer screams.  Its never been this fast.  If I get any requests, I'll post the instructions so that you can do this yourself.

[data doubler]:http://eshop.macsales.com/item/Other%20World%20Computing/DDAMBS0GB/
[disk tester]:http://diglloydtools.com/disktester.html
[intel]:http://www.intel.com/design/flash/nand/productinformation.htm
