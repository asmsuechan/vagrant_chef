require 'spec_helper'

# ポート
describe port(80) do
  it { should be_listening }
end

# インストールされているパッケージ
['nginx','ruby'].each do |pkg|
  describe package(pkg), :if => os[:family] == 'redhat' do
    let(:disable_sudo) { true }
    it { should be_installed }
  end
end

# パスからインストール確認
['mysql','rbenv'].each do |pkg|
  describe command("which #{pkg}") do
    let(:disable_sudo) { true }
    its(:exit_status) { should eq 0 }
  end
end

# インストールされているgem
['rails'].each do |gem_pkg|
  describe package(gem_pkg) do
    it { should be_installed.by('gem') }
  end
end

# ファイルの存在確認
['/etc/nginx/nginx.conf'].each do |file|
  describe file(file) do
    it { should be_file }
  end
end
