#!/bin/bash
links_DIR='/home/ben/GitRepos/links'
links_DIR="$(dirname $0)"
echo $links_DIR

if [[ -n $(ip addr | grep '172.2[96]\|2001') ]]; then
	if [[ -n $(diff <(head -2 $links_DIR/index.md) <(ip addr | grep '172.29\|2001' |awk '{print "* " $2}')) ]]; then

		ip addr | grep '172.2[96]\|2001' |awk '{print "* " $2}' > $links_DIR/index.md
		echo >> $links_DIR/index.md
		echo '---' >> $links_DIR/index.md
		date >> $links_DIR/index.md

		# README.md

		echo "My local ip address at school" > $links_DIR/README.md
		ip addr | grep '172.2[96]\|2001' |awk '{print "* " $2}' >> $links_DIR/README.md
		echo >> $links_DIR/README.md
		echo '---' >> $links_DIR/README.md
		date >> $links_DIR/README.md

		git -C $links_DIR reset HEAD^
		git -C $links_DIR add *
		git -C $links_DIR commit -m 'index'
	fi
fi
git -C $links_DIR push -f
