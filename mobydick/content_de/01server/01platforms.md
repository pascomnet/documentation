---
url: /server/plattformen/
linked: /server/
prev:  /server/
next:   /server/server-installieren/
weight: 11
title: Plattformen und Systemvoraussetzungen
keywords:
    - Server
    - Appliances
    - voip Appliances
    - voip ready
    - mobydick vorinstalliert
description: mobydick unterstützt eine Vielzahl an unterschiedlichen Servern / Appliances für jede Betriebsgröße
toc: true
lang: de

---

## mobydick Server


### mobydick miniAppliance

{{% row %}}
{{% col md-6 %}}
Hersteller: PC-Engines  
Empfohlene Benutzeranzahl: max. 15

* 1 GHz Dualcore  
* 2 GB RAM
* 16 GB SSD
* 3 Netzwerkkarten
* Lüfterlos

Die mobydick miniAppliance ist eine reine VoIP-Appliance, kann jedoch per externem Gateway um ISDN- , Analog- und GSM-Ports erweitert werden.

{{% /col %}}

{{% col md-6 %}}
![mobydick miniAppliance](../../images/mobydick_mini_appliance_front.png "mobydick miniAppliance Frontansicht")
{{% /col%}}
{{% /row %}}


### mobydick Appliance

{{% row %}}
{{% col md-6 %}}
Hersteller: beroNet  
Empfohlene Benutzeranzahl: max. 100

* 19‘‘ Aluminium Servergehäuse
* 1 HE, Tiefe 25 cm
* SSD-Festplatte
* Lüfterlos
* stromsparend - Leistung im Betrieb nur 24 W
* 2x Gigabit Ethernet Anschlüsse
* (optional) ISDN BRI(S0)/PRI(E1, S2M) bis zu 8 bzw. 4 Ports
* (optional) Analog bis zu 8 Ports
* (optional) GSM bis zu 4 SIM-Karten

{{% /col %}}

{{% col md-6 %}}
![mobydick Appliance](../../images/mobydick_appliance.jpg "mobydick Appliance von beronet")

{{% /col%}}
{{% /row %}}

### SNOGA

{{% row %}}
{{% col md-6 %}}
Hersteller: Patton  
Empfohlene Benutzeranzahl: max. 250

* Intel Celeron J1900 Quad Core 2.0 GHz Processor
* DDR3L RAM 4GB
* 250 GB HDD
* (optional) ISDN BRI(S0)/PRI(E1, S2M) bis zu 8 bzw. 4 Ports
* (optional) Analog bis zu 8 Ports

{{% /col %}}
{{% col md-6 %}}
![Patton SNOGA Appliance](../../images/mobydick_snoga.gif "mobydick Appliance von Patton")
{{% /col%}}
{{% /row %}}



## Standard Server-Hardware

mobydick basiert auf einem aktuellen Standard-Linux-Kernel und ist daher zu allen aktuellen x86-Servern kompatibel. Auf Systemen mit z. B. exotischen Raid-Controllern kann es sein, dass sich mobydick nicht installieren lässt. Im Zweifel laden Sie sich bitte ein mobydick Installations-ISO herunter und testen das Setup auf Ihrer Zielhardware.


*Allgemeine Systemvoraussetzungen:*

|  |< 10 Benutzer	|< 50 Benutzer	|< 250 Benutzer     |< 500 Benutzer |< 1000 Benutzer|
|---|----|---|---|---|---|
|**CPU(x86)**|AMD G series|Intel Atom|Intel Celeron|Intel XEON|2x Intel XEON|
|**RAM** |1 GB |2 GB|	4 GB |8 GB |16 GB|
|**Festplatte\***|16 GB|32 GB|64 GB|128 GB|256 GB|

**\*** Die Berechnung der Festplattenkapazität geht von einer durchschnittlichen Nutzung aus. Insbesondere die Mitschnitte von Gesprächen können Ihren Platzbedarf massiv beeinflussen. Rechnen Sie hier bitte mit 1 MB Platzbedarf pro 10 Minuten Gesprächsmitschnitt zusätzlich.  



## Virtuelle Maschinen
mobydick ist für den Betrieb in virtuellen Maschinen optimiert. Dabei fahren wir Integrationstests für folgende Systeme:

{{% row %}}
{{% col md-3 %}}
![vmware Logo](../../images/vm_vmware.jpg "vmware Virtualisierung")
{{% /col %}}
{{% col md-2 %}}
![hyperV Logo](../../images/vm_hyperv.png "hyperV Virtualisierung")
{{% /col %}}
{{% col md-1 %}}
![Virtualbox Logo](../../images/vm_virtualbox.png "Virtualbox Virtualisierung")
{{% /col %}}
{{% col md-2 %}}
![kvm Logo](../../images/vm_kvm.png "kvm Virtualisierung")
{{% /col %}}
{{% col md-2 %}}
![xen Logo](../../images/vm_xen.png "xen Virtualisierung")
{{% /col %}}
{{% col md-2 %}}
![proxmox Logo](../../images/vm_proxmox.png "proxmox Virtualisierung")
{{% /col %}}
{{% /row %}}


*Allgemeine Systemvoraussetzungen:*

|   |< 10 Benutzer|< 50 Benutzer|< 250 Benutzer|< 500 Benutzer|< 1000 Benutzer|
|---|---|---|---|---|---|
|**CPU (x86)**|1 Core| 1 Core|1 Core| 2 Core|4 Core|
|**RAM**|1 GB|2 GB |	4 GB            |8 GB           |16 GB          |
|**Festplatte\***|   16 GB       |32 GB          |64 GB	            |128 GB	        |256 GB         |

**\*** Die Berechnung der Festplattenkapazität geht von einer durchschnittlichen Nutzung aus. Insbesondere die Mitschnitte von Gesprächen können Ihren Platzbedarf massiv beeinflussen. Rechnen Sie hier bitte mit 1 MB Platzbedarf pro 10 Minuten Gesprächsmitschnitt zusätzlich.  
