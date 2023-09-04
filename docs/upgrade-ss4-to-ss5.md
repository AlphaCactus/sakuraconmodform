# Upgrade Site from SS4 to SS5
These instructions work for a simple installation of SilverStripe. Once the upgraade has been implemented, there may be other changes that need to be made in our custom code to make it compatible after these basic steps have been followed.
## Prerequisites
### Install PHP 8.1 on your Almalinux 8 Server Environment
SilverStripe 5 is compatible with PHP 8.1.x, but may not work with any version over 8.2.0, so we will run it on 8.1.x.
- Run these commands on your server via command line _(these instructions also work for installing PHP 8.2 if you replace all instances of “81” with “82” in the commands)_:
- `sudo su`
- `dnf install php81 php81-php-fpm php81-php-pdo php81-php-intl php81-php-pear php81-php-bcmath php81-php-opcache php81-php-mbstring php81-php-xml php81-php-gd php81-php-mysqlnd php81-php-xdebug php81-php-pecl-zip`
- `sed -i 's/user = .*/user = vagrant/g' /etc/opt/remi/php81/php-fpm.d/www.conf`
- `sed -i 's/group = .*/group = vagrant/g' /etc/opt/remi/php81/php-fpm.d/www.conf`
- `sed -i 's/listen.acl_users = .*/listen.acl_users = vagrant/g' /etc/opt/remi/php81/php-fpm.d/www.conf`
- `sed -i 's/;listen.owner = .*/listen.owner = vagrant/g' /etc/opt/remi/php81/php-fpm.d/www.conf`
- `sed -i 's/;listen.group = .*/listen.group = vagrant/g' /etc/opt/remi/php81/php-fpm.d/www.conf`
- `sed -i 's/;listen.mode = 0660/listen.mode = 0660/g' /etc/opt/remi/php81/php-fpm.d/www.conf`
- `chown -R vagrant:vagrant /var/opt/remi/php82/lib/php`
- `cd /scripts/`
- `nano a2restart.sh`
- Add these lines to the end of `a2restart.sh`, save and exit the file:
  ```
  echo "restarting php81-php-fpm"
  systemctl restart php81-php-fpm
  ```
- `exit`
- `a2restart.sh`
### Install/Update Composer 2
- run `php81 ~/bin/composer.phar self-update`
## Update site to latest version of SS4: 4.13
### Update composer.json
- Make sure silverstripe/recipe-cms is set to version 4.13
- Make sure all used modules are compatible with SS 4.13
- If using undefinedoffset/sortablegridfield, replace with [symbiote/silverstripe-gridfieldextensions](https://packagist.org/packages/symbiote/silverstripe-gridfieldextensions) and update classes and dataobjects that used sortablegridfield
- If using axllent/silverstripe-trailing-slash, remove it. [SilverStripe 5 doesn’t provide trailing slash by default](https://docs.silverstripe.org/en/5/changelogs/5.0.0/#trailing-slash), but can be set to add it automatically via `app.yml`.
- Change PHPUnit version to 9.5 in composer.json (this is compatible with SS 4.9 and above):
 - Change
  ```
      "require-dev": {
          "phpunit/phpunit": "^5.7"
      },
  ```
  to
  ```
      "require-dev": {
          "phpunit/phpunit": "^9.5"
      },
  ```
  and run `composer update`.
## Update site to SS5
### Update composer.json
- Change `"description"` to reflect SilverStripe version 5.
- Remove `"phpcli"` listed after `"description"` if present.
- Change `"php"` under `"require"` to `"^8.1"`.
- Change `"silverstripe/recipe-cms"` to `"^5.0"`.
- Check the version of each requirement on [packagist.org](https://packagist.org/) and update to make sure it is specified correctly for compatibility with SS5.
- The default value for the `RESOURCES_DIR` const has been changed to "_resources".
    - If your `composer.json` file has its `extra.resources-dir` key set to `_resources`, you can remove that now.
    - If your `composer.json` file doesn’t already have an `extra.resources-dir` key and you want to keep your resources in the `resources` directory, you can set `extra.resources-dir` to `resources`.
    - If your `composer.json` file doesn’t already have an `extra.resources-dir` key and you want to use the new default `_resources` directory, you may need to check that your code and templates don't assume the directory name for those resources. In your templates, it is preferred to use `$resourePath()` or `$resourceURL()` to get paths for resources.
- Under `"config"`, change `"phpcli"` to `"php81"`.
- Run `composer update`.
## Update PHP Version in `.htaccess` file
- Change 
  ```
  RewriteRule ^ - [H=proxy:unix:/var/opt/remi/php74/run/php-fpm/www.sock|fcgi://%{HTTP_HOST}]
  ``` 
  to
  ```
  RewriteRule ^ - [H=proxy:unix:/var/opt/remi/php82/run/php-fpm/www.sock|fcgi://%{HTTP_HOST}]
  ```
## Add Trailing Slash
- If your project previously was expecting a trailing slash on all URLs, add the following to app/_config/app.yml
  ```
  SilverStripe\Control\Controller:
    add_trailing_slash: true
  ```
## Changes in PHP Code
- Edit `/public/index.php` and remove `$app->addMiddleware(new ErrorControlChainMiddleware($app));` and its corresponding `use` statement.
## Do dev/build
- Run `/dev/build?flush` in the Browser
