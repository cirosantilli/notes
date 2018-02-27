# Data dump

Playing around with user data from: <https://archive.org/details/stackexchange>

Initial goal: show that I have a huge profile views / rep ratio.

## Date

http://meta.stackexchange.com/questions/264565/when-was-the-last-data-dump-upload-to-archive-org

## Format

Same as SEDE: http://meta.stackexchange.com/questions/2677/database-schema-documentation-for-the-public-data-dump-and-sede

- https://meta.stackexchange.com/questions/193802/does-the-public-data-dump-contain-user-names-or-not
- http://meta.stackexchange.com/questions/933/why-is-vote-time-missing-in-the-se-data-dump-and-sede
- what `anonymized` means http://meta.stackexchange.com/a/269759/200117

## Preprocessing

Existing scripts:

- http://stackapps.com/questions/3610/stackdump-an-offline-browser-for-stackexchange-sites
- http://meta.stackexchange.com/questions/28221/scripts-to-convert-data-dump-to-other-formats
- mongodb https://github.com/bgianfo/stackoverflow-mongodb
- https://gist.github.com/gousiosg/7600626

The problem is that I could not find decent tools to manipulate large XML files from the command line easily.

But since the data is well formatted (one entry per line, no inner `"`), it is possible to use `sed` to parse it.

Keep only the attribute names:

    cat small.xml |\
    head -n-2 |\
    tail -n+1 |\
    perl -lape 's/.*?([^= ]+)="|.*/$1 /g'

### Posts

Number of rows: 21736593

Optional fields:

- `OwnerUserId`: TODO why optional? This is an example of post without owner: <http://stackoverflow.com/a/23966/895245> Deleted accounts?
- `OwnerDisplayName` TODO why optional?
- `AcceptedAnswerId`
- `CommunityOwnedDate`

#### Broken sed attempt

Remove all data that may contain spaces from the posts, keeps only the more hard / precise fields.

Blacklist attempt:

    cat small.xml |\
    head -n-2 |\
    tail -n+1 |\
    sed -E \
    -e 's/(Body|LastEditorDisplayName|OwnerDisplayName|Title)="[^"]*" //g' \
    -e 's/  <row //' \
    -e 's/ \/>\r$//' \
    -e 's/[^ ]*="//g' \
    -e 's/"//g'

This is broken because some fields are optional which generates ambiguity on the final table.

To have a simple text table we have to remove optional fields, or set them to some magic value if missing.

Whitelist with only required fields attempt:

    cat Posts.xml |\
    head -n-1 |\
    tail -n+3 |\
    sed -E \
    -e 's/  <row //' \
    -e 's/\/>\r$//' \
    -e 's/\b(Id|PostTypeId|ParentId|Score|ViewCount|OwnerUserId)=//g' \
    -e 's/\b[^= ]*="[^"]*" //g' \
    -e 's/"//g'

This is broken because `OwnerUserId` is also optional! I give up, `perl` + array is required!
