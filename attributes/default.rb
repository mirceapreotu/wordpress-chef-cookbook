default['wordpress']['name']      = 'wordpress.local'
default['wordpress']['directory'] = '/vagrant'
default['wordpress']['platform']  = 'nginx'

default['wordpress']['sources']['files']    = 'https://wordpress.org/latest.zip'
default['wordpress']['sources']['database'] = ''

default['wordpress']['options']['db_name']     =  'wordpress'
default['wordpress']['options']['db_user']     =  'wordpress'
default['wordpress']['options']['db_password'] =  'wordpress'
default['wordpress']['options']['db_host']     =  'localhost'
default['wordpress']['options']['db_charset']  =  'utf8'
default['wordpress']['options']['db_collate']  =  ''

default['wordpress']['options']['auth_key']         = 'put your unique phrase here'
default['wordpress']['options']['secure_auth_key']  = 'put your unique phrase here'
default['wordpress']['options']['logged_in_key']    = 'put your unique phrase here'
default['wordpress']['options']['nonce_key']        = 'put your unique phrase here'
default['wordpress']['options']['auth_salt']        = 'put your unique phrase here'
default['wordpress']['options']['secure_auth_salt'] = 'put your unique phrase here'
default['wordpress']['options']['logged_in_salt']   = 'put your unique phrase here'
default['wordpress']['options']['nonce_salt']       = 'put your unique phrase here'
default['wordpress']['options']['wp_debug']         =  false