---
title: Mitel DECT Systems
description: How to integrate your Mitel / Aastra DECT system with your pascom phone system.
weight: 60
---

{{< doctype "both"  >}}

{{< description >}}

![Mitel DECT RFPs](Aastra-Mitel-DECT-System.png?width=50%)

## Supported Endpoints

**[List of supported Endpoints, Click here!]({{<ref "/endpoints#mitel-dect-systems" >}})**

## Overview

An Mitel SIP-DECT system can have any number from 1 to 254 base stations. The base stations are connected to the IP telephone network and communicate with your [pascom VoIP Software](https://www.pascom.net/en/mobydick-voip/ "pascom VoIP phone systems") solution using the SIP protocol. The base stations also communicate with one another using DECT to allow for switching between base stations during a call. A single base station does not have to connect to every other base station, but all base stations must be able to form a chain. Isolated groups of base stations should not be used.

One base station takes care of the user management and the connection to pascom. The master starts the **OpenMobility Manager (OMM)**. This software is used for management tasks and comes with a web interface. If a master base station fails, another base station that was previously specified can take over the role of the master.

{{% notice note %}}
The base stations do not have a power supply but are powered using Power over Ethernet (PoE) technology. Availability of a PoE-compatible switches must be ensured prior to installation.
{{% /notice %}}

### Base Station Boot Process

All base stations (DECT Transmitters) use identical hardware, whether they are used as a master or not. You should first plan which roles the base stations should serve, which is the master, which is the failover and which run as normal base stations before deploying them by using the **OpenMobility Configurator (OMC)**.At this point you should also configure static IP addresses for the base stations. 

### Preparing the DECT Base Station

In order to use pascom's automatic provisioning, the DECT sender must be running at least firmware version 7.0.

1) Connect the relevant DECT sender to your network

2) Start the **OpenMobility Configurator**, which contains the firmware, on a computer on the same network as the sender

3) Click on {{< ui-button "Scan" >}} and search for the MAC address of the Base Station that you want to configure and then enter the DECT sender log in credentials. The MAC address is found on the back of the DECT sender. The username and password are per default (as delivered) both set to **omm**.

{{% notice note %}}
Repeat **Step 3** until you have found all the DECT senders on your network.
{{% /notice %}}

![Scan network for DECT sender base stations](omm_configurator_scan.en.png?width=90%)

4) Select a DECT sender from the list

5) Click {{< ui-button "Edit configuration" >}} and under {{< ui-button "General" >}} set the IP address with which the DECT sender should be assigned inside your pascom phone system telephony network.

6) As {{< ui-button "Router" >}} enter the IP address of the pascom phone system and check the {{< ui-button "Local Config" >}} box.

![Configure Base Stations](omm_configurator_edit1.en.png?width=90%)

7) Set the IP address of the DECT sender which should be configured as the master sender under {{< ui-button "OpenMobility" >}} > {{< ui-button "OMM-address" >}}. On the master base station itself, it is neccesary to specify the IP address of DECT sender itself.

8) Under {{< ui-button "TFTP server address" >}} enter the pascom phone system IP address or your TFTP server.

9) Under {{< ui-button "TFTP file name" >}} enter the value "*ip.cfg*" or the name of the firmware version "*iprfp3G.dnld*" (RFP35 or higher höher) / "*iprfp2G.tftp*" (RFP34 or lower ).

![Base Station configuration](omm_configurator_edit2.en.png?width=90%)

10) Once you have implemented all the settings, click on {{< ui-button "Send Configuration" >}} in order to send the changes to the selected sender.

{{% notice note %}}
Repeat **steps 4** to **10** until all DECT senders have been configured.
{{% /notice %}}

![Send configuration](omm_configurator_send.en.png?width=90%)

## Configuration

### Add MASTER DECT Sender

{{% notice note%}}
Please note that in mixed deployments involving RFP 32, RFP 34 and RFP 35 senders or higher, it is essential to set a type RFP 35 sender or higher as the master base station, as the RFP 32 senders can no longer act as masters from firmware version 3.0.
{{% /notice %}}

Under {{< ui-button "Gateways" >}} > {{< ui-button "Gateway list" >}} press the button {{< ui-button "+Add" >}} and select **Aastra DECT** :

|Parameter|Description|
|---------|---------|
|OMM MAC Address|	The MAC address of the master base. This is found on the back of the base station.|
|Name|	Enter a name for this Base Station|

{{% notice note%}}
Further configuration of the Aastra DECT gateway is no longer needed at this point, as the master assignment was already completed in the **OpenMobility Configurator**.
{{% /notice %}}

### Add Mobile DECT Handsets

Adding an Aastra / Mitel DECT handset is done under {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}} in the pascom phone system web UI, click the {{< ui-button "+Add" >}} button and select **aia Aastra Dect Gateway: handset**:

|Parameter|Description|
|---------|---------|
|Connected to|Wählen Sie hier den DECT-Sender aus, der als Master definiert wurde|
|Subscribe via|Additional ID: the code required to manually add a mobile handset without the IPEI;           IPEI: The IPEI number serves as a unique handset identifyer|
|Login / Additional ID|An additional ID code is generate here, should you have selected the {{< ui-button "Subscribe via" >}} option **Additional ID**|
|IPEI|Enter the mobile handset's IPEI number should you selected the {{< ui-button "Subscribe via" >}} option **IPEI**. The IPEI number can be found on the back of the handset, however you will need to remove the battery as the sticker with the IPEI is placed under the battery. Alternatively, you can also find the IPEI number via the Info menu on the handset.|

Finally, you can assign the DECT handset to a [User (or location)]({{< ref "/user/user">}}).


### Configuring the OMM

Go to the IP adress of the OMM and log into the web UI using the username and password **omm**.
Complete the following setting configurations:

* Change passwords.
* Select language: **EN**
* Activate the advanced settings be checking the **Advanced** checkbox next to the language setting

![Send configurations](omm_aastra_password.en.png?width=90%)

* **System > System Settings** enter the PARK ID which is printed on the Aastra CD delivered with the system or the PARK as generated via the {{< ui-button "Online PARK manager" >}}. Please note, at this point the DECT sender must be able to establish an internet connection.
* Update the time settings
* Save. The system will now reboot.

![Send configuration](omm_aastra_park.de.png?width=90%)

Finally, the following steps are now required:

Select the Master DECT send from the list under {{< ui-button "Gateways" >}} > {{< ui-button "Gateway list" >}} within the pascom phone system web UI and by pressing the {{< ui-button "Acton" >}} button selection the option {{< ui-button "Provisioning URL" >}}.
Copy the relevant provisionings path as this will be required in the next steps.

Go to the Master DECT sender web UI and log in. 
In the {{< ui-button "Server" >}} field under  {{< ui-button "System" >}} > {{< ui-button "Provisioning" >}}, enter the pascom phone system IP address and under {{< ui-button "Path" >}} now paste the previously copied provisioning URL. Please ensure that the correct {{< ui-button "Protocol" >}} (HTTP or HTTPS) has been selected.

Confirm the settings by pressing **OK**

![Send configuration](omm_aastra_provisioning.de.png?width=90%)


### Import the Mobile Handset Configuration into the OMM

Instead of manually adding each individual handet to the OMM, simply download the necessary configuration file from the pascom web UI:

Under {{< ui-button "Gateways" >}} > {{< ui-button "Gateway list" >}} select the Aastra DECT sender that you have defined as Master and press {{< ui-button "Edit" >}}.
Under the {{< ui-button "Configuration Files" >}} you will find a download link to the required mobile handset configuration sets.
The mobile handset configuration contains all added handsets and can be imported to the OMM under the menu option **DECT devices**.

#### How to Import the Data:

Once you have clicked on the OMM configuration menu options {{< ui-button "DECT phones" >}} > {{< ui-button "Import" >}}, a new mask is opened in which you will need to proceed as follows:

1) Under {{< ui-button "Import registration data" >}} click on select file

2) Upload the configuration file

3) Click on Import

4) The RFP will now read and parse the file

A list will appear below containing all the entries (mobile handsets).

5) Select all the required entries

6) Now click **Add**

The entries will now be imported.

{{% notice warning %}}
Should you perform this import more than once, please only select the new devices under step 6 of the import, otherwise the import will encounter errors. Devices that are no longer deployed must be removed manually from the OMM configuration UI.{{% /notice %}}

### Connect Mobile Handsets to the DECt System

Depending on which subscription option you chose when adding the mobile handsets, there are two options to connect your DECT handsets to the DECT system.

#### Additional ID

1. Make a note of the {{< ui-button "Handset Registration PIN" >}} found in the Master DECT sender settings under {{< ui-button "Gateways" >}} > {{< ui-button "Gateway list" >}} in the pascom web UI.
2. Make a note of the {{< ui-button "Additional ID" >}} found in the mobile handset settings menu under {{< ui-button "Devices" >}} > {{< ui-button "Device list" >}} in the pascom web UI.
3. Press the handset's menu key and select {{< ui-button "System" >}} > {{< ui-button "New System" >}}
4. Now enter the previously noted registration PIN, the letter **R** and then the additional ID before confirming the settings by pressing {{< ui-button "Register" >}}, after which the mobile handset will automatically connect to the DECT sender.

Example:

        12345R0987

#### IPEI

1. Make a note of the {{< ui-button "Handset Registration PIN" >}} found in the Master DECT sender settings under {{< ui-button "Gateways" >}} > {{< ui-button "Gateway list" >}} in the pascom web UI.
2. Press the handset's menu key and select {{< ui-button "System" >}} > {{< ui-button "New System" >}}
3. As the access code, enter the handset's registration PIN
4. Confirm your setup by pressing {{< ui-button "Register" >}}, after which the mobile handset will automatically connect to the DECT sender.
