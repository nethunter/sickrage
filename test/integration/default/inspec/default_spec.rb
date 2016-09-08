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

describe port(8081) do
  it { should be_listening }
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
