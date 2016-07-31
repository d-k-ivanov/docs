### Change permisions recursively 
You can use a simple [Script](https://github.com/keepbot/shell_scripts/blob/master/permissions/default.sh "Change permissions to default")
```bash
find <path_to_folder> -type f -print -exec chmod 644 {} \;
find <path_to_folder> -type d -print -exec chmod 755 {} \;
```
### Count files
```bash
find . -type f | wc -l
ls | wc -l
```
### Remove file list
```bash
ls | xargs rm
```
### Remove file suffix "filename"+"suffix"
```bash
for i in `find . -type f -name "*<suffix>*"`; do dst=`echo $i | sed s/<suffix>//`;mv $i $dst; done
```
### Move all files in one level directory in certain folder to another
```bash
find /<path_to_folder>/* -prune -type f | xargs -I '{}' mv {} /<path_to_destination_folder>/archive/.
```
### Search for certain file contents
```bash
find . -type f -name "*conf" -exec echo {} \; -exec grep 192.168.0.1:3389 {} \;
```
### Show directories content recursively
```bash
ls -R /path | awk '
/:$/&&f{s=$0;f=0}
/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
NF&&f{ print s"/"$0 }'
```
### Make dirs with indexes
```bash
for i in 0{1..9} {10..39}; do mkdir delete-$i; cd delete-$i; touch del-file-$i; cd ..; done
```
###  Create bunch of files from list in a file:
```bash
# Predefined number of records
head -<number_of_lines> inventory | awk '{ print $1 }' | xargs -I '{}' <destination_folder>/{}
#E.g. head -10 inventory | awk '{ print $1 }' | xargs -I '{}' touch host_vars/{}

# Whole list from file
cat <filename> | awk '{ print $1 }' | xargs -I '{}' <destination_folder>/{}
#E.g. cat inventory | awk '{ print $1 }' | xargs -I '{}' host_vars/{}
```
### Move bunch of folders
```bash
ls -1d <space separeated folder list> | xargs -I '{}' mv {} <destination>
#E.g. ls -1d command_line dotfiles-srv programmming-examples shell_scripts | xargs -I '{}' mv {} github/
```
### Mounts
```bash
#Show information about mounted file systems with 'column' examples**
df -h | column -t
mount -l | column -t
```

### Sum of root folders
```bash
du -s * 2>/dev/null | awk '{print $1}' | paste -sd+ | bc
```

