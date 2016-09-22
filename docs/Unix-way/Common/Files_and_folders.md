### Change permisions recursively 
You can use a simple [Script](https://github.com/keepbot/progs/blob/master/bash/permissions/default.sh "Change permissions to default")
```bash
find <path_to_folder> -type f -print -exec chmod 644 {} \;
find <path_to_folder> -type d -print -exec chmod 755 {} \;

# Union
find /home/tmp -type f -print -exec chmod 644 {} \; && find /home/tmp  -type d -print -exec chmod 755 {} \;
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
head -<number_of_lines> inventory | awk '{ print $1 }' | xargs -I '{}' touch <destination_folder>/{}
#E.g. head -10 inventory | awk '{ print $1 }' | xargs -I '{}' touch host_vars/{}

# Whole list from file
cat <filename> | awk '{ print $1 }' | xargs -I '{}' touch <destination_folder>/{}
#E.g. cat inventory | awk '{ print $1 }' | xargs -I '{}' touch host_vars/{}
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

### Mass change extension of files
```bash
for file in *.txt; do mv "$file" "`basename "$file" .txt`.md"; done
```

### Split file
```bash
split <OPTION> <FILE> <PREFIX>

OPTIONS:
-aN, --suffix-length=N - length of numeric suffix. See "-d for suffices". Default 2.
-bN, --bytes=N - Amount of bytes in each of file. There is some interesting way to produce sucficies: K, KB, M, MB, G, GB, T, TB etc., where all values with "B" multiply amount to 1024xx, and without "B" - to 1000xx, so 1M=1024KB 1MB=1000KB, 1G=1024MB 1GB=1000MB. See MiB and MB explanation in wiki.
-d, --numeric-suffixes - enables numeric suffices <PREFIX>00, <PREFIX>01, <PREFIX>.02, etc., (with default prefix: х00, х01, х02, х03, etc.)
-lN, --lines=N - If you doesn't split files by bytes, then you split it by lines. So this option set amout of line in result file. Default 1000.

Example
split -b 8GB -d archive.tar.gz archive.tar.gz.

archive.tar.gz.00
archive.tar.gz.01
archive.tar.gz.02
archive.tar.gz.03
```

### Joining all similarly prefixed files
For example, "_tar.gz.1of2" and "_tar.gz.2of2".
```
# Unix
cat "FileName_tar.gz.1of3" "FileName_tar.gz.2of3" "FileName_tar.gz.3of3" > "FileName.tar.gz"
# Windows
copy /b "FileName_tar.gz.1of3"+"FileName_tar.gz.2of3"+"FileName_tar.gz.3of3" "FileName.tar.gz"
```
