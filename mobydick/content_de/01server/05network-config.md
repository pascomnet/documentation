---
title: Netzwerk planen und konfigurieren
keywords:
    - Integration in bestehendes Firmennetzwerk
    - Netzwerk konfigurieren
    - Netzwerkinfrastruktur
    - Telefon- und Firmennetzwerken
description: Es gibt mehrere Möglichkeiten wie Sie mobydick in Ihr Netzwerk integrieren können.
url:  /server/netzwerk-konfigurieren/
prev: /server/lizenzen-verwalten/
next: /server/dienste/
weight: 15
toc: true

---

## Netzwerkinfrastruktur planen ##

Bevor Sie mobydick in Betrieb nehmen und Telefone anschließen sollte Sie sich Gedanken darüber machen, wie mobydick in Ihrem schon bestehenden Netzwerk eingebunden werden soll. Dabei stehen folgende Möglichkeiten zur Verfügung:

### Integration der mobydick in das bestehende Firmennetzwerk ###

Vor allem in kleineren und mittleren Netzwerken kann mobydick direkt in die bestehende Netzwerkstruktur integriert werden. Dadurch sind nur geringe Anpassungen der vorhandenen IT-Umgebung erforderlich. Ein vorhandener DHCP-Server kann hierbei von mobydick und den angeschlossenen Endgeräten mitbenutzt werden (siehe DHCP-Server-Konfiguration). Alternativ konfigurieren Sie mobydick als DHCP-Server für das gesamte Netzwerk.

{{% notice info %}}
Nahezu alle von der mobydick unterstützen IP-Telefone haben einen eingebauten Switch. Um Steckplätze an Ihrem Switch und Verkabelung zu sparen, kann daran ein Arbeitsplatzrechner oder ein weiteres IP-Endgerät angeschlossen werden. Lesen Sie dazu die Herstellerspezifikation Ihrer IP-Endgeräte.
{{% /notice %}}

### Trennung von Telefon- und Firmennetz ###

Für größtmögliche Flexibilität und Betriebssicherheit wird mobydick in einem vom Firmennetzwerk getrennten Telefonnetzwerk betrieben. Diese Netzwerkarchitektur bring zahlreiche Vorteile mit sich:

* Probleme mit der Bandbreitenzuteilung (Quality of Service) und Konflikte mit bereits vorhandenen Netzwerkdiensten werden vermieden; insbesondere wird der Telefonverkehr nicht durch Auslastungsspitzen des Firmennetzwerkes beeinträchtigt.
* Zugriffe auf das Telefonnetzwerk können durch eine Firewall kontrolliert werden.
* Da mobydick einen integrierten DHCP-Server für das Telefonnetzwerk bereitstellen kann, sind keine Anpassungen des DHCP-Dienstes im Firmennetzwerk erforderlich.
* In einem getrennten Telefonnetzwerk können IP-Telefone mittels eines PowerOverEthernet(PoE)-fähigen Switch zentral mit Strom versorgt werden (lesen Sie dazu die Herstellerspezifikation Ihrer IP-Endgeräte). Durch die Absicherung des Switch und der Telefonanlage per Notstromversorgung kann dadurch auch bei Stromausfall weiter telefoniert werden.

{{% notice info %}}
Zu administrativen Zwecken sollte ein Zugriff auf das Telefonnetzwerk ermöglicht werden, um sowohl mobydick als auch ggf. die angeschlossenen Endgeräte über das Netzwerk konfigurieren zu können.
{{% /notice %}}

#### Trennung über Schnittstellen der mobydick ####

Zur Trennung des Firmen- und Telefonnetz können zwei Netzwerkschnittstellen der mobydick konfiguriert werden. Die Telefonanlage erhält in beiden Netzten je eine IP-Adresse und kann dadurch gleichermaßen mit den Telefonen im Telefonnetz sowie mit den Arbeitsstationen (z. B. zur Verwendung des mobydick Clients) im Firmennetz kommunizieren.  
Als DHCP-Server im Telefonnetz wird der mobydick eigene verwendet.

#### Trennung über ein Gateway ####
Alternativ können Sie ein bereits vorhandenes Sicherheitsgateway benutzen, um das Telefonnetzwerk anzubinden. Alle Aufgaben des Routings und der Filterung übernimmt in diesem Fall Ihre vorhandene Firewall.


## Konfiguration des DHCP-Servers ##

mobydick benötigt einen DHCP-Server um an die angeschlossenen IP-Telefone IP-Adressen und eine Provisionierungs-URL zu verteilen. Hierzu können Sie den in der mobydick integrierten DHCP-Server verwenden oder Ihren bereits vorhandenen DHCP-Server weiterhin nutzen.

### mobydick DHCP-Server ###

Die Nutzung des mobydick DHCP-Server hat mehrere Vorteile:

* Der Konfigurationsserver wird bereits automatisch an die Telefone übergeben.
* Wenn man in mobydick einem Telefon eine feste IP zuweist wird die Reservierung direkt in den DHCP-Server eingetragen.
* Der DHCP-Server kann so eingestellt werden, dass er nur an die zu provisionierenden Telefone IP-Adressen vergibt und alle anderen Anfragen ignoriert.

Den mobydick DHCP-Server können Sie im WEB-UI akivieren unter `Appliance` > `Dienste` > im Tab `DHCP-Server`.  
Zunächst muss der DHCP-Server aktiviert werden, dabei gibt es folgende Möglichkeiten

|Status|Beschreibung|
|---|---|
|**ja**|Es werden IP-Adressen für das ausgewählte Netzwerk vergeben|
|**ja, nur Telefone**|Es werden IP-Adressen für das ausgewählte Netzwerk und nur für dir von der mobydick provisionierten IP-Endgeräte. vergeben|
|**nein**|DHCP-Server ist deaktiviert|

|Weitere Einstellungen:||
|---|---|
|von Bereich... bis Bereich|Definieren den Pool an IP-Adressen der an die Geräte vergeben wird. Der DHCP Server beginnt dabei mit der letzten IP-Adresse des Pools.|
|Domain-Name, Domain-Name-Server, Gateway |Parameter die an das anfragende Gerät weitergegeben werden.|

### Windows DHCP-Server nutzen###

Beim Windows DHCP-Server oder anderen DHCP Servern die diesem Optionsschema folgen müssen Sie die DHCP-Option 66 und ggf. die Option 67 setzen, wobei Sie bitte 192.168.1.1 im Folgenden durch die IP-Adresse Ihrer mobydick ersetzen.

|Telefonhersteller|Option 66|Option 67|
|---|---|---|
|Snom|http://192.168.1.1/provisioning/{mac}||
|Yealink|http://192.168.1.1/provisioning||
|Grandstream|http://192.168.1.1/provisioning||
|Auerswald|http://192.168.1.1/provisioning|\<MACADR\>|
|Aastra/Mitel|http://192.168.1.1/provisioning||
|Siemens OpenStage|http://192.168.1.1/provisioning||

Es ist auch möglich den mobydick DHCP und den Windows DHCP im selben Netz zu betreiben. Hierbei vergibt die mobydick die IP-Adressen und Konfigurationsserver Optionen für die Telefone, Windows vergibt IP-Adressen an alle anderen Geräte. Hierzu muss man dem Windows DHCP so einstellen, dass er die Anfragen von den IP-Telefonen verweigert. Jede MAC-Adresse hat einen herstellerspezifischen Teil (die sechs ersten Zeichen), der auf dem Windows DHCP-Server unter **Filter** in der Tabelle **Verweigern** eingetragen werden muss.

|Telefonhersteller|MAC-Adresse|
|---|---|
|Snom|00-04-13-\*-\*-\*|
|Yealink|00-15-65-\*-\*-\*|
|Grandstream|00-0B-82-\*-\*-\*|
|Aastra|00-08-5D-\*-\*-\*|
|Auerswald|00-09-52-\*-\*-\*|
|Siemens OpenStage|00-01-E3-\*-\*-\* <br> 00-1A-E8-\*-\*-\*|

### Linux DHCP-Server nutzen###

Unter Linux heißt die Option 66 tftp-server-name und die Option 67 filename. Durch diese Option wird dem anfragendem Telefon mitgeteilt wo es sich seine Konfiguration herunterladen soll. Entnehmen Sie die Werte aus Folgender Tabelle, wobei Sie bitte 192.168.1.1 durch die IP-Adresse Ihrer mobydick ersetzen.

|Telefonhersteller|tftp-server-name|filename|
|---|---|---|
|Snom|http://192.168.1.1/provisioning/{mac}||
|Yealink|http://192.168.1.1/provisioning||
|Grandstream|http://192.168.1.1/provisioning||
|Auerswald|http://192.168.1.1/provisioning|\<MACADR\>|
|Aastra/Mitel|http://192.168.1.1/provisioning||
|Siemens OpenStage|http://192.168.1.1/provisioning||

Ergänzen Sie in der Linux DHCP-Konfig einfach folgende Zeile (hier als Beispiel für Yealink):

    option tftp-server-name "http://192.168.1.1/provisioning/";


## Konfiguration der Netzwerkschnittstellen ##

Die Netzwerkkonfiguration befindet sich unter `Appliance` > `Netzwerkschnittstellen`.
Diese Liste gibt eine Übersicht über alle vorhandenen Netzwerkschnittstellen, egal ob diese bereits konfiguriert wurden oder nicht.

### Konfiguration einer Netzwerkschnittstelle ändern ###

Markieren Sie die gewünschte Netzwerkschnittstelle mit einem Häkchen (Mehrfachauswahl ist auch möglich) und klicken Sie auf `Bearbeiten`. Folgende Modi stehen hier zur Verfügung:

|Modus|Erklärung|
|---|---|
|DHCP|Die Netzwerkschnittstelle ist als DHCP-Client eingestellt und bezieht sich eine IP-Adresse von Ihrem DHCP-Server|
|STATISCH|Die Netzwerkschnittstelle erhält eine feste IP-Adresse. Sie müssen die **IP-Adresse** und die **Netzmaske** eingeben und bei Bedarf ein **Gateway**|
|DEAKTIVIERT|Deaktiviert diese Netzwerkschnittstelle.|

{{% notice warning %}}
Änderungen an den Netzwerkeinstellungen führen nach Anwenden der Konfiguration zum Abbruch aller aktiven Gespräche.
{{% /notice %}}

### Virtuelle Schnittstelle hinzufügen ###

{{% notice note %}}
Es können nur virtuelle Schnittstellen (VLANs) hinzugefügt werden. Alle vorhandenen physikalischen Schnittstellen werden automatisch aufgelistet und müssen somit nicht hinzugefügt werden.
{{% /notice%}}

Um ein VLAN hinzuzufügen klicken Sie auf `Hinzufügen`
