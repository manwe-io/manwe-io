---
title: Metastable systems
date: 2022-11-17 18:43:31 +0000 UTC
draft: true
slug: metastable-systems
---

I recently came across the phrase ["metastable failures"](https://youtu.be/7w47SGaLsSw). It comes from a research paper with a longer and more intriguing title "Metastable Failures in Distributed Systems". The paper describes a set of problems that can affect a distributed system where the system (my paraphrase) effectively metastasizes and starts attacking itself.

> Metastable failures are when transient issues have been resolved (through self-healing processes) but there's some sort of feedback loop that keeps the overall system unhealthy.

Many incidents I've seen fit all of the criteria for a metastable failure mentioned in the video. For example, in a recent incident, an EC2 instance dedicated to database connection pods went offline which led to about 11% error rate in the one of our apis. The metastable failure part is not the error rate or the fact that we needed to restart the database connection pods. In the post-mortem we discovred that most parts of our system have HTTP retries baked into them in the event of failed requests.

It's those retries that put us in a vulnerable state.

The retries solve for transient errors and allow us to self-heal from slight service interruptions but they leave us open to DOSing ourselves. Something that seems to be a common theme in many of our incidents.

Interestingly enough, the video also tells us that if this isn't addressed the issue will only grow worse over time.

> Work amplification usually comes from features not bugs. Optimizations that amplify or the increase work amplification include things that don't apply in all cases caching extra work to try to make the system more reliable or address failures and situations where there's some sort of a competition between doing work now and doing work that will make future work cheaper and more efficient

In other words, for our context, every new feature we add that attempts to protect itself with aggressive retries will add to or amplify the amount of deferred work that the system needs to perform.

What can or should be done about it?

[This post](https://blog.techlanika.com/metastable-failures-in-distributed-systems-what-causes-them-and-3-things-you-can-do-to-tame-them-8fd56d593950) has 3 suggestions mined from [the paper](https://sigops.org/s/conferences/hotos/2021/papers/hotos21-s11-bronson.pdf) at the heart of this discussion

> 1. Focus on the sustaining feedback loop over the triggers
> 2. Identify the strongest feedback loops
> 3. Weaken the feedback loops

We've done some work around 3 with circuit breakers and rate limiters. And 2 with tightening up the conditions where work is queued.

We need to spend more time on 1 or figuring out how we can change our feedback loops from an O(n) growth rate to something more like an O(log n) by proactively eliminating requests that are redundant or otherwise unneeded.
