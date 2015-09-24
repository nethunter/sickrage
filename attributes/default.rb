#
# Cookbook Name:: sickrage
# Recipe:: default
#
# Copyright 2015, Jeremy Miller
#
# All rights reserved - Do Not Redistribute
#


default['sickrage']['user'] = 'sickbeard'
default['sickrage']['group'] = 'sickbeard'

default['sickrage']['listen_port'] = '8345'

default['sickrage']['install_dir'] = '/opt/sickbeard'
default['sickrage']['data_dir'] = '/var/sickrage'
default['sickrage']['config_dir'] = '/etc/sickrage'
default['sickrage']['pid_dir'] = 'var/run/sickbeard'
default['sickrage']['binary'] = '/opt/sickbeard/SickBeard.py'

# Only a fresh install will take place if this is false
default['sickrage']['config_enabled'] = 'true'

default['sickrage']['log_dir'] = '/var/log/sickbeard'

#Python 
default['sickrage']['python']['binary'] = '/usr/local/bin/python2.7'
#  git
default['sickrage']['install_style'] = 'git'

# Git Options
default['sickrage']['git_url'] = 'https://github.com/SiCKRAGETV/SickRage.git'
default['sickrage']['git_ref'] = '657ffd7c4e61d32cecde009541cd25476579b254'