---
title: Connector
keywords:
description:
url: /benutzer/connector/
prev: /benutzer/telefonbuch/
weight: 25
toc: true

---
## Konzept

Der mobydick Connector synchronisiert externe Datenquellen in die mobydick. mobydick ist in der Lage eine Vielzahl von Objekten wie z. B. Telefonbücher, Benutzer, Kurzwahlen usw. zu importieren. Diese können entweder aus einer CSV-Textdatei, LDAP-Quellen oder einem anderen mobydick Server importiert werden.

{{% notice info %}}
Wir empfehlen, den Connector zu verwenden, um regelmäßig Daten automatisiert zu importieren. Wenn Sie nur einmalig Daten importieren wollen können Sie dies einfacher über *Daten importieren per xlsx-Datei* erledigen.
{{% /notice %}}

## Konfiguration

Den Connector finden Sie unter: `Erweitert` > `Connector`. Fügen Sie neue Connector-Profile ein mit einem Klick auf `Hinzufügen`.

Anschließend erhalten Sie eine Übersicht über die Connector-Vorlagen:

* **Benutzer aus USC**
* **Benutzer aus AD**
* **Benutzer aus LDAP**
* **Benutzer aus CSV**
* [**Exchange Kontakte**](/integrationen/microsoft-exchange-server-integration/)
* **Telefonbuch aus AD**
* [**Telefonbuch aus CSV**](http://localhost:1313/benutzer/connector/#telefonbuch-aus-csv)
* **Telefonbuch aus LDAP**
* **Kurzwahlen aus AD**
* **Kurzwahlen aus CSV**
* **Kurzwahlen aus LDAP**
* **mobydick Telefonbuch**

Nachfolgend werden gängige Profile näher erklärt. Benutzen Sie bitte für den Einstieg die passende Connector-Vorlage.

### Telefonbuch aus CSV

|Variablen|Beschreibung|
|---|---|
|**Bezeichung**|Bezeichnung des Profiles|
|**Pfad zur CSV-Datei**|Die zu importierende Datei. Diese Angabe bezieht sich auf das Dateisystem der mobydick und nicht auf Ihr lokales Dateisystem.|
|**Zeichensatz der CSV-Datei**|Gibt an in welchem Format die CSV-Datei vorliegt. Wie empfehlen Ihnen UTF-8 zu verwenden.|
|**Trennzeichen**|Mit welchem Trennzeichen wurden die Felder separiert.|
|**Zeilenende**|Ob die CSV-Datei unter Windows oder Mac/Linux erstellt worden ist, unterscheidet sich das Zeilendende.|
|**Feldeinfassung**|Wir empfehlen die einzelnen Felder mit Zeichen einzufassen, z. B. "Max Muster"|

CSV-Quelle aus Freigabe laden:

|Variablen|Beschreibung|
|---|---|
|**Pfad zur CSV-Datei**|Bezieht sich nun relativ zur Freigabe.<br>*Beispiel*: Befindet sich in der Freigabe \\192.168.100.10\mobydick der Unterordner test mit der Datei address.csv tragen Sie hier test\address.csv ein.|
|**CIFS/SMB Freigabe verwenden**|Wählen Sie **JA** um eine CSV-Quelle aus einer Freigabe zu laden|
|**CIFS/SMB Freigabe**|UNC-Pfad zur Freigabe im Format **\\<servername** oder **ip>\<freigabe>**<br>*Beispiel*: \\192.168.100.10\mobydick|
|**CIFS/SMB Benutzer**|Benutzer mit der Berechtigung auf diese Freigabe lesend zuzugreifen.|
|**CIFS/SMB Passwort**|Zugehöriges Passwort.|

Nach dem Speichern kann der Importmodus noch eingestellt werden. Hier wird definiert, wie der Connector mit bereits vorhandenen Datensätzen umgehen soll. Folgende Möglichkeiten stehen zur Verfügung:

* Neue Sätze importieren und geänderte abgleichen
* Neue Sätze importieren, geänderte abgleichen und früher importierte Datensätze entfernen.

Im Tab `Variablen` sehen Sie welche Felder imporiert werden können. Hier ein Beispiel für eine CSV-Datei:

    "displayname","phone","givenname","surname","organisation","email","mobile","homephone","fax"
    "Max Muster - pascom [30000]","+4999112345","Max","Muster","pascom","","","","+4999112399"

<!--  
### Benutzer aus AD

|Variable|Beschreibung|
|---|---|
|**Bezeichung**|Bezeichnung des Profiles|
|**AD Domäne**|-|
|**AD Server**|-|
|**Benutzername**|-|
|**Passwort**|-|
|**Authentifizierung konfigurieren**|siehe [Authentifizierung](../connector#authentifizierung)|

Nach dem Speichern sehen Sie die Übersicht über die Einstellungen.

|Variable|Beschreibung|
|---|---|
|**Modus**|Hier definieren Sie wie der Connector mit bereits vorhanden Datensätzen umgehen soll|
|**URI**|Die LDAP-URI unter welcher der LDAP Server erreichbar ist. Standardmäßig **ldap://SERVER:389**, für SSL Verbindungen **ldaps://SERVER:636**|
|**Basis DN**|Definiert von welchem Startpunkt aus der LDAP-Baum durchsucht werden soll|
|****||
|****||

-->
<!--  
### Benutzer aus UCS
-->


## Authentifizierung gegen externe Systemen

mobydick bietet die Möglichkeit die Authentifizierung auf externe LDAP-Server auszulagern. Der Benutzer gibt dabei in der Loginmaske des mobydick Clients seinen Benutzernamen und sein Passwort ein. In der Benutzerdatenbank der mobydick wird geprüft ob der Benutzer existiert, anschließend wird die Anfrage an den LDAP-Server weitergegeben. Da wird dann das eingegebene Passwort zur Authentifizierung geprüft. Ist das Passwort richtig, kann der Client verbunden werden.

### Benutzerdaten

Der Import der Benutzerdaten und die Authentifizierung sind zwar miteinander kombinierbar aber nicht zwingend gleichzeitig notwendig. Sie können z. B. die Benutzer manuell anlegen und dann nur die Authentifizierung auf ein externes System umschalten. Die externe Authentifizierung scheitert jedoch wenn der Benutzer auf der mobydick nicht existiert. Den vollen Komfort entfaltet mobydick wenn Sie Authentifizierung und den automatischen Benutzerimport miteinander kombinieren.

### Konfiguration

**Authentifizierung einrichten**

Unter `Appliance` > `Dienste` > `Authentifizierung` kann die LDAP-Authentifizierung aktiviert werden.

|Einstellung|Beschreibung|
|---|---|
|**LDAP Host**|Tragen Sie hier die LDAP URL für Ihren Host ein.<br>Z. B. ldap://192.168.100.10 oder ldaps://192.168.100.10 für LDAPs Verbindungen|
|**LDAP Bind User**|Als Bind-User tragen Sie den *Distinguished Name* (DN) Ihrer Benutzer ein. Den Benutzername ersetzen Sie durch ein %-Zeichen. mobydick ersetzt das %-Zeichen durch den Benutzernamen der sich gerade am System authentifizieren will.|

Pro Benutzer kann entschieden werden ob die Authentifizierung über LDAP erfolgt oder weiterhin die interne mobydick Authentifizierungverwendet werden soll.

{{% notice info %}}
Für **UCS** und **Active Directory** können Sie Connector-Vorlagen benutzen. Diese richten auf Wunsch die Authentifizierung automatisch mit ein.
{{% /notice %}}

**Authentifizierung testen**

Mit der Schaltfläche `Anmeldung Testen` können Sie ausprobieren ob Ihre zuvor getätigten Angaben funktionieren.

**Authentifizierung pro Benutzer einstellen**

Unter `Benutzer` > `Benutzerliste` > `Bearbeiten` im Tab `Basisdaten` im Feld `Anmeldung` stellen Sie die Art der Authentifizierung ein.
