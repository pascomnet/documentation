---
title: Deutsche Telekom Mehrgeräte Anschluss
description: Übersicht zum pascom managed Provider Template von der Deutschen Telekom
weight: 5
---
{{< doctype "both"  >}}

{{< description >}}

![Deutsche Telekom Provider Logo](deutsche-telekom-logo.png?width=50%)


## Übersicht

Tarif in Kombination mit pascom: **Einzelrufnummer tel.telekom**  



{{% notice warning %}}
pascom unterstützt die direkte Registrierung des SIP Accounts in der pascom Telefonanlage nur in Verbindung mit dem von der Telekom [empfohlenen Lancom Router](https://geschaeftskunden.telekom.de/startseite/festnetz-internet/tarife/354892/paket-zum-anschluss-einer-ip-telefonanlage.html) für den Anschluss einer IP-Telefonanlage. Alternativ kann die [Registrierung in einer Fritzbox]({{< relref "#einrichtung-via-fritz-box">}}) vorgenommen werden.<br/><br/>
Wenn Sie einen eigenen Router betreiben muss dieser grundsätzlich die gleichen Kriterien erfüllen wie das empfohlene Gerät der Telekom. In diesem Fall übernehmen wir allerdings keinen Support seitens pascom.
{{% /notice %}}


{{< num 1 "Ihr Account" >}}

### Mehrgeräte und erweiterter Mehrgeräte Anschluss

Der Unterschied ist simpel. Bei einem normalen Mehrgeräte Anschluss registrieren Sie sich an Ihrem Standort mit einer festen Telefonnummer (Standortgebunden). Bei einem erweiterten Mehrgeräte Anschluss erhalten Sie zusätzlich eine Login-Email und Login-Password um den Tarif in der Cloud zu benutzen (Nomadisch).

#### Mehrgeräte Anschluss
![Ihre Telekom-Zugangsdaten für einen Mehrgeräte-Anschluss](telekom-access-data-dsl.de.png?width=70%)

Hat mehrere feste Rufnummern.

**Welche Daten können Sie daraus entnehmen?**

+ *Rufnummern*: Sie benötigen nur die Rufnummern zur Einrichtung des Amt

Bei den Zugangsdaten handelt es sich um die Internet-Zugangsdaten.
Diese werden nicht für die Einrichtung des Telekom Amts benötigt.

#### Erweiterter Mehrgeräte Anschluss

Hat mehrere feste Rufnummern und einen Email-/Password Registrar

**Welche Daten können Sie daraus entnehmen?**

+ *Login Email*: Benutzername für die Registrierung
+ *Login Password*: Password für die Registrierung
+ *Rufnummern*: Rufnummern zur Einrichtung des Amt


{{< num 2 "Einrichtung in der pascom" >}}

<!-- TAB ONSITE ---------------------------------------------------------------- -->
{{% tabs %}}
{{% tab "Onsite" %}}

### Router vorbereiten

Bevor Sie mit der Einrichtung des Telekom Amt auf der pascom Telefonanlage beginnen, stellen Sie sicher, dass folgende Einstellungen auf Ihrem Router getätigt wurden.

1. SIP-ALG deaktivieren.
2. Die Registrierung des Telekom Amt muss auf dem Router deaktiviert sein.

**Beispiel**

Die folgenden Screenshots wurden erstellt mit einem *LANCOM R883VAW (über ISDN)* mit der Firmware 10.00.0170.

Die SIP-ALG-Einstellungen finden Sie auf der Web-Oberfläche des LANCOM-Routers unter {{< ui-button "Konfiguration" >}} > {{< ui-button "SIP-ALG" >}} > {{< ui-button "Allgemein" >}}.
Deaktivieren Sie das Kontrollkästchen "SIP-ALG aktiviert".

![LANCOM SIP-ALG Einstellungen](lancom_sip_alg.de.png?width=70%)

Die Trunk-Konfiguration finden Sie in der Web-Benutzeroberfläche des LANCOM-Routers unter {{< ui-button "Konfiguration" >}} > {{< ui-button "Voice Call Manager" >}} > {{< ui-button "Verbindungen" >}} > {{< ui-button "SIP-Leitungen" >}}.
Stellen Sie sicher, dass diese Einstellungen entweder leer oder deaktiviert sind.  

![LANCOM SIP Verbindungen](lancom_sip_lines.de.png?width=70%)

### Amtsvorlage befüllen

Fügen Sie ein neues Telekom-Amt ein unter {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}} > {{< ui-button "Hinzufügen" >}}. Sie gelangen nun zur Ämter-Datenbank. Über den Filter können Sie direkt nach *Telekom* suchen. Wählen Sie die Vorlage **Telekom** und befüllen Sie die Vorlage mit den erhaltenen Account-Daten.

<br />

![Telekom Mehrgeräte Anschluss einrichten](choose-template-onsite.de.PNG)

<br />

**Variablen befüllen**

|Variable|Beschreibung|
|---|---|
|**Bezeichnung**|Geben Sie Ihrem Amt einen Namen, dieser taucht dann in der Ämterliste auf.|
|**Erste Rufnummer**|Geben Sie die erste Rufnummer ein.|
|**Erste Rufnummer Nebenstelle**|Tragen Sie hier die interne Durchwahl für die Rufnummer ein.|
|**Zweite Rufnummer**|Geben Sie die zweite Rufnummer ein.|
|**Zweite Rufnummer Nebenstelle**|Tragen Sie hier die interne Durchwahl für die Rufnummer ein.|
|**Dritte Rufnummer**|Geben Sie die dritte Rufnummer ein.|
|**Dritte Rufnummer Nebenstelle**|Tragen Sie hier die interne Durchwahl für die Rufnummer ein.|
|**Ortskennzahl**|Tragen Sie die Ortskennzahl bzw. Ortsvorwahl ohne führende 0 ein. In unserem Beispiel *991*.|
|**Präfix eing. Nummer**|Ist eine beliebige Ziffer, die bei eingehenden Telefonanrufen über dieses Amt vorangestellt wird. Wenn Sie hier eine 0 eingeben erscheint beispielsweise in der Anruferliste von IP-Telefonen dann nicht die 0172123123 sondern die 00172123123. Dadurch können Sie direkt aus der Anruferliste wieder über das selbe Amt zurückrufen.|

### Beispiel

![Telekom Mehrgeräte Anschluss](fill-variables-onsite.de.PNG?width=70%)

Nach dem {{< ui-button "Speichern" >}} wird das Amt angelegt.

{{< num 3 "Funktioniert Ihr Amt?" >}}

Um sicher zu gehen ob Ihre Daten korrekt eingegeben wurden und ob sich die pascom Telefonanlage erfolgreich beim Provider registriert hat, klicken Sie unter {{< ui-button "Gateway" >}} - {{< ui-button "Ämter" >}} auf das {{< ui-button "Info-Symbol" >}} bei Ihrem Amt.
Hier sehen Sie ob die **Registrierung** geklappt hat. (*registered*).

![Amt registriert](registered-template.de.PNG?width=50%)

{{< num 4 "pascom Outbound Proxy aktivieren" >}}

Für die Onsite Telefonie wird für diesen Provider der pascom Outbound Proxy benötigt. In den {{< ui-button "Basiseinstellungen" >}} finden Sie die Einstellung {{< ui-button "Schnittstelle" >}}, für welche der **Outbound Proxy** aktiviert werden soll.

![Outound Proxy aktivieren](setup_op.de.jpg?width=70%)


{{< num 5 "Definieren Sie Ihre Rufregeln" >}}

Das Amt ist eingerichtet und erfolgreich registriert. Als letzten Schritt definieren Sie Ihre eingehenden und ausgehenden Rufregeln um das Anrufverhalten Ihrer pascom Telefonanlage einzustellen. 

Das Einrichten von Rufregeln erklären wir Ihnen in der Anleitung zu den [Rufregeln]({{< ref "trunks/rules">}})

{{< num 6 "Alternative: Telekom in Fritzbox einrichten" >}}

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

{{% /tab %}}
<!-- TAB CLOUD ---------------------------------------------------------------- -->
{{% tab "Cloud" %}}
### Amtsvorlage befüllen

Fügen Sie ein neues Telekom-Amt ein unter {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}} > {{< ui-button "Hinzufügen" >}}. Sie gelangen nun zur Ämter-Datenbank. Über den Filter können Sie direkt nach *Telekom* suchen. Wählen Sie die Vorlage **Telekom, Erweitert** und befüllen Sie die Vorlage mit den erhaltenen Account-Daten.

<br />

![Telekom Mehrgeräte Anschluss einrichten in der Cloud](choose-template-cloud.de.PNG)

<br />

**Variablen befüllen**

|Variable|Beschreibung|
|---|---|
|**Bezeichnung**|Geben Sie Ihrem Amt einen Namen, dieser taucht dann in der Ämterliste auf.|
|**Telekom Login Email**|Geben Sie Ihre T-Online Email Adresse ein.|
|**Telekom Login Password**|Geben Sie das dazugehörige Email Password ein.|
|**Erste Rufnummer Nebenstelle**|Tragen Sie hier die interne Durchwahl für die Rufnummer ein.|
|**Zweite Rufnummer**|Geben Sie die zweite Rufnummer ein.|
|**Zweite Rufnummer Nebenstelle**|Tragen Sie hier die interne Durchwahl für die Rufnummer ein.|
|**Dritte Rufnummer**|Geben Sie die dritte Rufnummer ein.|
|**Dritte Rufnummer Nebenstelle**|Tragen Sie hier die interne Durchwahl für die Rufnummer ein.|
|**Ortskennzahl**|Tragen Sie die Ortskennzahl bzw. Ortsvorwahl ohne führende 0 ein. In unserem Beispiel *991*.|
|**Präfix eing. Nummer**|Ist eine beliebige Ziffer, die bei eingehenden Telefonanrufen über dieses Amt vorangestellt wird. Wenn Sie hier eine 0 eingeben erscheint beispielsweise in der Anruferliste von IP-Telefonen dann nicht die 0172123123 sondern die 00172123123. Dadurch können Sie direkt aus der Anruferliste wieder über das selbe Amt zurückrufen.|

### Beispiel

![Telekom Mehrgeräte Anschluss](fill-variables-cloud.de.PNG?width=70%)

Nach dem {{< ui-button "Speichern" >}} wird das Amt angelegt. Dabei werden automatisch Rufregeln angelegt. Diese können Sie gemäß Ihren Anforderungen und Wünschen konfigurieren. Lesen Sie dazu den Artikel über [Rufregeln]({{< ref "trunks/rules">}}).

{{< num 3 "Funktioniert Ihr Amt?" >}}

Um sicher zu gehen ob Ihre Daten korrekt eingegeben wurden und ob sich die pascom Telefonanlage erfolgreich beim Provider registriert hat, klicken Sie unter {{< ui-button "Gateway" >}} - {{< ui-button "Ämter" >}} auf das {{< ui-button "Info-Symbol" >}} bei Ihrem Amt.
Hier sehen Sie ob die **Registrierung** geklappt hat. (*registered*).

![Amt registriert](registered-template.de.PNG?width=50%)

{{< num 4 "Definieren Sie Ihre Rufregeln" >}}

Das Amt ist eingerichtet und erfolgreich registriert. Als letzten Schritt definieren Sie Ihre eingehenden und ausgehenden Rufregeln um das Anrufverhalten Ihrer pascom Telefonanlage einzustellen. 

Das Einrichten von Rufregeln erklären wir Ihnen in der Anleitung zu den [Rufregeln]({{< ref "trunks/rules">}})
{{% /tab %}}
{{% /tabs %}}



