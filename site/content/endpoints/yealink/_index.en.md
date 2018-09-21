---
title: Yealink T4 Series Desktop Phones
description: How to integrate your Yealink T4 Series Desktop SIP phones with your pascom phone system.
weight: 30
---


{{< doctype "both"  >}}

{{< description >}}

![Yealink T46G](yealink-t4-series1.jpg?width=400px "pascom Yealink T46 VoIP phone")


## Compatibility

|Provisioning|Firmware Management|Desktop Client CTI Control|pascom Menu|
|---|---|---|---|
|yes|yes|yes|yes|

**Provisioning**: The IP phone is manageable via the PBX web UI.<br>
**Firmware Management**: Firmware can be managed and updated via the PBX web UI.<br>
**Desktop Client CTI Control**: The desktop UC client can remotely control the phone, i.e. to start calls.<br>
**pascom Menu**: A phone touch key will be assigned to access the pascom Menu.

## Configuration

With [the pascom phone system] (https://www.pascom.net/en/ "pascom VoIP phone systems") it is possible to centrally and automatically configure the majority of Yealink IP Telephones. This process is know as {{< ui-button "Provisioning" >}}. For this purpose, pascom phone systems include a Default Configuration ({{< ui-button "Devices" >}} > {{< ui-button "Basic Configuration" >}}). For most deployments, these standard settings provide the ideal configuration. However, in some cases, the settings may need to be modified.

{{% notice tip%}}
By new installations, you should first test the provisioning process with a telephone. Should this be successful then you will be able to deploy further telephones.
{{% /notice %}}

### Preparation

In order to automatically deploy (AutoProvision) Yealink Telephones, a functioning DHCP server is required.

### Device Onboarding

Connect the phone to your network. Yealink IP phones come with a built in switch, allowing you to connect the phone directly via the Ethernet port labelled as **Internet**. Should you not have a **PoE** option available, connect the phone to a power supply.

The Yealink IP phone will now boot and acquires an IP address and the corresponding Basic Configurations via DHCP. After this process is completed, the device will automatically appear under {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}} as well as adding the appropriate SIP peer.

As mentioned above, for every device pascom will also automatically add a SIP peer. In addition, the device username and password will also be automatically generated. The username consists of a randomly generated string followed by the last six digits of the device’s MAC address (15 digits in total). As the IP phones are automatically provisioned, you will not be required to enter this data manually and it is not possible to modify the user data. This is designed to considerably increase security against SIP Brute Force attacks.

The Device Name will be automatically added as signified by the vendor (Yealink) and the MAC Address. On most IP phones, the MAC address is noted on the device housing, allowing phones to be more simply deployed on site in the correct locations.

After a successful provisioning, the IP phone display should show to correct language and time as well as the text {{< ui-button "Emergency Only" >}}

{{% notice info%}}
After the successful phone provisioning, the admin user will be reset by the PBX with the following credentials:  
<br>Username: *admin*
<br>Password: *0000*
{{% /notice  %}}

The Telephone Admin User Password can be changed within the Web UI under system settings. Use the search box and search for the parameter *sys.peripherals.access.password* and enter your desired password. Finally, you will be required to manually apply the Telephony Configurations and restart the endpoint.

### Assigning Users

As soon as the IP phone has appeared in the Device List, it can be edited via the {{< ui-button "Edit" >}} button. Under the {{< ui-button "Assign" >}} tab, the phone can be assigned to a [user (or location)]({{< ref "concept/user">}}).

After saving and once again apply the telephony configuration, the telephone will restart.

### Function Testing

The simplest method of testing whether a device has been successfully deployed is to call ones Voicemail box via **\*100**. On successfully provisioned phones, you should now hear your Voicemail box prompts.

### pascom Menu Key

Having been provisioned, the pascom menu key can be found on the second function key on the display of the Yealink IP phone. The following pascom phone system functions are available under this key:

|Function|Description|
|---|---|
|Telephone Book|Opens up the central PBX phonebook.|
|Journal|Displays answered, dialed and missed calls|
|Call Forwarding|Sets a call forwarding, activates / updates a previously configured call forwarding or deactivates an active call forwarding.|
|Voicemail Box|Voicemail box menu for activating/deactivating your mail box, plus message play backs|
|Login|Enables a user to log into the location where the phone is (Hotdesking / roaming users).|
|Logout [*username*]|Logs out the current user from this location.|
|Teams (Queues)<!--FIXME-->|Is used for agent management within a queue (login, logout, pause..) according the configuration of the queue.|


{{% notice tip%}}
Only set Call Forwardings via the pascom menu as they can then be managed by the PBX.
{{% /notice %}}

{{% notice info%}}
 Using the DND key (*do not disturb*) directly on your Yealink phone, ensures that the assigned user extension cannot be reached on the phone. The DND notice will appear only on the telephone itself and will have no impact on other endpoints or the Desktop UC client (softphone).
{{% /notice %}}

### Accessing the Yealink Web UI

In order to access the web UI of your Yealink phone, you will need to know the phone's IP address. The following outlines the different methods of discovering the phone IP Address:

#### Finding the IP-Address on the Telephone

Press the **OK** key when the phone idle screen is active and the phone IP address, MAC Address and firmware will be displayed.

#### Finding the IP-Address via the pascom Web UI Device Listn

Log into the PBX Web UI and select the {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}}, which provides you an overview of all available devices. To the left of each entry is an *Info* symbol which when clicked will open an overview of the provisioned telephone including the IP address.

### Function Keys

The function keys to the right and left of the Yealink phone's screen support a 3 page view, meaning they can be assigned with 3 different functions one for each page. Should the first page be fully assigned, the last key (bottom right) can be used to toggle pages.

#### BLF Key User / Extension Monitoring

Using the function keys, it is possible to monitor other extensions (i.e. users). The BLF keys (Busy Lamp Field) can be used to provide status information relating to the monitored extension. In this scenario, monitoring means watching the extension to see if the user is currently on the phone, being called or to answer calls intended for this extension (call pickup).

Function Keys can be assigned in a variety of ways.

#### Assign Function Keys Direct on the Yealink Phone

Push and hold the function key on the phone which you wish to configure for 5 seconds. At this point you will be able to assign this key with a function (e.g. BLF key).

|Settings|Assignement|
|---|---|
|Type|BLF|
|Account ID|Line 1|
|Label|Enter a name for the key.|
|Value|The extension to be monitored, e.g. 123 for the ext 123|

To confirm, press *Save*.

#### Assign Function Keys via the Yealink Web UI

Under the tab {{< ui-button "DSSKey" >}} it is possible to assign the various telephone keys as BLF keys for example:

|Type|Value|Label|Line|Extension|
|---|---|---|---|
|BLF|The extension to be monitored, e.g. 123 for extension 123|Enter an label / name for the key.|Line 1|The extension number, i.e. 123|

As well as user extensions, it is also possible to configure a BLF key with login codes or extensions switches.

#### Further Useful Function Keys

|Function Key|Description|
|---|---|
|**Speed Dial**| Can be assigned with a telephone number.|
|**DTMF**|Can be assigned with DTMF characters.|-->

### Default Configuration
    
As previously stated, Yealink IP phones are provisioned using the default configurations which can be found under {{< ui-button "Devices" >}} > {{< ui-button "Basic Configurations" >}}.
    
{{% notice note%}}
When modifying the default configuration settings, ensure you make a duplicate copy of the original using the {{< ui-button "Duplicate" >}} tool.
{{% /notice %}}
    
In addition, you can set an already edited default configurations as the {{< ui-button "standard settings" >}}. Doing so ensures that all newly added IP telephones will automatically be provisioned with these default configurations.

#### Assigning a Default Configuration

A default configuration can be assigned using multiple methods:

+ Via {{< ui-button "Devices" >}} > {{< ui-button "Basic Configurations" >}} > Choose your Basic configuration set and press {{< ui-button "Edit" >}} Under the {{< ui-button "Devices" >}} tab, it is possible to add multiple IP telephones.
+ Via {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}} > Select and edit the IP Telephone and under the tab {{< ui-button "Basic Data" >}} choose the correct **Basic configuration** option.

#### Default Configuration & Automatic BLF Assignment

Under the {{< ui-button "Configuration" >}} tab, it is possible to modify the existing basic configuration. Under the **Keys** section you will find the already pre-configured function keys which provide a useful guideline to work with.

BLF Keys can be setup as follows:

    {{!-- keys --}}
    linekey.3.type = 16
    linekey.3.value = 123
    linekey.3.label = Max

The assigned key (in this case, line key 3) consists of three parameters:

+ *type*: The key type, 16 stands for BLF,
+ *value*: the value, in this case the extension number,
+ *label*: the label, which is to be displayed on the phone's screen Label.

Via the menu tab {{< ui-button "Devices" >}}, assign these default configurations to thoses telephones that should be configured with this BLF setup. Save and apply your changes and once the phones have restarted, the changes will have taken affect.

### Firmware Updates

From mobydick version 7.14 onwards, IP endpoint firmware will no longer be included as standard. Should a firmware version (other than the version pre-installed on the phone) be required, this must be externally sourced and per hand uploaded to the phone system firmware management tool.

#### Upload New Firmware

The desired firmware can be uploaded via the the {{< ui-button "Devices" >}} > {{< ui-button "Device firmware" >}}:

|Settings|Description|
|---|---|
|Firmware Files|Upload the firmware files here. Firmware can be found here: [Yealink support download page](http://support.yealink.com/documentFront/forwardToDocumentFrontDisplayPage).|
|Model|Yealink Telephone model name|
|Version|Firmware Version|
|Comments|Optional field for notes|

#### Firmware Roll Outs

Firmware updates can be roll out via the {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}} menu. Simply select the desired Yealink Endpoints from the list via the check boxes and under {{< ui-button "Actions" >}} > {{< ui-button "Roll out firmware" >}}. This will open an overview of all selected devices to which the new firmware version should be roll out to. Click {{< ui-button "Firmware Update" >}} to roll out the desired firmware version.

#### Recommended Firmware 

As there are numerous Firmware versions available for the varying IP endpoint models, it is unfortunately not possible to test them all. Therefore, it is possible that some firmware versions may not support all phone system functions. If in doubt, please refer to below list of already tested firmware versions:

|Model|Firmware|
|---|---|
|T41P|36.81.0.110|
|T46G|28.81.0.110, 28.73.0.50|
|T46S|66.81.0.20, 66.81.0.110|
