if ['app_master', 'app', 'solo', 'util'].include?(node[:instance_role])
  node[:applications].each do |app, data|

  redis_host = if node[:instance_role] == "solo"
    'localhost'
  else
    node[:db_host]
  end

    framework_env = node[:environment][:framework_env]

    template "/data/#{app}/shared/config/resque.yml"do
      source 'resque.yml.erb'
      owner node[:owner_name]
      group node[:owner_name]
      mode 0655
      backup 0
      variables({
        :environment => node[:environment][:framework_env],
        :app => app,
        :hostname => redis_host
      })
    end
  end
end
