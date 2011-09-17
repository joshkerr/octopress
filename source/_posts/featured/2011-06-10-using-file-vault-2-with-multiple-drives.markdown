--- 
layout: post
title: Using File Vault 2 with multiple drives
category: featured
status: publish
type: post
published: true
---

<p><img title="Encrypted second volume" src="http://i.imgur.com/l2Qwp.png" /></p>

File Vault 2 is Mac OS X Lion’s new whole disk encryption system. It is baked into the OS and uses whole disk encryption to protect your entire disk, not just your home folder. This is easy to enable from the Security preferences panel which lets you encrypt your boot volume, but what if your home directory resides on a second disk?

This is the setup I use with my OS on an internal SSD drive and my home folder on a second normal drive. This configuration offers me higher performance and is easier to backup and upgrade. I'd like to be able to use File Vault, but there is no option to encrypt a second disk.

Command line to the rescue. Apple offers powerful tools to manage the encrypted disks via diskutil. The disks are actually CoreStorage units and you can manage them via:

{% highlight bash %}
diskutil cs
{% endhighlight %}

To convert a volume into a CoreStorage unit with encryption:

{% highlight bash %}diskutil cs convert [device] -passphrase [password]{% endhighlight %}

Replace device with the disk and password with the requested password. If it can convert the disk in place encryption will begin immediately.

When you are done, you can confirm that the process worked by checking your disk in Disk Utility.

