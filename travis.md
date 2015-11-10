# Travis

## Long time without stdout

You must produce stdout as time goes. If no stdout happens in the last 10 minutes, the build errors with:

> No output has been received in the last 10 minutes, this potentially indicates a stalled build or something wrong with the build itself.

If you want to reduce the size of a huge error suite stdout, consider:

## Maximum log size

Maximum log size 4Mb: <https://github.com/travis-ci/travis-ci/issues/1382>? But sometimes smaller outputs fail?

## Error vs Broken

If your test script does:

    exit 1

it is an error.

If it does:

    false

at the end, it is broken.

Travis likely sources the script.

If you want to store the test command exit status, cat generated log files, and then exit, use:

    make check
    status=$?
    cat my.log
    (exit $status)

## Get log files without artifact upload

If your log files are not too large, you can cat them directly and see the Travis log, this is simpler to setup than artifact upload.

You should mark file borders with some rare string like:

    echo '### START my.log ###'
    cat my.log
    echo '### END my.log ###'

Then you can `sed` up the log to extract it:

    sed '/^'### START my.log ###$/,/^### END my.log ###$/!d;//d'

See also: <http://stackoverflow.com/questions/17988756/how-to-select-lines-between-two-marker-patterns-which-may-occur-multiple-times-w>

If the log is too big (2M?), then you might what to grep it instead. E.g., for DejaGnu logs, we don't care about the passes, so we can do:

    grep -v '^PASS' my.log
