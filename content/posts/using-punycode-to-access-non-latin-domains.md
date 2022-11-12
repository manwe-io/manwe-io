---
title: "Using punycode to access non-Latin domains"
date: 2010-10-18 09:00:40 +0000 UTC
draft: false
slug: using-punycode-to-access-non-latin-domains
---

[![](http://werxltd.com/wp/wp-content/uploads/2010/10/idn-to-punycode-300x138.jpg)](http://werxltd.com/wp/wp-content/uploads/2010/10/idn-to-punycode.jpg) The [Internet Corporation on Assigned Names and Numbers](http://www.icann.org/) recently [decided to allow for the issuing of non-Latin domain names](http://news.cnet.com/8301-1023_3-10387139-93.html). Previously all countries were forced to use the [ASCII character set](http://www.asciitable.com/), including countries whose native language included non-ASCII characters.

To aid in the transition, ICANN devised a micro-language of sorts to allow a smooth transition between ASCII-only domain names and the more robust Unicode domain names (which allows for non-Latin characters). This micro-language is known as [Punycode](http://en.wikipedia.org/wiki/Punycode).

To give you an example of how this language works, let's take the [recent top level domain (TLD) approval of .iran](http://www.circleid.com/posts/20101015_iran_non_latin_top_level_domain_approved_by_icann/) in their native language of Farsi. [Click here](http://icann.org/en/topics/idn/fast-track/string-evaluation-completion-i-en.htm#ir) to see what this domain looks like in both it's native Unicode (in Arabic script) and it's punycode equivalent (xn--mgba3a4f16a).

There are a number of punycode decoders and encoders like [this one](http://www.motobit.com/util/punycode-decoder-encoder.asp). There are also excellent libraries available to convert punycode, like [this javascript one](http://stackoverflow.com/questions/183485/can-anyone-recommend-a-good-free-javascript-for-punycode-to-unicode-conversion).

[Here is my own rendition using the javascript library above.](http://werxltd.com/lab/punycode.php)

So if you have a need to use punycode and/or non-Latin domain names. I hope this helps.
