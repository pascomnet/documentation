---
title: pascom VPN Connector
description: Verbinden Sie Ihr lokales Netzwerk via VPN mit Ihrer Instanz in der pascom.cloud oder Ihrem lokalen pascom Server
weight: 10
---

{{< doctype "both"  >}}

{{< description >}}

## Überblick

Mithilfe des pascom VPN Connectors können Sie direkt aus der pascom.cloud auf Dienste aus Ihrem lokalen Netzwerk zugreifen. Dies kann notwendig sein, um beispielsweise Benutzer gegen Ihren lokal installierten Active Directory Server zu authentifizieren oder turnusmäßig Kundendaten aus Ihrem ERP- oder CRM-System in das pascom Telefonbuch zu importieren.

Diese Funktion steht Ihnen auch zur Verfügung, wenn Sie den pascom Server vor Ort nutzen und beispielsweise auf Daten aus einem anderen Standort zugreifen möchten.

{{%notice tip%}}
Da pascom einen eigenen Session Border Controller für mobile Anwender mit sich bringt, ist der VPN Connector für deren Anbindung unnötig und ungeeignet.
{{%/notice%}}

### Transit-Netzwerk und IP-Adressen

Der pascom VPN Connector baut eine Punkt-zu-Punkt Verbindung zwischen Ihrer pascom Instanz und dem OpenVPN Client auf. Die pascom Instanz hat dabei immer die IP-Adresse 172.16.23.1. Als Transit-Netzwerk wird die 172.16.23.0/24 verwendet. Der OpenVPN Client erhält eine zufällige, jedoch dann persistente (immer gleiche) IP-Adresse aus dem Transit-Netzwerk. Diese IP-Adresse können Sie am OpenVPN Client ablesen und für den Zugriff der pascom Instanz auf lokale Dienste des Clients nutzen.

## Konfiguration

### Transit-Netzwerk ändern (optional)

Falls Sie ein anderes Transit-Netzwerk als 172.16.23.0/24 verwenden möchten können Sie dies in Ihrer Instanz unter **Appliance** > **Systemeinsttellungen** im Parameter **sys.vpn.transit.network** verändern. 

### pascom Instanz

Loggen Sie sich in die Weboberfläche Ihrer pascom Instanz ein und legen Sie unter **Gateways** > **Gatewayliste** via **Hinzufügen** einen neuen **VPN Zugriff** an.

Geben Sie dem VPN Connector eine **Bezeichnung** und laden Sie die Konfiguration via **Speichern und exportieren** herunter.

### OpenVPN Client

Der pascom VPN Connector basiert auf OpenVPN. Mit den eben heruntergeladenen Daten können Sie einen beliebigen OpenVPN Client aufsetzen. OpenVPN Clients gibt es für eine Vielzahl von Betriebssystemen und Routern. 

Um beispielsweise auf Ihre lokal installierte Active Directory zugreifen zu können installieren Sie den OpenVPN Client für Windows direkt auf Ihrem Windows Server und bauen die Verbindung zu Ihrer pascom Instanz auf.

### Verbindung testen

Nach erfolgreichem VPN Aufbau sollten Sie in der Lage sein vom OpenVPN Client aus die IP-Adresse der pascom Instanz 172.16.23.1 zu erreichen:

```bash
ping 172.16.23.1

PING 172.16.23.1 (172.16.23.1): 56 data bytes
64 bytes from 172.16.23.1: icmp_seq=0 ttl=63 time=12.053 ms
64 bytes from 172.16.23.1: icmp_seq=1 ttl=63 time=11.945 ms
...
```
