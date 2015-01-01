#
# Cookbook Name: nginx
# Recipe: default
#
# Description:
# Set up ODM Specific nginx rulesets
#
# This file should be in .../cookbooks/nginx/recipes/default.rb
#
#
service "nginx"

if ['solo', 'app_master', 'app'].include?(node[:instance_role])
  # for each application
  node[:engineyard][:environment][:apps].each do |app|

    # create new custom.conf
    template "/data/nginx/servers/#{app[:name]}/custom.conf" do
      source 'custom.conf.erb'
      owner node[:users][0][:username]
      group node[:users][0][:username]
      mode 0644
      variables({
        :app => app[:name],
        :environment => node[:environment][:framework_env]
      })
    end

  end
end
