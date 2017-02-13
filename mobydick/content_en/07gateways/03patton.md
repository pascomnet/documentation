---
title: Patton Gateways Setup
url: /analog-isdn-gateways/patton-gateways/
prev: /analog-isdn-gateways/beronet-gateways/
linkde: /isdn-analog/patton-gateways/
description: Patton Gateways are fully compatible with pascom phone systems and offer cost effective multi technology communication solutions.
keywords: 
    - Patton gateways
    - gateway setup
    - BRI gateway
    - ISDN Gateway
    - FXS / FXO Gateway
weight: 52
toc: true
weight: 53
toc: true
---

## Concept

{{% notice note %}}
We support all Patton gateways running SmartWare 5.3 or higher.
{{% /notice %}}

### Patton Gateway

Once it is connected to the LAN, the Patton gateway is assigned an IP address from the telephony network. The ports of the gateway can be connected to the public telephone network or analogue terminal devices. Due to the LAN connection, Patton gateways are idealy suited to be operated in environments where mobydick is run inside virtual machine

### ISDN and analogue extensions

#### Connection via SIP

If the connection is established **via SIP**, this means that all calls to a particular extension are routed through mobydick using SIP. An incoming call for the fax device, for example, will first be routed through (1) to mobydick and then through(2) to the fax device.

The **advantage** of all connections being routed through mobydick is that mobydick can manage the call flow, e.g. forwad the call to another destination after a timeout. It is also possible to route the call based on pre-defined business hours. In this scenario, the extension needs not to be connected to the same Patton hardware as the trunks.

The **disadvantage** is that fax services may not be as stable. Also, data transmission with ISDN is not possible.

## Preparations
Connect the Patton gateway to your switch, then plug in the power supply and boot the gateway. The gateway will automatically request an IP address from the DHCP.

If you are using a Patton gateway that might have stored older settings and you are not sure about the network settings, do a factory reset. This will configure the gateway for use with DHCP. To perform the reset, press the gateway's reset button for 5 seconds while the gateway is in operation. Hold the button until the "Run" LED starts blinking. Wait until the blinking stops and the continuous light of the LED indicates that the Patton gateway is again ready for use.

## Configuration

### Detecting and adding Patton gateway entries for mobydick

Once your Patton gateway is connected to your LAN, mobydick can automatically detect it, as long as the gateway is located in the same subnet as mobydick.
In the mobydick web interface, select ***Gateways > Gateway*** list and press the "Add"  button. Next, select the gateway type Patton gateway. mobydick will search for the ***Patton gateway***:

If detection is unsuccessful or the Patton gateway is in a different subnet than mobydick, you can add the hardware manually by clicking the ***"Create manually"*** button.

The drop-down menu Gateways lists all detected Patton gateways:

Enter your data in the fields **User** name and **Password** to authenticate with the webserver running on the Patton devices. The default user name is administrator. No default password is set. You cannot change the user name or password at this point yet.
Press Next and review the summary and port configuration displayed in this screen:

You can now customize the **name** and **save** your changes.

### Creating ISDN trunks
A common use case for Patton gateways is to connect ISDN trunks to it. To do so, select the gateway you want to use from the list, click the `Edit` button and then switch to the Allocation tab.

The Add button allows you to configure either BRI or PRI trunks and will create a new data record. Please see Configuring ISDN, Analogue and GSM Gateways#ISDNinanutshell if you need help with ISDN technology.

Double-clicking on the **name** field of a record will open a detailed view. ou can then select which port belongs to that trunk. AMultiple selections are possible, as a BRI that is configured to use the PP protocol allows for several NTs to be aggregated so they form a single trunk.

Use **Mode** and **Technology** menus to configure the interface type. For a BRI that is configured to work in PP mode, the interface type must be set to **TE** and **PTP**. For more details, please see Configuring ISDN, Analogue and GSM Gateways#ISDNinanutshell.

You have now configured the interface of the Patton gateway and should continue with the next step, the Creating trunks and call rules chapter.

### Creating ISDN or analogue extensions
Select the gateway from the list, click the `Edit` button and go to the Allocation tab.

The Add menu allows you to add the following extensions:

| Typ | Description |Use case|
|-----|--------------|--------------|
|Analogue terminal via SIP|    Analogue terminal device being routed on mobydick  |telephone|
|ISDN telephone via SIP|   ISDN telephone being routed directly on mobydick   |telephone|

The interface of the Patton gateway is now configured. You can proceed with Preparing Devices for Operation.
