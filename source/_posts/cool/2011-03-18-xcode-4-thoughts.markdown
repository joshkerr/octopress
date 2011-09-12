--- 
layout: post
title: Xcode 4 thoughts
published: true
---
I just spent the past two weeks working with Apple's new Xcode 4.0.  I've got mixed feelings.  Some areas I see big improvements such as the single document view, and in other areas, it feels like Xcode is less capable than its predecessor.  

I don't think you NEED to upgrade to Xcode 4.  Apple will accept app submissions for any of their stores via Xcode 3.  Xcode 4 though does make the submission process a lot easier.  For one, they let you choose which certificate to apply after the build process.  So code signing with a new certificate doesn't require you to rebuild.  

![XcodeShot][]

The screenshot above shows the Xcode Organizer which is used to share your app or submit it to the App Store.  It is also sort of a snapshot backup system, making a compressed version of the output of your project.

Configuring builds, targets, etc.. are all easier in Xcode 4.  Apple does a good job of visualizing the different settings and allowing you to easily make changes.  

![XcodeShot2][]

Apple has made a lot of progress on its source code repository management with new support for Git.  They also have the ability to do file comparison directly in the main editor.

Another feature built right into the editor is Interface Builder.  I'm not sure this is such a good thing.  In a lot of ways, Interface Builder is step back in Xcode 4.  For one, it doesn't support plugins.  So if you are using a third party framework and you want to take advantage of a plugin, you are out of luck.  Not cool.

Apple's dev tools are very well done.  It is a pleasure working with them to create iPhone, iPad and Mac apps.  If Objective C had its own memory management system, I'd say that they had a near perfect platform.

[XcodeShot2]:http://joshkerr.s3.amazonaws.com/images/MegaErase%20-%20MegaErase.xcodeproj.png

[XcodeShot]:http://joshkerr.s3.amazonaws.com/images/MegaErase%20from%20Xcode%20Submit.png

