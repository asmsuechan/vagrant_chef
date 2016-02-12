#require 'spec_helper'

#describe package('httpd'), :if => os[:family] == 'redhat' do
#  it { should be_installed }
#end
#
#describe package('apache2'), :if => os[:family] == 'ubuntu' do
#  it { should be_installed }
#end
#
#describe service('httpd'), :if => os[:family] == 'redhat' do
#  it { should be_enabled }
#  it { should be_running }
#end
#
#describe service('apache2'), :if => os[:family] == 'ubuntu' do
#  it { should be_enabled }
#  it { should be_running }
#end
#
#describe service('org.apache.httpd'), :if => os[:family] == 'darwin' do
#  it { should be_enabled }
#  it { should be_running }
#end

## ポート
#describe port(80) do
#  it { should be_listening }
#end
#
## インストールされているパッケージ
#['nginx','ruby'].each do |pkg|
#  describe package(pkg), :if => os[:family] == 'redhat' do
#    it { should be_installed }
#  end
#end
#
## インストールされているgem
#['rails'].each do |gem_pkg|
#  describe package(gem_pkg) do
#    it { should be_installed.by('gem') }
#  end
#end
#
## ファイルの存在確認
#['/etc/nginx/nginx.conf'].each do |file|
#  describe file(file) do
#    it { should be_file }
#  end
#end
