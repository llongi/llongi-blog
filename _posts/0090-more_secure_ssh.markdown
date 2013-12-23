---
title: An even more secure SSH
categories: Longi, Gentoo, Software
author: Luca Longinotti
date: 2012/02/16 15:00:00
updated: 2012/02/16 15:00:00
---
First post of 2012, so let's start off with a "Happy New Year!" to everyone.  
On an even happier note, I just got word that I passed all my exams. :-)

Now the real topic of this post is SSH, more specifically how to make your SSH connections even more secure
than they already are. OpenSSH by default prefers slightly less strong cryptographic algorithms (like AES128
is preferred to AES256), and for its HMAC it still prefers MD5-based HMACs, which, while still kinda secure,
are clearly less secure than the SHA2-512 based ones, for which OpenSSH added support in the 5.9 release.  
Assuming you're running OpenSSH >=5.9 everywhere, like in my setup, configure your sshd's as following, so
that they will only offer the most secure known algorithms in their strongest variants first. This will also
only offer SSH protocol 2, as well as set some other miscellaneous login-related settings and make the server
check periodically that clients are alive, and if not, terminate the connection.

$$code(lang=bash)
Protocol 2
LoginGraceTime 1m
PermitRootLogin no
StrictModes yes
MaxAuthTries 3
MaxSessions 5
ClientAliveCountMax 3
ClientAliveInterval 5
Ciphers aes256-ctr,aes192-ctr,aes128-ctr
KexAlgorithms ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256
MACs hmac-sha2-512,hmac-sha2-256
$$/code

Configure your SSH client as follows to only connect to sshd's using secure algorithms, again trying the
strongest first. This also enables SSH protocol 2 only, periodically checks that the server is alive (especially
useful with sshfs and its '-o reconnect' flag, when working over unstable links like wireless). It further
lowers the amount of data needed for a rekey, default would usually be between 1G and 4G.  
Note that I had to split up some lines for better readability on the blog, you can notice those by the increased
indentation, just always make sure everything is on one line!

$$code(lang=bash)
Host *
  Protocol 2
  ServerAliveCountMax 2
  ServerAliveInterval 4
  Ciphers aes256-ctr,aes192-ctr,aes128-ctr,arcfour256,aes256-cbc
  KexAlgorithms ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,
    diffie-hellman-group-exchange-sha256
  MACs hmac-sha2-512,hmac-sha2-256,hmac-md5,hmac-sha1
  HostKeyAlgorithms ecdsa-sha2-nistp521-cert-v01@openssh.com,
    ecdsa-sha2-nistp384-cert-v01@openssh.com,
    ecdsa-sha2-nistp256-cert-v01@openssh.com,
    ssh-rsa-cert-v01@openssh.com,ssh-dss-cert-v01@openssh.com,
    ecdsa-sha2-nistp521,ecdsa-sha2-nistp384,ecdsa-sha2-nistp256
  RekeyLimit 512M
$$/code

Given both the server and client running OpenSSH >=5.9 and being configured correctly, you get an SSH connection
using AES256-CTR as cipher, exchanging keys using ECDH-SHA2-NISTP521, and using HMAC-SHA2-512 for integrity
checking. Basically AES-256 and SHA2-512 everywhere, which, as far as I know, are state-of-the-art in their
respective application domains and still considered very secure.  
Hope this helps increasing security, as well as reliability (the Alive options especially with sshfs).
