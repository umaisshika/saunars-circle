set :migration_role, 'db'

server '35.72.98.107', user: 'ec2-user', roles: %w{app db web}
