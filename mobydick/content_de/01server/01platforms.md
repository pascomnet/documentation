---
url: /server/plattformen/
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
![mobydick miniAppliance](/mobydick_mini_appliance_front.png?width=200px)
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
![mobydick Appliance](/mobydick_appliance.jpg)

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
![Patton SNOGA Appliance](/mobydick_snoga.gif)
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
![vmware Logo](/vm_vmware.jpg)
{{% /col %}}
{{% col md-2 %}}
![hyperV Logo](/vm_hyperv.png)
{{% /col %}}
{{% col md-1 %}}
![Virtualbox Logo](/vm_virtualbox.png)
{{% /col %}}
{{% col md-2 %}}
![kvm Logo](/vm_kvm.png)
{{% /col %}}
{{% col md-2 %}}
![xen Logo](/vm_xen.png)
{{% /col %}}
{{% col md-2 %}}
![proxmox Logo](/vm_proxmox.png)
{{% /col %}}
{{% /row %}}


*Allgemeine Systemvoraussetzungen:*

|   |< 10 Benutzer|< 50 Benutzer|< 250 Benutzer|< 500 Benutzer|< 1000 Benutzer|
|---|---|---|---|---|---|
|**CPU (x86)**|1 Core| 1 Core|1 Core| 2 Core|4 Core|
|**RAM**|1 GB|2 GB |4 GB|8 GB|16 GB|
|**Festplatte\***|16 GB|32 GB|64 GB|128 GB|256 GB|

**\*** Die Berechnung der Festplattenkapazität geht von einer durchschnittlichen Nutzung aus. Insbesondere die Mitschnitte von Gesprächen können Ihren Platzbedarf massiv beeinflussen. Rechnen Sie hier bitte mit 1 MB Platzbedarf pro 10 Minuten Gesprächsmitschnitt zusätzlich.  
