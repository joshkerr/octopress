--- 
wordpress_id: 2074846525
layout: post
title: "@mailgun: Email interface for your app"
wordpress_url: http://joshkerr.com/post/2074846525
---
<p><a href="http://mailgun.net/">Mailgun</a> is a service that provides a web-server API for fully managed, scalable email servers.  This is something that I think would work great with a service like <a href="http://www.zosh.com">Zosh</a>.</p>
<p>If you run a web application that needs to process email, the best way to get that email into your app server would be to have it posted.  You provide some sort of secure page and emails are posted via an HTTP POST.  Sendmail will let you do this, but there aren't a lot of other email servers that have this kind of capability.  This is where Mailgun comes in.  They will post a UTF-8 format email to the URL that you specify.  You get all parts of the email including the attachments and you can process it as if it was ordinary data.  You can even apply pattern matching before the email reaches your app server.</p>
<p>This is very powerful as it can be used to setup routes for certain emails.  For example lets say that we want to assign each user on our system their own @joshkerr.com email address.  Using this system we can easily route all shipping@joshkerr.com emails to a different location than the invoicing@joshkerr.com emails.</p>

<p>Mailgun provides a host of libraries to get you started including Ruby, PHP, Python, Java and C#.  <a href="http://mailgun.net/pricing">Pricing</a> is reasonable and I'm really tempted to use their service for one of my projects.  If anyone has any experience with them, please post to the comments.</p>

<p>Here is some sample code showing an HTTP POST:</p>

{% highlight ruby %}
def upload(request):
     if request.method == 'POST':
         sender    = request.POST.get('sender')
         recipient = request.POST.get('recipient')
         subject   = request.POST.get('subject', '')

         body_html  = request.POST.get('body-html', '')
         body_plain = request.POST.get('body-plain', '')

         for key in request.FILES:
             file = request.FILES[key]
             # do_something_cool_with(file)

     # Returned text is ignored but HTTP status code matters:
     # Mailgun wants to see 200, otherwise it will make another attempt
     return HttpResponse('OK')
{% endhighlight %}
