---
layout: post
title: "Create Mac App From Shell Script"
date: 2011-09-16 10:13
comments: true
categories: tips
---

> Great article showing how to convert a shell script into a Mac app.

{% codeblock Convert script into app lang:bash http://mathiasbynens.be/notes/shell-script-mac-apps Matias Bynens Website %}

#!/bin/bash

APPNAME=${2:-$(basename "$1" ".sh")}
DIR="$APPNAME.app/Contents/MacOS"

if [[ -a "$APPNAME.app" ]]; then
  echo "$PWD/$APPNAME.app already exists :("
  exit 1
fi

mkdir -p "$DIR"
cp "$1" "$DIR/$APPNAME"
chmod +x "$DIR/$APPNAME"

echo "$PWD/$APPNAME.app"

{% endcodeblock %}

[Mathias Bynens on converting script into App](http://mathiasbynens.be/notes/shell-script-mac-apps)

