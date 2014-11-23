# Atlas

<http://atlas.oreilly.com/>

<http://www.oreilly.com/about/>: 277 employees.

## GitLab Token and URL

You API token is visible from web edit on the header:

<https://atlas.oreilly.com/tmp/a/editor/master/01-titlepage.html>

Just grep for `gitlab_token` and `gitlab_url` (currently <https://git.atlas.oreilly.com>)

## Merge requests

Atlas does use them according to the GitLab API.

They set the title to a template "From to".

## Issues

Appear unused.

## Sample requests

    USERNAME="TODO"
    REPO_PATH="TODO

    HOST="https://git.atlas.oreilly.com"

    printf '{
      "file_path": ".git/config",
      "branch_name": "master",
      "content": "[core]\\n  repositoryformatversion = 0\\n  filemode = true\\n  bare = false\\n[remote \\"origin\\"]\\n  url = ANYTHING\\n  fetch = +refs/heads/*:refs/remotes/origin/*\\n  receivepack = '"$SATELLITE_PATH/$USERNAME/$REPO_PATH"'/a.sh\\n",
      "commit_message": "0"
    }' | curl -vvv -H 'Content-Type: application/json' --data @- "$HOST/api/v3/projects/${USERNAME}%2F${REPO_PATH}?private_token=$PRIVATE_TOKEN"

    curl -vvv -H 'Content-Type: application/json' "$HOST/api/v3/projects/${USERNAME}%2F${REPO_PATH}?private_token=$PRIVATE_TOKEN"
