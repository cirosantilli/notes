# Stack overflow Google rank repuptation

## Intro

Consider a Stack-Overflow-like Q&A website:

- there are questions and answers
- questions have tags, e.g. C, C++, Java
- users have reputation which say good much knowledge they have, and lead to better jobs (?)

We want to improve Stack Overflow's simplistic linear reputation system to determine who is the user who knows the most about a given tag.

Fundamental requirement: we are looking for a Google-rank-like algorithm (Eigenvalue based) such that:

-   if someone with high rep on a given tag upvotes you, you get a lot of rep on that tag. More than you would get from someone with low reputation on that tag.

Optional but very desirable requirements:

-   people can upvote tags on a given question to say: "I agree that this question deserves this tag".

    The vote of people with higher rep should count more.

-   each time you upvote a given person, it has less positive impact on his reputation for that tag.

    This would counter voting fraud, e.g. of close groups of friends which upvote each other a lot.

## Extra problem: how to deal with too broad questions and give people meaningful reputation?

This is unrelated (?), but is a major problem.

Stack Overflow discourages posts that are too "speculative" or have "too many" answers.

The rationale is to not give reputation to trivial answers by non-experts, so that reputation is a meaningful measure of expertise. Otherwise it degenerates to Quora.

However, many of those posts are useful.

There are two solutions for that:

- close questions and reject them entirely.
- make into a wiki post: not one gets rep. This solution is not as popular now.

Both of those processes require moderator intervention, which is manual, subjective and does not scale.

Find an algorithm that solves this problem elegantly.

Another problem: determine if something is "original research" or not, to differentiate who knows how to explain, and who knows hot to invent.

## Testing: a difficulty

While it is possible to download all public data from Stack overflow in dumps, this algorithms would need private information like who upvoted what.

So generating meaningful test data would be a problem in itself.

## Research

- http://meta.stackexchange.com/questions/28874/applying-pagerank-like-algorithm-to-stack-overflow-votes
- http://meta.stackexchange.com/questions/98141/ranking-users-similar-to-page-rank
- http://meta.stackexchange.com/questions/64938/doesnt-science-have-a-better-reputation-system-than-stack-overflow
- http://meta.stackexchange.com/questions/103735/modified-h-index-for-questions-and-answers

A Google-rank-like (eigenvalue based) reputation metric for stack overflow that takes into account tags:

- if someone with high rep on a given tag upvotes you, you get a lot of rep on that tag
- take into account a new property of tags: people can upvote tags if they think a tag fits a question well. Votes of people with more rep on a tag have more weight.
- if you upvote a given person multiple times, each upvote has less effect on their rep

This should be implemented as an Stack Overflow http://stackapps.com/ and on GitHub for languages with either GitHub API or http://ghtorrent.org/

We could still have the current linear rep, but the overall ranking would be a nice complement. I wonder how much it would differ from linear rep.

- https://github.com/networkx/networkx Python, does a lot of other graph things
- https://github.com/louridas/pagerank C++
- https://github.com/dcadenas/rankable_graph Ruby
- https://github.com/dcadenas/pagerank/ Go, port of rankable_graph

StackApps:

- http://stackapps.com/questions/6520/skillrep-experiment-in-computing-a-skill-focused-reputation
- http://stackapps.com/questions/6298/stackrating-tracks-skill-of-stack-overflow-users

## Who to propose this to

<https://catalogue.polytechnique.fr/cours.php?id=2913>

<http://psc.polytechnique.fr/>
