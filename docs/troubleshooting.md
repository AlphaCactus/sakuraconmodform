# Troubleshooting

## White screen
 - Check and fix file ownership and permissions.
 - On sites running in Live environment, if there are only fatal PHP errors, nothing will appear.
    - make sure php.ini has `display_errors = On` and `display_startup_errors = On`.
    - look in the silverstripe log file which is typically `~/public_html/silverstripe.log`.
    - Some sites may not have logging configured so that configuration will need to be added.
    - SS4: check for `app/_config_log.yml` or logging config in `app.yml`. If not set, add the `log.yml` from this project and `dev/build`.
    - SS3: logging is typically configured in `_config.php` and the log file may be in `/assets`.
 
## 500 Server Error on /dev/build?flush=1 after site setup
 - On dev & staging, manifests as infinite redirects in `/var/www/logs/kh_error_log`
 - ensure `/public/.htaccess` and `/public/index.php` exist

## Email will not send
 - [Email from Website Troubleshooting](email-troubleshooting.md)

## Unable to login as admin
 - **Set admin password override in .env**
    - Edit the .env file
    - Uncomment `SS_DEFAULT_ADMIN_USERNAME` and `SS_DEFAULT_ADMIN_PASSWORD` and assign a value to `SS_DEFAULT_ADMIN_PASSWORD`.
    - Try to login.
    - Update the admin password (see below)
 - **If login form gives you temporary lockout**
    - Run these commands directly on the database:
    - `UPDATE Member SET LockedOutUntil = NULL, FailedLoginCount = 0 WHERE Member.ID = 1;`
    - `DELETE FROM LoginAttempt WHERE MemberID = 1;`
    - Password override in .env should now work.
 - **Update admin password**
    -  If you want to update the admin password in the CMS, you will probably get a fatal server error: `Address in mailbox given [admin] does not comply with RFC 2822, 3.6.2.` because `admin` is not a valid email address.
    -  Set the email field to a valid address, such as your own.
    -  Update the password
    -  Run this command directly on the database `UPDATE Member SET Email = 'admin' WHERE Member.ID = 1;`

## Error: Allowed memory size of XXX bytes exhausted (tried to allocate XXX bytes) ... /Image/Gd/Driver.php
If a page will not load and the silverstripe log contains an error:
`[2023-03-17 12:01:35] error-log.ALERT: Fatal Error (E_ERROR): Allowed memory size of 536870912 bytes exhausted (tried to allocate 196128001 bytes) {"code":1,"message":"Allowed memory size of 536870912 bytes exhausted (tried to allocate 196128001 bytes)" "file":"/home/wdmadmin/public_html/vendor/intervention/image/src/Intervention/Image/Gd/Driver.php","line":83,"trace":null} []`

Someone uploaded an, or tried to use an existing, image which has very large dimentions. This can mean the file has a large filesize, but some simple files such as logos can have a small filesize but large dimensions. When Silverstripe attempts to resize the file, Silverstripe/PHP tries to allocate 4 bytes per pixel in memory. For example, an 8000x6000 image will try to allocate 183MB of ram which can easily cause the error above.

### Identifying which image is causing the issue
It can be difficult to know which images is actually causing the problem as the error does not indicate what image is being processed.

`vendor/silverstripe/assets/src/InterventionBackend.php` can be modified like this (or similar depending on what SilverStripe version is being used). Wrap the `clone $resource` call with log entries, and then watch the silverstripe log and the last file name reported before the error will be the image causing the memory error.

```
   // Must import the logger interface at the top of the file!
   use Psr\Log\LoggerInterface;
   ...
   
   // ~ Line 705
   protected function createCloneWithResource($resourceOrTransformation) {
      ...
      $log = Injector::inst()->get(LoggerInterface::class);
      $log->info($this->container->ClassName . "[".$this->container->ID."]" . $this->container->FileFilename);
      // ~ line 722
      $resource = clone $resource;
      $log->info( $this->container->ClassName . "[".$this->container->ID."] OK");
      ...
   }
```

### Solutions
   1. Increase PHP 'memory_limit' via cPanel
   2. Resize and replace the image (directly or via upload)
   3. Implement an image processing module which
      1. Rejects image upload of images larger than a specific dimension.
      2. Determine which images can be uploaded and downsized based on available memory and estimated memory requirements (memory required may be more than the calculation above as that is the *first* operation that exhausts memory, but after that allocation more memory may be needed so the amount of memory required may need to be tweaked.
      3. Reviews existing images and downsizes when possible and provide report of images that were downsized or too large to downsize.  Since this script would be run manually, perhaps it can be allowed to use `ini_set('memory_limit','1G')` or similar which is OK for this operation, but not for normal website operations.
