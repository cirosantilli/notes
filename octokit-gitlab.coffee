# How GitLab API response fields map to GitHub's.

repository:
  unchanged: [
    'created_at' # 2014-06-14T16:28:07.150Z
    'default_branch'
    'description'
    'id'
    'owner'
  ]
  renamed:
    full_name: 'path_with_namespace',
    last_activity_at: ['updated_at', 'pushed_at'] # '2014-06-14T16:28:39.702Z' TODO understand
    http_url_to_repo: 'clone_url' # https://gitlab.com/cirosantilli/test.git',
    issues_enabled: 'has_issues'
    path: 'name'
    public: 'private',
    ssh_url_to_repo: 'ssh_url'
    web_url: 'html_url' # https://gitlab.com/cirosantilli/test
    wiki_enabled: 'has_wiki'
  specific: [
    'archived'
    'snippets_enabled'
    'merge_requests_enabled'
    'name_with_namespace'
    'namespace'
    'permissions'
    'visibility_level'
  ]
  specific_renamed:
    name: 'humanName' # 'Repository Name'. Human readable name.

user:
  unchanged: [
    'id' # 12345
    'avatar_url' # https://secure.gravatar.com/avatar/c979bd881b6755f84947a5a8ecc7c6f7?s=40&d=identicon'
  ]
  renamed:
    username: 'login' # cirosantilli
  specific: [
    'name' # 'Ciro Santilli',
    'state' # 'active',
  ]
