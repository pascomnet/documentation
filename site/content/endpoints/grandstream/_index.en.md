---
title: Grandstream Desktop Phones
description: How to integrate your Grandstream IP Telephones in your pascom phone system.
weight: 50
---

{{< doctype "both"  >}}

![Grandstream GXP2160](grandstream_GXP2160.jpg?width=400px "Grandstream VoIP Phones")

## Supported Endpoints

**[List of supported Endpoints, Click here!]({{<ref "/endpoints#grandstream-ip-phones" >}})**

## Configuration

With [our VoIP Software] (https://www.pascom.net/en/ "pascom VoIP phone systems") it is possible to centrally and automatically configure the majority of Grandstream IP Telephones. This process is know as {{< ui-button "Provisioning" >}}. For this purpose, pascom phone systems include a Default Configuration ({{< ui-button "Devices" >}} > {{< ui-button "Basic Configuration" >}}). For most deployment scenarios, these standard settings provide a sufficient set of parameters. However, in some cases, the settings may need to be modified.

{{% notice tip%}}
By new installations, you should first test the provisioning process with a telephone. Should this be successful then you will be able to deploy further telephones.
{{% /notice %}}

### Preparation

In order to automatically deploy (AutoProvision) Grandstream Telephones, a functioning DHCP server is required.

### Device Onboarding
    
Connect the phone to your network. Grandstream IP phones come with a built in switch, allowing you to connect the phone directly via the Ethernet port labelled as **LAN**. Should you not have a **PoE** option available, connect the phone to a power supply.
    
The Grandstream IP phone will now boot and acquires an IP address and the corresponding Basic Configurations via DHCP. After this process is completed, the device will automatically appear under {{< ui-button "device" >}} > {{< ui-button "device list" >}} as well as adding the appropriate SIP peer.
    
As mentioned above, for every device pascom will also automatically add a SIP peer. In addition, the device username and password will also be automatically generated. The username consists of a randomly generated string followed by the last six digits of the device’s MAC address (15 digits in total). As the IP phones are automatically provisioned, you will not be required to enter this data manually and it is not possible to modify the user data. This is designed to considerably increase security against SIP Brute Force attacks.
    
The Device Name will be automatically added as signified by the vendor (Grandstream) and the MAC Address. On most IP phones, the MAC address is noted on the device housing, allowing phones to be more simply deployed on site in the correct locations.
    
After a successful provisioning, the IP phone display should show to correct language and time as well as the text {{< ui-button "Emergency Only" >}}
    
{{% notice info%}}
After the successful phone provisioning, the admin user will be reset by the PBX with the following credentials:  
<br>Username: *admin*
<br>Password: *0000*
{{% /notice  %}}
    
The Telephone Admin User Password can be changed within the Web UI under system settings. Use the search box and search for the parameter *sys.peripherals.access.password* and enter your desired password. Finally, you will be required to manually apply the Telephony Configurations and restart the endpoint.

### Assigning Users

As soon as the IP phone has appeared in the Device List, it can be edited via the {{< ui-button "Edit" >}} button. Under the {{< ui-button "Assign" >}} tab, the phone can be assigned to a [user (or location)]({{< ref "/user/user">}}).

After saving your assignments and reapplying the telephony configurations, all affected IP phones will restart.

### Function Testing

The simplest method of testing whether a device has been successfully deployed is to call your Voicemail box via **\*100**. On successfully provisioned phones, you should now hear your Voicemail box prompts.

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

For more information, please refer to our [Grandstream Key Documentation](/grandstream_key_configuration.pdf).

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

