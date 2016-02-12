#create database
template 'create database sql' do
  path "create_databases.sql"
  source 'create_databases.sql.erb'
  owner node['mysql']['user']
  group node['mysql']['group']
  mode '0644'
end

execute 'exec create database sql' do
  command "mysql -u root --password='#{node['mysql']['server_root_password']}' < create_databases.sql"
  user node['mysql']['user']
  group node['mysql']['group']
  environment 'HOME' => "/home/#{node['mysql']['user']}"
end

#create user
template 'create user sql' do
  path "create_user.sql"
  source 'create_user.sql.erb'
  owner node['mysql']['user']
  group node['mysql']['group']
  mode '0644'
end

execute 'exec create user sql' do
  command "mysql -u root --password='#{node['mysql']['server_root_password']}' < create_user.sql"
  user node['mysql']['user']
  group node['mysql']['group']
  environment 'HOME' => "/home/#{node['mysql']['user']}"
end

#ruby 'create_method' do
#def create_method(name)
#  define_method(name){
#    template "create #{name} sql" do
#    path "/home/#{node['mysql']['user']}/create_#{name}.sql"
#    source "create_#{name}.sql.erb"
#    owner node['mysql']['user']
#    group node['mysql']['group']
#    mode '0644'
#    end
#    execute "exec create #{name} sql" do
#      command "mysql -u root --password'#{node['mysql']['server_root_password']}' < /home/#{node['mysql']['user']}/create_#{name}.sql"
#      user node['mysql']['user']
#      group node['mysql']['group']
#      environment 'HOME' => "/home/#{node['mysql']['user']}"
#    end
#  }
#end
#create_method('users')
#create_method('databases')
#end

