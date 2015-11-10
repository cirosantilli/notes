# Stack overflow google rank rep

## Intro

Consider a Stack-Overflow-like Q&A website:

- there are questions and answers
- questions have tags, e.g. C, C++, Java

We want to improve Stack Overflow's simplistic linear reputation system to determine who is the user who knows the most about a given tag.

Fundamental requirement: we are looking for a Google-rank-like algorithm (Eigenvalue based) such that:

-   if someone with high rep on a given tag upvotes you, you get a lot of rep on that tag. More than you would get from someone with low reputation on that tag.

Optional but very desirable requirements:

-   people can upvote tags on a given question to say: "I agree that this question deserves this tag".

    The vote of people with higher rep should count more.

-   each time you upvote a given person, it has less positive impact on his reputation for that tag.

    This would counter voting fraud, e.g. of close groups of friends which upvote each other a lot.

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
