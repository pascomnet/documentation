---
title: Connector
keywords:
    - pascom Connector
    - Address book connector
    - phonebook synchronisation
description:
url: /users/connector/
prev: /users/phonebooks/
weight: 25
toc: true
draft: true
---
## Concept

The pascom connector synchronises external data sources with the pascom phone system. pascom phone systems can import and automatically sync numerous objects such as phonebooks, users, speed dials etc. These objects can be imported from CSV text files, LDAP sources or another pascom PBX server.

{{% notice info %}}
We recommend using the connector to regularly import and automatically synchronise data. If you only need to perform an **One-Off** data import, this is more simply achieved via the *Data import per xlsx file*.
{{% /notice %}}

## Configuration

To use the connector, navigate to `Advanced` > `Connector`. Add a new Connector Profile by clicking on the `Add` button.

This will provide an overview of all available Connector Templates:

* **USC User Sync**
* **AD User Sync**
* **LDAP User Sync**
* **CSV User Sync**
* **AD Phonebook Sync**
* **CSV Phonebook Sync**
* **LDAP Phonebook Sync**
* **AD Speeddial Sync**
* **CSV Speeddial Sync**
* **LDAP Speeddial Sync**
* **mobydick Phonebook**

In the following below, the main Connector Profiles are explained in more detail. To get started, please use a suitable Connector Template.

### CSV

|Variables|Description|
|---|---|
|**Name**|Profile name|
|**Path to CSV File**|The file to be imported. This refers to the mobydick file system and NOT to your local file system.|
|**CSV File Encoding**|File format of the CSV file. We recommend using UTF8.|
|**Delimiter**|The separating symbol with which the fields are separated.|
|**Line Separator**|Depending on the OS (Windows or Mac/Linux) under which the CSV file was created, the line endings will differ.|
|**Field Enclosure**|We recommend single fields enclosed by characters e.g. "Max Muster"|

Load CSV Sources from a Share:

|Variables|Description|
|---|---|
|**Path to CSV File**|The file to be imported. This refers to the share.<br>*Example*: If the share is located on \\192.168.100.10\mobydick in the subfolder **test** with the file **address.csv** enter test\address.csv.|
|**Use CIFS/SMB share**|Select **Yes** in order to load a CSV source file from within a share|
|**CIFS/SMB Share**|UNC path to the Share in the formate **\\<servername** oder **ip>\<share>**<br>*example*: \\192.168.100.10\mobydick|
|**CIFS/SMB Username**|User assigned with read permissions for accessing the share.|
|**CIFS/SMB Password**|Corresponding password.|

After saving, the import mode can be set. Setting the mode defines how the connector handles existing data as follows:

* Create and update records.
* Create and update records. Remove missing data from previous imports

Under the `Variables` tab, the fields which can be imported are listed, such as this example CSV file import: 

    "displayname","phone","givenname","surname","organisation","email","mobile","homephone","fax"
    "Max Muster - pascom [30000]","+4999112345","Max","Muster","pascom","","","","+4999112399"

<!--  
###  AD

|Variable|Description|
|---|---|
|**Name**|Bezeichnung des Profiles|
|**AD Domain**|-|
|**AD Server**|-|
|**Username**|-|
|**Password**|-|
|**Configure Authentication**|see [Authentication](../connector#authentication)|

Nach dem Speichern sehen Sie die Übersicht über die Einstellungen.

|Variable|Description|
|---|---|
|**Modus**|Hier definieren Sie wie der Connector mit bereits vorhanden Datensätzen umgehen soll|
|**URI**|Die LDAP-URI unter welcher der LDAP Server erreichbar ist. Standardmäßig **ldap://SERVER:389**, für SSL Verbindungen **ldaps://SERVER:636**|
|**Basis DN**|Definiert von welchem Startpunkt aus der LDAP-Baum durchsucht werden soll|
|****||
|****||

-->
<!--  
###  UCS
-->


## Authentication Against External Systems

pascom phone systems make it possible to  authenticate users against extneral LDAP server. Users enter their username and password within the pascom client  login screener Benutzer gibt dabei in der Loginmaske des mobydick Clients seinen Benutzernamen und sein Passwort ein. In der Benutzerdatenbank der mobydick wird geprüft ob der Benutzer existiert, anschließend wird die Anfrage an den LDAP-Server weitergegeben. Da wird dann das eingegebene Passwort zur Authentifizierung geprüft. Ist das Passwort richtig, kann der Client verbunden werden.

### Benutzerdaten

Der Import der Benutzerdaten und die Authentifizierung sind zwar miteinander kombinierbar aber nicht zwingend gleichzeitig notwendig. Sie können z. B. die Benutzer manuell anlegen und dann nur die Authentifizierung auf ein externes System umschalten. Die externe Authentifizierung scheitert jedoch wenn der Benutzer auf der mobydick nicht existiert. Den vollen Komfort entfaltet mobydick wenn Sie Authentifizierung und den automatischen Benutzerimport miteinander kombinieren.

### Konfiguration

**Authentifizierung einrichten**

Unter `Appliance` > `Dienste` > `Authentifizierung` kann die LDAP-Authentifizierung aktiviert werden.

|Einstellung|Description|
|---|---|
|**LDAP Host**|Tragen Sie hier die LDAP URL für Ihren Host ein.<br>Z. B. ldap://192.168.100.10 oder ldaps://192.168.100.10 für LDAPs Verbindungen|
|**LDAP Bind User**|Als Bind-User tragen Sie den *Distinguished Name* (DN) Ihrer Benutzer ein. Den Benutzername ersetzen Sie durch ein %-Zeichen. mobydick ersetzt das %-Zeichen durch den Benutzernamen der sich gerade am System authentifizieren will.|

Pro Benutzer kann entschlieden werden ob die Authentifizierung über LDAP erfolgt oder weiterhin die interne mobydick Authentifizierungverwendet werden soll.

{{% notice info %}}
Für **UCS** und **Active Directory** können Sie Connector-Vorlagen benutzen. Diese richten auf Wunsch die Authentifizierung automatisch mit ein.
{{% /notice %}}

**Authentifizierung testen**

Mit der Schaltfläche `Anmeldung Testen` können Sie ausprobieren ob Ihre zuvor getätigten Angaben funktionieren.

**Authentifizierung pro Benutzer einstellen**

Unter `Benutzer` > `Benutzerliste` > `Bearbeiten` im Tab `Basisdaten` im Feld `Anmeldung` stellen Sie die Art der Authentifizierung ein.
