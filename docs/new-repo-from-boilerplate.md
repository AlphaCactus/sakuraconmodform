## Create New Site Repository with git
### Clone the boilerplate repository
1. Go to https://github.com/klundt-hosmer/silverstripe-boilerplate
2. Click the green `Use this Template` button at the top right.
3. Fill in the `Repository Name` and `Description` fields.
4. Select the `Private` option.
5. Click `Create Repository From Template`
6. Clone new repository to your local dev environment
   * `git clone git@github.com:klundt-hosmer/[new-repository].git [new-repository]`
   * `cd [new-repository]`
   * edit app/_config.php and set the database name on line 10 
   * run `./update.sh` which performs several initial setup steps.
      * it should be ok to run this script at any time, however you can review it to see what it does in case you only want to perform certain operations.
   * check for changes and commit/push if necessary
7. clone new repository on staging
   * ssh into staging
   * `git clone git@github.com:klundt-hosmer/[new-repository].git /var/www/html/[new-site-name]`
   * `cd [new-site-name]` 
   * `./update.sh`

The process for cloning a repo that is not a template is documented at https://docs.github.com/en/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/duplicating-a-repository
Information about why we use a Template repository and cannot fork a repo to the same organization see https://github.community/t/alternatives-to-forking-into-the-same-account/10200
