#
# Makefile for Redirect Pages
#

LIST=REDIRECT-LIST

default: build


build:
	./build-pages $(LIST)


# Run this target to add any new files to Git
add:
	find . -name '*.html' \
	| fgrep -v ./template.html \
	| xargs -r git add


# WARNING: This target should only be used during inital development
# of these pages.  It will remove things that are eventually committed
# to the repository.
scrub:
	find . -type d \
	| egrep -ve '^\.\.?$$' \
	| xargs -r rm -rf


clean:
	rm -rf $(TO_CLEAN) *~
