#
# Jekyll Development Box for perfSONAR Web Site
#

name = "ps-site-dev"

Vagrant.configure("2") do |config|

    if Vagrant.has_plugin?("vagrant-vbguest")
      # Don't allow upgrades; the box has what it has.
      config.vbguest.auto_update = false
    end

    # Basic configuration

    config.vm.provider "virtualbox" do |vbox|
      # The default E1000 has a security vulerability.
      vbox.default_nic_type = "82543GC"
      vbox.cpus = 2
      vbox.memory = 2048
      config.vm.box = "bento/centos-7"
      config.vm.hostname = name
    end

    config.vm.provision "setup", type: "shell", run: "once", inline: <<-SHELL
      yum -y install epel-release
      yum -y update
    SHELL

    #
    # User Account, Shared Folders and Local Storage
    #

    acct = Etc.getpwnam(Etc.getlogin)
    home_dir = acct.dir

    config.vm.provision "account", type: "shell", run: "once", inline: <<-SHELL
      set -e

      mkdir -p '#{home_dir}'

      yum -y install '#{acct.shell}'

      id '#{acct.name}' >/dev/null 2>&1 \
        || useradd \
                --no-create-home \
                --comment '#{acct.gecos}' \
                --home-dir '#{home_dir}' \
                --shell '#{acct.shell}' \
                --uid '#{acct.uid}' \
                --gid '#{acct.gid}' \
                '#{acct.name}'

        # Local Storage
        install -d -D -o '#{acct.uid}' -g '#{acct.gid}' -m 770 '/local/#{acct.name}'

      # Grant frictionless sudo
      SUDOERS="/etc/sudoers.d/#{acct.name}"
      echo "#{acct.name} ${NEW_USER} ALL= (ALL) NOPASSWD:ALL" > "${SUDOERS}"
      chmod 440 "${SUDOERS}"

      # Install anything the user's custom package list says it wants
      if [ -e '#{home_dir}/.packages' ]
      then
          xargs -r yum -y install < '#{home_dir}/.packages'
      fi

    SHELL

    config.vm.synced_folder "#{acct.dir}/", home_dir,
                            automount: false,
                            mount_options: ["uid=#{acct.uid}", "gid=#{acct.gid}"],
                            SharedFoldersEnableSymlinksCreate: true

    #
    # Jekyll
    #

    vagrantfile_dir = File.dirname(__FILE__)

    config.vm.provision "jekyll", type: "shell", run: "once", inline: <<-SHELL
      set -e

      # Ruby version manager (https://rvm.io)
      gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB \
        || gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
      curl -sSL https://get.rvm.io | bash -s stable
      source /etc/profile.d/rvm.sh
      rvm install 2.6

      # Jekyll (https://jekyllrb.com)
      gem install bundler jekyll

      # Everything else
      yum -y install git

      # Final setup
      su '#{acct.name}' -c "make -C '#{vagrantfile_dir}' setup"

    SHELL

end


# -*- mode: ruby -*-
# vi: set ft=ruby :
