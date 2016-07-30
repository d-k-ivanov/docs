#!/bin/bash

git add --all

git commit -a -m "Post $(date +%Y-%m-%d-%h-%m)"

git push -u origin master

mkdocs gh-deploy --clean
