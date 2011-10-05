--- 
layout: post
title: Amazon adds server-side encryption to S3 data service
link: http://feeds.arstechnica.com/~r/arstechnica/index/~3/CCtM-_dOMk4/amazon-adds-server-side-encryption-to-s3-data-service.ars
tags: []

category: cool
---

<p><a href="http://feeds.arstechnica.com/~r/arstechnica/index/~3/CCtM-_dOMk4/amazon-adds-server-side-encryption-to-s3-data-service.ars">Amazon adds server-side encryption to S3 data service</a>:</p>
<blockquote>
<p>Up until now, Amazon Web Services customers had three choices when it came to protecting data sitting in Amazon Simple Storage Service "buckets": implementing <a href="http://docs.amazonwebservices.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3EncryptionClient.html">AWS's S3 Encryption Client</a> or their own encryption in  application code; encrypting it locally with another application before uploading; or counting on AWS authentication to keep bad people out of their data. The first two ways can create bottlenecks when it comes to getting data in and out of applications to users, and the third is just plain stupid.</p>
<p>Now there's another choice. Amazon has implemented <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/index.html?UsingEncryption.html">server-side encryption </a>of data using 256-bit AES crypto as part of the AWS REST, Java, and .NET APIs for S3, and as an option for data uploaded through the AWS management console.</p>
</blockquote>
<p>(Via <a href="http://arstechnica.com/index.php">Ars Technica</a>)</p>
