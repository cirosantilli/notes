# GitHub applicaiton

## Announcement

https://jobs.github.com/positions/ee122c22-a25f-11e4-8cbe-fe3b2390f69d

Tester

GitHub is looking for a Tester to join our nascent testing team and focus on manual testing for GitHub.com, GitHub Enterprise, and GitHub Desktop — wherever the need is most pressing — to help ensure we’re shipping truly quality product.

This person will also advocate for manual testing on other products (where appropriate), share their knowledge of best practices, and work to improve the visibility of quality control and quality assurance across the entire Engineering department.
Responsibilities

- Regression testing, exploratory testing, and sanity checks against release builds (and branch builds, as requested) of GitHub Enterprise and GitHub Desktop
- Determining comprehensive reproduction steps for issues that arise
- Formulating articulate and clear test plans, for native applications and web applications
- Managing the issue backlog for products: knowing how to find and surface issues, what’s been logged in the past, etc.
- Acquiring holistic knowledge about how the product works—past, present, and future—and becoming a go-to person for questions about it
- Expressing empathy for our end users, and advocating for them across the company

Requirements

- Excellent written and verbal communication skills
- Passionate about and truly interested in testing/detective work
- Experience and domain knowledge in manual testing
- Technical knowledge about processes, including the creation and execution of test matrices and manifests
- Vocally opinionated about user experience (UX) issues
- Great at prioritization, able to shift focus rapidly and keep up with our continuous deployment
- Pragmatic, and able to act responsively with our engineers on which issues to test, when (i.e., conscious of the need to constantly ship and iterate)
- Comfortable working asynchronously on a distributed team, with a potentially long turnaround time on communication
- Willing to shift focus between different products rapidly and as necessary
- Basic familiarity with Git and/or GitHub


## Question

> We'd love to learn more about your approach to testing. If given a product with no previous test plan and asked to devise one, how would you decide what to test?

1. Learn how to use the product to understand how end users use it and better decide what matters most
2. Look at the most voted bugs the bug / feature request database to decide what users want and what breaks more often
3. If you have automated user data collection, e.g. SaaS analytics, use it to decide what users use most.
3. Ask colleagues to notify you of common regressions that bother them, and keep an eye on the internal issue tracker
4. Look at the code around the bugs. They often come in groups, because they were written by the same person in the same bad day :)

Then:

1. Fix things twice: hotfix then refactor
2. Automate, automate, automate... and when you can't, make a checklist.

## Cover letter

Last year I've contributed full time for GitLab, in order to make a GitHub for books: https://github.com/booktree/booktree

I've decided that I was not going to be able to make money out of it, and got my current job in January to pay the bills.

I've kept a close eye on GitHub, and made several suggestions to both, some of which were accepted / highly upvoted:

- http://feedback.gitlab.com/forums/176466-general , e.g.: http://feedback.gitlab.com/forums/176466-general/suggestions/5379851-vote-issues-merge-requests-without-comment
- https://github.com/isaacs/github/issues/created_by/cirosantilli ,  e.g.: https://github.com/isaacs/github/issues/253

I've also implemented some features, fixes and tons of refactoring: Two sample fixes

- https://github.com/gitlabhq/gitlabhq/pull/7903/files improved the tests by fixing the test data version
- https://github.com/gitlabhq/gitlabhq/pull/7903 fixes something that was low level and hard to find. Was hard to make the CI pass, and will fix several duplicate issues once merged.

I've also grown an interest for testing Git web interface edge cases: https://github.com/cirosantilli/test

I like to help people get their jobs done, e.g. answering stuff on Stack Overflow: http://stackoverflow.com/users/895245/ciro-santilli

My current job is OK (develop an OLAP database for finance), but GitHub is cooler. I think that version control rocks and that non-programmers will use it some day.

I currently live in Paris, and asynchronous communication rocks.
