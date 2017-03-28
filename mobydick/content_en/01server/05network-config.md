---
title: Network Configuration
url:  /server/network-configuration/
prev: /server/accessing-mobydick/
next: /server/services/
weight: 15
toc: true
keywords:
- Integration in existing company network
    - Network Configuration konfigurieren
    - Network Infrastructure
    - Telephony and Corporate Networks
    - Enterprise Networks & VoIP
description: There are multiple options for integrating mobydick into your network.
lang: en
linkde: /server/netzwerk-konfigurieren/
---

## Network Infrastructure

There are several possibilities to integrate mobydick into your network. The below documentation applies to both [our virtual phone systems] (https://www.pascom.net/en/mobydick-virtual/ "virtual pascom VoIP phone systems") as well as our hardware based PBX solutions.


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

## DHCP Server Configuration

pascom phone systems require a DCHP server in order to be able to assign all connected IP telephones with IP addresses and provisioning URLs. For this purpose, our PBX software includes an integrated DHCP server which can be used. Alternatively, you can use your already existing DHCP server. 

### Integrated DHCP-Server ###

Using pascom's integrated DHCP Server has numerous advantages:

* The configurations server will already have been automatically provided to the telephones.
* Should you assign a telephone with a fixed IP address within the PBX web UI, the reservation will be automatically entered into the DHCP server settings.
* The DHCP server can be setup to assign IP addresses to the telephones to be provisioned and as such ignore all other requests.

The DHCP server can be activated within the Web UI `Appliance` > `Services` > and selecting the `DHCP-Server` menu tab.  
When activating the DHCP server, it will be necessary to select some standard configuration options 

|Status|Description|
|---|---|
|**Yes**| The DHCP server will assign IP addresses for the selected network|
|**Yes, phones only**|The DHCP server will assign IP addresses only for pascom PBX provisioned IP Endpoints within the selected network.|
|**No**|The DHCP server is deactivated|

|Additional Settings:||
|---|---|
|from area... to area| Defines the range of IP address which can be assigned to devices. The DHCP server will then assign addressing starting with the last available IP Address.|
|Domain-Name, Domain-Name-Server, Gateway |Parameters which are passed on the requesting device.|

### Using a Windows DHCP Server###

When using the Windows DHCP server or a DHCP server follows the same options pattern, you will need to activate DHCP option 66 and replace 192.168.1.1 with your PBX server's IP address. This option tells the telephone sending the request where it can download the appropriate configuration file. 

|Phone Manufacturer|Option 66|Option 67|
|---|---|---|
|Yealink|http://192.168.1.1/provisioning||
|Snom|http://192.168.1.1/provisioning/{mac}||
|Auerswald|http://192.168.1.1/provisioning|\<MACADR\>|
|Aastra/Mitel|http://192.168.1.1/provisioning||
|Siemens OpenStage|http://192.168.1.1/provisioning||

It is possible to run the integrated pascom PBX DHCP server and the Windows DHCP server within the same network. In this case, the PBX assigns IP addresses and options for configuration server to the phones, while the Windows DHCP server assignes IP addresses to all other devices. The Windows DHCP server needs to be configured in a way that ensures it ignores requests from your IP telephones. Every MAC address starts (first six characters) with a manufacturer specific identifier which can be used to identify the device manufacturer. Under the Windows DHCP Server **Filter** option, these MAC address identifiers will need to be added to the **Disallow** filter. 

|Phone Manufacturer |MAC-Adresses|
|---|---|
|Snom|00-04-13-\*-\*-\*|
|Aastra/Mitel|00-08-5D-\*-\*-\*|
|Yealink|00-15-65-\*-\*-\*|
|Auerswald|00-09-52-\*-\*-\*|
|Siemens OpenStage|00-01-E3-\*-\*-\* <br> 00-1A-E8-\*-\*-\*|

Once the addresses have been added, the filter must be activated. 

### Using a Linux DHCP Server

Under a Linux DHCP server, option 66 is called tftp-server-name. This option tells the telephone sending the request where it can download the appropriate configuration file. Please note that depending on the manufacturer of the phone, different values will need to be set as follows:

|Phone Manufacturer|tftp-server-name|filename|
|---|---|---|
|Yealink|http://192.168.1.1/provisioning||
|Snom|http://192.168.1.1/provisioning/{mac}||
|Auerswald|http://192.168.1.1/provisioning|\<MACADR\>|
|Aastra/Mitel|http://192.168.1.1/provisioning||
|Siemens OpenStage|http://192.168.1.1/provisioning||

You will need to update your Linux DHCP Configuration, which can be done by simply adding the following line (our example is for Yealink Telephones):

    option tftp-server-name "http://192.168.1.1/provisioning/";

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

## Network Interface Configuration

Configuring network interfaces and adding VLAN interfaces using the web interface or TUI.

{{% notice warning %}}
Applying changes to the network settings will result in the disconnectiong of all active calls. Applying such changes using the TUI will result in a restart of the network without any additional warning.
{{% /notice %}}

### Web UI Network Interface Configuration

The network can be configured using the Appliance > Network interfaces menu tool.

![Screenshot - Web UI Network Interfaces](../../images/network_interfaces.png "Web UI Network Interface Condfiguration")

The list will show all available network cards, regardless of whether they have already been configured or not.

#### Changing a Network Interface Configuration

Select the network interface on which you wish to change the configurations (selecting multiple interfaces is also possible) and click the `Edit button`.

|Mode|Explanation|
|---|---|
|DHCP| The IP address of this network interface is obtained via DHCP. The IP, Subnet and Gateway address fields can be left blank.|
|STATIC|  IP address, Subnet and Gateway addresses are manually assigned a static value.|
|DEACTIVATED|Deactivates this interface.|

{{% notice warning %}}
Applying changes to the network settings configuration will result in all active calls being terminated.
{{% /notice %}}

#### Adding a Network Interface

{{% notice note %}}
Only virtual interfaces (VLANs) can be added manually. All available physical interfaces are listed automatically and do not need to be added.
{{% /notice%}}

To add a virtual interface, press the `Add` button.
