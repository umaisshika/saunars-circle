set :migration_role, 'db'

server '18.177.79.220', user: 'ec2-user', roles: %w{app db web}
