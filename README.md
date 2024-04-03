# pushover-ssh-alert
Send an alert via Pushover upon successful SSH login or logoff.<p>
This is an implementation from the writeup on Leon's blog at https://www.l1cafe.blog<p>
To implement this alert service you will need an active Pushover account with a separate API token/key for this service.
<p>
  Add the following line at the end of the file /etc/pam.d/common-session:
</p>
<p>
  session optional       pam_exec.so /usr/local/bin/login-notification-pushover.bash
</p>
<p>
  Now create a file named login-notification-pushover.bash at /usr/local/bin/
</p>
