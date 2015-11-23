#
# Cookbook Name:: deploy
# Recipe:: web-restart

include_recipe 'deploy'

node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'static'
    Chef::Log.debug("Skipping deploy::web-restart application #{application} as it is not a static HTML app")
    next
  end

  service 'tomcat7' do
    supports :status => true, :restart => true, :reload => true
    action :restart
  end
end
