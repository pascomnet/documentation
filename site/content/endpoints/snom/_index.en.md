---
title:  Snom Desktop Phones
description: Integrate your Snom VoIP phones into your pascom business phone system
weight: 10
---

{{< doctype "both" >}}
 
{{< description >}}

![snom D300/ D700 Series](snom-series.png)

## Snom Provisioning

The process of configuring or registering an VoIP phone with an IP PBX such as pascom's is know as {{< ui-button "Provisioning" >}}. For this purpose, pascom phone systems include a Default Configuration ({{< ui-button "Devices" >}} > {{< ui-button "Basic Configuration" >}}). For most deployment scenarios, these standard settings provide an ideal configuration. However, in some cases, the settings may need to be modified.

{{% notice tip %}}
For pascom on-premise phone system installations, it is possible to perform fully automated mass Endpoint deployments by using the pascom DHCP server.  
Further details can be found in our Howto [Telephone Provisioning via DHCP]({{< ref "/howto/dhcp-provisioning" >}}).
{{% /notice %}}

## Add New Phone

{{% notice tip %}}
Should the telephone not be factory new, ensure you perform a **factory reset**. In order to do this on the phone, power up the phone and then press <strong>\**##</strong> holding the final <strong>#</strong> until after the phone has restarted and a menu has appeared. Select option **1** for factory settings. 
{{% /notice %}}

Connect the phone to your network. Snom IP phones come with a built in switch, allowing you to connect the phone directly via the Ethernet port labelled as **NET**. Should you not have a **PoE** option available, connect the phone to a power supply.

The Snom IP phone will now boot and acquires an IP address which is displayed on the screen during the boot process. Please take a note of this address.

After booting, the phone will stop at the country selection screen.

### Finding the MAC Address

MAC addresses can be found on the rear underside of the telephone.

Alternatively, using your browser, surf to the previously noted telephone's IP address.

Under {{< ui-button "System Information" >}} > {{< ui-button "MAC-Address" >}} please take a note of the phone's IP address.

### Add Phones / Endpoints

Log into your pascom phone system and under {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}} and press {{< ui-button "Add" >}} and select the option **IP Telephone: Manufacturer Snom**.

Under the corresponding field, enter the **Mac-Address** that you have just found and noted. 

### Assigning Users

As soon as the IP phone has appeared in the Device List, it can be edited via the {{< ui-button "Edit" >}} button. Under the {{< ui-button "Assign" >}} tab, the phone can be assigned to a [user (or location)]({{< ref "concept/user">}}).

### Apply Jobs

After saving your phone setup configurations, a corresponding prompt to apply telephony configs will appear in the job box (top of the screen). Simply start the job by clicking on the {{< ui-button "green tick" >}}.

### Finding the Provisioning URL

Select the desired telephone from the device list and under {{< ui-button "Action" >}} select the option {{< ui-button "Provisioning URL" >}}. Copy the **URL** to your clipboard.

### Enter the Provisioning URL on the Telephone

Go back to the telephone Web UI and under {{< ui-button "Advanced Settings" >}} > {{< ui-button "Update" >}} > {{< ui-button "Setting URL" >}} paste the copied Provisioning URL.

Click on {{< ui-button "Apply" >}} and finally {{< ui-button "Reboot" >}}.

### Assigning Users

As soon as the IP phone has appeared in the Device List, it can be edited via the {{< ui-button "Edit" >}} button. Under the {{< ui-button "Assign" >}} tab, the phone can be assigned to a [user (or location)]({{< ref "concept/user">}}).

After saving and once again apply the telephony configuration, the telephone will restart.

### Function Testing

The simplest method of testing whether a device has been successfully deployed is to call ones Voicemail box via **\*100**. On successfully provisioned phones, you should now hear your Voicemail box prompts.

### pascom Menu Key

After the provisioning process, the **Menu** button on Snom phones is no longer assigned to the Telephone Menu, but rather to a telephone specific pascom Menu making the following pascom phone system functions available:

|Function|Description|
|---|---|
|Telephone Book|Opens up the central PBX phonebook.|
|Journal|Displays answered, dialed and missed calls|
|Call Forwarding|Sets a call forwarding, activates / updates a previously configured call forwarding or deactivates an active call forwarding.|
|Voicemail Box|Voicemail box menu for activating/deactivating your mail box, plus message play backs|
|Login|Enables a user to log into the location where the phone is (Hotdesking / roaming users).|
|Logout [*username*]|Logs out the current user from this location.|
|Teams (Queues)<!--FIXME-->|Is used for agent management within a queue (login, logout, pause..) according the configuration of the queue.|

Should the Snom IP telephone not have a menu key (i.e. Snom 300, 710 or D715), then the second function key will be assigned with the pascom menu function.

{{% notice tip%}}
Only set Call Forwardings via the pascom menu as they can then be managed by the PBX and reflected within the desktop UC client etc.
{{% /notice %}}

{{% notice info%}}
 Using the DND key (*do not disturb*) directly on your Snom phone, ensures that the assigned user extension cannot be reached on the phone. The DND notice will appear only on the telephone itself and will have no impact on other endpoints or the Desktop UC client (softphone).
{{% /notice %}}

### Accessing the Snom Telephone Web UI

In order to access your telephone's web UI, you will need to know the phone's IP address. The following outlines the different methods of discovering the phone IP Address:

#### Finding the IP-Address on the Telephone

Press the **?** (i.e. the **help**) in order to call up the phone IP address.

#### Finding the IP-Address via the pascom Web UI Device List

Log into the PBX Web UI and select the {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}}, which provides you an overview of all available devices. To the left of each entry is an *Info* symbol which when clicked will open an overview of the provisioned telephone including the IP address.

#### Admin Rights

In order to access certain menu options with the Snom Telephone web UI, you will require admin rights. To do this simply go the **Advanced** menu point and now enter the Admin Password.

### Function Keys

In the menu of the left, click on the {{< ui-button "Function Keys" >}} option.

#### User / Extension Monitoring with BLF Keys

Using the function keys, it is possible to monitor other extensions (i.e. users). The BLF keys (Busy Lamp Field) can be used to provide status information relating to the monitored extension. In this scenario, monitoring means watching the extension to see if the user is currently on the phone, being called or to answer calls intended for this extension (call pickup).

|Context|Type|Number|Short Text|
|---|---|---|---|
|Select Account / Identity|**BLF**|The extension to be monitored (e.g. 123) in the following format 123\|*8 |Should the telephone have a second display for paperless keys, then the keys labels can be entered here.|

Alongside user extensions, it is also possible to configure keys as login / out codes for queues or to configure them as an extension switch.
<!--FIXME Links zu dw-schalter, warteschlangen  -->

#### Additional Useful Function Keys
     
|Function Key|Description|
|---|---|
|**Speed Dial**| Can be assigned with a telephone number.|
|**DTMF**|Can be assigned with DTMF characters.|

### Default Configuration

As previously stated, Snom IP phones are provisioned using the default configurations which can be found under {{< ui-button "Devices" >}} > {{< ui-button "Basic Configurations" >}}.

{{% notice note%}}
When modifying the default configuration settings, ensure you make a duplicate copy of the original using the {{< ui-button "Duplicate" >}} tool.
{{% /notice %}}

In addition, you can set an already edited default configurations as the {{< ui-button "standard settings" >}}. Doing so ensures that all newly added IP telephones will automatically be provisioned with these default configurations.

#### Assigning a Default Configuration

A default configuration can be assigned using multiple methods:

+ Via {{< ui-button "Devices" >}} > {{< ui-button "Basic Configurations" >}} > Choose your Basic configuration set and press {{< ui-button "Edit" >}} Under the {{< ui-button "Devices" >}} tab, it is possible to add multiple IP telephones.
+ Via {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}} > Select and edit the IP Telephone and under the tab {{< ui-button "Basic Data" >}} choose the correct **Basic configuration** option.

#### Automatic BLF Key Configuration via Basic Configurations

Under the {{< ui-button "Configuration" >}} tab, it is possible to modify the existing basic configuration. Under the **Keys** section you will find the already pre-configured function keys which provide a useful guideline to work with.

Navigate to the Snom Telephone web UI and under *Function Keys* configure the **P1** button as an example. As type, select **BLF**, and as number **\*8123** and **ExampleUser** as the short text. Once done, apply the settings.

Next, click on the *Settings* menu option. Should this option not be visible, you will require [admin rights]({{< relref "#accessing-the-snom-telephone-web-ui">}}).<br>
Search for *fkey0* and *fkey_label0*. Next copy and paste the search result lines into the phone system web UI:

    {{!-- keys --}}
    fkey0: blf sip:123@{{{cs_domain}}}|*8
    fkey_label0: Switchboard

Via the menu tab {{< ui-button "devices" >}}, assign these default configurations to the telephones which should have this BLF configuration. Save and apply your changes and once the phones have restarted, the changes will have taken affect.

## Firmware Updates

From mobydick version 7.14 onwards, IP endpoint firmware will no longer be included as standard. Should a firmware version (other than the version pre-installed on the phone) be required, this must be externally sourced and per hand uploaded to the phone system firmware management tool.

### Upload New Firmware

The desired firmware can be uploaded via the the {{< ui-button "Devices" >}} > {{< ui-button "Device firmware" >}}:

|Settings|Description|
|---|---|
|Firmware Files|Upload the firmware files here. Firmware can be found here: [Snom Support Wiki](http://wiki.snom.com/Category:Firmware).|
|Model|Snom Telephone model name|
|Version|Firmware Version|
|Comments|Optional field for notes|

### Firmware Roll Outs

Firmware updates can be rolled out via the {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}} menu. Simply select the desired Snom Endpoints from the list via the check boxes and click {{< ui-button "Actions" >}} > {{< ui-button "Roll out firmware" >}}. This will open an overview of all selected devices to which the new firmware version should be rolled out to. Click {{< ui-button "Firmware Update" >}} to roll out the desired firmware version.


