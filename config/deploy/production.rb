set :migration_role, 'db'

server '54.150.202.108', user: 'ec2-user', roles: %w{app db web}
