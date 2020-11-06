---
title: Port Overview | Firewall Configuration
description: Here you will find an overview of the necessary port clearances in your firewall.
weight: 100
---
{{< doctype "both"  >}}

{{< description >}}


## Configure your firewall

Many companies have **no restricted Internet access** and can therefore use the **pascom server** immediately, without any adjustment to the firewall.

However, if you specify exactly which Internet services your company network may access, please activate the following ports in your firewall to allow smooth operation of the [pascom phone system](https://www.pascom.net/en/business-phone-system/ "pascom VoIP telephone system")



{{% tabs %}}
{{% tab "Cloud" %}}
![Port Overview Cloud](port_overview_cloud.png)


| Port | Function | Device | Source |Target |
| ---- | ---- | ------------ |-----|---|
|5061/TCP|SIP-Connection|<i class="fas fa-desktop"></i>  <i class="fas fa-phone"></i>  <i class="fas fa-mobile-alt"></i>|Your Network|pascom.cloud*|
|30.000-35.000/UDP|RTP-Voice|<i class="fas fa-desktop"></i>  <i class="fas fa-phone"></i>  <i class="fas fa-mobile-alt"></i>|Your Network|pascom.cloud*|
|636/TCP|LDAPS, Phonebook| <i class="fas fa-phone"></i> |Your Network|pascom.cloud*|
|8884/TCP|Phone Provisioning| <i class="fas fa-phone"></i> |Your Network|pascom.cloud*|
|80 / 443/TCP|Updates, Push, Fax, Voicemail, Recordings| <i class="fas fa-desktop"></i>  <i class="fas fa-mobile-alt"></i> <i class="fas fa-video"></i> |Your Network|mypascom.net|
|3478|Video-Functionality/UDP| <i class="fas fa-desktop">  <i class="fas fa-mobile-alt"></i></i> |Your Network|pascom.cloud*|
|5222/TCP|Chat, Filetransfer| <i class="fas fa-desktop">  <i class="fas fa-mobile-alt"></i></i> |Your Network|pascom.cloud*|
|19302/UDP+TCP|WebRTC - WebClient| <i class="fas fa-video"></i> |Your Network|pascom.cloud*|
|8885/TCP|VPN Tunnel to PBX| <i class="fas fa-server"></i> |Your Network|pascom.cloud*|

<br/>
#### Legend
<i class="fas fa-server"></i>  =  pascom Server  
<i class="fas fa-desktop"></i>  =  Desktop Client  
<i class="fas fa-mobile-alt"></i>  = Mobile Client  
<i class="fas fa-phone"></i>  =  IP-Phone  
<i class="fas fa-video"></i>  =  WebClient

| * = The pascom.cloud can target different IP addresses 


{{% /tab %}}

{{% tab "Onsite" %}}
![Port Overview Onsite](port_overview_onsite.png)


| Port | Function | Device |  Source |Target|
| ---- | ---- | ------------ |-----|---|
|80 / 443/TCP|Licenseserver|<i class="fas fa-server"></i> |Your Network|mypascom.net|
|25/TCP|Access to pascom Mailserver|<i class="fas fa-server"></i> |Your Network|cloudmx1.pascom.net, cloudmx2.pascom.net|
|123/TCP|Access to TimeServer (NTP)| <i class="fas fa-server"></i> |Your Network|ntp.pool.org|


<br />

To access your devices via the Internet in your network to the pascom telephone system, you need the same port clearances as for the cloud variant. (or also with subnets)


| Port | Function | Device | Target |
| ---- | ---- | ------------ |-----|
|5061/TCP|SIP-Connection|<i class="fas fa-desktop"></i>  <i class="fas fa-phone"></i>  <i class="fas fa-mobile-alt"></i>|Your Network|
|30.000-35.000/UDP|RTP-Voice|<i class="fas fa-desktop"></i>  <i class="fas fa-phone"></i>  <i class="fas fa-mobile-alt"></i>|Your Network|
|636/TCP|LDAPS, Phonebook| <i class="fas fa-phone"></i> |Your Network|
|8884/TCP|Phone Provisioning| <i class="fas fa-phone"></i> |Your Network|
|80 / 443/TCP|Updates, Push, Fax, Voicemail, Recordings| <i class="fas fa-desktop"></i>  <i class="fas fa-mobile-alt"></i> <i class="fas fa-video"></i> |mypascom.net|
|3478/UDP|Video-Functionality| <i class="fas fa-desktop">  <i class="fas fa-mobile-alt"></i></i> |Your Network|
|5222/TCP|Chat, Filetransfer| <i class="fas fa-desktop">  <i class="fas fa-mobile-alt"></i></i> |Your Network|
|19302/UDP+TCP|WebRTC - WebClient| <i class="fas fa-video"></i> |Your Network|
|8885/TCP|VPN Tunnel to PBX| <i class="fas fa-server"></i> |Your Network|

<br/>
#### Legend
<i class="fas fa-server"></i>  =  pascom Server  
<i class="fas fa-desktop"></i>  =  Desktop Client  
<i class="fas fa-mobile-alt"></i>  = Mobile Client  
<i class="fas fa-phone"></i>  =  IP-Phone  
<i class="fas fa-video"></i>  =  WebClient  


| * = The pascom.cloud can target different IP addresses 

{{% /tab %}}
{{% /tabs %}}

