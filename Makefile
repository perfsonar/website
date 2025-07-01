#
# perfSONAR Web Site Makefile
#

default: build


vm:
	vagrant up
VAGRANT_TO_CLEAN += .vagrant


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
	@command -v vagrant > /dev/null \
	    && $(MAKE) vagrant-clean \
	    || echo "No Vagrant; must be in the VM."
	find . -name "*~" | xargs rm -f
	rm -rf $(TO_CLEAN)


vagrant-clean:
	vagrant destroy -f
	rm -rf $(VAGRANT_TO_CLEAN)



supported:
	@grep -Elr -e 'supported:\s*true'  _releasenotes
