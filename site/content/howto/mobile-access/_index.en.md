---
title: Setup Mobile Access via the Internet
description: This step is necessary if you want users to be able access your local on-premise pascom phone system when they are "on the move" via the pascom mobile app (Android & iOS) or the pascom desktop client
weight: 10
---
 
{{< doctype "self" >}}
 
{{< description >}}

## (Option 1) External IP Address without a Certificate

This options uses your fixed external IP address, without needing to setup a domain name or certificates.

**Requirements**

 * Fixed, external IP Address

**Pros**

 * Simple to setup 

**Cons**

 * Less security, "Self Signed" certificate
 * Your users must know the IP address for the initial setup of the pascom desktop client as opposed to an easier to remember domain name
 
### Update Your Firewall Settings

In order to enable pascom server access from the Internet, it is necessary to setup a Port Forwarding on to the IP address of the pascom server as follows: 

[Configure Firewall / Port Overview]({{< ref "/server/port-overview" >}})

### pascom Server Interface Update

Having updated your Firewall settings, you must now enter your external IP Address on the pascom Server Interface: 

* Using an admin account, login to the pascom server in your browser
* Click {{< ui-button "Interface" >}}
* Click {{< ui-button "Edit" >}} on the interface used by you
* Under {{< ui-field "Interface DNS Name" >}} enter your external IP Address
* Press {{< ui-button "Save" >}} to apply the configuration

The Interface will now restart. Now you can continue with the setup of your pascom phone system.
 

## (Option 2) Your External Domain Name

This option you will have your own externally accessible domain name which points to the external IP Address of your router.

**Requirements**

 * Fixed External IP Address
 * Domain name that points to your external IP address

**Pros**

 * More security
 * Fully automated use of Let's Encrypt is possible
 * Your users only see your more memorable domain name instead of an IP address

**Cons**

 * Setup is a bit more complicated
 
### Update Your Firewall Settings

In order to enable pascom server access from the Internet, it is necessary to setup a Port Forwarding on to the IP address of the pascom server as follows: 

#### Telephony and Instant Messaging

| Port | Description |
| ---- | ------------ |
| TCP **80**/**443** | Phone system Web Interface - Important for Let's Encrypt certificates |
| TCP **5061** | SIP-TLS - secure SIP communication |
| TCP **5222** | pascom Desktop and Mobile client access |
| UDP **30000 - 35000** | SRTP - encrypted Voice Data |

#### Optional Services

| Port | Description |
| ---- | ------------ |
| TCP **636** | LDAPS for telephone book access via LDAP |
| TCP **8884**  | Provisioning of Desktop IP Phones (hardware telephones) |
| TCP **8885**  | VPN Tunnel direct to the phone system |

## Domain Name Setup

As valid certificates can only be created using domain names and not IP addresses, you will now need to setup a domain name for the external IP address of your internet access.

Should you not have your own, external DNS server available,[no-ip](https://www.noip.com/) offers an easy way to setup externally accessible domain names on your router (Fritzbox, etc).

## Activate Let's Encrypt 

Now your have modified your firewall and setup up a domain name, your pascom phone system server has the capability to fully and automatically setup a Let's Encrypt certificate for these domain names. Simply follow these steps:

* Using an admin account, login to the pascom server via your browser
* Click {{< ui-button "Interface" >}}
* Click {{< ui-button "Edit" >}} on the interface used by you
* Under {{< ui-field "Interface DNS Name" >}} enter the previously setup {{< ui-input "Domain Name" >}}
* Switch the the {{< ui-field "Certificate mode" >}} to {{< ui-input "Let's Encrypt" >}}
* Press {{< ui-button "Save" >}} to apply the configuration

The Interface will now restart and automatically applies the Let's Encrypt Certificate. Should the interface restart encounter errors, please check your Firewall Settings, in particular Port TCP 443 and your domain name.

You can now continue with the setup of your phone system.