package "libcurl4-openssl-dev"

gem_package 'passenger'

script "nginx_install" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  not_if "test -f /opt/nginx/sbin/nginx"
  code <<-EOH
    passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx
  EOH
end

directory "/etc/nginx/" do
  owner "root"
  group "root"
  mode "0700"
  action :create
end

template "/etc/nginx/nginx.conf" do
  source "nginx.conf.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, "service[nginx]"
end

template "/etc/init.d/nginx" do
  source "nginx.erb"
  mode 0744
  owner "root"
  group "root"
end

user "deploy" do
  supports :manage_home => true
  home "/home/deploy"
  shell "/bin/bash"
end

directory "/home/deploy/.ssh/" do
  owner "deploy"
  group "deploy"
  mode "0744"
  action :create
  recursive true
end

directory "/www" do
  owner "deploy"
  group "deploy"
  mode "0775"
  action :create
end

service "nginx" do
  provider Chef::Provider::Service::Init
  supports :restart => false
end
