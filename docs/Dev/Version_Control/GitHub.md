### Git: Global settings
```bash
git config --global user.name "Your Name"
git config --global user.email your@e-mail.com
```
### Git: Create new repository
```bash
mkdir -p <path_to_repository>
cd <path_to_repository>
git add .
git commit -m "Initialization"
git remote add origin https://github.com/username/<repository>.git
git push -u origin master
git checkout 
```
### Git: New commit
```bash
# Addition of new files with automatic staging of deleted and modified files
git add .
git commit -a -m "new commentary"
git push -u origin master
```
### Git: update local reposytory from remote
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
### Git: Working with bunch of  repositories
```bash
# Last commits
for d in `ls`; do cd $d; git log --pretty=format:"%h - %an, %ar : %s" -1; cd ..; done
# Mass checkout
for d in `ls`; do cd $d; git checkout; cd ..; done
```
### GitHub: Independent history catalogs of git repository
```bash
# Makes a bunch of history folders formatted by the next way: <repository>-<number_of_commit>-<commit_hash>
# Check commit_list.end for mistakes, you need simple list of commits
git clone <repository_url> <repository>
cd <repository> && git log --pretty=format:"%h" > ../commit_list && cd ..
tac commit_list > commit_list.end 
i=1; for cid in `cat commit_list.end`; do cp -r <repository> <repository>-$i-$cid; cd <repository>-$i-$cid; git checkout $cid; cd ..; ((i=i+1)); done
```
### GitHub: Clone all user's repository
```bash
# Get complete list of user's repositories in JSON file
curl -s https://api.github.com/users/<username>/repos?per_page=200 > repo.list.json
python -c "import json,sys,os;file = open('repo.list.json' ,'r');obj = json.load(file);obj_size = len(obj);cmd = 'git clone  ';[os.system(cmd + obj[x]['clone_url']) for x in range(0, obj_size)];file.close()"
# And dont forget about "space"(%20, " ") in cmd = 'git clone ', it's completely nessesary
# Another way to clone up to 200 user's repos(just in shell): 
curl -s https://api.github.com/users/keepbot/repos?per_page=200 | jq '.[] | ."clone_url"' | xargs -I '{}' git clone {}
```
