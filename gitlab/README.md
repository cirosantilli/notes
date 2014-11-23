# GitLab

## Smells

Undesired whitespaces:

    git grep '\s+$'

JavaScript links should be replaced with styled buttons where possible:

    git ls-tree | grep -E '\.haml$' | xargs grep -E '"#"'
    git ls-tree | grep -E '\.haml$' | xargs grep -E "'#'"

Defined is bad in templates: use `local_defines` instead:

    git ls-tree | grep -E '\.haml$' | xargs grep -E 'defined\?'

### Many false positives

Use in-place modifications:

    git grep '\+\='

Hard because should not alter method inputs,
so you have to check if the matches are inputs or not.

Unnecessary regexes:

    git grep '(\\A|(\\(z|Z)|$)/)'

Use string methods instead.

## Users with open signup

- https://gitlab.com
- https://atlas.oreilly.com
- https://penflip.com

No free account:

- https://githost.io

## Similar software

- <http://alternativeto.net/software/gitlab/>
- <http://alternativeto.net/software/github/>
