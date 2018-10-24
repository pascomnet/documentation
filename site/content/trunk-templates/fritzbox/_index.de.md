---
title: Fritz!Box
description: So konfigurieren und verwalten Sie Ihr Amt via Fritz!Box richtig
weight: 40
---

{{< doctype "self"  >}}

{{< description >}}

## Übersicht

In folgenden Fällen empfehlen wir die Verwendung der Amt-Einbindung über die Fritz!Box:

* Es wird ein VoIP-Produkt eingebunden, das kein Business-Anschluss ist.
* Die Registrierung der SIP-Accounts zum Provider erfolgen über ein VLAN, in das die pascom nicht gelangen kann.
* Es fehlen Informationen zum VoIP-Produkt, so dass eine direkte Anbindung des SIP-Anschlusses nicht möglich ist.

{{% notice warning %}}
Bei der Verwendung der Fritz!Box ist der Anschluss auf die Benutzung von zwei Sprach-Kanälen aufgrund der Fritz!Box-Firmware beschränkt.
{{% /notice %}}

![Fritz!Box](fritzbox.de.png?width=70%)

Folgende Anleitung wurde unter Verwendung der *Fritz!Box Fon WLAN 7390* mit der Firmware 06.83 erstellt.

## Vorbereitung der Fritz!Box

Zuerst müssen Sie auf der Fritz!Box Accounts anlegen, mit denen sich die pascom bei der Fritzbox registrieren kann.

1. Surfen Sie auf Ihre Fritz!Box.
2. Unter {{< ui-button "Telefonie" >}} > {{< ui-button "Telefoniegeräte" >}} klicken Sie auf {{< ui-button "Neues Gerät einrichten" >}}.
3. Wählen Sie *Telefon (mit oder ohne Anrufbeantworter)*.
4. Wählen Sie im nächsten Schritt *LAN/WLAN (IP-Telefon)* und vergeben Sie einen Namen.
5. Anschließend geben Sie einen *Benutzernamen* und ein *Kennwort* ein. Diese müssen Sie sich merken, da Sie in der pascom benötigt werden.
6. Wählen Sie die Rufnummer Ihres Telefonanschlusses, über die eingehende Gespräche des Accounts geführt werden sollen.
7. Nun muss die Nummer für ausgehende Rufe gewählt werden. Wählen Sie hier die Nummer, die Sie davor für eingehende Rufe ausgewählt haben.
8. Im letzen Schritt übernehmen Sie die Einstellungen. Falls dies der erste Account ist, den Sie in dieser Session einrichten, müssen bestätigen, dass Sie befugt sind diese Änderung vorzunehmen. Gehen Sie zu Ihrer Fritz!Box und drücken Sie eine beliebige Taste.
9. In der Übersicht Ihrer Telefonie-Geräte sehen Sie die interne Nummer des Account (z. B. \**620). Diese Durchwahl müssen Sie sich ebenfalls merken.


## pascom Amt einrichten

### Amt-Vorlage befüllen

Fügen Sie ein neues Fritz!Box-Amt ein unter {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}} > {{< ui-button "Hinzufügen" >}}. Sie gelangen nun zur Ämter-Datenbank. Über den Filter können Sie direkt nach *fritz* suchen und die Vorlage anschließend auswählen. Befüllen Sie die Vorlage mit den auf der Fritz!Box eingestellten Account-Daten.

![Fritz!Box Account](fritzbox_account.de.png?width=80%)

Über die Vorlage können Sie erstmal drei Accounts anlegen.

|Variable|Beschreibung|
|---|---|
|**Bezeichung**|Geben Sie Ihrem Amt einen Namen, dieser taucht dann in der Ämterliste auf.|
|**Host**|Geben Sie hier den Registrar ein.|
|**Benutzername Leitung X**|Der Benutzername des Accounts, den Sie auf der Fritz!Box Angelegt haben.|
|**Passwort Leitung X**|Das zur Leitung gehörige Passwort.|
|**Durchwahl für Leitung X**|Die  zur Leitung gehörige Durchwahl, die die Fritz!Box Ihrer Leitung beim Anlegen vergeben hat.|
|**Internationale Vorwahl**|Geben Sie hier die internationale Vorwahl an. Z. B. 00|
|**Nationale Vorwahl**|Geben Sie hier die nationale Vorwahl an. Z. B. 0|
|**Länderkennung**|Tragen Sie die Länderkennung Ihres Anschlusses ein. Z. B. 49 für Deutschland.|
|**Ortskennzahl**|Tragen Sie die Ortskennzahl bzw. Ortsvorwahl ohne führende 0 ein.  Z. B. 89 für München|
|**Präfix. eing. Nummer**|Ist eine beliebige Ziffer, die bei eingehenden Telefonanrufen über dieses Amt vorangestellt wird. Wenn Sie hier eine 0 eingeben erscheint beispielsweise in der Anruferliste von IP-Telefonen dann nicht die 0172123123 sondern die 00172123123. Dadurch können Sie direkt aus der Anruferliste wieder über das selbe Amt zurückrufen.|


### Rufregeln Anpassen

Die Vorlage geht davon aus, dass die Durchwahlen auf der Fritz!Box mit den Durchwahlen auf der pascom übereinstimmen. Sollte das nicht der Fall sein, müssen Sie dies unter {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}} > Amt auswählen > {{< ui-button "Bearbeiten" >}} in den Tabs {{< ui-button "Eingehende Rufe" >}} und {{< ui-button "Ausgehende Rufe" >}} anpassen.

|Eingehende Rufe||
|---|---|
|Ziel|Das ist die Durchwahl auf der Fritz!Box (z. B. 620, 621...)|
|Durchwahl|Das ist die Durchwahl, auf die bei einem eingehenden Anruf abgeworfen wird. Das kann ein Benutzer, ein Team, etc. sein.|

|Ausgehende Rufe||
|---|---|
|Quelle|Das ist die Durchwahl des Benutzers der einen Anruf starten möchte|
|CIDNummer|Das ist die Durchwahl auf der Fritz!Box (z. B. 620, 621...)|
|Account|Hier muss der Account ausgewählt werden, dem die CIDNummer auf der Fritz!Box zugeordnet ist.|


### Weitere Accounts einrichten

Möchten Sie eine weitere Fritz!Box-Nummer anlegen fügen Sie diese unter dem aktuellen Amt im Tab {{< ui-button "Accounts" >}} ein. Da die grundsätzlichen Einstellungen die gleichen sind, können Sie den schon angelegten Account verwenden. Markieren Sie diesen mit einem Klick und klicken Sie anschließend auf den Button {{< ui-button "Duplizieren" >}}. In der neuen Account-Zeile können Sie nun die Felder *Benutzername*, *Passwort*, und *Durchwahl reg.* anpassen.

Legen Sie anschließend unter {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}} > Amt auswählen > {{< ui-button "Bearbeiten" >}} in den Tabs {{< ui-button "Eingehende Rufe" >}} und {{< ui-button "Ausgehende Rufe" >}} [entsprechende Regeln]({{< ref "/trunks/rules">}}) für den neuen Account an.
