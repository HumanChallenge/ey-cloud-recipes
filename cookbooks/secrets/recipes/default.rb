if %w(app_master app solo util).include?(node[:instance_role])
  app_name = node['applications'].keys.first

  # Plan for additional email services down the road
  template "/data/#{app_name}/shared/config/secrets.yml" do
    owner node[:owner_name]
    group node[:owner_name]
    mode 0600
    variables(
      :framework_environment => node[:environment][:framework_env]
    )
    source "secrets.yml.erb"
    backup false
  end
end
