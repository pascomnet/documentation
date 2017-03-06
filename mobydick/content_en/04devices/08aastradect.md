---
title: Integrate Aastra DECT Systems
keywords: 
    - Aastra DECT Systems
    - Multicell DECT Systems
    - Mitel DECT Systems
    - VoIP DECT
    - Aastra mobility solutions
description: How to integrate an Aastra MultiCell DECT system with the mobydick phone system.
url:  /endpoints/integrate-aastra-dect-system/
linkde: /endgeraete/aastra-dect-system-anbinden/
prev: /endpoints/generic-ip-endpoints/
weight: 48
toc: true
---

## Overview

An Aastra SIP-DECT system can have any number from 1 to 254 base stations. The base stations are connected to the IP telephone network and communicate with your [pascom VoIP Software] (https://www.pascom.net/en/mobydick-voip/ "pascom VoIP phone systems") solution using the SIP protocol. The base stations also communicate with one another using DECT to allow for switching between base stations during a call. A single base station does not have to connect to every other base station, but all base stations must be able to form a chain. Isolated groups of base stations should not be used. 

One base station takes care of the user management and the connection to mobydick. The master starts the **OpenMobility Manager (OMM)**. This software is used for management tasks and comes with a web interface. If a master base station fails, another base station that was previously specified can take over the role of the master.

{{% notice note %}}
The base stations do not have a power supply but are powered using Power over Ethernet (PoE) technology. Availability of a PoE-compatible switches must be ensured prior to installation.
{{% /notice %}}

### Base Station Boot Process

All base stations use identical hardware, whether they are used as a master or not. When booting, the base station will send a DHCP request to the mobydick system. mobydick checks in its database whether this base station's MAC address is supposed to have master configurations applied. If so, the DHCP server will, along with the IP address and an URL for the firmware, pass additional information to the base station, instructing it to boot with a master configuration. You should plan which roles the base stations should serve, which is the master, which is the failover and which run as normal base stations before deploying them by using the mobydick web interface.

## Configuration

### Activating DHCP and TFTP servers

If it has not been done yet, the DHCP Server now needs to be configured. It is possible to use any other DHCP server, however configuration of a third-party server is rather complicated because the VendorCode must be determined in the DHCP request of the base station. If you wish to use a different DHCP server, please refer to the Aastra manuals for advice. 

The TFTP server can be activated in the mobydick web interface in the Appliance > Services` menu. Set the **TFTP Server** active **yes**. 

### Add Master Base Station

{{% notice note%}}
Please note: when simultaneously operating RFP32 and RFP 34, 35 or higher, make sure to declare base stations as master that are of the type RFP 34, 35 or higher. As of firmware version 3.0, RFP 32 base stations cannot act as a master anymore
{{% /notice %}}

Under `Gateways > Gateway list` click the `+Add` button and select the **Add Aastra DECT Gateway** option:

|Parameter|Decription|
|---------|---------|
|Name|A name describing the DECT system|
|Firmware|	Select which firmware should be deployed on the master base station via TFTP|
|MAC Address|	The master base station's MAC address. Can be obtained from the back of the base station.|
|Desired IP Address|Enter the IP address which the DHCP server should reserve for the master.	|
|Netmask|	Corresponding netmask.|
|Username|	The username when logging onto OMM. Default is **omm**|
|Password|	The password when logging onto OMM. Default is **omm**|

### Add Additional Base Stations

After saving the master settings, the following screen can be used to adjust the details:

<!--//FixeME-->

Here, the master is already present in the Access Points tab. By pressing the "Add" button, additional base stations can now be added. For each base station, the following settings can be adjusted:

|Parameter|Description|
|---------|---------|
|Name|	Base station name|
|MAC Adresse|	The base station's MAC address. Can be obtained from the back of the base station.|
|Ziel-Ip|	Enter the IP address which the DHCP server should reserve for the base station.|
|Firmware|	For each base station, a different firmware can be selected for TFTP deployment. It is recommended to use the default setting. This way, all base stations will have the same firmware, as configured in the Basic data tab.|
|Master|	This base station is the designated master. Only one base station can be used as a master.|
|Failover|	This base station is used as a failover. Only one base station can be used as a failover.|
|Reflective Environment |	If this option is set to **Yes**, the base station will halve its channel capacities. Each handset will then use two channels and switch to the better one. This option is especially helpful in environments with lots of interference.|

### Adding Mobile Handsets

Under the tab `Handsets` you can now add Aastra DECT mobile devices. 

Enter the device IPEI ( International Portable Equipment Identity) . It is used as a unique identifier for the handset, similiar to a MAC address in IP networks

The IPEI can be obtained by removing the battery and reading the sticker inside the battery compartment. Alternatively, the info menu of the handset can be used.

After this step, the handsets are available as devices in mobydick and can be assigned to users and locations. 

### Putting Base Stations Operational

The base stations can now be connected to the network. After a short period of time, you will be able to access the master devices' web interface of the master:

<!--//FixeME-->

### Configuring the OMM

Using the default user name omm and password omm, log onto the OMM web interface. For the next steps, please see the instructions provided by Aastra at http://www.aastra.com. At the time of writing, the current version of the instructions could be found under [http://miteldocs.com/document-library_2.htm?curr_fam=SIP-DECT&curr_nav=4&prod_id=6023](http://miteldocs.com/document-library_2.htm?curr_fam=SIP-DECT&curr_nav=4&prod_id=6023 "Mitel Documentation")

Quick instructions (other firmware versions might require different steps):

* Change passwords.
* System > System settings: enter the PARK which is printed on the Aastra CD. Adjust system time and save changes and then reboot the system.
* System > SIP enter the mobydick IP as registrar and proxy
* Press the spanner symbol next to the handset symbol and adjust user data according to the identity stored on the mobydick system

### mobydick OMM Data Imports

Instead of manually adding the handsets and base stations in the OMM, download the required configuration files using
the mobydick web interface:


The RFP configuration contains the setup data for all base stations and can be imported in the OMM using the menu **Radio Fixed Parts > Import**.

The handset configuration contains all handsets that were created and can be imported in the **Portable Parts > Import** OMM menu.
 
#### mobydick OMM Data Import Process:

After clicking the Import button in the OMM configuration interface, a new screen appears. Please follow the instructions below:
<!--//FixeME-->

1. Click Select File
2. Upload the file
3. Click Import
4. RFP will now parse the file

<!--//FixeME-->


A list containing all entries (RFP or handset) will be displayed.

1. Select all entries you want to add
2. Click **Add**

The data import is now finished.

{{% notice warning %}}
When you have done this import process several times, only select the new devices in step 6, otherwise the import will fail. If devices are removed, they must be removed manually in the OMM configuration interface.
{{% /notice %}}