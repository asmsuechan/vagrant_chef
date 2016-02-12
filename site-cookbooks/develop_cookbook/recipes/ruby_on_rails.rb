['libxml2', 'libxslt', 'libxml2-devel', 'libxslt-devel', 'ruby-devel'].each do |pkg|
  package pkg do
    action :install
  end
end

bash "install rails" do
  code <<-EOC
    gem install json_pure
    gem install nokogiri -- --use-system-libraries
    export PATH="#{node['home_path']}/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    gem update --system
    gem install --no-ri --no-rdoc rails
  EOC
end
