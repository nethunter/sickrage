# epel repo is installed and enabled
describe yum.repo('epel') do
  it { should exist }
  it { should be_enabled }
end

# /opt/sickbeard directory exists
describe directory('/opt/sickbeard') do
  it { should be_directory }
  it { should be_owned_by 'sickbeard' }
  it { should be_grouped_into 'sickbeard' }
end

# /opt/sickbeard directory exists
describe directory('/opt/Python-2.7.6') do
  it { should be_directory }
end

# Check to see if packages are installed
package_list = ['zlib-devel', 'bzip2-devel', 'openssl-devel', 'ncurses-devel', 'sqlite-devel', 'xz', 'nfs-utils']
package_list.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe port(8081) do
  it { should be_listening }
  its('processes') { should include 'python2.7' }
end

describe user('sickbeard') do
  it { should exist }
  its(:groups) { should include('sickbeard') }
end

describe file('/opt/sickbeard/SickBeard.py') do
  it { should be_file }
  it { should be_owned_by 'sickbeard' }
end

# sickrage service is enabled and running
describe service('sickrage') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
