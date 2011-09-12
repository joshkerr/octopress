---
layout: post
date: 2010-10-02
title: testflightapp beta test iphone apps without using adhoc
excerpt: the best way to have an ios app beta test
category: featured
permalink: /2010/10/02/testflightapp-beta-test-iphone-apps-without-using-adhoc/
---
![TestFlightScreenShot][]

Is it possible that you can run an iPhone app beta without using AdHoc distribution?  Is is possible that your beta users can install the app without even using iTunes?  No jail breaking?

According to TestFlight App, it is possible.  Users download the app via the web directly to their iPhone to install and test.  I'm skeptical myself and since it is a private beta, I cannot verify, but if it does do what they say it does, than it would really reduce the load of an app developer.  If it does work, chances are good that it will be shutdown by Apple pretty quickly. [TestFlightApp][]

### Update

Okay, I got a beta invite and tried it out.  It works.  These are the steps:

*  Invite users via the TestFlight website to become beta testers for your app.

* They enter their UDID directly into the TestFlight website.

* You copy and paste the UDID's right into the Apple developer portal and generate a certificate for the beta.

* Install the certificate, create a build and then upload the new build to the test flight website.

* Testflight will notify your testers that the build is ready and then let them install directly from the web.
It certainly simplifies a lot of the headaches associated with performing an iPhone app beta.  There are still some annoying manual steps (like copying the UDID's,) but TestFlight organizes most of that work so that you can focus on the product.

I'm not sure how much they plan to charge for the service when it goes live, but I imagine that most developers who run regular betas will hop on board for anything under $10 a month.

[TestFlightApp]:http://testflightapp.com/
[TestFlightScreenShot]:http://joshkerr.s3.amazonaws.com/images/TestFlightApp.png
