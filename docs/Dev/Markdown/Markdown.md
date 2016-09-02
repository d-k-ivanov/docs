### Generate MD file from baunch of man files
```bash
for file in *.txt; do echo "### $file" >> result.md; echo '```' >> result.md; cat $file >> result.md; echo '```' >> result.md; echo >> result.md; done
```