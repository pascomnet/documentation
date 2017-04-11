---
title: Snom 3xx 7xx Series VoIP Phones
keywords: 
    - Snom 
    - Desktop Phones
    - provisioning
    - 300, 320, 360, 370, 710,715, 720, 760
    - D705, D715, D725, D765
    - Snom BLF Key
    - Busy Lamp Field
    - Snom Firmware
description: All Snom IP telephone models are supported by mobydick and here is how to integrate your Snom VoIP Desktop Phone.
url:  /endpoints/snom-ip-telephones-300-700-series/
linkde: /endgeraete/snom-tischtelefone-300-700-serie/
prev: /endpoints/
next: /endpoints/yealink-ip-telephones-t4-series/
weight: 41
toc: true
---

![snom 300/700 series](/snom-series.png)

## Compatability

With [our VoIP Software] (https://www.pascom.net/en/mobydick-voip/ "pascom VoIP phone systems") it is possible to centrally and automatically configure Snom IP Telephones, both 3xx and 7xx series.

|Provisioning|Firmware Management|Desktop Client CTI Control|pascom Menu|
|---|---|---|---|
|yes|yes|yes|yes|

**Provisioning**: The IP phone is manageable via the PBX web UI.<br>
**Firmware Management**: Firmware can be managed and updated via the PBX web UI.<br>
**Desktop Client CTI Control**: The desktop UC client can remotely control the phone, i.e. to start calls.<br>
**pascom Menu**: A phone touch key will be assigned to access the pascom Menu.

{{% notice warning%}}
Necessary Requirements  
In order to automatically deploy (AutoProvision) Snom IP Telephones, a functioning DHCP server is required.
{{% /notice %}}

## Configuration

The configurations process is know as `Provisioning`. For this purpose, pascom phone systems include a Default Configuration (`Devices > Basic Configuration`). For most deployment scenarios, these standard settings provide a sufficient set of parameters. However, in some cases, the settings may need to be modified.

{{% notice tip%}}
By new installations, you should first test the provisioning process with a telephone. Should this be successful then you will be able to deploy further telephones.
{{% /notice %}}

### Preparation

In order to automatically deploy (AutoProvision) Yealink Telephones, a functioning DHCP server is required.
[Network Planning and Configuration](../../server/network-configuration/).

### Device Commissioning

Connect the phone to your network. Yealink IP phones come with a built in switch, allowing you to connect the phone directly via the Ethernet port labelled as **NET**. Should you not have a **PoE** option available, connect the phone to a power supply.

The Snom IP phone will now boot and acquires an IP address and the corresponding Basic Configurations via DHCP. After this process is completed, the device will automatically** appear under `device` > `device list` as well as adding the appropriate SIP peer.

As mentioned above, for every device mobydick will also automatically add a SIP peer. In addition, the device username and password will also be automatically generated. The username consists of a randomly generated string followed by the last six digits of the device’s MAC address (15 digits in total). As the IP phones are automatically provisioned, you will not be required to enter this data manually and it is not possible to modifiy the user data. This is designed to considerably increase security against SIP Brute Force attacks.

The Device Name will be automatically added as signified by the vendor (Snom) and the MAC Address. On most IP phones, the MAC address is noted on the device housing, allowing phones to be more simply deployed on site in the correct locations.

After a successful provisioning, the IP phone display should show to correct language and time as well as the text `Emergency Only`

{{% notice info%}}
After the successful phone provisioning, the admin user will be reset by the PBX with the following credentials:  
<br>Username: *admin*
<br>Password: *0000*
{{% /notice  %}}

The Telephone Admin User Password can be changed within the Web UI under system settings. Use the search box and search for the parameter *sys.peripherals.access.password* and enter your desired password. Finally, you will be required to manually apply the Telephony Configurations and restart the endpoint.

### Assigning Users

As soon as the IP phone has appeared in the Device List, it can be edited via the `Edit` button. Under the `Assign` tab, the phone can be assigned to a [user (or location)](../../users/users-and-locations/). 

After saving your assignments and reapplying the telephony configurations, all affected IP phones will restart.

### Function Testing

The simplest method of testing whether a device has been successfully deployed is to call ones Voicemail box via **\*100**. On successfully provisioned phones, you should now hear your Voicemail box prompts.

### pascom Menu Key

After the provisioning process, the **Menu** button on Snom phones is no longer assigned to the Telephone Menu, but rather to a telephone specific pascom Menu making the following pascom phone system functions available:

|Function|Description|
|---|---|
|Telephone Book|Opens up the central PBX phonebook.|
|Journal|Displays answered, dialled and missed calls|
|Call Forwarding|Sets a call forwarding, activates / updates a previously configured call forwarding or deactivates an active call forwarding.|
|Voicmail Box|Voicemail box menu for activating/deactivating your mail box, plus message play backs|
|Login|Enables a user to log into the location where the phone is (Hotdesking / roaming users).|
|Logout [*username*]|Logs out the current user from this location.|
|Teams (Queues)<!--FIXME-->|Is used for agent management within a queue (login, logout, pause..) according the configuration of the queue.|

Should the Snom IP telephone not have a menu key (i.e. Snom 300, 710 or D715), then the second functions key be assigned with the pascom menu function.

{{% notice tip%}}
Only set Call Forwardings via the pascom menu as they can then be managed by the PBX and reflected within the desktop UC client etc.
{{% /notice %}}

{{% notice info%}}
 Using the DND key (*do not disturb*) directly on your Snom phone, ensures that the assigned user extension cannot be reached on the phone. The DND notice will appear only on the telephone itself and will have no impact on other endpoints or the Desktop UC client (softphone).
{{% /notice %}}

### Accessing the Snom Telephone Web UI

In order to access your telephone's web UI, you will need to know the phone's IP address. The following outlines the different methods of discovering the phone IP Address:

**Finding the IP-Address on the Telephone**

Press the **?** (i.e. the **help**) in order to call up the phone IP address.

**Finding the IP-Address via the Web UI Device List**

Log into the PBX Web UI and select the `Devices` > `Device list`, which provides you an overview of all available devices. To the left of each entry is an *Info* symbol which when clicked will open an overview of the provisioned telephone including the IP address.

**Admin Rights** 

In order to access certain menu options with the Snom Telephone web UI, you will require admin rights. To do this simply go the **Advanced** menu point and now enter the Admin Password. 

### Function Keys

In the menu of the left, click on the `Function Keys` option.

**User / Extension Monitoring with BLF Keys**

Using the function keys, it is possible to monitor other extensions (i.e. users). The BLF keys (Busy Lamp Field) can be used to provide status information relating to the monitored extension. In this scenario, monitoring means watching the extension to see if the user is currently on the phone, being called or to answer calls intended for this extension (call pickup). 

|Context|Type|Number|Short Text|
|---|---|---|---|
|Select Account / Identity|**Extension**|The extension to be monitored (e.g. 123) in the following format <sip:123@192.168.100.1>|Should the telephone have a second display for paperless keys, then the keys labels can be entered here.|

Alongside user extension, it is also possible to to configure keys as login / out codes for [queues](../../users/add-teams/) or to configure them as an [extension switch](../../call-distribution/business-hours/#using-extension-switches).

**Additional Useful Function Keys**

|Function Key|Description|
|---|---|
|**Speed Dial**| Can be assigned with a telephone number.|
|**DTMF**|Can be assigned with DTMF characters.|

### Default Configuration

As previously stated, Snom IP phones are provisioned using the default configurations which can be found under `Devices`> `Basic Configurations`.

{{% notice note%}}
When modifying the default configuration settings, ensure you make a duplicate copy of the original using the `Duplicate`tool. 
{{% /notice %}}

In addition, you can set an already edited default configurations as the `standard settings`. Doing so ensures that all newly added IP telephones will automatically be provisioned with these default configurations.

**Assigning a Default Configuration**

A default configuration can be assigned using multiple methods:

+ Via `Devices`> `Basic Configurations` > Choose your Basic configuration set and press `Edit` Under the `Devices` tab, it is possible to add multiple IP telephones.
+ Via `Devices`> `Device list` > Select and edit the IP Telephone and under the tab `Basic Data` choose the correct **Basic configuration** option. 

**Automatic BLF Key Configuration via Basic Configurations**

Under the `Configuration` tab, it is possible to modify the existing basic configuration. Under the **Keys** section you will find the already pre-configured function keys which provide a useful guideline to work with.

Navigate the the Snom Telephone web UI and under *Function Keys* configure the **P1** button as an example. As type, select **Extension**, and as number **123** and **ExampleUser** as the short text. Once done, apply the settings.

Next, click on the *Settings* menu optuon. Should this option not be visible, you will require [admin rights](../snom-ip-telephones-300-700-series/#accessing-the-snom-telephone-web-ui).<br>
Search for *fkey0* and *fkey_label0*. Next copy and paste the search result lines into the phone system web UI:

    {{!-- keys --}}
    fkey0: dest <sip:123@192.168.100.1>
    fkey_label0: Switchboard

Via the menu tab `devices`, assign these default configurations to the telephones which should have this BLF configuration. Save and apply your changes and once the phones have restarted, the changes will have taken affect.

### Firmware Updates

From mobydick version 7.14 onwards, IP endpoint firmware will no longer be included as standard. Should a firmware version (other than the version pre-installed on the phone) be required, this must be externally sourced and per hand uploaded to the phone system firmware management tool.

**Upload New Firmware**

The desired firmware can be uploaded via the the `Devices`> `Device firmware`:

|Settings|Description|
|---|---|
|Firmware Files|Upload the firmware files here. Firmware can be found here: [Snom Support Wiki](http://wiki.snom.com/Category:Firmware).|
|Model|Snom Telephone model name|
|Version|Firmware Version|
|Comments|Optional field for notes|

**Firmware Roll Outs**

Firmware updates can be roll out via the `Devices` > `Device list` menu. Simply select the desired Snom Endpoints from the list via the check boxes and under `Actions` > `Roll out firmware`. This will open an overview of all selected devices to which the new firmware version should be roll out to. Click `Firmware Upate` to roll out the desired firmware version.

**Recommended Firmware**

As there are numerous Firmware versions available for the varying IP endpoint models, it is unfortunately not possible to test them all. Therefore, it is possible that some firmware versions may not support all phone sytem functions. If in doubt, please refer to below list of already tested firmware versions:

|Model|Firmware|
|---|---|
|Snom 300|8.7.3.25.5|
|Snom 320|8.7.3.25.5|
|Snom 360|8.7.3.25.5|
|Snom 370|8.7.3.25.5|
|Snom 710|8.7.3.25.5|
|Snom 715|8.7.8.8.2|
|Snom 720|8.7.3.25.5|
|Snom 760|8.7.3.25.5|