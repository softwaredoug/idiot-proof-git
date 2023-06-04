# Idiot Proof Git

Alias-based [opinionated git](https://softwaredoug.com/blog/2022/11/09/idiot-proof-git-aliases.html).

Idiot-proofing your git experience with git aliases. No extra tools, no fuss, just standardized, opinionated aliases for the 80% use case. 

Intended for OSX users that use Github or Github Enterprise. Automagically uses the right 'trunk' for the situation - (upstream or origin, master or main...) - without you having to remember all that jazz.

## Installation and updating

### Script

Either run

```
./install.sh
```

And follow the instructions

... Or

### Copy into .gitconfig

Just copy the aliases from this `.gitconfig` into your `.gitconfig`. 

If applicable, replace the `enterprisehost = "!echo 'your.enterprise.host'"`, to point at a Github Enterprise instance

## How it works

Adds shortcuts for a rebase workflow. Assumes a 'trunk' of develompment at either origin or upstream remotes. Assumes Github and/or Github Enterprise.

### 'git publish' or 'git pub'

Pushes local changes to the current branch at origin. Rejects if local branch is not up to date (ie your buddy made changes). See [force-with-lease](https://itnext.io/git-force-vs-force-with-lease-9d0e753e8c41?gi=569651c36210)

### 'git synced'

Sync up current branch corresponding branch at trunkiest-trunk available. Either master or main. If you have 'upstream' it prefers the upstream, but falls back to origin.

Does a rebase with main/master on that remote.

### 'git update'

Sync this branch with it's corresponding branch at origin. So if your buddy is working on this branch too, you can get their changes.

### 'git squash'

Squash your changes into a single commit relative to main branch's HEAD commit - starts an interactive rebase relative to that commit.

## Github Shortcuts

### 'git pr'

Loads a diff to open/view PR to main (or master) branch at trunkiest trunk.

[Inspired by this shortcut](https://salferrarello.com/git-alias-open-pull-request-github). Useful to jump to the PR to see review comments, create a PR, or view a diff in Github.

### 'git hub'

Opens the trunkiest-trunk available on Github (prefes upstream to origin; prefers github.com to your Github enterprise if available)

Useful to browse issues, PRs, etc on that repo.

## Useful shortcuts

### 'git amend'

Amend the last commit with a new change.

## Philosophy

* Just solve the 80% use case most people have for interacting/syncing with remotes
* Don't replace git, just augment it
* Expect users to use git for anything beyond the 80%, which will be most of the time
