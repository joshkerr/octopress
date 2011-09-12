---
layout: post
title: Using iA Writer with Jekyll
excerpt:
category: tips
---
![iAWriterScreen][]

I'm a big fan of [iA Writer][], a Mac app that allows you to write in Markdown free of distractions by focusing on the content and removing pretty much everything else.

I'm also using [Jekyll][] which is a static blogging app to pre-generate my site before deploying it and with a simple rake script, I'm able to use both together.

First, you'll want to make sure you've got both Jekyll and IA Writer installed.  With that done, just add the following to your rake file:

{% highlight ruby %}

desc 'Begin a new post'
task :post do
  ROOT_DIR = File.dirname(__FILE__)

  title = ARGV[1]
  tags = ARGV[2 ]

  unless title
    puts %{Usage: rake post "The Post Title"}
    exit(-1)
  end

  datetime = Time.now.strftime('%Y-%m-%d')  # 30 minutes from now.
  slug = title.strip.downcase.gsub(/ /, '-')

  # E.g. 2006-07-16_11-41-batch-open-urls-from-clipboard.markdown
  path = "#{ROOT_DIR}/_posts/#{datetime}-#{slug}.markdown"

  header = <<-END
---
layout: post
title: #{title}
excerpt:
category:
---


END

  File.open(path, 'w') {|f| f << header }
  #system("bbedit", path)
  open_iAWriter(path)
end

def open_iAWriter(path)
	sh 'open $1 -a /Applications/iA\ Writer.app ' + path
end


{% endhighlight %}

This will create a new post and open it in IA Writer.  Just make sure to pass in a subject for the post.  (The file name will be your subject too.)  So for example:

{% highlight bash %}

rake post "This is a test post"

{% endhighlight %}

Although I do not have it as part of this script, you could also open your new Markdown document in [Marked] too.  This would display a Markdown preview while you were editing the document in IA Writer.

[Marked]:http://markedapp.com/
[Jekyll]:http://jekyllrb.com/
[iA Writer]:http://www.iawriter.com/
[iAWriterScreen]:http://i.imgur.com/vs4EW.jpg