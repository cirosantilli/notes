# Data queries

Data queries: http://data.stackexchange.com/

DB format sloppy docs: http://meta.stackexchange.com/questions/2677/database-schema-documentation-for-the-public-data-dump-and-sede

Post bodies are stored as HTML I think?

Average votes per post (TODO improve it): http://data.stackexchange.com/stackoverflow/query/edit/395152

## Chinese dissidents

    SELECT TOP 256
      Id AS [User Link], Reputation, AboutMe
    FROM
      Users
    WHERE
      LOWER(AboutMe) LIKE '%great firewall%' OR
      LOWER(DisplayName) LIKE '%great firewall%' OR
      LOWER(AboutMe) LIKE '%tian an men%' OR
      LOWER(DisplayName) LIKE '%tian an men%' OR
      LOWER(AboutMe) LIKE '%tiananmen%' OR
      LOWER(DisplayName) LIKE '%tiananmen%' OR
      LOWER(AboutMe) LIKE '%falun%' OR
      LOWER(DisplayName) LIKE '%falun%'
    ORDER BY Reputation DESC

## No reppers: Lowest Reputation / *Answer + Question) Count ratios

    SELECT TOP 256
      Users.Id AS [User Link],
      Users.Reputation,
      COUNT(*) AS PostCount,
      Users.Reputation / CAST(COUNT(*) AS FLOAT) AS Ratio
    FROM
      Users
    INNER JOIN
      Posts
    ON
      Users.id = Posts.OwnerUserId AND
      Posts.PostTypeId IN(1, 2) AND
      Users.Reputation > 1
    GROUP BY
      Users.Id,
      Users.Reputation
    ORDER BY
      Ratio ASC
