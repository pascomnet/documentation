---
title: Network Configuration
url:  /server/network-configuration/
prev: /server/accessing-mobydick/
next: /server/cluster-setup/
weight: 15
toc: true
keywords:
- Integration in existing company network
    - Network Configuration konfigurieren
    - Network Infractructure
    - Telephony and Corporate Networks
    - Enterprise Networks & VoIP
description: There are multiple options for integrating mobydick into your network.
lang: en
linkde: /server/netzwerk-konfigurieren/
---

## Network Infrastructure
There are several possibilities to integrate mobydick into your network.


### Integration into an Existing Company Network
Integrating mobydick directly into small to medium sized business networks is relatively straight forward and requires only a minimum of changes to the existing infrastructure. An existing DHCP server can either be used by mobydick and all connected devices or you can configure mobydick as the DHCP server for the complete network (s. DHCP Server Configuration).

![Illustration - Integrated Network Infrastructure](../../images/integrated_networkstructure.png "Integration in Existing Network")

If you are connecting either Snom, Yealink, Auerswald or Aastra IP telephones to your mobydick, you can also use them as switches to connect desktop computers or additional end user devices in order to further simplify your network. This will reduce cabling and is in particularly useful in weaker network environments.

![Illustration - Integrated Network Structure with Telephones](../../images/integrated_networkstructure_snom.png "Using the Telephony Switch")


#### Separating Telephony and Company Networks

To provide the highest flexibility and operational reliability, mobydick can be operated from within a dedicated network separated from the company network. This setup is beneficial in many ways:

* Problems with Quality of Service and conflicts with existing network services can be avoided; telephone traffic is not compromised by load peaks in the company network.
* Access to the telephony network can be controlled via a firewall.
* No changes to the DHCP service on the company network are needed, as mobydick can provide its own DHCP service for the telephone network.
* In a separate telephony network, Snom, Yealink, Auerswald, OpenStage and Aastra phones can be powered by a PoE (PowerOverEthernet) switch. When connected up to an uninterruptable power supply (UPS), phone calls can still be made in the event of a power failure.

There are several ways by which to separate the networks. In all scenarios, access to the telephone network is provided in order to allow configuration of both mobydick and connected devices via the network.

#### Separation via Phone System Interfaces
In order to separate both networks, different network interfaces, which are available within mobydick, can be used for each network. The telephony appliance is assigned an IP address within the networks and will therefore be able to communicate with the phones on the telephone network as well as with devices on the company network.

![Illustration - Separated Network Structure via PBX](../../images/separated_network_structure_via_pbx.png "Separated Network Structure via PBX")

The network settings of the mobydick appliance can be configured according to your requirements; network traffic can be subjected to firewall policies or otherwise restricted through routing settings on the server.

#### Separation Using a Gateway
Alternatively, you can use an existing security gateway to integrate the telephone network. In this case, all routing and filtering tasks are handled by your existing firewall.

![Illustration - Separated Network Structure via a Gateway](../../images/separated_network_structure_via_gateway.png "Separation via a Gateway")

## Multi-Location Networking, HomeOffices and Mobile Users
As the workplace is becoming increasingly mobile, communication is often passed through public or private networks. mobydick integrates seamlessly into this concept of a distributed network architecture. mobydick provides users with a transparent overview of the network infrastructure, ensuring a logically interconnected network in terms of telephone and data traffic. Separation into virtual networks (VLAN) is also supported by mobydick.

![Illustration - Multi-location Networking](../../images/distributed_networkstructure_homeoffice.png "Multi-Location Networking, HomeOffices and Mobile Users")

Branch offices can have their own telephony system installed and connected to the system at the organisational headquarters. This allows the telephone network to be scaled and work independently, should the connection with the organisational headquarters be interrupted or lost.

![Illustration - Branch Office Concept](../../images/distributed_networkstructure.png "Separated Branch Offices with separate mobydick PBXs")

Mobile devices used by employees (BYOD / CYOD) can be connected via the integrated GSM interface, enabling least cost routing, increasing employee mobility and transforming mobile devices into virtual extensions whilst employees are working from HomeOffice or are on the go.

![Illustration - GSM Interface](../../images/distributed_networkstructure_gsm.png "Mobile Device Integration per GSM Gateway")

## Integration and Migration of Existing Telephony Appliances
Existing ISDN appliances can be directly connected to mobydick. This allows for a gradual so-called `soft` migration where the immediate integration of existing end points and extensions is not required.

![Illustration - PBX Soft Migration](../../images/integration_existing_pbx.png "Integration and Migration of Existing Phone System")

## Configuration

Configuring network interfaces and adding VLAN interfaces using the web interface or TUI.

{{% notice warning %}}
Applying changes to the network settings will result in the disconnectiong of all active calls. Applying such changes using the TUI will result in a restart of the network without any additional warning.
{{% /notice %}}

### Configuring the Network via the Web UI

The network can be configured using the Appliance > Network interfaces menu tool.

![Screenshot - Netzwerkkonfiguration per Weboberfläche](../../images/network_interfaces.png "Netzwerkkonfiguration per Weboberfläche")

The list will show all available network cards, regardless of whether they have already been configured or not.

#### Changing a Network Interface Configurations

Select the network interface on which you wish to change the configurations (selecting multiple interfaces is also possible) and click the `Edit button`.

![Screenshot - Changing a Network Interface Configurations](../../images/network_interface_edit.png "Changing a Network Interface Configurations")

A description of the network interface will then be displayed; you will be able to enter an **IP address**, **Subnet address** and a **Gateway**. You are now able to choose between the following **modes**:

* **DHCP:** The IP address of this network interface is obtained via DHCP. The IP, Subnet and Gateway address fields can be left blank.
* **STATIC:**  IP address, Subnet and Gateway addresses are manually assigned a static value.
* **DEACTIVATED:** Deactivates this interface.

#### Adding a Network Interface

{{% notice note %}}
Only virtual interfaces (VLANs) can be added manually. All available physical interfaces are listed automatically and do not need to be added.
{{% /notice%}}

To add a virtual interface, press the `Add` button.
