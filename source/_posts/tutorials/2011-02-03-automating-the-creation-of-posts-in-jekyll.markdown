---
layout: post
date: 2011-02-03
title: automating the creation of posts in jekyll
excerpt: Jekyll is fantastic; here is how I automated the creation of posts.
category: featured
---
I really dig the control that Jekyll afford me to blog using the tools of my choice in the manner I see fit.  I like that I can publish with static files and that what I edit on my local machine is identical to what you see on my blog.  

Creating new posts can be a chore however because there are default tags that have to be added to each post.  You can automate this in a bunch of different ways, but I like this way:

[Workflow grabbed from Forrst](http://forrst.com/posts/Jekyll_Workflow_Automation-1hs)

{% highlight bash %}

# create a new post and fill the template
alias create="sh ~/.postname"

# the contents of ~/.postname:
#!/bin/zsh

################
# Get our info #
################
yearmonth=`date "+%Y/%m"`
postdate=`date "+%Y-%m-%d"`
jekylldate=`date "+%Y-%m-%d"`
read -p "Enter the post name: " post_variable;
touch /Users/TJ/Desktop/foobar.com/_posts/$yearmonth/$postdate-$post_variable.markdown &&
cat <<EOF > /Users/TJ/Desktop/foobar.com/_posts/$yearmonth/$postdate-$post_variable.markdown
---
layout: post
date: $jekylldate
title: $post_variable
excerpt:
---
EOF
mate /Users/TJ/Desktop/foobar.com/_posts/$yearmonth/$postdate-$post_variable.markdown
exit 0

# start up Jekyll for local preview of blog
alias preview="cd /Users/TJ/Desktop/foobar.com && jekyll --server --auto"

# delete the existing built site and rebuild
alias build="cd /Users/TJ/Desktop/foobar.com && rm -rf _site/ && jekyll"

# use rsync to push the weblog to my (ve)
alias deploy="echo 'Deploying to remote host...' &&
cd /Users/TJ/Desktop/foobar.com && rsync -rtz --delete _site/ deploy@foobar.com:/var/www/_site &&
echo 'Done!'"

{% endhighlight %}

Just add this to your bash_profile to enable simple terminal commands for creating blog entries.  It will use textmate as the editor, but you can easily swap it out for another.  Make sure to configure the directories correct as the ones above were configured for someone else.