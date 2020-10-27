ip addr | grep '172\|2001' |awk '{print "* " $2}' > index.md
git add ./
git commit -m 'index'
git rebase -i HEAD^
git push -f
