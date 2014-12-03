# 4M users.

# API

  TOKEN=''
  # USER='cirosantilli'
  USER='cirosantilli-puppet'
  REPO='test-tmp1'
  ID="$USER/$REPO"

  # Empty
  BLOB="e69de29bb2d1d6434b8b29ae775ad8c2e48c5391"

  # One file named `a` that is empty.
  TREE="496d6428b9cf92981dc9495211e6e1120fb6f2ba"

  # One file named `b` that is empty.
  TREE="4277b6e69d25e5efa77c455340557b384a4c018a"

  curl -H "Authorization: token $TOKEN" https://api.github.com

## Initialize a clean test repo

# Create repo:

  printf '{
    "name": "'$REPO'",
    "auto_init": true
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/user/repos

  # curl -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID

  # Blob
  BLOB="$(
    printf '{
      "content": ""
    }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/blobs | json sha
  )"
  echo $BLOB

  # Tree
  TREE="$(
    printf '{
      "tree": [
        {
          "path": "a",
          "mode": "100644",
          "type": "blob",
          "sha": "'$BLOB'"
        }
      ]
    }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/trees | json sha
  )"
  echo $TREE

  # Commit
  COMMIT="$(
    printf '{
      "message": "a",
      "tree": "'$TREE'"
    }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/commits | json sha
  )"
  echo $COMMIT

  # Ref
  printf '{
    "sha": "'$COMMIT'",
    "force": true
  }' | curl --data @- -H "Authorization: token $TOKEN" -X PATCH https://api.github.com/repos/$ID/git/refs/heads/master

## Repos

# <https://developer.github.com/v3/repos>

# Get repo:

  curl -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID

### Refs

# List:

  curl -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

#### Expected

  printf '{
    "ref": "refs/heads/0",
    "sha": "'$COMMIT'"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

  printf '{
    "ref": "refs/0/0",
    "sha": "'$COMMIT'"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

  printf '{
    "ref": "refs/0",
    "sha": "'$COMMIT'"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

##### Fail

# Invalid names:

  printf '{
    "ref": "refs/heads/a b",
    "sha": "'$COMMIT'"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

  printf '{
    "ref": "refs/heads/a.lock",
    "sha": "'$COMMIT'"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

# Top level:

  printf '{
    "ref": "0",
    "sha": "'$COMMIT'"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

# Go up:

  printf '{
    "ref": "refs/../0",
    "sha": "'$COMMIT'"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

  printf '{
    "ref": "refs/heads/../0",
    "sha": "'$COMMIT'"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

# Non-canonical:

  printf '{
    "ref": "refs/heads///2",
    "sha": "'$COMMIT'"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

  printf '{
    "ref": "refs/heads/./0",
    "sha": "'$COMMIT'"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

  printf '{
    "ref": "refs2/tags",
    "sha": "'$COMMIT'"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

# Long filename:

  printf '{
    "ref": "refs/heads/'`python -c 'print "m" * 251'`'",
    "sha": "'$COMMIT'"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

#### Unexpected

# YAY works: blocks pull requests and tags: https://github.com/isaacs/github/issues/308

  printf '{
    "ref": "refs/pull",
    "sha": "b17887cfde1dd808155f4eab9d809684ceccc54b"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

  printf '{
    "ref": "refs/tags",
    "sha": "b17887cfde1dd808155f4eab9d809684ceccc54b"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

  printf '{
    "ref": "refs/remotes",
    "sha": "'$COMMIT'"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/refs

## Tree

# Fail as expected:

  printf '{
    "tree": [
      {
        "path": ".git/a",
        "mode": "100644",
        "type": "blob",
        "sha": "'$BLOB'"
      }
    ]
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/trees

  printf '{
    "tree": [
      {
        "path": "a/.git/a",
        "mode": "100644",
        "type": "blob",
        "sha": "'$BLOB'"
      }
    ]
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/trees

  printf '{
    "tree": [
      {
        "path": "../a",
        "mode": "100644",
        "type": "blob",
        "sha": "'$BLOB'"
      }
    ]
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/trees

  printf '{
    "tree": [
      {
        "path": "/b",
        "mode": "100644",
        "type": "blob",
        "sha": "'$BLOB'"
      }
    ]
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/git/trees

## Status

# Shows on the branch page. This is how Travis interacts.

  printf '{
    "state": "success",
    "target_url": "http://example.com/a",
    "description": "da",
    "context": "a"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/statuses/$COMMIT

  printf '{
    "state": "failure",
    "target_url": "http://example.com/b",
    "description": "db",
    "context": "b"
  }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/statuses/$COMMIT

## Releases

    printf '{
      "tag_name": "1"
    }' | curl --data @- -H "Authorization: token $TOKEN" https://api.github.com/repos/$ID/releases | json upload_url

  # upload_url is a standardized URL template, now you have to replace the name parameter
  # in the URL template with the desired name.

    printf 'a' | curl --data @- -H "Authorization: token $TOKEN" -H 'Content-Type: application/zip' 'https://uploads.github.com/repos/cirosantilli-puppet/test-tmp1/releases/727084/assets?name=a.zip'

  # Fails, too long:

    printf 'a' | curl --data @- -H "Authorization: token $TOKEN" -H 'Content-Type: application/zip' 'https://uploads.github.com/repos/cirosantilli-puppet/test-tmp1/releases/727084/assets?name='`python -c 'print "n" * 255'`.zip

    printf 'a' | curl --data @- -H "Authorization: token $TOKEN" -H 'Content-Type: application/zip' 'https://uploads.github.com/repos/cirosantilli-puppet/test-tmp1/releases/727084/assets?name='`python -c 'print "n" * 250'`.zip
