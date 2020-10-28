---
title: Portübersicht | Firewall konfigurieren
description: Hier finden Sie eine Übersicht der notwendigen Portfreigaben in Ihrer Firewall.
weight: 100
---
{{< doctype "both"  >}}

{{< description >}}


## Ihre Firewall anpassen

Viele Unternehmen haben **keinen eingeschränkten Internetzugriff** und können den **pascom Server** daher **sofort**, ohne jede Anpassung an der Firewall **nutzen**.

Wenn Sie jedoch genau festlegen auf welche Internetdienste Ihr Unternehmensnetzwerk zugreifen darf, schalten Sie bitte folgende Ports in Ihrer Firewall frei, um einen reibungslosen Betrieb der [pascom Telefonanlage](https://www.pascom.net/de/voip-telefonanlage/ "pascom VoIP Telefonanlage") zu ermöglichen:



{{% tabs %}}
{{% tab "Cloud" %}}
![Port Übersicht Cloud](port_overview_cloud.png)


| Port | Funktion | Gerät | Quelle |Ziel|
| ---- | ---- | ------------ |---|---|
|5061/TCP|SIP-Verbindung|<i class="fas fa-desktop"></i>  <i class="fas fa-phone"></i>  <i class="fas fa-mobile-alt"></i>|Ihr Netzwerk|pascom.cloud*|
|30.000-35.000/UDP|RTP-Sprache|<i class="fas fa-desktop"></i>  <i class="fas fa-phone"></i>  <i class="fas fa-mobile-alt"></i>|Ihr Netzwerk|pascom.cloud*|
|636/TCP|LDAPS, Telefonbuch| <i class="fas fa-phone"></i> |Ihr Netzwerk|pascom.cloud*|
|8884/TCP|Telefonprovisionierung| <i class="fas fa-phone"></i> |Ihr Netzwerk|pascom.cloud*|
|80 / 443/TCP|Updates, Push| <i class="fas fa-desktop">  <i class="fas fa-mobile-alt"></i></i> |Ihr Netzwerk|my.pascom.net|
|3478/UDP|Video-Funktionalität| <i class="fas fa-desktop">  <i class="fas fa-mobile-alt"></i></i> |Ihr Netzwerk|pascom.cloud*|
|5222/TCP|Chat| <i class="fas fa-desktop">  <i class="fas fa-mobile-alt"></i></i> |Ihr Netzwerk|pascom.cloud*|
|19302/UDP+TCP|WebRTC - WebClient| <i class="fas fa-video"></i> |Ihr Netzwerk|pascom.cloud*|
|8885/TCP|VPN Tunnel zur PBX| <i class="fas fa-server"></i> |Ihr Netzwerk|pascom.cloud*|

<br/>
#### Legende
<i class="fas fa-server"></i>  =  pascom Server  
<i class="fas fa-desktop"></i>  =  Desktop Client  
<i class="fas fa-mobile-alt"></i>  = Mobile Client  
<i class="fas fa-phone"></i>  =  IP-Telefon  
<i class="fas fa-video"></i>  =  WebClient

| * = Die pascom.cloud kann unterschiedliche IP-Adressen als Ziel haben  


{{% /tab %}}

{{% tab "Onsite" %}}
![Port Übersicht Onsite](port_overview_onsite.png)


| Port | Funktion | Gerät | Quelle | Ziel|
| ---- | ---- | ------------ |---| ---|
|80 / 443/TCP|Lizenzserver|<i class="fas fa-server"></i> |Ihr Netzwerk|my.pascom.net|
|25/TCP|Zugriff zum pascom Mailserver|<i class="fas fa-server"></i> |Ihr Netzwerk|cloudmx1.pascom.net, cloudmx2.pascom.net|
|123/UDP|Zugriff zum Zeitserver (NTP)| <i class="fas fa-server"></i> |Ihr Netzwerk|ntp.pool.org|


<br />

Für einen Zugriff Ihrer Geräte über das Internet in Ihr Netzwerk zur pascom Telefonanlage benötigen Sie die selben Portfreigaben wie bei der Cloud Variante. (bzw. auch bei Subnetzen)


| Port | Funktion | Gerät | Ziel|
| ---- | ---- | ------------ |-----|
|5061/TCP|SIP-Verbindung|<i class="fas fa-desktop"></i>  <i class="fas fa-phone"></i>  <i class="fas fa-mobile-alt"></i>|Ihr Netzwerk|
|30.000-35.000/UDP|RTP-Sprache|<i class="fas fa-desktop"></i>  <i class="fas fa-phone"></i>  <i class="fas fa-mobile-alt"></i>|Ihr Netzwerk|
|636/TCP|LDAPS, Telefonbuch| <i class="fas fa-phone"></i> |Ihr Netzwerk|
|8884/TCP|Telefonprovisionierung| <i class="fas fa-phone"></i> |Ihr Netzwerk|
|80 / 443/TCP|Updates, Push| <i class="fas fa-desktop">  <i class="fas fa-mobile-alt"></i></i> |my.pascom.net|
|3478/UDP|Video-Funktionalität| <i class="fas fa-desktop">  <i class="fas fa-mobile-alt"></i></i> |Ihr Netzwerk|
|5222/TCP|Chat| <i class="fas fa-desktop">  <i class="fas fa-mobile-alt"></i></i> |Ihr Netzwerk|
|19302/UDP+TCP|WebRTC - WebClient| <i class="fas fa-video"></i> |Ihr Netzwerk|
|8885/TCP|VPN Tunnel zur PBX| <i class="fas fa-server"></i> |Ihr Netzwerk|

<br/>
#### Legende
<i class="fas fa-server"></i>  =  pascom Server  
<i class="fas fa-desktop"></i>  =  Desktop Client  
<i class="fas fa-mobile-alt"></i>  = Mobile Client  
<i class="fas fa-phone"></i>  =  IP-Telefon  
<i class="fas fa-video"></i>  =  WebClient

| * = Die pascom.cloud kann unterschiedliche IP-Adressen als Ziel haben  

{{% /tab %}}
{{% /tabs %}}


