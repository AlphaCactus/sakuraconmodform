# SSH Configuration

Apache runs as `vagrant` on `staging`, and as the user of the account per site on `sputnik`.
In order to allow multiple people to interact with many repositories, we all connect to the servers with the same accounts, but need to be individually identified to GIT. 
Therefore we've setup SSH Agent Forwarding to forward our dev machine user keys to the servers and pass in git username and emails as environment paramters for git.

* Setup your local machine to forward your ssh key with agent forwarding
   * OSX
      * List registered keys with `ssh-add -L`
      * Add your key with `ssh-add -K ~/.ssh/id_rsa
   * Windows
      * Setup PuttyAgent to run at startup and set it to load your key.
* Send git username and email as environment variables
  * OSX - iterm2
      * Add each host to `~/.ssh/config` with parameters, like so:
      * ```Host staging.designkh.com
  ForwardAgent yes
  SetEnv GIT_COMMITTER_NAME=<git username> GIT_COMMITTER_EMAIL=<git email> GIT_AUTHOR_NAME=<git username> GIT_AUTHOR_EMAIL=<git email>```
   * Windows - Putty
      * In the configuration for each host, add each "GIT_*" variable to Connection -> Data -> Environment Variables.
      * Putting them in /Users/<WindowsUserName>.ssh/config may also work, but not tested.
* Server side config
   * `sudo nano /etc/ssh/sshd_config`
   * Ensure `AllowAgentForwarding` is enabled
   * Add the following after the last `AcceptEnv` near the end of the file:
   `AcceptEnv GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL`
   * Save and exit
   * Restart sshd to apply settings `sudo systemctl restart sshd`
   * Reconnect with a new ssh connection
   * See if the above env vars are set with `printenv`

# Troubleshooting
* Github publickey error when connected to remove machine from OSX, but it works for other users
   * Ensure the git remote is set to use SSH and other users are not logging in with HTTPS authentication
   * Ensure ssh key is added to keychain. See instructions above.
   * Ensure agent forwarding is enabled and SetEnv commands are set for the domain of the remote machine in ~/.ssh/config in OSX.
