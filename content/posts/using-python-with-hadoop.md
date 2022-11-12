---
title: "Using Python with Hadoop"
date: 2009-09-29 09:46:50 +0000 UTC
draft: false
slug: using-python-with-hadoop
---

### First, some review

 [Hadoop](http://hadoop.apache.org/) is a very powerful [MapReduce](http://en.wikipedia.org/wiki/MapReduce) framework based on a [white paper released by Google](http://news.cnet.com/8301-10784_3-9955184-7.html) documenting how they have successfully tackled the issue of processing large amounts of data (on the scale of petabytes in many cases) using their proprietary distributed filesystem, [GFS](http://labs.google.com/papers/gfs.html). Hadoop is the open source version of this distributed file system ((Technically Hadoop is an umbrella name whereas [HDFS](http://hadoop.apache.org/common/docs/current/hdfs_design.html) is the technical name for the GFS alternative.)), heavily [supported by companies like](http://wiki.apache.org/hadoop/PoweredBy) Yahoo, Google, Amazon, Adobe, [Facebook](http://hadoop.apache.org/hive/), Hulu, [IBM](http://www-03.ibm.com/press/us/en/pressrelease/22613.wss), [RackSpace](http://blog.racklabs.com/?p=66), etc. and and has a growing number of related projects hosted by the Apache Foundation.

### Why we need to learn "yet another language"

Yet, even with all of the buzz and hoopla many people find it difficult to setup and start writing applications capable of levreging the awesome power of an Hadoop cluster, many find the learning curve of Java and the Hadoop APIs very steep.

Fortunately one of the features available in Hadoop is [HadoopStreaming](http://wiki.apache.org/hadoop/HadoopStreaming) which allows programmers to specify any program (or script) as a mapper and/or reducer. Consequently, one of the most popular scripting languages to use alongside Hadoop is [Python](http://www.python.org/) ((If you aren't familiar with Python and want to learn, [here is an excellent site](http://diveintopython.org/) for diving into the language and here is an excellent [video series](http://www.youtube.com/watch?v=bDgD9whDfEY) walking you through the basics.)).

One of the reasons Python is well suited to this type of work is it's ability to be [functional](http://en.wikipedia.org/wiki/Functional_programming) provided you are careful how you write it. This makes chopping well-written Python map/reduce scripts up into distributable units much easier.

### There's a framework for that

While [it is possible to write plain Python scripts](http://www.michael-noll.com/wiki/Writing_An_Hadoop_MapReduce_Program_In_Python), the folks at last.fm have helped create an excellent [Python framework for Hadoop called Dumbo](http://blog.last.fm/2008/05/29/python-hadoop-flying-circus-elephant) to help streamline the process of writing MapReduce jobs in Python. [Dumbo](http://wiki.github.com/klbostee/dumbo) seems to be a fairly [simple framework](http://wiki.github.com/klbostee/dumbo/short-tutorial) with [plenty of examples](http://github.com/klbostee/dumbo/wikis/example-programs) you can adapt to your [particular needs](http://www.audioscrobbler.net/development/dumbo/).

### There's a framework for that too

Hadoop has many sub-projects, and one that is fairly popular is called [HBase](http://hadoop.apache.org/hbase/) which allows a more structured, database-like, approach to storing and retrieving data. An excellent Python framework for quickly parsing data into HBase tables is [Zohmg](http://github.com/zohmg/zohmg). This framework allows programmers to define tables in a [YAML](http://www.yaml.org/) [configuration file](http://github.com/zohmg/zohmg/blob/master/examples/television/config/dataset.yaml) and corresponding mappers as [simple Python scripts](http://github.com/zohmg/zohmg/blob/master/examples/television/mappers/mapper.py).

### Bringing it back home

One of the biggest drawbacks to using HadoopStreaming is that it is inherently less optimal than writing MapReduce jobs in Java since the target script or application has to be initialized, the data then has to be serialized, sent to the target application/script, processed, and then sent back (if there are any reducers). All this context switching adds overhead that wouldn't exist if the MapReduce job were kept in the JVM where Hadoop runs.

[Jython](http://www.jython.org/) is a viable answer for converting existing Python applications into Java bytecode to prevent incurring as much of a performance penalty. This utility can come in handy if you decide that your "quick and dirty" Python script needs to be moved into a production environment.
