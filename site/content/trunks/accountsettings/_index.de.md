---
title: Account Einstellungen
description: In den Account Einstellungen legen Sie fest, mit welchen Daten sich das Amt bei den Servern des Provider registrieren soll. Zusätzlich lassen sich hier weitere Attribute setzen. 
weight: 30
---

{{< doctype "both"  >}}

{{< description >}}

## Die Account Einstellungen

Zu den Account Daten Ihres Amts gelangen Sie über {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}} > {{< ui-button "Bearbeiten" >}}. Im Register **Account** finden Sie die Datensätze Ihres Registrar. Diese können Sie nach belieben verändern.

### Durchwahl registrierien

![Durchwahl registrieren](extension_reg.de.JPG?width=15%)



|Variable|Erklärung|
|---|---|
|**Durchwahl reg.**|Hier teilen Sie dem Host mit welche Durchwahl ein eingehender Anruf auf Ihrer Seite rufen soll. Dies ist notwendig wenn der Benutzer-SIP-Account genau eine Nummer zur Verfügung stellt. Nutzen Sie jedoch einen SIP-Anlagenanschluss (z. B: sipgate trunking) geben Sie hier nichts an, da die gerufene Durchwahl jeweils separat übermittelt wird.|

{{% notice tip %}}
Nutzen Sie einen Anschluss, der mehrere einzelne Rufnummern beeinhaltet, müssen Sie für jede Rufnummer einen eigenen Datensatz unter {{< ui-button "Hinzufügen" >}} anlegen, damit sich jede Rufnummer beim Provider registrieren kann. 
{{% /notice %}}

### Benutzername

![Benutzername](username.de.JPG?width=15%)

|Variable|Erklärung|
|---|---|
|**Benutzername**|Der Benutzername wird je nach Amt-Typ dazu verwendet um sich damit entweder<br> * an der Gegenstelle (dem Host) zu registrieren (Typ: *User*)<br> * oder ist der Name mit dem sich eine Gegenstelle bei der pascom registriert (Typ *Peer*).<br>Wird der Typ auf *Friend* gesetzt werden zwei Datensätze angelegt und das Passwort wird sowohl für User und Peer genutzt.<br><br> Je nach Account kann auch die Rufnummer für die Authentifizierung genutzt werden.|

### Passwort

![Passwort](password.de.JPG?width=10%)

|Variable|Erklärung|
|---|---|
|**Passwort**|Ist, falls benötigt, das zum Benutzer gehörende Passwort.|

### Host

![Host](host.de.JPG?width=15%)

|Variable|Erklärung|
|---|---|
|**Host**|Hier tragen Sie die IP-Adresse oder den Hostnamen der Gegenstelle ein, an der sich der Account registrieren muss.|

### Optionen

![Optionen](options.de.JPG?width=20%)

|Variable|Erklärung|
|---|---|
|**Optionen**|Dieses Feld bietet die Möglichkeit weitere SIP-Optionen (eine Option pro Zeile), die von Asterisk verstanden werden, anzugeben.|

{{% notice tip %}}
Einen Überblick über SIP-Optionen finden Sie hier: [SIP Configurations - peers and clients](http://www.voip-info.org/wiki/view/Asterisk+config+sip.conf#SIPconfigurationspeersandclients)
{{% /notice %}}

### Registrierung

![Register](register.de.JPG?width=10%)

|Variable|Erklärung|
|---|---|
|**Registrierung**|Wählen Sie *Ja* oder *Nein*, je nachdem ob sich die pascom beim Host anmelden muss oder nicht.|

### Port

![Port](port.de.JPG?width=7%)

|Variable|Erklärung|
|---|---|
|**Port**|Als Standard wird der Port *5060* verwendet. Soll ein anderer verwendet werden, können Sie diesen hier eintragen.|

### Rufnummern Ermittlung

![Rufnummern Ermittlung](numberdetermination.de.JPG?width=15%)

|Variable|Erklärung|
|---|---|
|**Rufnummer-Ermittlung**|Hier können Sie einstellen woher die Zielrufnummer ermittelt werden soll. Standardmäßig greift hier die Ämterautomatik, sodass der Trunk eine automatische Rufnummern-Ermittlung durchführen kann. Mögliche Einstellungen: <br> * *Request-URI*<br> * *To-Header*<br> * *AUTO*|

### Rufnummern Übermittlung

![Rufnummern Übermittlung](numberpresentation.de.JPG?width=15%)

|Variable|Erklärung|
|---|---|
|**Rufnummern-Übermittlung**|Die Rufnummern-Übermittlung (CLIP) ist ein Leistungsmerkmal, welches die Übermittlung von Rufnummern bei ausgehenden Rufen ermöglicht. Standardmäßig greift hier die Ämterautomatik, sodass der Trunk eine automatische Rufnummern-Übermittlung durchführen kann. Mögliche Einstellungen: <br> * *AUTO*<br> * *FROM*<br> * *PPI*<br> * *PAI*|

### Rufnummern Unterdrückung

![Rufnummern Unterdrückung](numberrestriction.de.JPG?width=15%)

|Variable|Erklärung|
|---|---|
|**Rufnummern-Unterdrückung**|Die Rufnummer-Unterdrückung (CLIR) ist ein Leistungsmerkmal, welches die Unterdrückung von Rufnummern bei ausgehenden Rufen ermöglicht. Standardmäßig greift hier die Ämterautomatik, sodass der Trunk eine automatische Rufnummern-Unterdrückung durchführen kann. Mögliche Einstellungen: <br>* *AUTO*<br> * *FROM*<br> * *Privacy-ID*|