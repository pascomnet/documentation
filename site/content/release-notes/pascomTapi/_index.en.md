---
title: pascom TAPI
description: The pascom TAPI client for Windows is designed to integrate TAPI enabled software such as MS Office, ERP and CRM systems etc.
weight: 1000
---

{{% notice tip %}}
For further information, please refer to our detailed [Installation Guide]({{< ref "/clients/tapi-installation" >}}).
{{%/notice%}}

## Release 6.R84 (22.04.2020)

**Overview**

- TAPI now also supports software that requires TAPI v3 or v3.1.


**MODIFICATIONS:**

- [TAPI-27] - TAPI credentials are not accepting user without instance
- [TAPI-28] - Update reported TAPI Version to 3.1
- [TAPI-29] - Switch TAPI installer to Unicode


## Release 5.R76 (19.12.2019)

**Overview**

- Windows feature updates no longer result in the settings (username, password, server, etc.) being deleted. A new configuration is required when installing the tapi update.
- Pickups within a Terminal Server installation function correctly again (requires a server update to 18.13 or newer).
- Special characters, e.g. umlauts etc. within passwords are correctly processed again.

**MODIFICATIONS:**

- [TAPI-20] - TAPI will loose settings after Windows 10 feature update
- [TAPI-24] - TAPI doesn't accept umlauts and special chars
- [TAPI-25] - Enhance pickup command with username attribute if xmpp.supervisor is set

## Release 4.R56 (08.03.2019)

**Overview**

- Calls that were started immediately after launching the TAPI application are no longer dropped
- If the TAPI user's password is no longer valid, the driver will stop the registration process after 5 attempts 
- Phone numbers with the following format "0044 (0) 29691 0" are now correctly transmitted to the pascom server
- Enhanced call hangup reliability for TAPI calls on a pascom 18 server
- Increased stability of XMPP connections to a pascom 18 server

**MODIFICATIONS:**

- [TAPI-4] - TAPI looses calls issued very early after initialization
- [TAPI-6] - TAPI: stop trying to reconnect if the password is invalid
- [TAPI-16] - Number cleanup for phone numbers containing (0) fails
- [TAPI-17] - Increase version field width
- [TAPI-19] - TAPI not reacting anymore after inactivity
- [TAPI-21] - Hangup does not work properly in tapi


## Release 3.R42 (09.10.2018)

**Overview**

- TAPI is now compatible with pascom server 18.01 and newer
- New version number
- Rebranding from mobydick to pascom

**MODIFICATIONS:**

- TAPI-3 - Correct "Mobydick" to "pascom" in TAPI
- TAPI-14 - TAPI can't connect if Role doesn't contain RoleTypeList
- TAPI-15 - Implement new version numbering scheme in TAPI
