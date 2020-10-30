#!/bin/bash
cd $(dirname $0)
#git pull origin main
wget --reject pdf,svg,eml,png,json,xlsx,pptx,eot,eot2,ttf,woff,woff2 --recursive --level=1 --span-hosts --domains=corona.hhu.de --random-wait  --mirror --convert-links --adjust-extension --page-requisites --no-parent https://corona.hhu.de
find . -type f -name "*.html" -exec tidy -m '{}' \;
find . -type f -name "*.html" -exec ./to_plaintext.py '{}' \;
find ./* -type f -not -name "README.adoc" -not -name "pull_website.sh" -not -name "to_plaintext.py" -not -name "*.md" -not -path "./.git/*" -exec rm '{}' \;
git add --all
git commit -m "$(date)"
#git push origin main 
