### Dealing with line endings
```bash
# Mac
git config --global core.autocrlf input
# Linux
git config --global core.autocrlf input
# Windows
git config --global core.autocrlf true
```

### Normalize all the line endings
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

### Clone
```bash
# For new repos(-jN - number of simltaniuos jobs):
git clone --recursive-submodules -j4 https://github.com/keepbot/dotfiles
git clone --recursive-submodules https://github.com/keepbot/dotfiles

# Ignore self signed ssl certificates
git -c http.sslVerify=false clone --recursive https://github.com/keepbot/dotfiles.git
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

### Clean
```bash
git clean -d -x -f
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

### Creating patches from commits:
```bash
# The easiest version (you can specify number of commit to patch) 
git format-patch -1 HEAD
# Same as first, but create numbered files (00001-nnnnn)
git format-patch -n HEAD^
# Simple cat ftom stdout, works fine on most of systems, but be carfull, if you have customized terminal (color tags, special symbols, etc.)
git show HEAD > path_to.patch
```

### Apply patches:
```bash
git apply --stat 0001-Linux-agent-LVM-subagent-initial-implementation.patch
git apply --check 0001-Linux-agent-LVM-subagent-initial-implementation.patch
git am < 0001-Linux-agent-LVM-subagent-initial-implementation.patch
```

### Add submodule
```bash
git submodule add -b <branch_name> <submodule_git_url> <local_path>
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

### Update submodules
```bash
git submodule update --recursive --remote
```

### Download all submodules
```bash
git submodule update --init --recursive
```

### Remove submodule
```
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

### Logs
```bash
git log --pretty=format:"%h - %an, %ar : %s" -1
```

### Provide separate ssh-key
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


