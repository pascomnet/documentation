---
title: Grandstream GXP / GXV Series Desktop Phones
description: How to integrate your Grandstream IP Telephones in your pascom phone system.
weight: 50
---

{{< doctype "both"  >}}

![Grandstream GXP2160](grandstream_GXP2160.jpg?width=400px "Grandstream VoIP Phones")

## Compatibility

|Provisioning|Firmware Management|Desktop Client CTI Control|pascom Menu|
|---|---|---|---|
|yes|yes|yes|no|

**Provisioning**: The IP phone is manageable via the PBX web UI.<br>
**Firmware Management**: Firmware can be managed and updated via the PBX web UI.<br>
**Desktop Client CTI Control**: The desktop UC client can remotely control the phone, i.e. to start calls.<br>
**pascom Menu**: A phone touch key will be assigned to access the pascom Menu.

## Supported Grandstream IP Phones

The following Grandstream VoIP phones are supported by pascom:

+ Grandstream GXP 1610
+ Grandstream GXP 1615
+ Grandstream GXP 1620
+ Grandstream GXP 1625
+ Grandstream GXP 1628
+ Grandstream GXP 1630
+ Grandstream GXP 2130
+ Grandstream GXP 2135	 
+ Grandstream GXP 2160
+ Grandstream GXP 2170	 
+ Grandstream GXV 3240


## Configuration

With [our VoIP Software] (https://www.pascom.net/en/ "pascom VoIP phone systems") it is possible to centrally and automatically configure the majority of Grandstream IP Telephones. This process is know as `Provisioning`. For this purpose, pascom phone systems include a Default Configuration (`Devices > Basic Configuration`). For most deployment scenarios, these standard settings provide a sufficient set of parameters. However, in some cases, the settings may need to be modified.

{{% notice tip%}}
By new installations, you should first test the provisioning process with a telephone. Should this be successful then you will be able to deploy further telephones.
{{% /notice %}}

### Preparation

In order to automatically deploy (AutoProvision) Grandstream Telephones, a functioning DHCP server is required.

### Device Onboarding
    
Connect the phone to your network. Grandstream IP phones come with a built in switch, allowing you to connect the phone directly via the Ethernet port labelled as **LAN**. Should you not have a **PoE** option available, connect the phone to a power supply.
    
The Grandstream IP phone will now boot and acquires an IP address and the corresponding Basic Configurations via DHCP. After this process is completed, the device will automatically appear under `device` > `device list` as well as adding the appropriate SIP peer.
    
As mentioned above, for every device pascom will also automatically add a SIP peer. In addition, the device username and password will also be automatically generated. The username consists of a randomly generated string followed by the last six digits of the device’s MAC address (15 digits in total). As the IP phones are automatically provisioned, you will not be required to enter this data manually and it is not possible to modify the user data. This is designed to considerably increase security against SIP Brute Force attacks.
    
The Device Name will be automatically added as signified by the vendor (Grandstream) and the MAC Address. On most IP phones, the MAC address is noted on the device housing, allowing phones to be more simply deployed on site in the correct locations.
    
After a successful provisioning, the IP phone display should show to correct language and time as well as the text `Emergency Only`
    
{{% notice info%}}
After the successful phone provisioning, the admin user will be reset by the PBX with the following credentials:  
<br>Username: *admin*
<br>Password: *0000*
{{% /notice  %}}
    
The Telephone Admin User Password can be changed within the Web UI under system settings. Use the search box and search for the parameter *sys.peripherals.access.password* and enter your desired password. Finally, you will be required to manually apply the Telephony Configurations and restart the endpoint.

### Assigning Users

As soon as the IP phone has appeared in the Device List, it can be edited via the `Edit` button. Under the `Assign` tab, the phone can be assigned to a [user (or location)]({{< ref "/user/user">}}).

After saving your assignments and reapplying the telephony configurations, all affected IP phones will restart.

### Function Testing

The simplest method of testing whether a device has been successfully deployed is to call your Voicemail box via **\*100**. On successfully provisioned phones, you should now hear your Voicemail box prompts.

### Accessing the Grandstream Web UI

In order to access your telephone's web UI, you will need to know the phone's IP address. The following outlines the different methods of discovering the phone IP Address:

#### Finding the IP-Address on the Telephone

Press the round **OK** key in the center of the arrow keys. You can find the IP address via the `Status` > `Network Status` menu options.

#### Finding the IP-Address via the Web UI Device List

Log into the PBX Web UI and select the `Devices` > `Device list`, which provides you an overview of all available devices. To the left of each entry is an *Info* symbol which when clicked will open an overview of the provisioned telephone including the IP address.

### Programmable Keys

Via the Grandstream telephone's Web UI, it is possible to assign programmable function keys. Click on `Settings` > `Programmable Keys` and you will be able to configure the two types of keys available:

#### Virtual Multi-Purpose Keys

As programmable "soft keys", these keys appear on the phone's main display. In order to configure this key, click `Edit VPK`:

|Mode|Accounts|Description|Value|
|---|---|---|---|
|Busy Lamp Field (BLF)|Account 1|Key label / name|Extension number|

To save your settings, simply click `Save`. The settings will then come into effect after clicking `Save VPK`.

{{% notice info%}}
In order to reset the key settings, click on `Reset` and then finally `Save VPK`.
{{% /notice %}}

#### Multi-Purpose Keys

Depending on the IP telephone model, these keys are additional programmable "hard keys".
Within the overview screen, you will see all the available multi-function keys which can be configured:

|Mode|Accounts|Description|Value|
|---|---|---|---|
|Busy Lamp Field (BLF)|Account 1|Key label / name|Extension number|

To finish your configuration, click on `Save and Apply`, which will activate all your modifications.

{{% notice info%}}
In order to reset the key settings, click on `Reset` and then finally `Save and apply`.
{{% /notice %}}

### Default Configuration

As previously stated, Grandstream IP phones are provisioned using the default configurations which can be found under `Devices`> `Basic Configurations`.

{{% notice note%}}
When modifying the default configuration settings, ensure you make a duplicate copy of the original using the `Duplicate`tool.
{{% /notice %}}

In addition, you can set an already edited default configurations as the `standard settings`. Doing so ensures that all newly added IP telephones will automatically be provisioned with these default configurations.

#### Assigning a Default Configuration

A default configuration can be assigned using multiple methods:

+ Via `Devices`> `Basic Configurations` > Choose your Basic configuration set and press `Edit` Under the `Devices` tab, it is possible to add multiple IP telephones.
+ Via `Devices`> `Device list` > Select and edit the IP Telephone and under the tab `Basic Data` choose the correct **Basic configuration** option.


#### Automatic BLF Key Configuration via Basic Configurations

Under the `Configuration` tab, it is possible to modify the existing basic configuration.

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

Via the menu tab `devices`, assign these default configurations to the telephones which should have this BLF configuration. Save and apply your changes and once the phones have restarted, the changes will have taken affect.

### Firmware Updates

From mobydick version 7.14 onwards, IP endpoint firmware will no longer be included as standard. Should a firmware version (other than the version pre-installed on the phone) be required, this must be externally sourced and per hand uploaded to the phone system firmware management tool.

#### Upload New Firmware

The desired firmware can be uploaded via the the `Devices`> `Device firmware`:

|Settings|Description|
|---|---|
|Firmware Files|Upload the firmware files here.|
|Model|Grandstream Telephone model name|
|Version|Firmware Version|
|Comments|Optional field for notes|

#### Firmware Roll Outs

Firmware updates can be roll out via the `Devices` > `Device list` menu. Simply select the desired Grandstream Endpoints from the list via the check boxes and under `Actions` > `Roll out firmware`. This will open an overview of all selected devices to which the new firmware version should be roll out to. Click `Firmware Update` to roll out the desired firmware version.

#### Recommended Firmware

As there are numerous Firmware versions available for the varying IP endpoint models, it is unfortunately not possible to test them all. Therefore, it is possible that some firmware versions may not support all phone system functions. If in doubt, please refer to below list of already tested firmware versions:

|Model|Recommended Firmware|
|---|---|
|GXP 1630|1.0.4.55|
|GXP 2130|1.0.7.25|
|GXP 2135|1.0.7.97|
|GXP 2160|1.0.7.97|
|GXV 3240|1.0.3.158|