#!/bin/bash

git add --all

git commit -a -m "Post $(date +%Y-%m-%d-%H:%M:%S)"

git push -u origin master

python -m mkdocs gh-deploy --clean
