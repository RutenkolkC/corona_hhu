!#/bin/bash
cd $(dirname $0)
git pull origin main
wget --reject pdf,svg,eml,png,json,xlsx,pptx,eot,eot2,ttf,woff,woff2 --recursive --level=1 --span-hosts --domains=corona.hhu.de --random-wait  --mirror --convert-links --adjust-extension --page-requisites --no-parent https://corona.hhu.de
git add --all
git commit -m "$(date)"
git push origin main 
