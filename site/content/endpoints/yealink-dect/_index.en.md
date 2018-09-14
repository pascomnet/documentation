---
title: Yealink W52P DECT System
description: Integrate your Yealink DECT system with your pascom phone system.
weight: 40
---

{{< doctype "both"  >}}

{{< description >}}

![Yealink W52P](yealink_w52p_dect.png?width=300px "pascom phone system Yealink W52P DECT system integration")


## Overview

The Yealink W52P DECT solution is ideally suited for small businesses who require only a small number of mobile handsets (maximum 5).

### Preparation

For the automatic provisioning of Yealink DECT systems, a functioning DHCP server is required.

## Configuration

Connect all required Snom base stations to your network. Once the boot process is completed, base stations will automatically appear in the PBX web UI Gateway list ('Gateways' > 'Gateway list').

The **Status** field currently has no relevance and the "plug symbol" warning is normal at this stage.

### Add and Assign Handsets

It is only possible to register a maximum of 5 handsets per base station.

nder`Devices` > `Device List` > `Add`, select the option `Via Yealink DECT Gateway: handset`. Next you will need to update the following settings: Einstellungen müssen Sie vornehmen:

|Settings|Description|
|---|---|
|Connected to|Select the DECT base station.|
|Assignment|In this tab, you can assign users.|

## Register Handsets to the DECT Base Station

The handsets will automatically connect themselves to the DECT base station as soon as they are placed in the charging stations and the provisioning of the Base Station has been applied. 

{{% notice note %}}
It is possible that the DECT base station may require a restart. 
{{% /notice %}}
