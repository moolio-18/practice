require 'spec_helper'

listen_port = 8080

describe package('nginx') do
  it { should be_installed }
end

describe port(80) do
  it { should be_listening }
end

describe command('ruby --version') do
  its(:stdout) { should match /ruby 3\.2\.3/ }
end

describe command('node --version') do 
  its(:stdout) { should match /v17\.9\.1/ }
end

describe command('yarn --version') do
  its(:stdout) { should match /1\.22\.19/ }
end

describe package('bundler') do
  it { should be_installed.by('gem').with_version('2.4.19') }
end

#describe command('curl http://127.0.0.1:#{listen_port}/_plugin/head/ -o /dev/null -w "%{http_code}\n" -s') do
#  its(:stdout) { should match /^200$/ }
#end


