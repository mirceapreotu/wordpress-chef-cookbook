name             "wordpress"
maintainer       "Mircea Preotu"
maintainer_email "Mircea Preotu <mircea.preotu@gmail.com>"
license          "Apache 2.0"
description      "Installs/Configures WordPress"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

recipe "wordpress::default", "Installs and configures WordPress with php-fpm + nginx + mysql stack"

depends 'mysql'