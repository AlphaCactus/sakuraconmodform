# Migrate Sites from svn to git
## Migrate Existing Local Project from svn to git
### 1. Update local files via svn
* Update local version of the site to most recent files on production.
* This can be done via svn or rsync.
* Merge production .htaccess with local .htaccess so that the .htaccess will work in both places.
   * This is mostly accomplished by using the .htaccess from production and putting any PHP version handling for staging/dev inside an `<IfDefine STAGE>...</IfDefine>` statement.
### 2. Create new repository in github
* Go to github and use the + button at upper right to create a new repository.
* Enter repository name and description (if needed).
* Click to add a README file and a .gitignore file, using the .gitignore template Composer.
* Click Create Repository.
### 3. Clone new repository to server
* ssh to server that contains all the site files.
   * if the repo is cloned somewhere that does not have all of the assets, they may not get specified in the .gitignore and have to be dealt with in the future or on production.
* Enter `git clone git@github.com:klundt-hosmer/[repositoryname].git [sitename]-git`
### 4. Move git files from clone into existing project
* if you are inside the [sitename] folder, `cd ..` to go up a level.
* `mv [sitename]-git/* [sitename]/` to move non-hidden files
* `mv [sitename]-git/.* [sitename]/` to move hidden files
* `rm -r [sitename]-git` to remove the now empty folder
* `cd [sitename]`
* run `sudo /scripts/fixPerms.sh -d [sitename]` to ensure file permissions are set correctly.
* `git status` to see the files that are not yet tracked
* `nano .gitignore`
* add lines for `.idea/`, `.svn/`, `/public/_resources/`, `/public/resources/`, `/public/assets/`, `/public/php_errors.log`, `/public/php.php`, `.sass-cache/`, and any other items in your project that you don’t want to have in the repository.
* save and exit
* repeat steps from `git status` until all files are ignored or added.
### 5. Add files from existing project to repository
* `git add -A` to add the remaining files in the folder to the repository
### 6. Commit added files
* `git status` to see the list of files that will be committed
* `git commit`
* Enter your commit message above the list files to be committed and save and exit.
### 7. Push commit to github
* `git push` to send the commits from the local to the remote repository.
* Remove .svn folder

## Migrate Site on Staging
### 1. Clone new repository to server
* SSH into Staging
* `cd /var/www/html/[cpanelaccountname]/`
* `git clone git@github.com:klundt-hosmer/[repositoryname].git git/`
### 2. Move git files from clone into existing project
* `mv git/.git/ .` 
* `mv git/.gitignore .`
* `rm -r git/` to remove the unneeded folder
* `git status` to see the files that are not yet tracked
* Resolve untracked and/or conflicting files by adding to the repository or to the .gitignore, for example:
    * `rm p.php`
    * Evaluate and potentially delete extra .htaccess files (.htaccess-production, .htaccess-staging, etc.)
    * Add files as neccesary to .gitignore such as
       * php.ini, .user.ini - cPanel generated files
       * `_ss_environment.php`, `error_log`, `framework/error_log`, and `silverstripe-cache` - silverstripe files
       * other random files
          * `.DS_Store`
* repeat from `git status` step until all files are accounted for
   * if you see (modified content) check the folder with modified content for a `.git` folder. Remove it or consider not including that folder in the repo and maintaining it with `composer` instead. 
* commit changes
* `git status`
   * if done correctly, there should be no changes and your copy should match HEAD.
   * if there are local differences, consider each one to determine if you want to keep changes or not.  If you do, consider branching, commiting then merging in order to have standard merging or conflict resolution options.
   if you want to discard all local changes and go with the incoming repository (CAREFUL! Work may be lost!) run:
      * `git reset --hard HEAD`
      * this is useful when you made changes on local dev, then created repo, and now are updating staging.

## Migrate Site on Production
### 1. Clone new repository to server
* SSH into Sputnik 
* `cd /home/[cpanelaccountname]/`
* `git clone git@github.com:klundt-hosmer/[repositoryname].git git/`
### 2. Move git files from clone into existing project
* `mv git/.git/ public_html/` 
* `mv git/.gitignore public_html/`
* `rm -r git/` to remove the unneeded folder
* `cd public_html`
* `git status` to see the files that are not yet tracked
* Resolve untracked and/or conflicting files by adding to the repository or to the .gitignore, for example:
    * `rm p.php`
    * Evaluate and potentially delete extra .htaccess files (.htaccess-production, .htaccess-staging, etc.)
    * Add cPanel generated files to .gitignore, such as php.ini, .user.ini
    * Add silverstripe generate files such as `error_log` and `silverstripe-cache` to .gitignore
    * Add _ss_environment.php to .gitignore
* repeat from `git status` step until all files are accounted for
* commit changes
* `git status`
   * if done correctly, there should be no changes when pulled.
   * if done correctly, there should be no changes and your copy should match HEAD.
   * if there are local differences, consider each one to determine if you want to keep changes or not.  If you do, consider branching, commiting then merging in order to have standard merging or conflict resolution options.
   if you want to discard all local changes and go with the incoming repository (CAREFUL! Work may be lost!) run:
      * `git reset --hard HEAD`
      * this is useful when you made changes on local dev, then created repo, and now are updating staging. 
