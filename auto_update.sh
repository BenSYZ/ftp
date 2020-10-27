ip addr | grep '172\|2001' |awk '{print "* " $2}' > index.md
git add index.md
git commit -m 'index'
git push -f
#
