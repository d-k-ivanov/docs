#!/usr/bin/env bash

va
python -m mkdocs gh-deploy --clean
git add --all
git commit -a -m "Post $(date +%Y-%m-%d-%H:%M:%S)"
git push -u origin master
vd

