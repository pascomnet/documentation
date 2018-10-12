---
title: beroNet Gateways Setup
description: How to integrate Analog and ISDN endpoints into your pascom phone system using a beroNet Gateway. 
weight: 20
---

## Overview

beroNet are a German Gateway vendor who offer a modular construction, meaning you can cover different connection types with on device. Their modular construction make them a popular choice as [VoIP Gateways for our Hardware based] (https://www.pascom.net/en/mobydick-classic/ "pascom VoIP hardware") and virtualized IP PBX solutions.


### beroNet VoIP Gateways
The beroNet Gateway is connected via LAN and is assigned an IP address from the telephone network. Connections to the public telephone network and analogue terminal devices are established using the front ports. beroNet Boxes allow for the installation of various modules. Depending on the module, the front ports are compatible with analogue or ISDN devices. Due to the LAN connection, beroNet Boxes can be easily integrated with a pascom virtual appliance.

![beroNet Gateway](voip_gateway.en.png)

### beroNet Cards
beroNet expansion cards can be mounted directly in a pascom hardware appliance and are automatically assigned an IP address from the zero-config network range **169.254.0.0/16** during boot. With exception of this difference configuration of beroNet Gateways and expansion cards

## ISDN and Analog Extensions
Extensions such as fax devices, fax servers, telephones, door openers etc. can either be connected directly or using SIP.

### Direct connection

![beroNet direct connection](direct.en.png)

**Calls** will **not be converted to SIP** and sent over the phone system server, but rather they are routed directly on the beroNet device. If, for example, there is an inbound call for the fax device, the beroNet device will directly connect it to the fax device.

The **advantage** of this approach is that connections are not converted to SIP, which gives superior results when a fax must be used. Direct connections can also be used if ISDN data must be transmitted.

The **disadvantage** here is that the PBX will not be made aware of those calls. Therefore, the server is not able to manage the call flow, e.g. forward the call to another device after a timeout, check for business hours, etc. In addition to that, the ISDN trunk and the extension must be connected to the same beroNet hardware.

### Connecting via SIP

![beroNet via SIP](via_sip.en.png)

**Via SIP** means that all calls to the corresponding extension are routed per SIP over your telephony system. Therefore, should a call for the fax device come in, it will be firstly routed via **1** to the phone system and then further via **2** to the analog fax device.

The **advantage** of this method is that connections are routed through the PBX, thus allowing the pascom PBX to manage the call flow, e.g. forward the call to another device after a timeout, check for business hours, etc. In this case, the extension and the trunks do not have to be connected to the same BeroNet hardware.

The **downside** here is that in some cases, fax applications might not be so stable and ISDN data transmission is also not possible.

## Preparation

As a first step, Beronet boxes or expansion cards each need to be equipped with suitable modules. If you ordered your hardware through pascom, the module already pre-installed. For further details such as port assignment etc. For more information, please see the [Beronet Documentation](https://beronet.atlassian.net/wiki/spaces/PUB/pages/51085410/Gateways+and+Cards "to beroNet Documentation").

PCI expansion cards can be easily added to a pascom server. The card will automatically receive an IP address from the **169.254.0.0/16** subnet.

Individual BeroNet boxes need be connected to your switch. Next, connect the power supply and start the box. An IP address will automatically be assigned through DHCP. In case you do not have a DHCP server in your network, the phone system can still detect and configure the box as long as it is within the same subnet.


## Configuration

### Detecting and Adding beroNet Hardware
pascom phone systems will detect the new hardware automatically once you have connected your beroNet expansion card or Box to the LAN. Please note that beroNet Boxes need to be in the same subnet as the PBX for this to work.

In the pascom web interface, select {{< ui-button "Gateways" >}} > {{< ui-button "Gateway list" >}} and press the {{< ui-button "+Add" >}} button. The phone system will then try to detect your beroNet hardware:
![Screenshot - beroNet Gateway identication](detect.en.png?width=90% "Detect new beroNet Gateway")

If the detection process is unsuccessful or the beroNet Box is in a different subnet from the PBX, you can add the hardware manually by clicking the {{< ui-button "Create manually" >}} button.

The drop-down menu {{< ui-button "Gateways" >}} lists all detected beroNet Boxes and expansion cards:
![Screenshot - add beroNet Gateway](add.en.png?width=90% "Add new beroNet Gateway")

Enter your data in the fields **Username** and **Password** to authenticate with the webserver running on the beroNet device. The default user name and password is **admin***. You cannot change the username or password at this point yet.

With beroNet Gateways it is also possible to modify the network configuration, i.e. **the IP address, netmask and gateway** settings. If you do not want to change these settings, you can just leave them blank. If you have a PCI expansion card installed, the network setting is configured automatically and cannot be changed.

To continue, press {{< ui-button "Next" >}} which will lead to a summary screen highlight which modules are installed on each beroNet card or Gateway. Press **Save** to store your changes.

Alternatively, you can now add a trunk and the corresponding inbound / outbound rules by checking the **Create Trunk** entry.

### Creating ISDN trunks
A common use case for beroNet hardware is to connect ISDN trunks to it. To do so, select the gateway you want to use from the list, click the {{< ui-button "Edit" >}} button and then switch to the **Allocation** tab.

![Screenshot - Add ISDN Trunk](isdn_trunk_add.en.png?width=90% "Add ISDN Trunnk via beroNet")

Under {{< ui-button "Add" >}} to configure either a **BRI** or **PRI Trunk line** .

<!-- //FixMe Siehe Konzept: ISDN verstehen falls Sie mit den Begrifflichkeiten nicht vertraut sind. Dieser Vorgang fügt einen neuen Datensatz ein. -->

![Screenshot - Add ISDN Trunk in Detail](isdn_trunk_add_detail.en.png?width=90% "Add ISDN Trunk via beroNet")


Double-clicking on the record {{< ui-button "Name" >}} field will open a more detailed view in which you select which **Ports** are allocated to the trunk. It is possible to select multiple options here as a BRI that is configured to use the PP protocol allows for several NTs to be aggregated so they form a single trunk.

Under {{< ui-button "Mode" >}} and {{< ui-button "Technology" >}} to configure the interface type. For BRI connections in PP mode, the interface should be set to **TE** and **PTP**.

<!-- //FixMe  Siehe Konzept: ISDN verstehen für weitere Details. -->

You have now configured the interface of the beroNet hardware. For complete functionality, you should now continue with Trunks and Call Rules configuration.

### Adding ISDN / Analog Endpoints

Choose the required Gateway from the list and select {{< ui-button "Edit" >}} and go to the **Allocation** tab.

In diesem Schritt konfigurieren Sie lediglich den Anschluss auf der beroNet Hardware. Zur vollständigen Funktion fahren Sie nun mit Aemter und Rufregeln anlegen fort.

### ISDN oder Analoge Nebenstellen anlegen

Selektieren Sie das entsprechende Gateway aus der Liste aus, wählen Sie {{< ui-button "Bearbeiten" >}} und schalten Sie dann auf den Tab **Belegung** um.

![Screenshot - Add Analog Endpoint](analog_add.en.png?width=90% "Add Analog Endpoint via beroNet")

The {{< ui-button "Add" >}} dropdown includes the following options:

|Type            |Description   |Uses |
|---------------|---------------|---------------|
|Analogue terminal directly | Analogue terminal device being routed directly on beroNet hardware| Fax, door control, fire alarm system|
|Analogue terminal via SIP| Analogue terminal device being routed on the PBX| Telephones|
|ISDN telephony directly| ISDN telephone being routed directly on beroNet hardware| Emergency phone|
|ISDN fax directly| ISDN fax being routed directly on beroNet hardware| Fax server (e.g. Tobit Faxware)|
|ISDN data directly| ISDN data transmission line being routed directly on beroNet hardware| Online banking, ISDN machine control, burglar alarm|
|ISDN telephone via SIP| ISDN telephone being routed on the PBX| Telephones|

<!-- FIXME -->
You have now configured the connection of the beroNet hardware. For complete functionality, you should now continue with Endpoint deployment.
