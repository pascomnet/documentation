---
title: Telephone Provisioning via DHCP
description: Instead of coupling each individual desktop phone with the pascom phone system via provisioning URLs, you can also automatically distribute the provisioning URLs via DHCP
---
 
{{< doctype "self" >}} 

{{< description >}}

{{% notice warning %}}
DHCP provisioning is only possible when the desktop phones AND the pascom server are both located in the same local network!
{{% /notice %}}

## Using your Own DHCP Server (Recommended)

As a DHCP servers are already available in almost ever local network, it is recommended to update this DHCP server to deliver the provisioning URLs to the desktop phones.

### Allow DHCP Provisioning on the pascom Server

Per default, the local DHCP provisioning is activated. 

Should you have deactivated this function in the past, log into the pascom Management UI (not the phone system) and under {{< ui-button "Interfaces" >}} select the corresponding network card and click {{< ui-button "Edit" >}}. Activate the option {{< ui-button "Allow local DHCP provisionioning" >}} and save your new configuration.

### Configure the DHCP Server
{{% notice tip %}}
On Windows DHCP servers (or DHCP servers which follow this options schema), you will now need to set the **DHCP Option** **66** and possibly **67**. With Linux/Unix DHCP servers these options are known as **tftp-server-name** and **filename**.
{{% /notice  %}}

The provisioning URLs differ depending on the telephones to be deployed.

In the following example, please **replace** **[pascom_Server]** with the IP address or DNS name of your pascom server and **[phonesystemname]** with the name of your pascom phone system:

|Phone Manufacturer|Option 66 (tftp-server-name) |Option 67 (filename) |
|---|---|---|
|Snom|http://[pascom_Server]:8880/p/[phonesystemname]/{mac}||
|Yealink, Grandstream, Aastra, Mitel|http://[pascom_Server]:8880/p/[phonesystemname]/||
|Auerswald|http://[pascom_Server]:8880/p/[phonesystemname]/|\<MACADR\>|

Should you only wish to send these options exclusively to telephones, then you can restrict the use of the option to the manufactures used by you:

|Phone Manufacturer|MAC address|
|---|---|
|Snom|00-04-13-\*-\*-\*|
|Yealink|00-15-65-\*-\*-\*|
|Grandstream|00-0B-82-\*-\*-\*|
|Aastra|00-08-5D-\*-\*-\*|
|Auerswald|00-09-52-\*-\*-\*|

### Test the Provisioning

Reset your Desktop phones to factory settings. Should the DHCP function with the correct options, the desktop phone will be configured automatically. If the provisioning process was succesful, you will now see "Emergency Only" or a username or location name in the telephone display.

## Using the pascom DHCP Server

Alternatively, you can also use the pascom DHCP server. 

Log into the pascom Server Management UI and under {{< ui-button "Interfaces" >}} select the corresponding network card and click {{< ui-button "Edit" >}}.

Activate the options {{< ui-button "Allow Local DHCP Provisioning" >}} and {{< ui-button "DHCP Server" >}}.

Configure the DHCP Server:

|Option|Description|Example|
|---|---|---|
|DHCP Mode|**All Requests:** Answer all DHCP requests<br> **Only supported telephones:** Only distribute IP address to supported telephones||
|DHCP range from|The first IP address to be assigned by the DHCP server |192.168.1.100|
|DHCP range to|The last IP address that the DHCP server should assign|192.168.1.150|
|DHCP Gateway|Network Gateway|192.168.1.1|
|DHCP DNS|DNS Server|192.168.1.1|
|Forward phone request to this phone system|pascom|pascom phone system name to which provisioning requests should be forwarded|

Save your configurations.

### Provisioning with DHCP via VPN

As soon as the VPN connection has been set up on the pascom, the provisioning URLs will also change. The path now looks like this. 

|Phone manufacturer|URL-Path|
|---|---|
|Snom|http://[Ihre_VPN_IP]/provisioning/{mac}|
|Yealink, Grandstream, Aastra, Mitel|http://[Ihre_VPN_IP]/provisioning/|
|Auerswald|http://[Ihre_VPN_IP]/provisioning/|  

**As soon as your end devices have been provisioned via the VPN connection, the audio stream of your calls will also run via the VPN connection**

### Test the Provisioning

Reset your Desktop phones to factory settings. Should the DHCP function with the correct options, the desktop phone will be configured automatically. If the provisioning process was succesful, you will now see "Emergency Only" or a username or location name in the telephone display.
