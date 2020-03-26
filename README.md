# perfSONAR Web Site

These are the files used to generate the perfSONAR web site on GitHub pages.

The site is based on [Jekyll](https://jekyllrb.com), a static site
generator based on Ruby and the
[Liquid](https://shopify.github.io/liquid) templating language.

The recommended environment is the development VM described below.

## Development VM

### Prerequisites

 * Linux or OS X host system VirtualBox
 * Vagrant
 * The `vagrant-vbguest` plugin (installed with `vagrant plugin install vagrant-vbguest`).


### Setup

This process will build a VirtualBox VM with an account matching your
account on the host and your home directory available as a shared
folder.

Begin by cloning a copy of the site sources into your home directory.

Then build the VM:

```
you@host$ cd ~/path/to/checked/out/website
you@host$ make vm
```

Prepare the environment on the VM for use (sorry, this couldn't be
automated as part of the VM build):

```
you@host$ make ssh
you@ps-site-dev$ cd ~/path/to/checked/out/website
you@ps-site-dev$ make setup
```

Ignore the complaints about running Bundler as root.


### Developing On the VM

Files in the cloned copy of the site can be edited on the host or the guest.

To build the site:

```
you@ps-site-dev$ cd ~/path/to/checked/out/website
you@ps-site-dev$ make build
jekyll build
Configuration file: /home/you/path/to/checked/out/website/_config.yml
            Source: /home/you/path/to/checked/out/website
       Destination: /home/you/path/to/checked/out/website/_site
 Incremental build: disabled. Enable with --incremental
      Generating... 
   GitHub Metadata: No GitHub API authentication could be found. Some fields may be missing or have incorrect data.
                    done in 4.162 seconds.
 Auto-regeneration: disabled. Use --watch to enable.

```

Alternately, a process can be started in another terminal to
continuously update the site as changes are made:

```
you@host$ make ssh
you@ps-site-dev$ cd ~/path/to/checked/out/website
you@ps-site-dev$ make dev
jekyll build --incremental --watch
Configuration file: /home/you/path/to/checked/out/website/_config.yml
            Source: /home/you/path/to/checked/out/website
       Destination: /home/you/path/to/checked/out/website/_site
 Incremental build: enabled
      Generating... 
   GitHub Metadata: No GitHub API authentication could be found. Some fields may be missing or have incorrect data.
                    done in 4.032 seconds.
 Auto-regeneration: enabled for '/home/you/path/to/checked/out/website'
```


To view the website, point a browser on the host at
`file:///home/you/path/to/checked/out/website/_site/index.html`.


## Other Notes

### News Items

Items for the news feed should be added to the `_posts` directory.  Use one
of the existing posts as a template.


### Releases

Release notes are in the `_releasenotes` collection.  When adding a
new release, use an existing file as a template.

Things to do when releasing a new version:

 * Go through older releases and set the `supported` item to `false`
   in those that are no longer supported.  (Do this for betas, even if
   they were for a now-supported version.)

 * Add the release to the `local` section of `pages/about/history.md`,
   making sure to keep it in descending date order.


### Favicon

The `images/favicon` and favicon data in `_include/head.html` were
generated with https://realfavicongenerator.net and a tightly-cropped
version of the logo.


### Redirects

The `redirects` directory contains a set of generated pages that use
HTML tags to redirect pages from the old web site to their
counterparts in the new one.  After the site is initially fielded,
there should be no need to make any changes to files in this
directory.
