---
title: "Using PHP to write PHP"
date: 2010-07-29 14:00:49 +0000 UTC
draft: false
slug: using-php-to-write-php
---

I ran into a situation recently where I had a very large array object that was not going to change. It was the polygon coordinates for the world countries to be used in [KML](http://code.google.com/apis/kml/documentation/) provided by [Thematic Mapping](http://thematicmapping.org/).

I didn't wan't to pull this data out of MySQL every time I went to build a map, I wanted to use one giant static array instead. So to write the array back out in a re-usable fashion I developed the following code which can take any array, of any depth, associative or index based, and spit out corresponding PHP that you can copy and paste back into your script.

```
function phpPrintArr(array $arr) {
	echo "array(".PHP_EOL;

	$c = 1;
	$total = count($arr);

	foreach($arr as $i =>$v) {
		$iq = is_numeric($i) ? '' : '"';
		$vq = is_numeric($v) ? '' : '"';
		$e = $c < $total ? ',' : '';

		if(is_array($v)) {
			echo $iq.$i.$iq.'=>'.PHP_EOL;
			phpPrintArr($v);
			echo $e.PHP_EOL;
		} else {
			echo $iq.$i.$iq.'=>'.$vq.$v.$vq.$e.PHP_EOL;
		}
		$c++;
	}

	echo ")".PHP_EOL;
}
```

Oh, and for anyone who is interested in the array of country polygons this produced from the Thematic Mapping Engine data, [here is the rather large array](http://werxltd.com/software/TME_Countries). Feel free to use it in your own KML project.
