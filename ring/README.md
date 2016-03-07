# Ring

Benchmark Skype (pro), Cisco Webex.

<https://ring.cx>

<https://ring.cx/en/documentation/technical-aspects-of-ring>

<https://lists.savoirfairelinux.net/pipermail/ring/>

<https://webchat.freenode.net/> #ring

<https://twitter.com/JoinTheRing>

Ring : la communication à l'ère des hommes et objets connectés <https://www.youtube.com/watch?v=lkOoVRCSrQ4&feature=youtu.be>

Wiki: says it is read-only and closed. Does that mean even for signed in users?

- <https://projects.savoirfairelinux.com/projects/ring/wiki/WikiStart>
- <https://projects.savoirfairelinux.com/projects/ring>

What is the official bug tracker / feature request:

-   redmine <https://projects.savoirfairelinux.com/projects/ring/issues?set_filter=1>

    mentioned at <https://projects.savoirfairelinux.com/projects/ring/wiki/BugReports>. Only possible for employees.

-   <https://lists.savoirfairelinux.net/pipermail/ring/> (mentioned at: <https://ring.cx/en/documentation/how-to-contribute-to-the-ring-project>)

-   <https://tuleap.ring.cx/projects/ring/>

    Looks like the most active one.

    What is an epic: <https://tuleap.ring.cx/plugins/tracker/?tracker=10> Looks like a set of stories.

    Anyone can open issues.

    <https://tuleap.ring.cx/plugins/tracker/?group_id=101>

Pull requests:

-   gerrit <https://gerrit-ring.savoirfairelinux.com/#/q/status:open>

    TODO oauth only? Seems so.

    TODO: open for public? Seems so.

Mailing list seems more active.

Telephone: 601

Client server architecture.

Server executable: `/usr/lib/x86_64-linux-gnu/dring`.

Linux client: `/usr/bin/ring`, which decides between `/usr/bin/gnome-ring` and `ring-kde` otherwise.

## Missing features

Nice identifiers instead of the hashes: Also for tox: <https://github.com/irungentoo/toxcore/issues/1222>

## Devs

Compile and install: <https://github.com/cirosantilli/ring>

### Compile options

Static executable: `-DENABLE_STATIC=true` on lrc and client.

### Style

C++11 + POSIX (via mingw in Windows) + boost

- private variables underscore trailed `dispatcher_`

## DHT

Algorithm:

-   https://en.wikipedia.org/wiki/Kademlia
    - original paper https://pdos.csail.mit.edu/~petar/papers/maymounkov-kademlia-lncs.pdf
-   https://en.wikipedia.org/wiki/Mainline_DHT
