---
title: Snom SIP DECT Setup
keywords: 
        - Snom DECT system
        - Snom M700
        - Snom M300
        - Snom DECT phones
        - Snom DECT Base Stations
description: Setup guide to configuring Snom DECT systems with the pascom PBX solution
url:  /endpoints/snom-dect-system-setup/
linkde: /endgeraete/snom-dect/
prev: /endpoints/generic-ip-endpoints/
next: /endpoints/integrate-aastra-dect-system/
weight: 47
toc: true
draft: false
---



## Overview

[Snom M700] (https://www.snom.com/telephones/workplace-mobility/m700-multi-radio-base-station/ "Snom DECT Workplace mobility solutions") base stations can be operated in both Single Cell and Multi-Cell deployments and is ideally suited for organisations that require additional [work place mobility] (https://www.pascom.net/en/features/ "pascom workplace mobility features") over multi floors or across larger company buildings.

## Configuration
{{% notice warning %}}
For the automatic commissioning of Snom DECT systems, a functioning DHCP server is required. For more information, please refer to [DHCP Server Configuration] (https://www.pascom.net/en/documentation/mobydick/server/network-configuration/#dhcp-server-configuration "DCHP Server Configuration").
{{% /notice %}}

### Connecting Snom Base Stations
Connect all required Snom base stations to your network. Once the boot process is completed, base stations will automatically appear in the PBX web UI Gateway list ('Gateways' > 'Gateway list'):

The **Status** field currently has no relevance and the "plug symbol" warning is normal at this stage.

### Configuring Multi-Cell Operation (optional)
Should you wish to network multiple Gateways into a multicell DECT system, simply mark and select all the desired Gateways and click **Edit**. By using the arrow buttons, you can navigate through all your selected Gateways and then edit them as follows. 

Under the `Mutli Cell` option, selec the value `Base Station` for one of the Gateways and for all other Gateways, select the option `Repeater`.

### Add and Assign Handsets
Under`Devices` > `Device List` > `Add`, select the option `Via snom DECT Gateway: handset

Ìn the next screen, you will be able to configure the device and under the `Assignment` tab you will be able to assign users and / or locations. 

|Parameter|Description|Comments|
|----|----|----|
|Connected to| Select a Gateway to connect to.|In multicell environments, all Gateways configured as a repeater are automatically hidden.|
|IPEI Number|Enter the handset IPEI number which can be found via the handset menu Settings > Status|The first line of the IPEI number is enough, i.e. everything after the colon (:) symbol does not need to be entered.|
|SIP Options| (Optional Step) It is possible to enter all the SIP peer options as supported by Asterisk| Please refer to Asterisk's SIP Configuration - Peers and Clients Documentation.|
