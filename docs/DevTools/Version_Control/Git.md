# Common Git commands

## Cloning

```bash

# For new repos(-jN - number of simltaniuos jobs):
git clone --recursive-submodules -j4 git@github.com:keepbot/docs.git
git clone --recursive-submodules git@github.com:keepbot/docs.git

# Ignore self signed ssl certificates
git -c http.sslVerify=false clone --recursive git@github.com:keepbot/docs.git
```

## Cleaning repository

```bash
# Those commands reset all changes. The repository will be the same as clone new repos.
git reset --hard
git clean -d -x -f
```

## Commits

```bash
# Add files to commit
git add <path_to_file>
# Commit with comment
git commit -m "Your comment here"
# Commit with review (Will be shown as diff)
git commit -v
# Add changes to previous commit or change commit message
git commit --amend
# Add changes to previous commit without changing commit message
git commit --amend --no-edit
```

## Submodules

### Add and Update submodule

```bash
# Add
git submodule add -b <branch_name> <submodule_git_url> <local_path>
# Update
git submodule update --recursive --remote
# Download all
git submodule update --init --recursive
```

### Remove submodule

```bash
# 1. Delete the relevant section from the *.gitmodules* file.
[submodule "vendor"]
    path = vendor
    url = git://github.com/some-user/some-repo.git
# 2. Stage the *.gitmodules* changes with following command:
git add .gitmodules
# 3.Delete the relevant section from *.git/config*:
[submodule "vendor"]
    url = git://github.com/some-user/some-repo.git
# 4. Remove submodule folders from repo:
git rm --cached path/to/submodule
rm -rf .git/modules/submodule_name
# 6. Commit changes
# 7. Delete files
rm -rf path/to/submodule
```

### Change branch for existing submodule

```bash
cd <path_to_repo>
git config -f .gitmodules submodule.<local_path>.branch <branch_name>

# Make sure that submodule is at the latest of branch (OR)
cd <submodule_local_path>
git checkout -b branch --track origin/branch
git branch -u origin/master master

cd <path_to_repo>
git add <submodule_local_path>
```

## Branches

```bash
# Create branch
git checkout -b <branch_name>
# Checkout branch
git checkout <branch_name>
# List local branches
git branch
# List remote branches
git branch -r
# List all branches
git branch -a
# List all merged branches
git branch -a --merged
# List all not merged branches
git branch -a --no-merged
# Remove branch
git push origin --delete <branch_name>
```

## Garbage collection

```bash
# Help: https://git-scm.com/docs/git-gc
# Runs a number of housekeeping tasks within the current repository, such as compressing file revisions (to reduce disk space and increase performance), removing unreachable objects which may have been created from prior invocations of git add, packing refs, pruning reflog, rerere metadata or stale working trees.
# Users are encouraged to run this task on a regular basis within each repository to maintain good disk space utilization and good operating performance.
# Some git commands may automatically run git gc
# Enable automatic garbage collection
git config --global gc.auto 1
# Disable automatic garbage collection
git config --global gc.auto 0

# Run garbage collector
git gc
# Run garbage collector to prune old file
git gc --prune=now
# Run garbage collector if necessary
git gc --auto
# Alternative ways to cleanup old references:
git remote prune origin
git fetch --prune
```

## Patches

### Create patch from commit

```bash
## The easiest version (you can specify number of commit to patch)
git format-patch -1 HEAD
## Same as first, but create numbered files (00001-nnnnn)
git format-patch -n HEAD^
## Simple cat ftom stdout, works fine on most of systems, but be carfull, if you have customized terminal (color tags, special symbols, etc.)
git show HEAD > path_to.patch
```

### Apply patches

```bash
git apply --stat 00001-File-Name.patch
git apply --check 00001-File-Name.patch
git am < 0001-File-Name.patch
```

## Line endings

### OS-based proper config

```bash
# Mac
git config --global core.autocrlf input
# Linux
git config --global core.autocrlf input
# Windows
git config --global core.autocrlf true
```

### Normalize line endings

```bash
# Save your current files in Git, so that none of your work is lost.
git add . -u
git commit -m "Saving files before refreshing line endings"

# Remove the index and force Git to rescan the working directory.
rm .git/index

# Rewrite the Git index to pick up all the new line endings.
git reset

# Show the rewritten, normalized files.
git status

# Add all your changed files back, and prepare them for a commit. This is your chance to inspect which files, if any, were unchanged.
git add -u
# It is perfectly safe to see a lot of messages here that read
# "warning: CRLF will be replaced by LF in file."

# Rewrite the .gitattributes file.
git add .gitattributes

# Commit the changes to your repository.
git commit -m "Normalize all the line endings"
```

## Settings

```bash
# System namespace
git config --global user.name "Your Name"
git config --global user.email your@e-mail.com

# Repository namespace
git config --local user.name "Your Name"
git config --local user.email your@e-mail.com

```

## Update local reposytory from remote

```bash
# Fentch + Merge
git pull
# Fetch only
git fetch
# Fetch changes from remote repository with modified local repository
git commit -a -m "new commentary"
git pull rebase
# pull remote with overwrite local changes
git fetch --all
git reset --hard origin/master
```

## Working with bunch of  repositories

```bash
# Last commits
for d in `ls`; do cd $d; git log --pretty=format:"%h - %an, %ar : %s" -1; cd ..; done
# Mass checkout
for d in `ls`; do cd $d; git checkout; cd ..; done
```

## Logs

```bash
git log --pretty=format:"%h - %an, %ar : %s" -1
```

## Provide separate ssh-key

```bash
vim ~/.ssh/config
#------ add ------
host <full_server_hostname>
 HostName <full_server_hostname>
 IdentityFile ~/.ssh/<your_custom_ssh_key>
 User <git_user>
#---- example ---
host github.com
 HostName github.com
 IdentityFile ~/.ssh/id_rsa_github
 User git
#----------------
sudo chmod 400 ~/.ssh/<your_custom_ssh_key>
Now you can clone repo
```
