#!/bin/bash

git add --all

git commit -a -m "Post $(date +%Y-%m-%-%H:%M:%S)"

git push -u origin master

mkdocs gh-deploy --clean
