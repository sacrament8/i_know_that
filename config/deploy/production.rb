server '52.194.133.113', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/home/.shh/id_rsa'