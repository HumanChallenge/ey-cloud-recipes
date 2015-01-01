default[:s3_region_hostname] = 's3-us-west-2'
default[:s3_region] = 'us-west-2'
default[:s3_key_pairs] = {
  production: { key: "KEY",
                secret: "SECRET" },
  staging: {    key: "KEY",
                secret: "SECRET" }
}
