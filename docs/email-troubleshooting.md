# Mail Send Debugging in SilverStripe
This also includes the Reset Password functionality provided by the login form.
Determining why mail is not being sent from the website can be complicated due to the many possible points of failure.

Silverstipe uses the PHP mail() function which is terrible about returning errors.
https://www.php.net/manual/en/function.mail.php

It will return true on success, or false on failure.
The actual mail function used can be difficult to track down, but unless it has been setup
with an SMTP mailer that connects to and authenticates with a specific mail sender,
then it is likely using the binary at sendmail_path which defaults to /usr/sbin/sendmail -t -i
However, on cPanel /usr/sbin/sendmail actually redirects to exim.
Not sure how, but it may be that on cPanel systems sendmail is replaced with a different
binary that passes through requets to exim.

It may be pointless to try to send mail from a development environment due to the plethora of 
checks performed by other emails servers to ensure mail is legitimate. If desperate, you could
possibly add an SPF entry that references your current external IP.

Further, some email services may require that the email account being used as the from address
actually exist which means that if you weant to send email from a domain we host but where
we do not host the email, it may be impossible without using SMTP configured for a specific account.
You may need to work with an administrator with access to the email account management in that case.

If trying to send mail on a machin that actually uses sendmail, it should log to /var/log/maillog
On cPanel, use `tail -f /var/log/exim_` to view the mail submission.
