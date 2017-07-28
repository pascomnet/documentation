---
title: Microsoft Active Directory
keywords:
    - microsoft
    - active directory
    - ad
description: Integrieren Sie Microsoft Active Direcory in Ihre pascom.
prev: /integrationen/microsoft-exchange-server-integration/
url: /integrationen/microsoft-active-directory-integration/
next: /integrationen/univention-integration/
weight: 105
toc: true
---

![microsoft active directory](/connector_microsoft_ad.png?width=50%)

## Konzept

Mit dem pascom Connector können Sie Benutzer aus dem Active Directory in pascom importieren und sychronisieren. Zusätzlich kann die Authentifizierung der pascom Benutzer gegen Active Directory aktivieren werden.

## Konfiguration

### Microsoft Active Directory

Um die Daten aus dem Active Directory auslesen zu dürfen brauchen Sie einen Benutzer mit entsprechender Berechtigung. Natürlich könnten Sie dazu den Active Directory Administrator verwenden. Da pascom die Zugangsdaten für den wiederholten Import abspeichern muss und der Administrator mit wesentlich mehr als den benötigten Rechten ausgestattet ist, bietet es sich an einen eigenen Benutzer für pascom anzulegen:

Wenn Sie *mobydick* als Benutzernamen verwenden wird dieser beim Import durch den LDAP-Filter erkannt und nicht automatisch als Benutzer auf der Telefonanlage mit angelegt.

Vergeben Sie für den pascom Benutzer ein Passwort und markieren Sie *Kennwort läuft nie ab*. pascom authentifiziert sich am Active Directory bei jedem Connector-Lauf. Wenn Sie das Passwort ändern möchten müssen Sie das sowohl in Active Directory als auch im pascom Connector machen:

### Connector-Profil "Benutzer aus AD"

Erstellen Sie ein neues Connector-Profil indem Sie in der pascom Web-UI unter dem
Menüpunkt `Erweitert` > `Connector` auf `Hinzufügen` klicken.

Wählen Sie die Vorlage *Benutzer aus AD* und tragen Sie folgende Daten ein:

|Feld|Beschreibung|
|---|---|
|**Bezeichung**|Name des Connectors|
|**AD Domäne**|Active Directory Domain Name|
|**AD Server**|Server IP oder Host|
|**Benutzername** und **Passwort**|Der zuvor im AD angelegte pascom Benutzer zur Authentifizierung|
|**Authentifizierung konfigurieren**|**NEIN**: Benutzer werden nur importiert und authentifizieren sich gegen die pascom<br>**JA**: Benutzer werden importiert und können sich gegen den AD authentifizieren. In diesem Fall wird die Authentifizierung eingerichtet und Sie können unter `Appliance` > `Dienste` im Reiter `Authentifizierung` bei Bedarf anpassen.|

Nach dem Speichern kann die Vorlage im Reiter `Basisdaten` bei Bedarf angepasst werden.

#### Pre Filter

Im Standard importiert die Vorlage alle Benutzer bis auf den Benutzer *mobydick* aus dem AD. Über den Reiter `Pre Filter` können Sie den Import eine Gruppe von Benutzern, z. B. *pascom-user*, einschränken. Fügen Sie dazu folgenden Code ein:

    if (strpos($row['memberOf'],'mobydick-users') !== false) {
    return true;
    }
    return false;

#### Benutzerfelder im AD

|Active Directory|pascom|Bescheibung|
|---|---|---|
|Konto > Benutzeranmeldename|Anmeldename|Der Anmeldename wird für sämtliche Anmeldung verwendet und darf nur Kleinbuchstaben enthalten. Pflichtfeld.|
|Allgemein > Anzeigename|Anzeigename |Der Anzeigename erscheint auf allen Telefondisplays und im pascom Client. Pflichtfeld.|
|Allgemein > Vorname|Vorname|Vorname des Benutzers für den pascom Telefonbucheintrag.|
|Allgemein > Nachname|Nachname|Nachname des Benutzers für den pascom Telefonbucheintrag.|
|Allgemein > Rufnummer|Durchwahl|Die interne Durchwahl des Benutzers. Wird diese nicht im AD gepflegt, vergibt pascom automatisch die nächste freie Durchwahl aus dem Telefonnummernpool.|
|Allgemein > E-Mail|EMail|E-Mail Adresse des Benutzers. Wird für den Versand von Voicemails und Faxen benötigt.|
|Organisation > Firma|Organisation|Firma des Benutzers für den Telefonbucheintrag in mobydick.|
|Rufnummern > Privat|Telefon privat|Private Telefonnummer des Benutzers für den pascom Telefonbucheintrag.|
|Rufnummern > Mobil|Handy|Mobilnummer des Benutzers für den pascom Telefonbucheintrag.|
|Rufnummer > Fax|Fax|Interne Faxnummer des Benutzers. Legt automatisch ein virtuelles pascom Faxgerät für den Benutzer mit an. Voraussetzung hierfür ist ein konfigurierter Faxserver auf der pascom.|

Die Felder sind lediglich ein Vorschlag der Vorlage. Sie können Felder hinzufügen und entfernen bzw. die gesamte Import-Struktur beliebig anpassen.

#### Importlauf testen und aktivieren

Nachdem Sie die Konfiguration abgeschlossen haben, können Sie durch die Schaltfläche `Speichern und Simulieren` testen welche Datensätze importiert werden würden. Wenn Sie mit dem Ergebnis zufrieden sind können Sie den Import entweder einmalig unter `Aktion` > `Import jetzt durchführen` ausführen oder durch die Schaltfläche `Automatisieren` eine regelmäßige Durchführung des Importes einrichten.

#### Authentifizierung testen

Haben Sie in der Vorlage *Authentifizierung konfigurieren* auf *JA* gesetzt können Sie nun unter `Appliance` > `Dienste`
im Reiter `Authentifizierung` mit der Schaltfläche `Anmeldung Testen` testen ob die Authentifizierung Ihrer Benutzer funktioniert.


<!--### Connector-Profil "Telefonbuch aus AD"
### Connector-Profil "Kurzwahlen aus AD"
hat es Sinn das zu dokumentieren? haben die Vorlagen überhaupt Sinn? jedenfalls funktioniert der Telefonbuch import nicht richtig ohne Suchfilter-Anpassungen.
 -->
