if ['app_master', 'app', 'util', 'solo'].include?(node[:instance_role])
  node[:applications].each do |app, data|

    framework_env = node[:environment][:framework_env]

    template "/data/#{app}/shared/config/aws.yml"do
      source 'aws.yml.erb'
      owner node[:owner_name]
      group node[:owner_name]
      mode 0655
      backup 0
      variables({
        :key => node[:s3_key_pairs][framework_env][:key],
        :secret => node[:s3_key_pairs][framework_env][:secret],
        :environment => framework_env,
        :region => node[:s3_region],
        :hostname => node[:s3_region_hostname]
      })
    end
  end
end
