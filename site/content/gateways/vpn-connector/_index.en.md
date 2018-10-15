---
title: pascom VPN Connector
description: Connect your local network to your pascom.cloud phone system instance or self hosted pascom PBX via VPN Sie Ihr lokales Netzwerk via VPN mit Ihrer Instanz in der pascom.cloud oder Ihrem lokalen pascom Server
weight: 10
---

{{< doctype "both"  >}}

{{< description >}}

## Overview

By using the pascom VPN connector it is possible to access local network services directly from the pascom.cloud hosted phone system. This could be necessary, for example, in order to authenticate phone system users against a locally installed Active Directory or to periodically import customer data from your ERP or CRM system into the pascom phone book. 

This function is also available to you should you have an on-site pascom server and need to access, for example, data from another location. 

{{%notice tip%}}
That pascom phone systems include a Session Border Controller for mobile users, the VPN Connector is not necessary for and indeed is unsuitable for their connection.
{{%/notice%}}

### Transit Network and IP Addresses

The pascom VPN Connector establishes a Point to Point connection between your pascom instance and the OpenVPN client. The pascom instance is permanently assigned the IP address 172.16.23.1. For the purpose of the Transit Network, the address 172.16.23.0/24 is used. The OpenVPN client receives a random, however persistent IP address (always the same) from the Transit Network. You can determine this IP address via the OpenVPN client and use it enable access for you pascom instance to local client services.

## Configuration

### Change Transit Network (optional)

Should you wish to use a different Transit Network other than 172.16.23.0/24, you can configure this under the following menu points {{< ui-button "Appliance" >}} >{{< ui-button "System Settings" >}}* and editing the parameter **sys.vpn.transit.network**. Simply use the search tool to search from the parameter.

### pascom Instance

Log into your pascom phone system instance and under {{< ui-button "Gateways" >}} > {{< ui-button "Gateway list" >}} > {{< ui-button "Add" >}} and select new **VPN Access** from the list.

Enter a **name** for the VPN Connector and download the configuration via the {{< ui-button "Save and Export" >}} button.

### OpenVPN Client

The pascom VPN Connector is based on OpenVPN. Using the downloaded configuration, it is now possible to setup any OpenVPN client. OpenVPN clients are available for a number of Operationg Systems and Routers. 

In order to access, for example, your locally installed Active Directory, simply install the OpenVPN client for Windows directly on your Windows Server and establish the connection to your pascom phone system instance. 

### Test the Connection

After successfully establishing the VPN, you should be in the position to reach the IP address of your pascom Instance 172.16.23.1 from the OpenVPN client:

```bash
ping 172.16.23.1

PING 172.16.23.1 (172.16.23.1): 56 data bytes
64 bytes from 172.16.23.1: icmp_seq=0 ttl=63 time=12.053 ms
64 bytes from 172.16.23.1: icmp_seq=1 ttl=63 time=11.945 ms
...
```
