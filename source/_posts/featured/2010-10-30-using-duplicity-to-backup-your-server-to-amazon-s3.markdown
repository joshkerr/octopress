---
layout: post
date: 2010-10-30
title: using duplicity to backup your server to amazon s3
excerpt: a great way to backup your server to a reliable low cost source
category: featured
---
There is no question that you want your data backed up to the cloud and the cheapest way to do that is by using Amazon S3.  For more people, their hosted servers provide some sort of web based automated backup system.  For those of us that manage our own servers, yo'll need to configure something yourself.  This task can be fairly straight forward and I'll show you how I've configured mine.

The key tool that we are going to use is a program called duplicity which will support incremental encrypted backups to Amazon.  Before we get started yo'll need an Amazon S3 account with a bucket configured for your backups.  I'm not going to show you how to do that in this article as it is pretty straight forward.

Next, you'll want to choose which directories on your server you want to backup.  For me, I'm backing up the following

{% highlight bash %}
/home/
/etc/
/usr/
/lib/
/opt/
/root/
/var/
{% endhighlight %}


This gives me all that I'd need to reconfigure my server in case of complete server failure.  It isn't a complete drive clone, but I don't really need that.

To install duplicity, you'll need to make sure that your apt-get library is up to date.

{% highlight bash %}apt-get update{% endhighlight %}

Next you'll want to install duplicity:

{% highlight bash %}apt-get install duplicity{% endhighlight %}

With duplicity installed, all that is left is your backup script.  You probably shouldn't leave the PASSPHRASE in the script and you will need to replace they [KEY-ID] and [SEC-KEY] with your own Amazon information.  Here is a copy of mine:

{% highlight bash %}#!/bin/bash

#Log script
log() { logger -t scriptname "$@"; echo "$@"; }

export AWS_ACCESS_KEY_ID=[KEY-ID]
export AWS_SECRET_ACCESS_KEY=[SEC-KEY]
export PASSPHRASE=[PASSWORD]

duplicity /home/ s3+http://joshkerr/joshkerr-com/home/
duplicity /etc/ s3+http://joshkerr/joshkerr-com/etc/
duplicity /usr/ s3+http://joshkerr/joshkerr-com/usr/
duplicity /lib/ s3+http://joshkerr/joshkerr-com/lib/
duplicity /opt/ s3+http://joshkerr/joshkerr-com/opt/
duplicity /root/ s3+http://joshkerr/joshkerr-com/root/
duplicity /var/ s3+http://joshkerr/joshkerr-com/var/

log "Backup completed."

export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export PASSPHRASE
{% endhighlight %}

Its a good thing I posted this article shortly before I decided to upgrade my server to Ubuntu 10.04 LTS because it basically wiped clean my drive.  Hey MediaTemple, where is the heads up?  They do put your old data in the /old folder, but it was way easier to restore from Amazon S3.  Thank you duplicity.