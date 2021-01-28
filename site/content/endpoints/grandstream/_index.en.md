---
title: Grandstream Desktop Phones
description: How to integrate your Grandstream IP Telephones in your pascom phone system.
weight: 11
---

{{< doctype "both"  >}}

![Grandstream GXP2160](grandstream_GXP2160.jpg?width=400px "Grandstream VoIP Phones")

## Supported Endpoints

**[List of supported Endpoints, Click here!]({{<ref "/endpoints#grandstream-ip-phones" >}})**

{{% notice tip %}}
For local pascom phone system installations, it is possible to automatically on-board and perform mass deployments of endpoints using the DHCP server.
For more details, please refer to our HowTo [Telephone Provisioning via DHCP]({{< ref "/howto/dhcp-provisioning" >}}).
{{% /notice %}}

[pascom phone systems](https://www.pascom.net/en/ "pascom VoIP phone systems") are able to automatically and centrally configure Yealink IP phones. This process is known as Provisioning. For this purpose, pascom phone systems include a Default Configuration ({{< ui-button "Devices" >}} > {{< ui-button "Basic Configuration" >}}). For most deployment scenarios, these standard settings provide an ideal configuration. However, in some cases, the settings may need to be modified.

## Add New Phone
{{% tabs %}}

{{% tab "Cloud" %}}

**Pairing via URL works with CLOUD + ONSITE**  


{{< num 1 "Connect your Device" >}}

{{% notice tip %}}
Should the telephone not be factory new, ensure you perform a **factory reset**. 
{{% /notice %}}

Connect the phone to your network. Snom IP phones come with a built in switch, allowing you to connect the phone directly via the Ethernet port labelled as **NET**. Should you not have a **PoE** option available, connect the phone to a power supply.

The Snom IP phone will now boot and acquires an IP address which is displayed on the screen during the boot process. Please take a note of this address.


{{< num 2 "Finding the MAC Address" >}}

MAC addresses can be found on the rear underside of the telephone.

Alternatively, using your browser, surf to the previously noted telephone's IP address.

Under {{< ui-button "System Information" >}} > {{< ui-button "MAC-Address" >}} please take a note of the phone's IP address.

{{< num 3 "Add Phones / Endpoints" >}}

Log into your pascom phone system and under {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}} and press {{< ui-button "Add" >}} and select the option **IP Telephone: Manufacturer Grandstream**.

Under the corresponding field, enter the **Mac-Address** that you have just found and noted. 

{{< num 4 "Assigning Users" >}}

As soon as the IP phone has appeared in the Device List, it can be edited via the {{< ui-button "Edit" >}} button. Under the {{< ui-button "Assign" >}} tab, the phone can be assigned to a [user (or location)]({{< ref "concept/user">}})

{{< num 5 "Apply Jobs" >}}

After saving your phone setup configurations, a corresponding prompt to apply telephony configs will appear in the job box (top of the screen). Simply start the job by clicking on the {{< ui-button "green tick" >}}.

{{< num 6 "Finding the Provisioning URL" >}}

Select the desired telephone from the device list and under {{< ui-button "Action" >}} select the option {{< ui-button "Provisioning URL" >}}. Copy the **URL** to your clipboard.

{{< num 7 "Enter the Provisioning URL on the Telephone" >}}

Go to the Grandstream phone's admin UI, and enter the copied provisioning URL.

Click {{< ui-button "Confirm" >}} and finally {{< ui-button "reboot" >}}.

The phone will now restart and provision itself.

{{< num 8 "Function Testing" >}}

The simplest method of testing whether a device has been successfully deployed is to call ones Voicemail box via **\*100**. On successfully provisioned phones, you should now hear your Voicemail box prompts.

{{% /tab %}}

{{% tab "Onsite" %}}

**DHCP Provisioning works only ONSITE**  

{{% notice note %}}
For local installations of the pascom server it is possible to commission end devices via DHCP server on a mass scale and fully automatically.
{{% /notice %}}

{{< num 1 "Prepare your DHCP-Server" >}}

Prepare a DHCP server as described in [Phone Provisioning via DHCP]({{< ref "/howto/dhcp-provisioning" >}}).

{{< num 2 "Connect your Device" >}}

{{% notice tip %}}
Should the telephone not be factory new, ensure you perform a **factory reset**. In order to do this on the phone, power up the phone and then press {{< ui-button "OK" >}} holding the final until **Factory Reset** appears in the display. Confirm by pressing {{< ui-button "OK" >}}. 
{{% /notice %}}

Connect the phone to your network. Snom IP phones come with a built in switch, allowing you to connect the phone directly via the Ethernet port labelled as **NET**. Should you not have a **PoE** option available, connect the phone to a power supply.

The device is **automatically** configured by the pascom server and **appears** in the list {{< ui-button "Devices" >}} > {{< ui-button "Device List" >}}. 

{{< num 3 "Assigning Users" >}}

As soon as the IP phone has appeared in the Device List, it can be edited via the {{< ui-button "Edit" >}} button. Under the {{< ui-button "Assign" >}} tab, the phone can be assigned to a [user (or location)]({{< ref "concept/user">}})

{{< num 4 "Apply Jobs" >}}

After saving your phone setup configurations, a corresponding prompt to apply telephony configs will appear in the job box (top of the screen). Simply start the job by clicking on the {{< ui-button "green tick" >}}.

{{< num 5 "Function testing" >}}

The simplest method of testing whether a device has been successfully deployed is to call ones Voicemail box via **\*100**. On successfully provisioned phones, you should now hear your Voicemail box prompts.

{{% /tab %}}
{{% /tabs %}}

### Accessing the Grandstream Web UI

In order to access your telephone's web UI, you will need to know the phone's IP address. The following outlines the different methods of discovering the phone IP Address:

#### Finding the IP-Address on the Telephone

Press the round **OK** key in the center of the arrow keys. You can find the IP address via the {{< ui-button "Status" >}} > {{< ui-button "Network Status" >}} menu options.

#### Finding the IP-Address via the Web UI Device List

Log into the PBX Web UI and select the {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}}, which provides you an overview of all available devices. To the left of each entry is an *Info* symbol which when clicked will open an overview of the provisioned telephone including the IP address.

### Programmable Keys

Via the Grandstream telephone's Web UI, it is possible to assign programmable function keys. Click on {{< ui-button "Settings" >}} > {{< ui-button "Programmable Keys" >}} and you will be able to configure the two types of keys available:

#### Virtual Multi-Purpose Keys

As programmable "soft keys", these keys appear on the phone's main display. In order to configure this key, click {{< ui-button "Edit VPK" >}}:

|Mode|Accounts|Description|Value|
|---|---|---|---|
|Busy Lamp Field (BLF)|Account 1|Key label / name|Extension number|

To save your settings, simply click {{< ui-button "Save" >}}. The settings will then come into effect after clicking {{< ui-button "Save VPK" >}}.

{{% notice info%}}
In order to reset the key settings, click on {{< ui-button "Reset" >}} and then finally {{< ui-button "Save VPK" >}}.
{{% /notice %}}

#### Multi-Purpose Keys

Depending on the IP telephone model, these keys are additional programmable "hard keys".
Within the overview screen, you will see all the available multi-function keys which can be configured:

|Mode|Accounts|Description|Value|
|---|---|---|---|
|Busy Lamp Field (BLF)|Account 1|Key label / name|Extension number|

To finish your configuration, click on {{< ui-button "Save and Apply" >}}, which will activate all your modifications.

{{% notice info%}}
In order to reset the key settings, click on {{< ui-button "Reset" >}} and then finally {{< ui-button "Save and apply" >}}.
{{% /notice %}}

### Default Configuration

As previously stated, Grandstream IP phones are provisioned using the default configurations which can be found under {{< ui-button "Devices" >}} > {{< ui-button "Basic Configurations" >}}.

{{% notice note%}}
When modifying the default configuration settings, ensure you make a duplicate copy of the original using the {{< ui-button "Duplicate" >}} tool.
{{% /notice %}}

In addition, you can set an already edited default configurations as the {{< ui-button "standard settings" >}}. Doing so ensures that all newly added IP telephones will automatically be provisioned with these default configurations.

#### Assigning a Default Configuration

A default configuration can be assigned using multiple methods:

+ Via {{< ui-button "Devices" >}} > {{< ui-button "Basic Configurations" >}} > Choose your Basic configuration set and press {{< ui-button "Edit" >}} Under the {{< ui-button "Devices" >}} tab, it is possible to add multiple IP telephones.
+ Via {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}} > Select and edit the IP Telephone and under the tab {{< ui-button "Basic Data" >}} choose the correct **Basic configuration** option.


#### Automatic BLF Key Configuration via Basic Configurations

Under the {{< ui-button "Configuration" >}} tab, it is possible to modify the existing basic configuration.

Within the **</config>** section, you can add your desired keys. The following example highlights how to add the first *Virtual-Multi-Purpose-Key*:

    <P1363>11</P1363>
    <P1364>0</P1364>
    <P1465>Max</P1465>
    <P1466>103</P1466>

#### Explanation:

**11** is the BLF key code
**0** is the first account on the telephone
**Max** is the label which should appear on the telephone screen
**103** is the extension to be watched.

<!-- For more information, please refer to our [Grandstream Key Documentation](/grandstream_key_configuration.pdf). -->

Via the menu tab {{< ui-button "devices" >}}, assign these default configurations to the telephones which should have this BLF configuration. Save and apply your changes and once the phones have restarted, the changes will have taken affect.

### Firmware Updates

From mobydick version 7.14 onwards, IP endpoint firmware will no longer be included as standard. Should a firmware version (other than the version pre-installed on the phone) be required, this must be externally sourced and per hand uploaded to the phone system firmware management tool.

#### Upload New Firmware

The desired firmware can be uploaded via the the {{< ui-button "Devices" >}} > {{< ui-button "Device firmware" >}}:

|Settings|Description|
|---|---|
|Firmware Files|Upload the firmware files here.|
|Model|Grandstream Telephone model name|
|Version|Firmware Version|
|Comments|Optional field for notes|

#### Firmware Roll Outs

Firmware updates can be roll out via the {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}} menu. Simply select the desired Grandstream Endpoints from the list via the check boxes and under {{< ui-button "Actions" >}} > {{< ui-button "Roll out firmware" >}}. This will open an overview of all selected devices to which the new firmware version should be roll out to. Click {{< ui-button "Firmware Update" >}} to roll out the desired firmware version.

