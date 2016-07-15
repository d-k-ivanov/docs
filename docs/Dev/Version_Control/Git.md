### Clone
```
# For new repos(-jN - number of simltaniuos jobs):
git clone --recursive -j4 https://github.com/keepbot/dotfiles-srv
git clone --recursive https://github.com/keepbot/dotfiles-srv

# For already cloned repos:
git submodule update --init --recursive
```

### Global settings
```bash
git config --global user.name "Your Name"
git config --global user.email your@e-mail.com
```
### Create new repository
```bash
mkdir -p <path_to_repository>
cd <path_to_repository>
git add .
git commit -m "Initialization"
git remote add origin https://github.com/username/<repository>.git
git push -u origin master
git checkout 
```
### Commit
```bash
# Addition of new files with automatic staging of deleted and modified files
git add .
git commit -a -m "new commentary"
git push -u origin master
```
### Update local reposytory from remote
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
### Working with bunch of  repositories
```bash
# Last commits
for d in `ls`; do cd $d; git log --pretty=format:"%h - %an, %ar : %s" -1; cd ..; done
# Mass checkout
for d in `ls`; do cd $d; git checkout; cd ..; done
```

### Making patches from commits:
* Create patch 
```bash
# The easiest version (you can specify number of commit to patch) 
git format-patch -1 HEAD
# Same as first, but create numbered files (00001-nnnnn)
git format-patch -n HEAD^
# Simple cat ftom stdout, works fine on most of systems, but be carfull, if you have customized terminal (color tags, special symbols, etc.)
git show HEAD > path_to.patch
```
* Apply patch
```bash
git apply --stat 0001-Linux-agent-LVM-subagent-initial-implementation.patch
git apply --check 0001-Linux-agent-LVM-subagent-initial-implementation.patch
git am < 0001-Linux-agent-LVM-subagent-initial-implementation.patch
```


