---
title: Using pascom.cloud
weight: 20
description: We offer all Free, Basic and Premium customers completely free pascom.cloud phone system hosting. Simple, Secure, Fast - start free now.
---

{{< doctype "cloud" >}}
 
{{< description >}}

## Training Video

{{< youtube QDtL-9ktR6E  >}}

## pascom.cloud

The simplest deployment option for your pascom phone system is to use pascom.cloud which is free for all Free, Basic and Premium pascom customers. 

Choose the pascom.cloud phone system option and benefit from a hosted PBX without requiring any in-house or rented hosting as we take care of the hosting for you - free of charge. You can get started within minutes without any installation hassle or any additional hardware being required. 

 * [Start Free Now](http://my.pascom.net/do/cloud)

### Modify Your Firewall

Many companies have **no Internet access restrictions** and can therefore **immediately** start using **pascom.cloud** without needing to make any alterations to their Firewall.

#### Destination Ports

However, should you choose to, you can specify which internet services your company network is permitted to access by opening the following ports:

#### Telephony and Instant Messaging

| Port | Description |
| ---- | ------------ |
| TCP **5061** | SIP-TLS - secure SIP communication |
| TCP **5222** | pascom Desktop and Mobile client access |
| UDP **30000 - 35000** | SRTP - encrypted Voice Data |
| UDP **3478** | Access for Video-Functionality |
| UDP + TCP **19302** | WebRTC | Access for Web Client |

#### Optional Servicees

| Port | Description |
| ---- | ------------ |
| TCP **636** | LDAPS for telephone book access via LDAP |
| TCP **8884**  | Provisioning of Desktop IP Phones (hardware telephones) |
| TCP **8885**  | VPN Tunnel direct to the phone system |

#### QoS settings

pascom.cloud marks voice and signal packets. Many routers / switches take this into account as standard or can be configured accordingly.

| Package type | TOS | COS | DSCP decimal |
| -------- | ----- | ----- | ------------ |
| Voice | ef / 184 | 5 | 46 |
| Signaling | cs3 / 96 | 3 | 24 |

All pascom clients also mark packages in accordance. Please note that group policies must be set for this under Windows. See [Windows QoS Settings]({{< ref "/clients/desktop-installation#windows-qos-settings-optional" >}}).

#### Destination IP addresses

Our recommendation is to restrict ***only*** **destination ports** and ***not*** **destination IP addresses**. Pascom.cloud uses a variety of services and balancers and thus also corresponds to many destination IP addresses. The list of destination IP addresses is constantly being expanded and is therefore difficult for you to maintain.

If you still need a current list of destination IP addresses, please contact our support.