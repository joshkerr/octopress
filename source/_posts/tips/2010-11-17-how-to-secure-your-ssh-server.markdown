--- 
wordpress_id: 2072512764
layout: post
title: How to secure your SSH server.
wordpress_url: http://joshkerr.com/post/2072512764
---
<p>If you are running any variant of Unix or Linux remotely you are probably using SSH to access that system.  This article from <a href="http://www.rackspacecloud.com/blog/2010/11/11/securing-your-ssh-server/">Rackspace</a> does a great job telling you how to secure your box so that hackers have a really hard time breaking into your system.</p>
{% highlight bash %}
iptables -A INPUT -j ACCEPT -p tcp --dport 22 -s 10.0.0.20
iptables -A INPUT -j ACCEPT -p tcp --dport 22 -s 10.0.0.25
iptables -A INPUT -j DROP -p tcp --dport 22
{% endhighlight %}
<p><a href="http://www.rackspacecloud.com/blog/2010/11/11/securing-your-ssh-server/">Read the article</a>.</p>
