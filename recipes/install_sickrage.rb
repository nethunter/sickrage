#
# Cookbook Name:: sickrage
# Recipe:: install_sickrage
#
# Copyright 2015, Jeremy Miller
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'git'

user node['sickrage']['user'] do
  shell '/bin/bash'
  comment 'SickRage User'
  home node['sickrage']['directory']['install_dir']
  system true
end

node['sickrage']['directory'].each do |_name, value|
  directory value do
    mode '755'
    owner node['sickrage']['user']
    group node['sickrage']['group']
    recursive true
  end
end

git node['sickrage']['directory']['install_dir'] do
  repository node['sickrage']['git_url']
  action :sync
end

execute 'checkout master' do
  cwd '/opt/sickbeard'
  command 'git checkout master'
end

template 'sickrage' do
  path '/etc/init.d/sickrage'
  source 'sickrage_service_configured.erb'
  mode '775'
  owner 'root'
  group 'root'
  only_if { node['sickrage']['release'] == 6 }
end

template 'sickrage' do
  path '/etc/systemd/system/sickrage.service'
  source 'sickrage.service.erb'
  mode '775'
  owner 'root'
  group 'root'
  only_if { node['sickrage']['release'] == 7 }
end

template 'config' do
  path '/etc/sickrage/config.ini'
  source 'config.ini.erb'
  mode '644'
  owner node['sickrage']['user']
  group node['sickrage']['group']
  only_if { node['sickrage']['config_enabled'] == true }
end

execute 'update permissions' do
  command "chown -R sickbeard:sickbeard #{node['sickrage']['directory']['install_dir']}"
end

service 'sickrage' do
  action [:enable, :restart]
end
