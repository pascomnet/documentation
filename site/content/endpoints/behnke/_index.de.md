---
title: Behnke Türsprechstelle
description: So binden Sie die Behnke Türsprechstelle in die pascom Telefonanlage ein
weight: 10
---

{{< doctype "self"  >}}

{{< description >}}


## Einschränkungen

Die Türsprechstelle von Behnke kann vom pascom Server nicht automatisch konfiguriert werden.
Die Fernsteuerung via pascom Client ist nur eingeschränkt möglich. 

### Voraussetzungen des Engerätes 

Um ein SIP-Endgerät am pascom Server betreiben zu können sind folgende Funktionen notwendig:

* **SIP via TCP/TLS** (verschlüsseltes Signaling)
* **SRTP** (verschlüsselte Gesprächsdaten)
* **Outbound-Proxy** (senden der Daten via Session Border Controller)

## Vorbereitung und Zugangsdaten

{{% notice tip %}}
Leider nutzen viele Hersteller für die gleiche Einstellung verschiedene
Begrifflichkeiten. Lassen Sie sich davon nicht irritieren. Evtl. müssen Sie
ein wenig experimentieren. In der folgenden Tabelle werden häufige Begriffe
genannt.
{{% /notice %}}


|Einstellung|Beispiel-Wert|Beschreibung|
|---|---|---|
|Registrar, SIP-Server|**pascom**|Der Name des Gerätes|
|Proxy, Outbound-Proxy|**pascom.cloud**|DNS-Name oder IP-Adresse des Servers|
|SIP-Port| **TCP 5061** | TLS SIP Port|
|Username, Identity, Authuser|**mein-endgeräte-name**|Der Geräte-Anmeldename|
|Password|*****| Passwort des Gerätes, nicht des Benutzers!|



## Benutzer für die Behnke Türsprechstelle anlegen

Die Behnke Türsprechstelle benötigt einen Benutzer welche eine interne Durchwahl besitzt, um die Türsprechstelle anzusteuern. Gehen Sie auf der pascom Admin-Weboberfläche auf {{< ui-button "Benutzer" >}} > {{< ui-button "Benutzerliste" >}} und klicken Sie auf {{< ui-button "Hinzufügen" >}}.

Füllen Sie die vordefinierten Felder mit Ihren Daten aus.

![Neuer Benutzer für Behnke Türsprechstelle](newuser.de.PNG?width=80%)

## Jobs Anwenden

Nach dem Speichern von Änderungen erscheint in der Job-Box (oben) ein
entsprechender Eintrag die Telefonie anzuwenden. Starten Sie den Job durch
einen Klick auf den `grünen Haken`, damit die Änderungen in die Datenbank 
übernommen werden. 


## Neues Endgerät anlegen

Legen Sie unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} ein
neues Gerät vom Typ **Generic SIP Phone** an.  

Vergeben Sie hier einen **"Geräte-Anmeldenamen"** und ein **"Password"** für die Sprechstelle. Im Eingabefeld **"SIP-Optionen"** müssen folgende Optionen eingetragen werden. 

**disallow=all**  
**allow=alaw:20**  

{{% notice tip %}}
Der hier vergebene **"Geräte-Anmeldename"**, sowie das vergebene **"Password"** werden später in der Sprechstelle eingetragen.
{{% /notice %}}

![Neues Behnke Endgerät anlegen](newendpoint.de.PNG?width=80%)

Unter dem Reiter {{< ui-button "Zuweisen" >}} geben Sie dem IP-Endgerät noch den im Vorfeld **angelegten Benutzer**. Abschließend Speichern und den Job der Telefoniekonfig anwenden!

## Behnke Türsprechstelle konfigurieren

Um die Sprechstelle von Behnke zu konfigurieren, nutzen Sie bitte die Anleitung vom Hersteller.

[Behnke Anleitung PDF](https://www.behnke-online.de/telefonanlagen/540-pascom-cloud-anlage/file)
