# Architecture

## Configuration

Managed by <https://github.com/settingslogic/settingslogic>.

At:
<https://github.com/gitlabhq/gitlabhq/blob/2b816075dc71dfe8f6f9e5349fdff7f03ad9dad0/config/initializers/2_app.rb#L5>
`Settings` is aliased to `Gitlab.config` which is then used on the app
instead of Settings. TODO why the indirection?
