# silverstripe-boilerplate
SilverStripe site setup with KH development customizations intended to be cloned when setting up new sites for development.
Get latest version of Bootstrap: https://getbootstrap.com/

## Guides
   - [How to create new repo from boilerplate](docs/new-repo-from-boilerplate.md)
   - [How to migrate SVN to Git](docs/migrate-svn-to-git.md)
   - [Deployment](docs/deploy.md)


## Common Git Commands
- `git clone git@github.com:klundt-hosmer/REPONAME.git destination-folder`
- `git fetch` to see changes that are available to update from remote repository.
- `git pull` to update the local repository with the changes from the remote repository.
- `git commit -m "[commit message]"` (Note: staging doesn’t have write access to the git repositories so commits have to be done from our local dev machines.)
- `git remote set-url origin git@github.com:klundt-hosmer/REPONAME.git`
- `git config core.fileMode false` - ignore filemode changes. Useful for Windows Hosted VM. Permissions should be what is set by /scripts/fixperms.sh on production
- `git config --global core.editor "nano"` - set nano as default editor for commits which is much easier to use than vi.

## DevOps
### Composer Usage on Sputnik
Some odd behavior occurs with Composer may occur on sputnik, therefore when reunning composer it may be necessary to use a specific version of php.

For example, on evoke\
```php -v```\
shows\
```php5.6```\
as the version, which is correct.

However, the command\
  ```php /opt/cpanel/composer/bin/composer install```\
results in\
  ```silverstripe/framework 3.6.7 requires php >= 5.3.3, <7.2 -> your php version (7.2.34) does not satisfy that requirement.```\
this is unexpected.

To correct, use a specific version of php like so:

```ea-php56 /opt/cpanel/composer/bin/composer install```

another example:

```ea-php74 /opt/cpanel/composer/bin/composer install```
