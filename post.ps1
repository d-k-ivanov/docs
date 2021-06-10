#requires -version 3

va
python -m mkdocs gh-deploy --clean
git add --all
git commit -a -m "Post $(Get-Date -UFormat +%Y-%m-%d-%H:%M:%S)"
git push -u origin main
vd
