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

## VPN Gateway einrichten

### Transit-Netzwerk und IP-Adressen

Der pascom VPN Connector baut eine Punkt-zu-Punkt Verbindung zwischen Ihrer pascom Instanz und dem OpenVPN Client auf. Die pascom Instanz hat dabei immer die IP-Adresse 172.16.23.1. Als Transit-Netzwerk wird die 172.16.23.0/24 verwendet. Der OpenVPN Client erhält eine zufällige, jedoch dann persistente (immer gleiche) IP-Adresse aus dem Transit-Netzwerk. Diese IP-Adresse können Sie am OpenVPN Client ablesen und für den Zugriff der pascom Instanz auf lokale Dienste des Clients nutzen.

### eigenen DHCP nutzen

Der pascom VPN Connector baut eine Punkt-zu-Punkt Verbindung zwischen Ihrer pascom Instanz und Ihrem lokalen DHCP Server auf, sodass Sie beispielsweise auch in der pascom Cloud die DHCP-Provsionierung verwenden können.
Die pascom Instanz hat dabei immer die IP-Adresse 172.16.23.1. Als Transit-Netzwerk wird die 172.16.23.0/24 verwendet. 

## Konfiguration

### Transit-Netzwerk ändern (optional)

Falls Sie ein anderes Transit-Netzwerk als 172.16.23.0/24 verwenden möchten können Sie dies in Ihrer Instanz unter {{< ui-button "Appliance" >}} > {{< ui-button "Systemeinstellungen" >}} im Parameter **sys.vpn.transit.network** verändern. 

### pascom Instanz

Loggen Sie sich in die Weboberfläche Ihrer pascom Instanz ein und legen Sie unter {{< ui-button "Gateways" >}} > {{< ui-button "Gatewayliste" >}} mit einem Klick auf {{< ui-button "Hinzufügen" >}} ein neues Gateway vom Typ **"VPN Zugriff"** an.

|Einstellung|Beschreibung|
|---|---|
|Aktiviert|JA: Der VPN Zugriff ist aktiviert.<br/> NEIN: Der VPN Zugriff ist deaktiviert.|
|Bezeichnung|Name der VPN Verbindung|
|Routing|Tragen Sie hier das Netzwerk der Gegenstelle ein, sodass die pascom via VPN auf dieses Netzwerk Zugriff erhält. *Beispiel: 192.168.1.0 255.255.255.0*|
|Server Optionen|Tragen Sie hier optionale Serverkonfigurationen ein, die in der .ccd-Datei enthalten sein sollen.|
|Client Optionen|Tragen Sie hier optionale Clientkonfigurationen ein, die in der .ovpn-Datei enthalten sein sollen.|

Klicken Sie anschließend auf {{< ui-button "Speichern und exportieren" >}} um die OpenVPN-Dateien und Zertifikate herunterzuladen.

Diese können Sie in Ihrem Router einbinden.

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

### Zuverlässigkeit des OpenVPN Client am Windows Server erhöhen

Falls Sie den OpenVPN Client am Windows Server betreiben, kann es vorkommen, dass der VPN Tunnel  nach 24h nicht mehr funktioniert und neugestartet werden muss. Die Verbindung ist zwar noch aktiv, das TAP Interface hat jedoch eine APIPA (169.x.x.x) Adresse und es kann deswegen nicht über den Tunnel kommuniziert werden.

Um die Zuverlässigkeit der Verbindung zu erhöhen, muss die Windows Option "DHCP-Medienerkennung"
eingeschaltet werden.

Prüfen Sie zunächst den Status der Option "DHCP-Medienerkennung" in der Windows Eingabeaufforderung:

```shell
netsh interface ipv4 show global
```

Sollte "DHCP-Medienerkennung" deaktiviert sein, aktivieren Sie diese durch den Befehl:

```shell
netsh interface ipv4 set global dhcpmediasense=enabled
```


