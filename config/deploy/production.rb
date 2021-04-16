set :migration_role, 'db'

server '54.64.26.247', user: 'ec2-user', roles: %w{app db web}
