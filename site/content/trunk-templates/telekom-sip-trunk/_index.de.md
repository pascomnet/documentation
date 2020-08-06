---
title: Deutsche Telekom
description: Übersicht zum pascom managed Provider Template von der Deutschen Telekom
weight: 5
---


{{< description >}}

![Deutsche Telekom Provider Logo](deutsche-telekom-logo.png?width=50%)

## Telekom Training Video
 
{{< youtube igfkRY6OGqc >}}

## Übersicht

Informationen über Leistungsmerkmale und Tarife finden Sie [hier](https://geschaeftskunden.telekom.de/startseite/festnetz-internet/tarife/333506/deutschlandlan-sip-trunk.html). Die [pascom Telefonanlage](https://www.pascom.net/de/voip-telefonanlage/ "pascom VoIP-Telefonagen Software") (sowohl Classic als auch Cloud) unterstützt nur Business-Anschlüsse von Telekom.

{{% notice warning %}}
pascom unterstützt die direkte Registrierung des SIP Accounts in der Telefonanlage nur in Verbindung mit dem von der Telekom [empfohlenen Lancom Router](https://geschaeftskunden.telekom.de/startseite/festnetz-internet/tarife/354892/paket-zum-anschluss-einer-ip-telefonanlage.html) für den Anschluss einer IP-Telefonanlage. Alternativ kann die [Registrierung im Router]({{< relref "#einrichtung-via-fritz-box">}}) vorgenommen werden.<br/><br/>
Wenn Sie einen eigenen Router betreiben muss dieser grundsätzlich die gleichen Kriterien erfüllen wie das empfohlene Gerät der Telekom. In diesem Fall übernehmen wir allerdings keinen Support seitens pascom.
{{% /notice %}}

## Unterstützte Nutzungsvarianten
Nutzen Sie die pascom Telefonanlage in der Cloud oder Onsite Vor-Ort in Ihrem Unternehmen? Erfahren Sie in unserer Amtsvorlagenübersicht mehr zu den jeweiligen unterstützen Providern. 

[Übersicht Amtsvorlagen]({{< ref "trunk-templates">}})

## Ihr Account

Nach dem Erwerb und der Freischaltung Ihres Telekom DeutschlandLAN SIP-Trunks erhalten Sie einen Brief mit Ihren Account-Daten, die wie folgt aussehen können:

**Telekom Mehrgeräte-Anschluss**

![Ihre Telekom-Zugangsdaten für einen Mehrgeräte-Anschluss](telekom-access-data-dsl.de.png?width=70%)

Hat mehrere feste Rufnummern.

**Welche Daten können Sie daraus entnehmen?**

+ *Rufnummern*: Sie benötigen nur die Rufnummern zur Einrichtung des Amt

Bei den Zugangsdaten handelt es sich um die Internet-Zugangsdaten.
Diese werden nicht für die Einrichtung des Telekom-Trunks benötigt.


**Telekom SIP-Trunk**


![Ihre Telekom-Zugangsdaten für einen SIP-Trunk mit Rufnummernblock](telekom-access-data.de.png?width=70%)

Hat **eine** Registrierungsrufnummer und einen Rufnummernblock.


+ *Ortsvorwahl*: 0991
+ *Stammnummer*: XXXXXX (aus Datenschutzgründen hier mit XXXXXX dargestellt)
+ *Rufnummernblock*: 0-99, daraus ergeben sich 2-stellige Durchwahlen (Nebenstellen)
+ *Registrierungs-Daten für Ihr Amt*, bestehend aus Telefonie-Benutzername und Telefonie-Passwort
+ *Registrierungsrufnummer*: in diesem Beispiel +49991XXXXXX0

## Einrichtung

Wenn Sie eine Fritz!Box in Ihrem Netzwerk betreiben, können Sie den Telekom-Anschluss direkt dort einrichten. Eine Anleitung dazu finden Sie [hier]({{< relref "#einrichtung-via-fritz-box">}}).
Verwenden Sie keine Fritz!Box richten Sie das Telekom-Amt bitte direkt in der pascom Telefonanlage und *nicht in Ihrem Router* ein.

### Einrichtung in pascom

#### Router vorbereiten

Bevor Sie mit der Einrichtung des Telekom-Amt in der pascom beginnen stellen Sie sicher, dass folgende Einstellungen in Ihrem Router gemacht wurden:

1. SIP-ALG muss **deaktiviert** sein.
2. Das Telekom-Amt darf **nicht** im Router eingerichtet sein, oder muss **deaktiviert** werden.

Haben Sie die genannten Punkte überprüft können Sie mit dem Anlagen des Amts in der WebUI der pascom Telefonanlage fortfahren.

**Beispiel-Einrichtung:**

Folgende Screenshots wurden unter Verwendung des *LANCOM R883VAW (over ISDN)* mit der Firmware 10.00.0170 erstellt.

Die SIP-ALG Einstellungen finden Sie auf der WebUI des LANCOM-Routers unter {{< ui-button "Konfiguration" >}} > {{< ui-button "SIP-ALG" >}} > {{< ui-button "Allgemein" >}}.
Entfernen Sie den Haken bei "SIP-ALG aktivieren".

![LANCOM SIP-ALG Einstellungen](lancom_sip_alg.de.png?width=70%)

Die Amt-Konfiguration finden Sie auf der WebUI des LANCOM-Routers unter {{< ui-button "Konfiguration" >}} > {{< ui-button "Voice Call Manager" >}} > {{< ui-button "Leitungen" >}} > {{< ui-button "SIP-Leitungen" >}}.
Stellen Sie sicher, dass diese Einstellungen leer oder deaktiviert sind.

![LANCOM SIP-Leitungen](lancom_sip_lines.de.png?width=70%)


#### Amt-Vorlage befüllen

Fügen Sie ein neues Telekom-Amt ein unter {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}} > {{< ui-button "Hinzufügen" >}}. Sie gelangen nun zur Ämter-Datenbank. Über den Filter können Sie direkt nach *Telekom* suchen. Wählen Sie die Vorlage *Telekom SIP-Trunk* und befüllen Sie die Vorlage mit den erhaltenen Account-Daten.

|Variable|Beschreibung|
|---|---|
|**Bezeichnung**|Geben Sie Ihrem Amt einen Namen, dieser taucht dann in der Ämterliste auf.|
|**Telefonie-Benutzername**|Entnehmen Sie den Telefonie-Benutzernamen aus Ihren Zugangsdaten.|
|**Telefonie-Passwort**|Tragen Sie hier das dazu gehörige Telefonie-Passwort ein.|
|**Registrierungsrufnummer**|Entnehmen Sie die Registrierungsrufnummer aus Ihren Zugangsdaten.|
|**Ortskennzahl**|Tragen Sie die Ortskennzahl bzw. Ortsvorwahl ohne führende 0 ein. In unserem Beispiel *991*.|
|**Stammnummer**|Basisnummer des Telefonanschlusses ohne Nebenstellen. In unserem Beispiel als *XXXXXX* dargestellt.|
|**Präfix eing. Nummer**|Ist eine beliebige Ziffer, die bei eingehenden Telefonanrufen über dieses Amt vorangestellt wird. Wenn Sie hier eine 0 eingeben erscheint beispielsweise in der Anruferliste von IP-Telefonen dann nicht die 0172123123 sondern die 00172123123. Dadurch können Sie direkt aus der Anruferliste wieder über das selbe Amt zurückrufen.|
|**Anzahl der Durchwahlstellen**|Anzahl der Stellen der Benutzer-Durchwahlen. (NICHT die Anzahl der Nummern im Rufnummernblock!)|
|**Durchwahl Zentrale**|Geben Sie hier an, auf welche interne Durchwahl die erste Nummer Ihres Rufnummernblocks (meistens die 0) abgeworfen werden soll.|

Nach dem {{< ui-button "Speichern" >}} wird das Amt angelegt. Dabei werden automatisch Rufregeln angelegt. Diese können Sie gemäß Ihren Anforderungen und Wünschen konfigurieren. Lesen Sie dazu den Artikel über [Rufregeln]({{< ref "trunks/rules">}}).

#### Passwort ändern

Klicken Sie auf {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}}, wählen Sie Ihr Amt aus und klicken Sie auf {{< ui-button "Bearbeiten" >}}. Im Tab {{< ui-button "Account" >}} in der Spalte {{< ui-button "Passwort" >}} können Sie mit einem Doppelklick auf das gewünschte Feld das Passwort ändern. Bestätigen Sie zunächst die Änderung mit {{< ui-button "Ok" >}} und wenden Sie sie mit {{< ui-button "Speichern" >}} und anschließendem Anwenden der Telefonie-Konfiguration an.

#### Einen weiteren Telekom-SIP-Account hinzufügen

Möchten Sie Ihren Telekom DeutschlandLAN SIP-Trunk-Anschluss um einen weiteren Account erweitern, fügen Sie diesen unter dem aktuellen Amt im Tab {{< ui-button "Accounts" >}} ein. Da die grundsätzlichen Einstellungen die gleichen sind, können Sie den schon angelegten Account verwenden. Markieren Sie diesen mit einem Klick und klicken Sie anschließend auf den Button {{< ui-button "Duplizieren" >}}.
In der neuen Account-Zeile können Sie nun **Benutzername** (entspricht der *Registrierungsrufnummer*), das **Passwort** und den **Anmeldenamen** (entspricht dem *Telefonie-Benutzernamen*) und bei Bedarf weitere Felder anpassen.

Nun müssen [eingehende und ausgehende Rufregeln]({{< ref "/trunks/rules">}}) angepasst werden. Bei den ausgehenden Regeln müssen Sie nun auswählen welcher Account pro Regel verwendet werden soll. Scrollen Sie hierfür nach rechts und wählen in der Spalte {{< ui-button "Account" >}} den entsprechenden aus.


### Einrichtung via Fritz!Box

In folgenden Fällen empfehlen wir die Verwendung der Amt-Einbindung über die Fritz!Box:

* Es wird ein Telekom-Amt eingebunden, das kein Business-Anschluss ist.
* Die Registrierung der SIP-Accounts zum Provider erfolgen über ein VLAN, in das die pascom nicht gelangen kann.

{{% notice warning %}}
Bei der Verwendung der Fritz!Box ist der Anschluss auf die Benutzung von zwei Sprach-Kanälen aufgrund der Fritz!Box-Firmware beschränkt.
{{% /notice %}}

![Fritz!Box](fritzbox.de.png?width=70%)

Folgende Anleitung wurde unter Verwendung der *Fritz!Box Fon WLAN 7390* mit der Firmware 06.83 erstellt.

#### Vorbereitung der Fritz!Box

Zuerst müssen Sie auf der Fritz!Box die Telekom-Rufnummern einrichten, sodass sich die Fritz!Box sich korrekt mit der Telekom verbinden kann.

1. Surfen Sie auf die WebUI Ihrer Fritz!Box
2. Unter {{< ui-button "Telefonie" >}} > {{< ui-button "Eigene Rufnummern" >}} klicken Sie auf {{< ui-button "Neue Rufnummer" >}}.
3. Wählen Sie bei {{< ui-button "Telefonie-Anbieter" >}} *Telekom* aus.
4. Tragen Sie die *Ortsvorwahl* und die *Rufnummer* aus Ihrem Brief mit den Accountdaten ein.
5. Wählen Sie {{< ui-button "Weitere Rufnummer" >}} und wiederholen Sie Schritt 4 mit allen Rufnummern aus Ihrem Brief mit den Accountdaten.
6. Bestätigen Sie die Einstellungen in der aktuellen und allen folgenden Masken mit {{< ui-button "Weiter" >}} und {{< ui-button "Übernehmen" >}}.

Die Fritz!Box wird sofort versuchen mit den angegebenen Daten eine Verbindung zur Telekom aufzubauen.

![Fritz!Box](fritzbox_telekom_dids.de.png?width=80%)

Nachdem die Telekom-Rufnummern erfolgreich eingerichtet wurden, müssen Sie auf der Fritz!Box Accounts anlegen, mit denen sich die pascom bei der Fritz!Box registrieren kann.

1. Auf der WebUI Ihrer Fritz!Box unter {{< ui-button "Telefonie" >}} > {{< ui-button "Telefoniegeräte" >}} klicken Sie auf {{< ui-button "Neues Gerät einrichten" >}}.
2. Wählen Sie *Telefon (mit oder ohne Anrufbeantworter)* aus.
3. Wählen Sie im nächsten Schritt *LAN/WLAN (IP-Telefon)* und vergeben Sie einen Namen.
4. Anschließend geben Sie einen *Benutzernamen* und ein *Kennwort* ein. Diese müssen Sie sich merken, da Sie in der pascom benötigt werden.
5. Wählen Sie die Rufnummern Ihres Telefonanschlusses, über die eingehende Gespräche des Accounts geführt werden sollen.
6. Nun muss die Nummer für ausgehende Rufe gewählt werden. Wählen Sie hier die Nummer, die Sie davor für eingehende Rufe ausgewählt haben.
7. Im letzten Schritt übernehmen Sie die Einstellungen. Falls dies der erste Account ist, den Sie in dieser Session einrichten, müssen Sie bestätigen, dass Sie befugt sind diese Änderungen vorzunehmen. Gehen Sie zu Ihrer Fritz!Box und drücken Sie eine beliebige Taste.
8. Wollen Sie alle Rufnummern Ihres Telekom-Anschlusses nutzen, wiederholen Sie die Schritte 1 - 7 um für alle Rufnummern einen Account anzulegen.
9. In der Übersicht Ihrer Telefonie-Geräte sehen Sie die interne Nummer des Accounts (z. B. \**620). Diese Durchwahl müssen Sie sich ebenfalls für die Einrichtung in der pascom merken.

![Fritz!Box](fritzbox_telekom_phones.de.png?width=80%)

#### Fritz!Box-Amt in der pascom einrichten

**Amt-Vorlage befüllen**

Fügen Sie ein neues Fritz!Box-Amt ein unter {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}} > {{< ui-button "Hinzufügen" >}}. Sie gelangen nun zur Ämter-Datenbank. Über den Filter können Sie direkt nach *fritz* suchen und die Vorlage anschließend auswählen. Befüllen Sie die Vorlage mit den auf der Fritz!Box eingestellten Account-Daten.

![Fritz!Box Account](fritzbox_account_telekom.de.png?width=80%)

Über die Vorlage können die ersten 3 Accounts angelegt werden.

|Variable|Beschreibung|
|---|---|
|**Bezeichung**|Geben Sie Ihrem Amt einen Namen, dieser taucht dann in der Ämterliste auf.|
|**Host**|Geben Sie hier die IP-Adresse bzw. die Domain Ihrer Fritz!Box ein.|
|**Benutzername Leitung X**|Der Benutzername des Accounts, den Sie auf der Fritz!Box angelegt haben.|
|**Passwort Leitung X**|Das zur Leitung gehörige Passwort.|
|**Durchwahl für Leitung X**|Die  zur Leitung gehörige Durchwahl, die die Fritz!Box Ihrer Leitung beim Anlegen vergeben hat.|
|**Internationale Vorwahl**|Geben Sie hier die internationale Vorwahl an. z. B. 00|
|**Nationale Vorwahl**|Geben Sie hier die nationale Vorwahl an. z. B. 0|
|**Länderkennung**|Tragen Sie die Länderkennung Ihres Anschlusses ein. z. B. 49 für Deutschland.|
|**Ortskennzahl**|Tragen Sie die Ortskennzahl bzw. Ortsvorwahl ohne führende 0 ein.  z. B. 89 für München|
|**Präfix. eing. Nummer**|Ist eine beliebige Ziffer, die bei eingehenden Telefonanrufen über dieses Amt vorangestellt wird. Wenn Sie hier eine 0 eingeben erscheint beispielsweise in der Anruferliste von IP-Telefonen dann nicht die 0172123123 sondern die 00172123123. Dadurch können Sie direkt aus der Anruferliste wieder über das selbe Amt zurückrufen.|

Nach dem {{< ui-button "Speichern" >}} wird das Amt angelegt. Wenn Sie weitere Accounts in der Fritz!Box angelegt haben können Sie diese jetzt im Reiter {{< ui-button "Accounts" >}} ergänzen. Wählen Sie dazu einen Eintrag aus und klicken Sie auf {{< ui-button "Duplizieren" >}}. Bei den duplizierten Einträgen reicht es aus *Benutzernamen*, *Passwort* und *Durchwahl reg.* entsprechend anzupassen.

**Rufregeln anpassen**

Die Rufregeln der ersten 3 Accounts werden automatisch angelegt, die Rufregeln aller weiteren Accounts müssen manuell angelegt werden. Diese können Sie gemäß Ihren Anforderungen und Wünschen konfigurieren und erweitern. Lesen Sie dazu den Artikel über [Rufregeln]({{< ref "/trunks/rules">}}).

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
