---
title: Using pascom.cloud
weight: 20
description: We offer all Free, Basic and Premium customers completely free pascom.cloud phone system hosting. Simple, Secure, Fast - start free now.
---

{{% tabs %}}
  {{% tab "first" %}}
   This is first tab
  {{% /tab %}}

  {{% tab "second" %}}
  this is second tab
  {{% /tab %}}

  {{% tab "third" %}}
  this is third tab
  {{% /tab %}}
{{% tabs %}}

{{< doctype "cloud" >}}
 
{{< description >}}

## pascom.cloud

The simplest deployment option for your pascom phone system is to use pascom.cloud which is free for all Free, Basic and Premium pascom customers. 

Choose the pascom.cloud phone system option and benefit from a hosted PBX without requiring any in-house or rented hosting as we take care of the hosting for you - free of charge. You can get started within minutes without any installation hassle or any additional hardware being required. 

 * [Start Free Now](http://my.pascom.net/do/cloud)

### Modify Your Firewall

Many companies have **no Internet access restrictions** and can therefore **immediately** start using **pascom.cloud** without needing to make any alterations to their Firewall.

However, should you choose to, you can specify which internet services your company network is permitted to access by opening the following ports:

#### Telephony and Instant Messaging

| Port | Descriptuon |
| ---- | ------------ |
| TCP **5061** | SIP-TLS - secure SIP communication |
| TCP **5222** | pascom Desktop and Mobile client access |
| UDP **30000 - 35000** | SRTP - encrypted Voice Data |

#### Optional Servicees

| Port | Description |
| ---- | ------------ |
| TCP **636** | LDAPS for telephone book access via LDAP |
| TCP **8884**  | Provisioning of Desktop IP Phones (hardware telephones) |
| TCP **8885**  | VPN Tunnel direct to the phone system |