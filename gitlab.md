#Feedback ideas

Ideas that interest me.

Only ones that are not in the Booktree bug tracker, since all of those interest me and are better classified there.
https://github.com/booktree/booktree/issues

## Started

- http://feedback.gitlab.com/forums/176466-general/suggestions/5350102-option-to-make-a-merge-request-when-editing-via-we
- http://feedback.gitlab.com/forums/176466-general/suggestions/3797854-create-empty-repo-on-project-creation

##Accepted

Text output formats like PDF:

- http://feedback.gitlab.com/forums/176466-general/suggestions/4522830-allow-access-to-build-artifacts-of-gitlab-ci
- http://feedback.gitlab.com/forums/176466-general/suggestions/4319179-show-build-status-in-commit-details

Prose input specifics like Markdown:

All from web UI:

Analytics:

SaaS:

- http://feedback.gitlab.com/forums/176466-general/suggestions/5627348-notify-admin-whenever-the-sum-of-size-of-repositor

MRs, diffs:

- http://feedback.gitlab.com/forums/176466-general/suggestions/5607934-view-diff-on-submit-merge-request-form
- http://feedback.gitlab.com/forums/176466-general/suggestions/3958540-add-way-to-label-merge-requests
- http://feedback.gitlab.com/forums/176466-general/suggestions/5507440-auto-complete-merge-requests-in-gitlab-markdown
- http://feedback.gitlab.com/forums/176466-general/suggestions/4677198-allow-cross-repo-issue-merge-request-reference
- http://feedback.gitlab.com/forums/176466-general/suggestions/5592471-add-a-comment-to-a-mr-when-new-commits-pushed
- ($100) http://feedback.gitlab.com/forums/176466-general/suggestions/4255282-task-lists-like-github-done-or-some-other-implemen
- http://feedback.gitlab.com/forums/176466-general/suggestions/4851362-move-issues-between-projects

Issues, comments:

- http://feedback.gitlab.com/forums/176466-general/suggestions/3797817-close-comment-button-for-issues
- http://feedback.gitlab.com/forums/176466-general/suggestions/5350291-mentions-in-public-internal-repo-s-should-include-

###Easy

- http://feedback.gitlab.com/forums/176466-general/suggestions/6162713-the-new-project-button-in-the-admin-page-should-al
    easy, groups

- http://feedback.gitlab.com/forums/176466-general/suggestions/3538034-modify-tab-order-on-issues-comments-so-it-goes-to
    easy, UI

##Not Accepted

PDF output:

- http://feedback.gitlab.com/forums/176466-general/suggestions/5591851-store-build-configuration-in-the-repo-like-travi
- http://feedback.gitlab.com/forums/176466-general/suggestions/3957367-allowing-the-build-pages-to-be-viewed-publicly
- http://feedback.gitlab.com/forums/176466-general/suggestions/5591851-store-build-configuration-in-the-repo-like-travi
- gh pages: http://feedback.gitlab.com/forums/176466-general/suggestions/5599145-preview-render-static-html-pages-pushed-to-repos

All from web UI:

- http://feedback.gitlab.com/forums/176466-general/suggestions/6093710-track-changes-in-the-web-editor
- http://feedback.gitlab.com/forums/176466-general/suggestions/3797831-allow-moving-and-renaming-files-in-gitlab

MRs:

- http://stackoverflow.com/questions/2427238/in-git-what-is-the-difference-between-merge-squash-and-rebase

Easy:

- http://feedback.gitlab.com/forums/176466-general/suggestions/4066398-add-assign-to-and-other-ticket-options-to-the-co
- http://feedback.gitlab.com/forums/176466-general/suggestions/5514785-the-default-title-for-a-merge-request-should-be-th
- http://feedback.gitlab.com/forums/176466-general/suggestions/5593468-use-monospace-font-in-wiki-edit-content-textarea
- http://feedback.gitlab.com/forums/176466-general/suggestions/5593468-use-monospace-font-in-wiki-edit-content-textarea

- http://feedback.gitlab.com/forums/176466-general/suggestions/4205933-show-snippets-in-the-public-area
- http://feedback.gitlab.com/forums/176466-general/suggestions/5427278-subscribe-or-follow-a-repo
- http://feedback.gitlab.com/forums/176466-general/suggestions/5475512-user-profiles-and-user-search-similar-to-github-
- http://feedback.gitlab.com/forums/176466-general/suggestions/3784623-reputation-system-for-gitlab
- http://feedback.gitlab.com/forums/176466-general/suggestions/4501328-wysiwyg-in-wiki
- http://feedback.gitlab.com/forums/176466-general/suggestions/3841239-allow-standard-markdown-paragraphs-in-gitlab

100+ votes:

- http://feedback.gitlab.com/forums/176466-general/suggestions/4501700-allow-image-attachments-when-creating-new-issues

With PR:

- http://feedback.gitlab.com/forums/176466-general/suggestions/4201014-enable-mathjax-support-in-the-gollum-wikis
- http://feedback.gitlab.com/forums/176466-general/suggestions/5648020-better-editor-for-all-content

API:

- http://feedback.gitlab.com/forums/176466-general/suggestions/5618007-provide-an-unauthenticated-api

#My unsubmitted ideas

- make users public page project list like dashboard.
- make the project name link to the corresponding namespace on the project view

- UI: make issue / MR descriptions background white to match wiki.
- UI: make README view like file blob view without edit bar: add border + gray title bar (same as GitHub)
- UI: make API help more uniform. It currently renders as files (with gray header), unlike every other help page.
- UI: show MR count on the project tab

- UI: admin project remove user use minus instead of X. TODO where is minus used and where is 

        ciro@ciro$ (git::up) grep -Eri 'icon-remove' .
        ./projects/merge_requests/show/_mr_ci.html.haml:      %i.icon-remove
        ./projects/merge_requests/show/_mr_ci.html.haml:      %i.icon-remove
        ./projects/merge_requests/show/_mr_box.html.haml:        %i.icon-remove
        ./projects/notes/_discussion.html.haml:            %i.icon-remove
        ./shared/_project_filter.html.haml:          %i.icon-remove
        ./shared/_filter.html.haml:          %i.icon-remove
        ./admin/users/show.html.haml:                    %i.icon-remove.icon-white
        ./admin/users/show.html.haml:                      %i.icon-remove
        ./admin/projects/show.html.haml:                  %i.icon-remove
        ./admin/broadcast_messages/index.html.haml:            %i.icon-remove.cred
        ./groups/edit.html.haml:          %i.icon-remove-sign
        ~/gitlab/app/views

        ciro@ciro$ (git::up) grep -Eri 'icon-minus' .
        ./projects/team_members/_team_member.html.haml:          %i.icon-minus.icon-white
        ./projects/commits/_diff_head.html.haml:            %i.icon-minus
        ./projects/commits/_diff_head.html.haml:            %i.icon-minus
        ./admin/groups/show.html.haml:                %i.icon-minus.icon-white
        ./users_groups/_users_group.html.haml:        %i.icon-minus.icon-white

##differentiate markdown relative links from links from the root

Dir structure:

- /a.md
- /d/README.md
- /d/a.md

Currently, the only way to reference the file `/a.md` from `/d/README.md` is to do 

- [a.md](a.md)
- [/a.md](/a.md)

point to `/d/a.md`.

I suggest we make instead:

- `a.md` point to `/d/a.md`
- `/a.md` point to `/a.md`

which matches the common UNIX like file paths and URL schemes.

We can make this a non-breaking change via a script that automatically updates

Currently, if file `/d/a.md` does not exist, then the link `a.md` would point to `/a.md`.

We would have to make a choice:

- if `/d/a.md` does not exist and `/a.md` does, what happens?

# Merge request update policy

If requested to update a merge request, developers have 2 weeks to do so. But how long do GitLab owners / Collaborators have to consider the update and merge it?

If it takes too long, then the request may need to be updated again, so the first update made the developer lose some time, because its faster to fix all at once than setting things up twice.

I propose the following policy be added to the CONTRIBUTING:

- if the request for update was made 2 weeks before day 1 of the merge window, it must be ready for that window or it shall be closed.

- otherwise, it must be ready for the next window.

- once the request is made, consistently mark it with a label, e.g. the existing "Awaiting developer action/feedback"

- after day 1 of the merge window, just browse the label and close all MRs that did not respond.

This policy has the benefit that:

- developers have at least 2 weeks to update.
- collaborators have at least 7 days to review

If the review requests further updates and the merge window is open, the label is kept and review waits until the next merge window, where it should have been made mergeable again.

This does *not* imply that collaborators have to review every MR: only if they requested an update.

Requesting an update is not the same as asking for modifications: if something is wrong with the behaviour / implementation MR, it should be noted immediately. This policy only concerns requests to make things merge-able again, and only those issues will get the label.

We can of course be flexible in the times: nothing is written in stone. However, since the contrib process is already very good, why not write it down to make some publicity for GitLab?
