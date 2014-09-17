# wordpress-chef-cookbook

Wordpress provision Chef cookbook

##Attributes

* `node['wordpress']['sources']['files']` - Install WP from specific location (default https://wordpress.org/latest.zip)
* `node['wordpress']['sources']['database']` - Import database from specific location
* `node['wordpress']['options']['db_name']`
* `node['wordpress']['options']['db_user']`
* `node['wordpress']['options']['db_password']`
* `node['wordpress']['options']['db_host']`
* `node['wordpress']['options']['db_charset']`
* `node['wordpress']['options']['db_collate']`
* `node['wordpress']['options']['auth_key']`
* `node['wordpress']['options']['secure_auth_key']`
* `node['wordpress']['options']['logged_in_key']`
* `node['wordpress']['options']['nonce_key']`
* `node['wordpress']['options']['auth_salt']`
* `node['wordpress']['options']['secure_auth_salt']`
* `node['wordpress']['options']['logged_in_salt']`
* `node['wordpress']['options']['nonce_salt']`
* `node['wordpress']['options']['wp_debug']`

## Author
* [Mircea Preotu](https://github.com/mirceapreotu/)
