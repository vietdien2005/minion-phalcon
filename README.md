# minion-phalcon

Minion CMS - Written in Phalcon PHP Framework (version 3.x supported). Inherit from [YonaCMS](https://github.com/oleksandr-torosh/yona-cms), but structure folder look like [Laravel](https://github.com/laravel/laravel)

## Installation

### Composer

Run
```
composer create-project vietdien2005/minion-phalcon
```

Or create composer.json file and install dependencies:
```json
{  
    "require": {  
        "vietdien2005/minion-phalcon": "master"
    }  
}
```
```
composer install
```

Sometime, You should run composer update for update dependencies:
```
composer update
```

Composer is required. It will install required libraries.
[How to install Composer](https://getcomposer.org/doc/00-intro.md#installation-linux-unix-osx)

### Config

Config environmet of your application in app/global.php

### Permissions

```
chmod a+w data -R
chmod a+w public/assets -R
chmod a+w public/img -R
chmod a+w public/robots.txt
```

### Nginx

Example of configuration for php-fpm + nginx.

```
server {

    listen   80;
    server_name minion.dev;

    index index.php index.html index.htm;
    root /var/www/minion-phalcon/public;
    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?_url=$uri&$args;
    }

    location ~ \.php$ {
        fastcgi_pass  127.0.0.1:9000;
        fastcgi_index /index.php;

        include fastcgi_params;
        fastcgi_split_path_info       ^(.+\.php)(/.+)$;
        fastcgi_param PATH_INFO       $fastcgi_path_info;
        fastcgi_param PATH_TRANSLATED $document_root$fastcgi_path_info;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location ~ /\.ht {
        deny all;
    }

}
```

### Admin dashboard

Open http://minion.dev/admin and auth:

* login: admin
* password: 12345678

Change **admin** user password.

### Database
Edit **/config/environment/development.php** and setup database connection.
Import MySQL dump file **minion-cms.sql**

### Phinx migrations

https://phinx.org/
Library for creation, executing and rollback migrations

Creation migration class in /data/migrations
```
php vendor/bin/phinx create NewMigrationName
```

Status
```
php vendor/bin/phinx -e development status
```

Executing new migrations
```
php vendor/bin/phinx -e development migrate
```

Rollback
```
php vendor/bin/phinx -e development rollback
```

You can set default environment for your localhost user
```
sudo nano ~/.bashrc
```
Add line
```
export PHINX_ENVIRONMENT=development
```

### Elixir 

Config elixir in gulpfile.js

Build development:
```
gulp watch
```

Build production:
```
gulp --production
```

## Requirements

* php 5.6+
* phalcon 3.0.0+
* mysql
* php-intl
* nginx
