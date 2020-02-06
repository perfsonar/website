#
# perfSONAR Web Site Makefile
#

default: build


vm:
	vagrant up
TO_CLEAN += .vagrant


ssh:
	vagrant ssh -c "sudo -i -u $${USER}"

setup:
	sudo /bin/bash -c "cd $$(pwd) && source /etc/profile.d/rvm.sh && bundle install"


build:
	jekyll build
TO_CLEAN += _site .sass-cache .jekyll-cache .jekyll-metadata


dev:
	jekyll build --incremental --watch


clean:
	vagrant destroy -f
	find . -name "*~" | xargs rm -f
	rm -rf $(TO_CLEAN)
