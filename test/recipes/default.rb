#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "/tmp/filetest" do
 content "My personnel file"
end

ruby_block "configure minions" do
  block do
    file = Chef::Util::FileEdit.new "/etc/salt/minion"
    file.insert_line_if_no_match "^master", "master: #{node["salt-master"]}"
    file.write_file
  end
  not_if "grep test /etc/salt/minion"
#  notifies :restart, "service[salt-minion]", :immediate
end

