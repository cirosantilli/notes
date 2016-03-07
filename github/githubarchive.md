
# githubarchive

## Old deprecated timeline queries

It has more data, and more fields.

Total events:

    SELECT COUNT(*) FROM [githubarchive:github.timeline]

280M Q4 2015.

<https://www.githubarchive.org>

Reads all public data through the GitHub API, and exports it as: hourly updates to Google BigQuery, sample usage: https://www.reddit.com/r/github/comments/3jp8jw/the_most_popular_github_projects_august_2015/

Count closed source repos that were open sourced at some point:

    SELECT COUNT(*) FROM [githubarchive:github.timeline] WHERE type = 'PublicEvent'

TODO Count closed source repos that were open sourced and then reclosed:

250k on Q4 2015. TODO: get most starred ones!

Largest repositories:

    SELECT repository_url, MAX(repository_size) AS max FROM [githubarchive:github.timeline] WHERE type = 'PushEvent' GROUP BY repository_url ORDER BY max DESC LIMIT 100

The top one shows: https://github.com/thefallentree/oow "Access to this repository has been disabled by GitHub staff due to excessive use of resources," https://web.archive.org/web/20150907202043/https://github.com/thefallentree/oow

TODO get repository stars: https://github.com/igrigorik/githubarchive.org/issues/118

Private repos? How is that possible? 1k events only.

    SELECT repository_url FROM [githubarchive:github.timeline] WHERE repository_private = 'true' GROUP BY repository_url
    SELECT * FROM [githubarchive:github.timeline] WHERE repository_private = 'true'

Most are seem to be `PublicEvent`:

    SELECT * FROM [githubarchive:github.timeline] WHERE repository_private = 'true' AND type != 'PublicEvent'
    SELECT * FROM [githubarchive:github.timeline] WHERE repository_private = 'true' AND type != 'PublicEvent' ORDER BY type

## User stats

How many users have ever pushed:

    SELECT COUNT(DISTINCT actor) FROM [githubarchive:github.timeline] WHERE type = 'PushEvent'

Only 2M in Q4 2015.

Compare to 10M claimed users: https://github.com/about/press

How many users have ever done anything on GitHub besides signing up:

    SELECT COUNT(DISTINCT actor) FROM [githubarchive:github.timeline]

4.5M Q4 2015.

    SELECT COUNT(DISTINCT repository_url) FROM [githubarchive:github.timeline]

16M compared to 26.7M claimed. Are there that many closed source ones, or are my queries wrong?

## Emails

Talking about commit emails here.

How many different emails are there:

    SELECT COUNT(DISTINCT payload_commit_email)
    FROM [githubarchive:github.timeline]
    WHERE type = 'PushEvent'

All emails:

    SELECT payload_commit_email
    FROM [githubarchive:github.timeline]
    WHERE type = 'PushEvent'
    GROUP BY payload_commit_email
    ORDER BY payload_commit_email ASC
    LIMIT 100000

TODO Failed attempt at getting one person' email. Fails because merge commits show the person as author, but the email of the collaborator who merged...

    SELECT * FROM [githubarchive:github.timeline]
    WHERE type = 'PushEvent'
      AND actor = 'cirosantilli'
    LIMIT 100

Email for a given commit: <http://webapps.stackexchange.com/a/84179/51862>

Emails with the most commits:

    SELECT
      MIN(payload_commit_name),
      payload_commit_email,
      COUNT(payload_commit_email) AS count
    FROM [githubarchive:github.timeline]
    WHERE type = 'PushEvent'
    GROUP BY payload_commit_email
    ORDER BY count DESC
    LIMIT 100

Domains with the most emails:

    SELECT domain, COUNT(domain) AS count
    FROM (
      SELECT
      SUBSTRING(email, INSTR(email, '@') + 1) AS domain
      FROM (
        SELECT payload_commit_email AS email
        FROM [githubarchive:github.timeline]
        WHERE type = 'PushEvent'
        GROUP BY email
      )
    )
    GROUP BY domain
    ORDER BY count DESC
    LIMIT 1000

1M results! So many small organizations dominate. Some interesting ones at the top:

- google.com
- pivotallabs.com
- github.com
- `.(none)` what is that?
- localhost.localdomain
- redhat.com
- berkeley.edu
- intel.com
