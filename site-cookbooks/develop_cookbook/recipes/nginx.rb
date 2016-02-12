#nginx configration
bash 'rm nginx conf files' do
  code 'sudo rm /etc/nginx/nginx.conf'
end

template 'nginx.conf' do
  path '/etc/nginx/nginx.conf'
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :reload, 'service[nginx]'
end
