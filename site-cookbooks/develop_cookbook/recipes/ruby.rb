#install ruby 
execute "install ruby #{node['ruby_version']}" do
  not_if "rbenv versions | grep #{node['ruby_version']}"
  command "rbenv install #{node['ruby_version']}"
  action :run
end

#set global ruby
execute "set global ruby #{node['ruby_version']}" do
  not_if "rbenv versions | grep #{node['ruby_version']}"
  command "rbenv global #{node['ruby_version']}"
  action :run
end
