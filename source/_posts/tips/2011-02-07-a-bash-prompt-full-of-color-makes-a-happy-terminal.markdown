---
layout: post
date: 2011-02-07
title: a bash prompt full of color makes a happy terminal
excerpt: Learn how to make the bash prompt a lot more useful by adding color.
category: tips
---
I spent a lot of time in Terminal the Mac app for executing shell commands.  I'm using the Bash shell which is the default one on OSX, but I've made a few improvements by enabling colors.  This not only looks better, but makes it easier to determine what is what and where you are.  In the end you will make fewer mistakes and find that your productivity has improved.

Adding color support is simple.  Just open your ~/.bash_profile and add the following lines:

{% highlight bash %}
#Custom bash prompt
export CLICOLOR=1;
PS1='\[\033[01;32m\]\u\[\033[01;34m\]::\[\033[01;31m\]\h \[\033[00;34m\]{ \[\033[01;34m\]\w \[\033[00;34m\]}\[\033[01;3$\[\033[00m\]'
{% endhighlight %}

When you are done, you will need to logout.  When you log back on, your Terminal should look something like this:

![BashPrompt][]

[BashPrompt]:http://joshkerr.s3.amazonaws.com/images/TerminalBash.png