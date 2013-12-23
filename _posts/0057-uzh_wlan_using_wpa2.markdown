---
title: UZH wlan using WPA2
categories: UZH, Software
author: Luca Longinotti
date: 2010/10/23 19:45:00
updated: 2010/10/29 23:48:50
---
It is possible! ;)  
Instead of going through the "public" WLAN and then using the VPN, you can just connect to the "uzh" SSID and
use its WPA2 encryption.  
This usually works much better, on "public" I sometimes loose the connection or can't connect at all...  
I found this out by just trying to connect to it using my UniAccess Login-Data and the same encryption-scheme
I used for the "eth" network at ETHZ, which is basically [WPA2 Enterprise with IEEE802.1x Authentication][1],
and look there, it worked!  
I have no idea why the ID (Informatik-Dienste) don't mention the possibility of using the "uzh" network, as
it is clearly superior in its implementation and security. Here the [WICD][2] encryption-scheme file I use,
based on the one by a friend of mine (Lukas Manser) for the ETHZ network.

**/etc/wicd/encryption/templates/uzh**

$$code(lang=ini)
name = UZH Network WPA2
author = Luca Longinotti
version = 1
require identity *Identity password *Password
-----
ctrl_interface = /var/run/wpa_supplicant
network = {
	ssid="$_ESSID"
	scan_ssid=$_SCAN
	proto=WPA2
	key_mgmt=WPA-EAP
	pairwise=CCMP TKIP
	group=CCMP TKIP
	eap=TTLS
	identity="$_IDENTITY"
	password="$_PASSWORD"
	phase2="auth=MSCHAPV2"
}
$$/code

One can probably extract the relevant information from here even for other OSes. Have fun!

**Update:**

It seems on the 20th of October (according to Google) UZH [updated their pages][3] to mention the possibility
of using the "uzh" SSID and WPA2, and added instructions for it [here][4]. They also mention that in the
future it's going to be the main SSID and to migrate to it, if possible. So now it's official!

[1]: https://www1.ethz.ch/id/services/list/network/wifi "ETHZ WLAN Info"
[2]: http://wicd.sourceforge.net/ "WICD"
[3]: http://www.id.uzh.ch/dl/mobil/wlan/Angebot.html "UZH WLAN Info"
[4]: http://www.id.uzh.ch/dl/mobil/wlan/Angebot/konfig-uzh.html "uzh SSID Configuration Guide"
