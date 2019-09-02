# Git-Flow

## Links

[Git-Flow branching model](https://nvie.com/posts/a-successful-git-branching-model/)

## Sample Workflow

### Install Git-Flow-AVH

[Git-Flow-AVH Instalaltion Notes](https://github.com/petervanderdoes/gitflow-avh/wiki/Installation)

### Initialize workflow in Git repo

```bash
$ git flow init

Which branch should be used for bringing forth production releases?
- develop
- master
- release/1.0.0
Branch name for production releases: [master]

Which branch should be used for integration of the "next release"?
- dev/feature/ISSUE-111
- develop
- release/1.0.0
Branch name for "next release" development: [develop]

How to name your supporting branch prefixes?
Feature branches? [feature/] dev/feature/
Bugfix branches? [bugfix/]
Release branches? [release/]
Hotfix branches? [hotfix/]
Support branches? [support/]
Version tag prefix? []
Hooks and filters directory? [~/workspace/git-repo/.git/hooks]
```

### Finish flow

#### Ensure that all branches are up to date with remotes

```bash
#assuming that you are on release branch
release=`git branch | grep \* | cut -d ' ' -f2-`
git checkout develop && git pull
git checkout master && git pull
git checkout $release && git pull
```

#### Merge branches with command:

```bash
git flow release finish --keepremote
```

#### Push all branches and get back to develop:

```bash
git push
git checkout master && git push
git push --tags
git checkout develop
```

#### Remove all dev branches that were merged into develop to keep only important one:

```bash
git branch -r --merged origin/develop | grep origin/dev/ | sed -s 's@origin/@@' | sed -e 's/^[ \t]*//' | tee branches_to_delete
for i in `cat branches_to_delete`; do git push origin :$i; done
rm branches_to_delete
```

### Hotfix

```bash
git flow hotfix start 1.10.1
Switched to a new branch 'hotfix/1.10.1'

Summary of actions:
- A new branch 'hotfix/1.10.1' was created, based on 'master'
- You are now on branch 'hotfix/1.10.1'

Follow-up actions:
- Bump the version number now!
- Start committing your hot fixes
- When done, run:

git flow hotfix finish '1.10.1'
```
