---
layout: post
title: "Amazon Route 53 to Host Your DNS"
date: 2011-09-27 13:15
comments: true
categories: tips
---
![Interstate 53](http://f.cl.ly/items/0F022n1Y1h322b3O0m0V/Screen%20Shot%202011-09-27%20at%201.14.40%20PM.png)

Hosting your DNS is a straight forward task for most web administrators.  Use your hosts NS servers and then forget about it.  If you care about the performance and availablity of your website, you might want to think twice about where you host it.

If you are the type of person who is running a high performanced memory cached website, then your site probably screams with performance.  DNS Resolution might be a factor that can completely slow down the performance for most of your users.  So all that horsepower means nothing.

I prefer to host my stuff at either [Media Temple][], Amazon or Heroku.  All three of those services provide DNS hosting, but Amazon's Route 53 in my opinion is the most capable.  The bad news is that Amazon's interface is crypting using a [perl script][] and command line to configure your zones.

Now enter [Interstate 53][], a website that places a front end web interface to Amazons Route 53 service.  Interstate 53 is a free service that lets you batch your DNS changes over to Amazon's Route 53 service.  So you configure your Zones, click a button and then those changes are transmitted to Amazon.  It worked well for me as I migrated my domain from another DNS provider to Amazon.

[perl script]:http://aws.amazon.com/developertools/Amazon-Route-53/9706686376855511
[Interstate 53]:http://interstate53.com
[Media Temple]:http://mediatemple.net/