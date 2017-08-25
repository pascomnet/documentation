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
    - pascom vorinstalliert
description: pascom unterstützt eine Vielzahl an unterschiedlichen Servern / Appliances für jede Betriebsgröße
toc: true

---

## pascom Server

Informationen zu unserer VoIP-Hardware-Lösung [hier](https://www.pascom.net/de/mobydick-classic/).

## Standard Server-Hardware

pascom basiert auf einem aktuellen Standard-Linux-Kernel und ist daher zu allen aktuellen x86-Servern kompatibel. Auf Systemen mit z. B. exotischen Raid-Controllern kann es sein, dass sich pascom nicht installieren lässt. Im Zweifel laden Sie sich bitte ein pascom Installations-ISO herunter und testen das Setup auf Ihrer Zielhardware.


*Allgemeine Systemvoraussetzungen:*

|Benutzer:|< 10|< 50|< 250|< 500|< 1000|
|---|----|---|---|---|---|
|**CPU(x86)**|AMD G series|Intel Atom|Intel Celeron|Intel XEON|2x Intel XEON|
|**RAM** |1 GB |2 GB|	4 GB |8 GB |16 GB|
|**Festplatte\***|16 GB|32 GB|64 GB|128 GB|256 GB|

**\*** Die Berechnung der Festplattenkapazität geht von einer durchschnittlichen Nutzung aus. Insbesondere die Mitschnitte von Gesprächen können Ihren Platzbedarf massiv beeinflussen. Rechnen Sie hier bitte mit 1 MB Platzbedarf pro 10 Minuten Gesprächsmitschnitt zusätzlich.  


## Virtuelle Maschinen
pascom ist für den Betrieb in virtuellen Maschinen optimiert. Dabei fahren wir Integrationstests für folgende Systeme:

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
|**Festplatte \***|16 GB|32 GB|64 GB|128 GB|256 GB|

**\*** Die Berechnung der Festplattenkapazität geht von einer durchschnittlichen Nutzung aus. Insbesondere die Mitschnitte von Gesprächen können Ihren Platzbedarf massiv beeinflussen. Rechnen Sie hier bitte mit 1 MB Platzbedarf pro 10 Minuten Gesprächsmitschnitt zusätzlich.  
