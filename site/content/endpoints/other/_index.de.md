---
title: Generische SIP-Endgeräte
description: So binden Sie SIP-Engeräte, nicht offiziell unterstützer Hersteller in die pascom ein
weight: 100
---

{{< doctype "both"  >}}

{{< description >}}

{{% notice warning %}}
Bitte beachten Sie, dass Ihnen das pascom Support Team bei der Einbindung nicht unterstützer Telefone keine Hilfestellung leisten kann. Wenden Sie sich daher bei Fragen bitte direkt an unser [Forum](https://www.pascom.net/forum). 
{{% /notice %}}

## Einschränkungen

Nicht unterstützte Telefone können vom pascom Server weder automatisch konfiguriert werden noch steht am Endgerät das pascom Menü zur Verfügung.
Die Fernsteuerung via pascom Client ist nur eingeschränkt möglich. 

## Voraussetzungen des Engerätes 

Um ein SIP-Endgerät am pascom Server betreiben zu können sind folgende Funktionen notwendig:

* **SIP via TCP/TLS** (verschlüsseltes Signaling)
* **SRTP** (verschlüsselte Gesprächsdaten)
* **Outbound-Proxy** (senden der Daten via Session Border Controller)

## Neue Basiskonfiguration erstellen

Um die Provisionierung zu vereinfachen erstellen Sie sich eine neue Basiskonfiguration für Ihr SIP-Endgerät. Gehen Sie dazu auf der pascom WEB GUI auf {{< ui-button "Endgeräte" >}} > {{< ui-button "Basis-Konfigurationen" >}}

{{% notice tip %}}
Mit der pascom Version 19.03 gibt es eine neue Basiskonfiguration **Empty Generic Profile**
{{% /notice %}}

Duplizieren Sie die Basiskonfiguration **Empty Generic Profile** und geben Ihr eine Bezeichnung z.B. Meine Siemens Geräte. Markieren Sie die neue Basiskonfiguration und klicken auf 
{{< ui-button "Bearbeiten" >}} > {{< ui-button "Konfiguration" >}}.

Nachfolgenden Code-Teil können Sie natürlich zusätzlich anpassen. 

```
{{!-- This is a example template --}}

{{!-- Please clone and overwrite this Profile --}}

{{!-- use regular expression to match a request uri to a template snipped --}}
{{!-- a empty template output (i.e. no if_regex matched) will return a 404 response--}}


{{!-- this "if" block catches request directly to the provisioning url (/) --}}
{{#if_regex "/provisioning/ee[0-9a-f]+/?$" http_path}}
You requested the example generic template.

Please try two other routes:

- append /example.cfg for a example provisioning file
- append /info to the url to see a list of all variables.

{{/if_regex}}

{{!-- requests ending with .cfg (e.g. /y02384.cfg) will be handled here --}}
{{#if_regex "\.cfg$" http_path}}

sip username = {{{013pee_username}}}
sip password = {{{013pee_password}}}
sip host = {{{httpip}}}:5061;transport=tls
sip domain = {{{cs_domain}}}

{{/if_regex}}

{{!-- here, each request ending with /info will be answered --}}
{{#if_regex "/info$" http_path}}

Variables:
----------
{{#each this}}
{{@key}} => {{this}}
{{/each}}

url parameters:
----------
{{#each http_params}}
{{@key}} => {{this}}
{{/each}}

{{/if_regex}}
```
Speichern Sie die neue Basiskonfiguration. 

## Endgerät anlegen

Legen Sie unter {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} ein
neues Gerät vom Typ **IP-Telefon: Hersteller beliebig oder Softphone** an. Wählen Sie nun die erstellte **neue Basiskonfiguration** aus (Meine Siemens Geräte). 

Unter dem Reiter {{< ui-button "Zuweisen" >}} geben Sie dem IP-Endgerät noch einen Benutzer. Abschließend Speichern!

## Jobs Anwenden

Nach dem Speichern von Änderungen erscheint in der Job-Box (oben) ein
entsprechender Eintrag die Telefonie anzuwenden. Starten Sie den Job durch
einen Klick auf den `grünen Haken`.

## Provisionierung am SIP-Endgerät

Markieren Sie das SIP-Endgeräte in der Geräteliste und gehen zu {{< ui-button "Aktion" >}} > {{< ui-button "Provisioning URL" >}} wo Sie sich
die **Provisionierungs-URL** in die Zwischenablage kopieren. 

Jedes SIP-fähige Endgeräte besitzt eine eigene Weboberfläche. Wie Sie dort hin gelangen, entnehmen Sie bitte den Instruktionen des jeweiligen Herstellers.
Die **Provisioning URL** muss meistens in den **Servicing** Einstellungen des Endgeräts bei der Server URL gesetzt werden. Nach Anwenden der Änderungen und 
einem **Neustart/Reboot** des Endgeräts werden automatisch die Einstellungen über die Provisioning URL in das Endgerät übertragen. 


{{% notice tip %}}
Leider nutzen viele Hersteller für die gleiche Einstellung verschiedene
Begrifflichkeiten. Lassen Sie sich davon nicht irritieren. Evtl. müssen Sie
ein wenig experimentieren. In der folgenden Tabelle werden häufige Begriffe
genannt.
{{% /notice %}}


|Einstellung|Beispiel-Wert|Beschreibung|
|---|---|---|
|Registrar, SIP-Server|**pascom**|Der Name der Telefonanlage|
|Proxy, Outbound-Proxy|**pascom.cloud**|DNS-Name oder IP-Adresse des Servers|
|SIP-Port| **TCP 5061** | TLS SIP Port|
|Username, Identity, Authuser|**mein-telefon-name**|Der Geräte-Anmeldename|
|Password|*****| Passwort des Gerätes, nicht des Benutzers!|

#### SIP TLS und SRTP

Lesen Sie im Handbuch des IP-Endgerätes nach wie man SIP TLS und SRTP aktiviert.
Eventuell sind hierfür mehrere Einstellungen nötig.

## Anruf testen

Rufen Sie zum Test mit dem SIP-Endgerät die **\*100**. Hier sollte Sie die
Mailboxansage der pascom hören.
