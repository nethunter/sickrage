#
# Cookbook Name:: sickrage
# Recipe:: default
#
# Copyright 2015, Jeremy Miller
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'git'

user node['sickrage']['user'] do
  shell '/bin/bash'
  comment 'SickRage User'
  home node['sickrage']['install_dir']
  system true
end

app_dirs = [
  node['sickrage']['install_dir'],
  node['sickrage']['log_dir'],
  node['sickrage']['data_dir'],
  node['sickrage']['config_dir'],
  node['sickrage']['pid_dir']
]

app_dirs.each do |dir|
  directory dir do
    mode 0755
    owner node['sickrage']['user']
    group node['sickrage']['group']
    recursive true
  end
end

package ['python-mako.noarch', 'pyOpenSSL.x86_64']  do
  action :install
end

unless Dir.exist? "#{node['sickrage']['install_dir']}"
execute 'git clone' do
	command "git clone #{node['sickrage']['git_url']}  #{node['sickrage']['install_dir']}"
	#command "chown #{node['sickrage']['user']}:#{node['sickrage']['group']} #{node['sickrage']['install_dir']}"
 end
end

template 'sickrage' do
	path '/etc/init.d/sickrage'
	source 'sickrage_service.erb'
	mode 0775
	owner 'root'
	group 'root'
end

if node['sickrage']['config_enabled'] == 'true' then

  template 'config' do
    path '/opt/sickbeard/config.ini'
    source 'config.ini.erb'
    mode 0644
    owner node['sickrage']['user']
    group node['sickrage']['group']
  end
end

service 'sickrage' do
  action [:enable, :start]
end


