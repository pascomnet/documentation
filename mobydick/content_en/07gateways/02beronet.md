---
title: beroNet Gateway Setup
url: /analog-isdn-gateways/beronet-gateways/
prev: /analog-isdn-gateways/
next: /analog-isdn-gateways/patton-gateways/
linkde: /isdn-analog/beronet-gateways/
description: beroNet Gateways are fully compatible with pascom phone systems and offer cost effective multi technology communication solutions.
keywords: 
    - beronet gateways
    - gateway setup
    - BRI gateway
    - ISDN Gateway
    - FXS / FXO Gateway
weight: 52
toc: true
---

## Concept

### Modular Construction for more Flexibility
beroNet Cards and Gateways offer a modular construction, meaning you can cover different connection types with on device.
<!--//FixMe![Illustration - modular Gateway](../../images/beronet_gateway_beispiel.jpg?width=90% "Modular Gateways Solutions from beroNet")-->

For example: you could have 3 NTBAs (ISDN Connections) as well as 2 Analog Faxes, then you can use a beroNet Gateway or card with a 4S0 module in combination with a 4FXS module.

### beroNet VoIP Gateways
The beroNet Gateway is connected via LAN and is assigned an IP address from the telephone network. Connections to the
public telephone network and analogue terminal devices are established using the front ports. beroNet Boxes allow for the
installation of various modules. Depending on the module, the front ports are compatible with analogue or ISDN devices.
Due to the LAN connection, beroNet Boxes can be easily integrated with a mobydick virtual appliance.

![Illustration - beroNet VoIP Gateway](../../images/beronet_voip_gateway.png?width=90% "beroNet VoIP Gateway Network Setup")

beroNet Gateways are available in the following specifications:

* beroNet VoIP Gateway, 4-16 channels
* beroNet VoIP Gateway, 16-64 channels
* beroNet VoIP Gateway, 32-128 channels

### beroNet Cards
beroNet expansion cards can be mounted directly in a mobydick hardware appliance and are automatically assigned an IP address from the zero-config network range **169.254.0.0/16** during boot. With exception of this difference configuration of beroNet Gateways and expansion cards

![Illustration - beroNet Cards](../../images/beronet_card.png "beroNet VoIP Cards")

The following beroNet cards are available:

* beroNet Baseboard PCI-Express, 4-16 channels
* beroNet Baseboard PCI-Express, 16-64 channels
* beroNet Baseboard PCI-Express, 32-128 channels


## ISDN and Analog Extensions
Extensions such as fax devices, fax serversm telephones, door openers etc. can either be connected directly or using SIP.

### Direct connection

![Illustration - ISDN Direct Connection](../../images/beronet_direct.png?width=90% "Direct Connection over ISDN Gateway")

**Calls** will **not be converted to SIP** and sent over the phone system server, but rather they are routed directly on the beroNet device. If, for example, there is an inbound call for the fax device, the beroNet device will directly connect it to the fax device. 

The **advantage** of this approach is that connections are not converted to SIP, which gives superior results when a fax must be used. Direct connections can also be used if ISDN data must be transmitted. 

The **disadvantage** here is that mobydick will not be made aware of those calls. Therefore, the server is not able to manage the call flow, e.g. forward the call to another device after a timeout, check for business hours, etc. In addition to that, the ISDN trunk and the extension must be connected to the same beroNet hardware.

### Connecting via SIP

![Illustration - Connection via SIP](../../images/beronet_via_sip.png?width=90% "Anbindung via SIP over Gateway")

**Via SIP** means that all calls to the corresponding extension are routed per SIP over your telephony system. Therefore, should a call for the fax device come in, it will be firstly routed via **1** to the phone system and then further via **2** to the analog fax device.

The **advantage** of this method is that connections are routed through mobydick, thus allowing mobydick to manage the call flow, e.g. forward the call to another device after a timeout, check for business hours, etc. In this case, the extension and the trunks do not have to be connected to the same Beronet hardware.

The **downside** here is that in some cases, fax applications might not be so stable and ISDN data transmission is also not possible.

## Preparation

As a first step, Beronet boxes or expansion cards each need to be equipped with suitable modules. If you ordered your hardware through pascom, the module already pre-installed. For further details such as port assignment etc. please see the [beroNet documentation] (http://wiki.beronet.com/index.php/beroNetDocuV2).

PCI expansion cards can be easily added to a mobydick server. The card will automatically receive an IP address from the **169.254.0.0/16** subnet.

Individual Beronet boxes need be connected to your switch. Next, connect the power supply and start the box. An IP address will automatically be assigned through DHCP. In case you do not have a DHCP server in your network, mobydick can still detect and configure the box. as long as it is within the same subnet.


## Configuration

### Detecting and Adding beroNet Hardware
mobydick will detect the new hardware automatically once you have connected your beroNet expansion card or Box to the LAN. Please note that beroNet Boxes need to be in the same subnet as mobydick for this to work.

In the mobydick web interface, select ***Gateways > Gateway list*** and press the `+Add` button. mobydick will then try to detect your beroNet hardware:
![Screenshot - beroNet Gateway detection](../../images/beronet_detect.png?width=60% "Detect new beroNet Gateway")

If detection is unsuccessful or the beroNet Box is in a different subnet from mobydick, you can add the hardware manually by clicking the `Create manually` button.

The drop-down menu `Gateways lists all detected beroNet Boxes and expansion cards:
![Screenshot - Add beroNet Gateway](../../images/new_beronet_gateway.png?width=90% "Add new beroNet Gateway")

Enter your data in the fields `Username` and `Password to authenticate with the webserver running on the beroNet device. The default user name and password is ***admin***. You cannot change the username or password at this point yet.

With beroNet Gateways it is also possible to modify the network configuration, i.e. **the IP address, netmask and gateway** settings. If you do not want to change these settings, you can just leave them blank. If you have a PCI expansion card installed, the network setting is configured automatically and cannot be changed. 

To continue, press `Next` which will lead to a summary screen highlight which modules are installed on each beroNet card or Gateway. Press **Save** to store your changes. 

Alternatively, you can now add a trunk and the corresponding inbound / outbound rules by checking the **Create Trunk** entry.

### Creating ISDN trunks
A common use case for beroNet hardware is to connect ISDN trunks to it. To do so, select the gateway you want to use from the list, click the `Edit` button and then switch to the **Allocation** tab.
![Screenshot - Add ISDN Trunk](../../images/beronet_isdn_trunk_add.png?width=90% "ISDN Trunk via beroNet add")

Under `Add` to configure either a **BRI** or **PRI Trunk line** . 

![Screenshot - Add ISDN Trunk Detailed](../../images/beronet_isdn_trunk_add_detail.png?width=90% "Add ISDN trunk via beroNet Gateway")

Double-clicking on the record `Name` field will open a more detailed view in which you select which **Ports** are allocated to the trunk. It is possible to select multiple options here as a BRI that is configured to use the PP protocol allows for several NTs to be aggregated so they form a single trunk.

Under `Mode` and `Technology` to configure the interface tyoe. For BRI connections in PP mode, the interface should be set to **TE** and **PTP**. 

You have now configured the interface of the beroNet hardware. For complete functionality, you should now continue with Trunks and Call Rules configuration.

### Adding ISDN / Analog Endpoints


Choose the required Gateway from the list and select `Edit` and go to the **Allocation** tab.

![Screenshot - beroNet Analog Endpoint](../../images/beronet_analog_add.png?width=90% "Add Analog Endpoint via beroNet")

The `Add` dropdown includes the following options:

|Type            |Description   |Uses |
|---------------|---------------|---------------|
|Analogue terminal directly | Analogue terminal device being routed directly on beroNet hardware| Fax, door control, fire alarm system|
|Analogue terminal via SIP| Analogue terminal device being routed on the PBX| Telephones|
|ISDN telephony directly| ISDN telephone being routed directly on beroNet hardware| Emergency phone|
|ISDN fax directly| ISDN fax being routed directly on beroNet hardware| Fax server (e.g. Tobit Faxware)|
|ISDN data directly| ISDN data transmission line being routed directly on beroNet hardware| Online banking, ISDN machine control, burglar alarm|
|ISDN telephone via SIP| ISDN telephone being routed on the PBX| Telephones|


You have now configured the connection of the beroNet hardware. For complete functionality, you should now continue with Endpoint deployment.