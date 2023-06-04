# Idiot Proof Git

Alias-based [opinionated git](https://softwaredoug.com/blog/2022/11/09/idiot-proof-git-aliases.html).

Idiot-proofing your git experience with git aliases. No extra tools, no fuss, just standardized, opinionated aliases - for OSX users that use Github or Github Enterprise.

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

Adds shortcuts for a rebase-based workflow. Assumes a 'trunk' of develompment at either origin or upstream remotes. Assumes Github and/or Github Enterprise.

### 'git publish' or 'git pub'

Pushes local changes to the current branch. Rejects if local branch is not up to date (ie your buddy made changes). See [force-with-lease](https://itnext.io/git-force-vs-force-with-lease-9d0e753e8c41?gi=569651c36210)

### 'git synced'

Sync up with the trunkiest-trunk available. Either master or main on origin. If you have 'upstream' it prefers the upstream. 

Does a rebase with main/master on that remote.

### 'git update'

Sync this branch with it's remote. So if your buddy is working on this branch too, you can get their changes.

### 'git pr'

Loads a diff to open PR / shortcut to the current PR

[Inspired by this shortcut](https://salferrarello.com/git-alias-open-pull-request-github). Useful to jump to the PR to see review comments, create a PR, or view a diff in Github.

### 'git hub'

Opens the trunkiest-trunk available on Github (prefes upstream to remote; prefers github.com to your Github enterprise if available)

Useful to browse issues, PRs, etc on that repo.

### 'git squash'

Squash your changes into a single commit relative to HEAD - starts an interactive rebase.

## Useful shortcuts

### 'git amend'

Amend the last commit with a new change.
