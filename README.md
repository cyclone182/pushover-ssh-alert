# pushover-ssh-alert
Send an alert via Pushover upon successful SSH login or logoff in Linux.
<p>This is an implementation from the writeup on Leon's blog at https://www.l1cafe.blog</p>
<p>To implement this alert service you will need an active Pushover account with a separate API token/key for this service.</p>
<p>Instructions:</p>
<p>
 1. Open your linux shell and add the following line at the end of the file /etc/pam.d/common-session:
</p>
<p>
  session optional   &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  pam_exec.so /usr/local/bin/login-notification-pushover.bash
</p>
<p></p>
<p>
2. Now copy the file login-notification-pushover.bash from this repository and create the file at /usr/local/bin/
</p>
<p>Replace Token 1 with your application token for logouts.</p>
<p>Replace Token 2 with your application token for logins</p>
<p>USERTOKEN is your user key.</p>
<p>Uncomment and edit the lines near the end if you want to send root login notifications to a different set of users. You can also uncomment the line with the john user (and replace that with the user to target) to send notifications of a specific Linux user to a specific Pushover user key.</p>
<p>3. The last step is to be sure to make the .bash file an executable.</p>
<p>4. Now logout and login to test your work.</p>
