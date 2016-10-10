---
title: Network Configuration
url:  /server/network-configuration/
prev: /server/accessing-mobydick/
next: /server/cluster-setup/
weight: 14
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

To add a virtual interface, press the `Add button.

![Screenshot - Add Virtual Interface - VLANs](../../images/network_vlan_add.png "Adding VLANs - Virtual Network Interfaces")

### Network Configuration per TUI

{{% notice note %}}
TUI configuration mode uses the same database as the web interface. Both the TUI and the web interface therefore provide identical information on all network interfaces.
{{% /notice%}}

Select **F2** on the TUI screen and enter the system password. Next select the **Configure Network** option.

![Screenshot - Network Configuration per TUI](../../images/netzwerk_tui.png?width=80% "TUI Network Configuration")

Within the list, you will be able to see all available network cards, regardless of whether or not they have been configured.

#### Change Network Interface Configurations

Using the **arrow keys**, please select the interface to be changed and confirm your select by pressing **enter**.

![Screenshot - Change Network Interface Configurations per TUI](../../images/netzwerk_tui_modus.png?width=80% "TUI Network Interface Configuration update")

The following **Modes** are available:

* **DHCP:** The IP address of this network interface is obtained via DHCP. The IP, Subnet and Gateway address fields can be left blank
* **STATIC:** IP address, Subnet and Gateway addresses are manually assigned a static value.
* **UNCONFIGURED:** deactivates this interface.

Confirm you selection with the **Enter key**. The TUI dialog will now ask for the IP addresses, Netmask and Gateways should they be required by your selected mode.

#### Add an Interface
{{% notice note %}}
All available physical interfaces are listed automatically and do not need to be added. Only virtual interfaces (VLANs) can be added manually.
{{% /notice %}}

To add a new virtual interface, select **Add new virtual interface** and follow the dialog below:

* Select virtual Network card type: vlan virtual LAN interface
* Select physical network card on which the VLAN should be mounted
* Enter an nummerical VLAN ID

The following **Modes** are available:

* DHCP: The IP address of this virtual network interface is obtained via DHCP. Fields for IP address, Subnet and Gateway addresses can be left empty.
* STATIC:  IP address, Subnet and Gateway are manually assigned a static value.

### Troubleshooting
Log on to your mobydick using SSH.

In case this is not possible due to a network malfunction, plug a display and keyboard into your mobydick server (a mouse is not needed). If you are using a virtual machine, you can directly access the console as well.

If you are using console mode (not using SSH), press **ALT+F3** to open a shell prompt and log on to the system.

#### Display Current IP Configuration

By using the ip addr command, the current settings of all network interfaces will be displayed:

    admin@mobydick:~$ ip addr
    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
        inet6 ::1/128 scope host
           valid_lft forever preferred_lft forever
    2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 00:0c:29:25:22:57 brd ff:ff:ff:ff:ff:ff
        inet 192.168.1.5/24 brd 192.168.1.255 scope global eth0
        inet6 fe80::20c:29ff:fe25:2257/64 scope link
           valid_lft forever preferred_lft forever
    3: eth1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 1000
        link/ether 00:0c:29:25:22:61 brd ff:ff:ff:ff:ff:ff
    admin@mobydick:~$

In the above example, line 9 reveals 192.168.1.5 as the IP address of the network interface eth0.

#### View Configuration File

Any changes made to the configuration using the web interface or TUI are written to the file /etc/network/interfaces. Do not modify this file yourself, as mobydick writes any changes in the configuration to this file.

    admin@mobydick:~$ cat /etc/network/interfaces
    auto lo
    iface lo inet loopback
    auto eth0
    iface eth0 inet static
            address 192.168.1.5
            netmask 255.255.255.0
    admin@mobydick:~$

#### Manually Restart Network
For troubleshooting purposes, the network can be restarted manually. To do this, root access is required:

    admin@mobydick:~$ su
    Passwort:
    root@mobydick:/etc/admin# /etc/init.d/networking restart
    Running /etc/init.d/networking restart is deprecated because it may not enable again some interfaces ... (warning).
    Reconfiguring network interfaces...done.
    root@mobydick:/etc/admin# exit
    exit
    admin@mobydick:~$



## Mail Server Configuration

### Configuration
mobydick includes a mail server. It should be configured so it can forward e-mails to your SMTP server. You can either run your own SMTP server or have your provider run such a service for you. For a successful configuration, you need to know the IP or domain name of the SMTP server you intend to use.
Especially if you are using the SMTP server of your provider, it may be necessary to authenticate with a user name and password.
mobydick needs the mail server to send voice mails, faxes, recordings of phone conversations etc., via e-mail. To allow this, create a mail account for mobydick on your mail server. This account will only send but not receive e-mails.

#### Mail Server Setup

![Screenshot - Mailserver einrichten](../../images/netzwerk_mailserver.png "Mailserver einrichten")

Under **visible domain name**, please enter the part of your e-mail address following the @ sign. If, for example, you use mobydick@chaosconsulting.com as the e-mail account for your mobydick, enter chaosconsulting.com in the visible domain name field. mobydick will not send e-mail directly to the particular server, but will use the server that is specified to act as the relay server.


### Testing and Troubleshooting

#### Testing the Mail Server
To test whether your mail server works correctly, use SSH to log on to your mobydick.

Using the shell, you can send a test message to an arbitrary recipient. Use the command below and replace **max@chaosconsulting.com** with a test address of your choice:

    admin@mobydick:~$ echo Test | mail -s Test max@chaosconsulting.com

Um To check the mail server's log file, enter the command listed below and your system password:

    admin@mobydick:~$ su
    Password:
    root@mobydick:/etc/admin# tail -f /var/log/exim4/mainlog

This will return several lines allowing you to check whether the e-mail was successfully sent using your SMTP server.


    2010-03-16 12:21:14 1NrUpm-0007gQ-Dk <= admin@chaosconsulting.com U=admin P=local S=368
    2010-03-16 12:21:14 1NrUpm-0007gQ-Dk => max@chaosconsulting.com R=smarthost T=remote_smtp_smarthost H=ihr.mailserver [192.168.1.10]
    2010-03-16 12:21:14 1NrUpm-0007gQ-Dk Completed

#### Mail Server Log File Analysis

    eadmin@mobydick:~$ su
    Passwort:
    root@mobydick:/etc/admin# tail -f /var/log/exim4/mainlog
    2012-11-22 11:16:10 Start queue run: pid=21045
    2012-11-22 11:16:10 End queue run: pid=21045
    2012-11-22 11:46:10 Start queue run: pid=22933
    2012-11-22 11:46:10 End queue run: pid=22933
    2012-11-22 11:50:09 exim 4.72 daemon started: pid=23458, -q30m, listening for SMTP on port 25 (IPv6 and IPv4)
    2012-11-22 11:50:09 Start queue run: pid=23459
    2012-11-22 11:50:09 End queue run: pid=23459
    2012-11-22 12:17:33 exim 4.72 daemon started: pid=25630, -q30m, listening for SMTP on port 25 (IPv6 and IPv4)
    2012-11-22 12:17:33 Start queue run: pid=25632
    2012-11-22 12:17:33 End queue run: pid=25632

#### Restart the mobydick Mail Server

##### per SSH

    admin@mobydick:~$ su
    Passwort:
    root@mobydick:/etc/admin# /etc/init.d/exim4 restart
    Stopping MTA for restart: exim4_listener.
    Restarting MTA: exim4.
    root@mobydick:/etc/admin#

## NTP Server Configuration

### Configuration
Many use cases of mobydick depend on a reliable source for timekeeping. For example, a call could be routed to different destinations, depending on the time of day.  All IP phones are automatically synchronized to a time source on the mobydick server if the latter has a properly configured NTP server.

{{% notice tip %}}
If you do not have your own NTP server, you can use the publicly available service at **pool.ntp.org**.
{{% /notice %}}

![Screenshot - NTP-Server Konfiguration](../../images/netzwerk_ntp.png "NTP-Server Konfiguration")

### Troubleshooting

#### Restart NTP Server
Log on to your mobydick using SSH

    admin@mobydick:~$ su
    Passwort: 
    root@mobydick:/etc/admin# /etc/init.d/ntp restart
    Stopping NTP server: ntpd.
    Starting NTP server: ntpd.
    root@mobydick:/etc/admin#

## Standard Telephony Settings

### Overview

![Screenshot - Telefonie Grundeinstellungen](../../images/netzwerk_telefonie.png "Telefonie Grundeinstellungen")

#### Standard Codecs

The default codec settings are alaw, ulaw, gsm and h264. The codecs will be prioritises in the sequence in which they are entered here.
Additional codecs can be added according to your needs  (e. g HD Codec g.722).
The Codecs will be set as a global preference. However, this preference can be overwritten on all devices and trunks under the options field .
In this example, the all codecs for a device / trunk will initially be disallowed, but then the only the alaw will be allowed:

    disallow=all
    allow=alaw

{{% notice note %}}
Many of our Trunk Templates overwrite the globally set preferred codecs using the options field according to the provider settings.
{{% /notice %}}

#### Supported Codecs

|Codec|Name|Description|Bitrate (Kb/s)|
|-----|----|------------|--------------|
|alaw	|G.711 A-law	|ISDN Codec in Europe, mobydick Standard codec|	64|
|ulaw	|G.711 u-law	|ISDN Codec in N. America and Japan	|64|
|gsm	|GSM	|GSM Codec - low bandwidth usage	|13|
|g722	|G722	|Codec for HD Voice (adaptive) |48-64|
|h264	|H.264 Video	|Video Codec for h264	|dependent on frame rate and resolution|

A list of all the supported codecs can be found in the Asterisk CLI by using the command core show codecs.

### Allowed IAX Connections
As default, IAX connections are deactivated.

### Allowed AMI-Connections
As default, AMI connections are deactivated. Should the WombatDialer or QueueMetrics be used, you can set the AMI connection to public. See WombatDialer Integration or QueueMetrics Integration.

### SRTP
The RTP (Real-Time Transport Protocol) is a protocol which facilitates the transmission of multimedia data streams over a network. In IP telephony this is used in order to transmit both audio and video streams for a call. mobydick is able to encrypt the transmissions (SRTP - Secure Real-Time Transport Protocol).

The following settings are available:

|Setting|Description|
|-----------|------------|
|Deactivated|As default SRTP is deactivated|
|Activated for all supported devices |Support devices, which can be provisioned by mobydick (Snom, Yealink, Aastra (mitel), Auerswald, OpenStage and mobydick Softphone)|
|Activated for all supported devices and any IP phone/softpone|SRTP will be activated for all supported devices and any IP phone or softphone.<br/>Please note that devices that are not provisioned by mobydick, SRTP must be manually activated on the device itself. Should you not do this, then it could be that it can no longer be called when SRTP is activated in mobydick.|


As standard SRTP can only be activated for IP phones / Softphones and not for Gateways. When SRTP is activated in mobydick, only internal calls will be encrypted and not calls that are externally routed over a gateway or a SIP provider.

When activating / deactivating SRTP:

* Asterisk will be restarted, meaning all current calls will be disconnected
* All hardware phones must be restarted (-> Device List)
* All mobydick Clients using Softphones must be restarted.