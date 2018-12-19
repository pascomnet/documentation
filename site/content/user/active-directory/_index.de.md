---
title: Microsoft Active Directory Integration
description: Synchronisieren und Authentifizieren Sie Ihre Benutzer gegen das Microsoft Active Directory
weight: 50
---

{{< doctype "both" >}}

{{< description >}}

![microsoft active directory](connector_microsoft_ad.png?width=50%)

## Microsoft Active Directory

Um die Daten aus dem Active Directory auslesen zu dürfen brauchen Sie einen Benutzer mit entsprechender Berechtigung. Natürlich könnten Sie dazu den Active Directory Administrator verwenden. Da pascom die Zugangsdaten für den wiederholten Import abspeichern muss und der Administrator mit wesentlich mehr als den benötigten Rechten ausgestattet ist, bietet es sich an einen eigenen Benutzer für pascom anzulegen:

Wenn Sie *mobydick* als Benutzernamen verwenden wird dieser beim Import durch den LDAP-Filter erkannt und nicht automatisch als Benutzer auf der Telefonanlage mit angelegt.

Vergeben Sie für den pascom Benutzer ein Passwort und markieren Sie *Kennwort läuft nie ab*. pascom authentifiziert sich am Active Directory bei jedem Connector-Lauf. Wenn Sie das Passwort ändern möchten müssen Sie das sowohl in Active Directory als auch im pascom Connector machen:

## Connector-Profil "Benutzer aus AD"

Erstellen Sie ein neues Connector-Profil indem Sie in der pascom Web-UI unter dem
Menüpunkt {{< ui-button "Erweitert" >}} > {{< ui-button "Connector" >}} auf {{< ui-button "Hinzufügen" >}} klicken.

Wählen Sie die Vorlage *Benutzer aus AD* und tragen Sie folgende Daten ein:

|Feld|Beschreibung|
|---|---|
|**Bezeichung**|Name des Connectors|
|**AD Domäne**|Active Directory Domain Name|
|**AD Server**|Server IP oder DNS-Name des Hosts|
|**Benutzername** und **Passwort**|Der zuvor im AD angelegte pascom Benutzer zur Authentifizierung|
|**Authentifizierung konfigurieren**|**NEIN**: Benutzer werden nur importiert und authentifizieren sich gegen die pascom<br>**JA**: Benutzer werden importiert und können sich gegen den AD authentifizieren. In diesem Fall wird die Authentifizierung eingerichtet und Sie können unter {{< ui-button "Appliance" >}} > {{< ui-button "Dienste" >}} im Reiter {{< ui-button "Authentifizierung" >}} bei Bedarf anpassen.|
|**pascom Softphone anlegen**|**JA**: Legt automatisch für jeden importierten Benutzer ein pascom Softphone an. **NEIN**: Legt für keinen importierten Benutzer ein pascom Softphone an.|
|**Mobilgerät anlegen**|**JA**: Legt automatisch für jeden importierten Benutzer ein Mobiltelefon mit der hinterlegten Mobilrufnummer an. **NEIN**: Legt für keinen importierten Benutzer ein Mobiltelefon an.|

Nach dem Speichern kann die Vorlage im Reiter {{< ui-button "Basisdaten" >}} bei Bedarf angepasst werden.

### Pre Filter

Im Standard importiert die Vorlage alle Benutzer bis auf den Benutzer *mobydick* aus dem AD. Über den Reiter {{< ui-button "Pre Filter" >}} können Sie den Import einer Gruppe von Benutzern, z. B. *pascom-user*, einschränken. Fügen Sie dazu folgenden Code ein:

    if (strpos($row['memberOf'],'pascom-user') !== false) {
    return true;
    }
    return false;

### Benutzerfelder im AD

|Active Directory|pascom|Beschreibung|
|---|---|---|
|Konto > Benutzeranmeldename|Anmeldename|Der Anmeldename wird für sämtliche Anmeldung verwendet und darf nur Kleinbuchstaben enthalten. Pflichtfeld.|
|Allgemein > Anzeigename|Anzeigename |Der Anzeigename erscheint auf allen Telefondisplays und im pascom Client. Pflichtfeld.|
|Allgemein > Vorname|Vorname|Vorname des Benutzers für den pascom Telefonbucheintrag.|
|Allgemein > Nachname|Nachname|Nachname des Benutzers für den pascom Telefonbucheintrag.|
|Allgemein > Rufnummer|Durchwahl|Die interne Durchwahl des Benutzers. Wird diese nicht im AD gepflegt, vergibt pascom automatisch die nächste freie Durchwahl aus dem Telefonnummernpool.|
|Allgemein > E-Mail|EMail|E-Mail Adresse des Benutzers. Wird für den Versand von Voicemails und Faxen benötigt.|
|Organisation > Firma|Organisation|Firma des Benutzers für den Telefonbucheintrag in pascom.|
|Rufnummern > Privat|Telefon privat|Private Telefonnummer des Benutzers für den pascom Telefonbucheintrag.|
|Rufnummern > Mobil|Handy|Mobilnummer des Benutzers für den pascom Telefonbucheintrag und das automatisch angelegte Mobiltelefon.|
|Rufnummer > Fax|Fax|Interne Faxnummer des Benutzers. Legt automatisch ein virtuelles pascom Faxgerät für den Benutzer mit an. Voraussetzung hierfür ist ein konfigurierter Faxserver auf der pascom.|

Die Felder sind lediglich ein Vorschlag der Vorlage. Sie können Felder hinzufügen und entfernen bzw. die gesamte Import-Struktur beliebig anpassen.

### Importlauf testen und aktivieren

Nachdem Sie die Konfiguration abgeschlossen haben, können Sie durch die Schaltfläche {{< ui-button "Speichern und Simulieren" >}} testen welche Datensätze importiert werden würden. Wenn Sie mit dem Ergebnis zufrieden sind können Sie den Import entweder einmalig unter {{< ui-button "Aktion" >}} > {{< ui-button "Import jetzt durchführen" >}} ausführen oder durch die Schaltfläche {{< ui-button "Automatisieren" >}} eine regelmäßige Durchführung des Importes einrichten.

### Authentifizierung testen

Haben Sie in der Vorlage *Authentifizierung konfigurieren* auf *JA* gesetzt können Sie nun unter {{< ui-button "Appliance" >}} > {{< ui-button "Dienste" >}}
im Reiter {{< ui-button "Authentifizierung" >}} mit der Schaltfläche {{< ui-button "Anmeldung Testen" >}} testen ob die Authentifizierung Ihrer Benutzer funktioniert.


### Optionale Einstellungen

#### Feldzuordnung anpassen

Im Connector Profil können Sie im Reiter Variablen und Struktur die Feldzuordnung ActiveDirectory > pascom an Ihre Bedürfnisse anpassen.

Als Beispiel möchten wir die Berufsbezeichnung des Benutzers im Notizfeld des pascom Telefonbuches speichern.
Fügen Sie hierzu im Reiter {{< ui-button "Variablen" >}} folgende Zeile durch {{< ui-button "Hinzufügen" >}} ein:

|Variable|Quelle|
|----|----|
|Job|return $row["Job"];|

Durch diese Zeile speichert der Connector den Inhalt des ActiveDirectory Feldes "Job" in der gleichnamigen Variable "Job" ab.
Diese Variable muss nun unter {{< ui-button "Struktur" >}} dem Notiz pascom-Telefonbuch Feld zugeordnet werden.

Ergänzen Sie hierzu die Zeilen:

          "028pho_notes" :        "{{{Job}}}"

**in der Struktur:**

        {
          "identity": [{

            "003use_bez": "{{{displayname}}}",
            "003use_name": "{{{username}}}",
            "003use_pw": "{{{password}}}",
            "011acc_pin": "{{{pin}}}",
            "009ext_extension": "{{{phone}}}",
            "016voi_email": "{{{email}}}"          
            ,"post": {
              "phonebook": [{
                "028pho_bez" :  "{{{DisplayName}}}",
                "028pho_phone" : "{{{BusinessPhone}}}",
                "028pho_firstname" :  "{{{GivenName}}}",
                "028pho_lastname" : "{{{Surname}}}",
                "028pho_organisation" : "{{{CompanyName}}}",
                "028pho_email" :  "{{{EmailAddress}}}",
                "028pho_mobile" : "{{{MobilePhone}}}",
                "028pho_homephone" :  "{{{HomePhone}}}",
                "028pho_fax" :  "{{{BusinessFax}}}",
                "028pho_notes" :  "{{{Job}}}"
              }]
            }
          }]
        }


Dadurch wird der Wert der Variablen Job dem **Notiz** pascom Telefonbuch Feld zugewiesen.


#### Rollenzuweisung

Um Benutzer direkt beim Import einer Rolle zuweisen zu können muss die Struktur um die Rollenzuweisung erweitert werden.

Fügen Sie hierzu im Reiter {{< ui-button "Variablen" >}} folgende Zeile durch {{< ui-button "Hinzufügen" >}} ein:

**Variable:** rollen

**Quelle:**

          //Fill in the roles you want to filter (rolesToFilter) like this:
          //array('Rolle1', 'Rolle2');          

          $rolesToFilter=array();          
          $output=array();

          if(empty($rolesToFilter))
             return $output;

          $src = $row['memberOf'];

          if(!is_array($src)) {
            $src = array($src);
          }

          foreach($src as $group) {
            $list = explode(',', str_replace(array('[', ']', 'CN=', 'DC=', '"'), '', $group));
            foreach($list as $elem) {
             if(in_array($elem, $rolesToFilter)) {
                $output[]=$elem;
              }
            }
          }

          return $output;

Das Feld "rollen" entspricht einer Liste an Rollen, denen der Benutzer zugeordnet werden soll.
Über die Mitgliedszuweisung im ActiveDirectory können Sie die Rollen in pascom bestimmen.
Durch diese Zeile kann der Connector die Mitgliedszuweisung aus dem ActiveDirectory auslesen und in dem Benutzerrollen pascom Feld zuordnen.

{{% notice note%}}
Tragen Sie in der PHP-Variable `rolesToFilter` im Code des *Quelle* Feldes, die Rollenbezeichnungen ein, nach denen der Connector im ActiveDirectory suchen soll. Alle anderen ActiveDirectory Mitgliedszuweisungen werden ignoriert.
Beispiel: **array('Rolle1', 'Rolle2');**
{{% /notice%}}

Ergänzen Sie hierzu die Zeilen:

        {{#if rollen}}
          ,"user_roles": [
            {{#each rollen}}
            "{{this}}",
            {{/each}}
            "All Users"
          ],
        {{/if}}

**in der Struktur:**

          {
            "identity": [{

              "003use_bez": "{{{displayname}}}",
              "003use_name": "{{{username}}}",
              "003use_pw": "{{{password}}}",
              "011acc_pin": "{{{pin}}}",
              "009ext_extension": "{{{phone}}}",
              "016voi_email": "{{{email}}}"
              {{#if rollen}}
                ,"user_roles": [
                  {{#each rollen}}
                  "{{this}}",
                  {{/each}}
                  "All Users"
                ],
              {{/if}}
              ,"post": {
                "phonebook": [{
                  "028pho_bez":       "{{{displayname}}}",
                  "028pho_firstname": "{{{givenname}}}",
                  "028pho_lastname":  "{{{surname}}}",
                  "028pho_email":     "{{{email}}}"
                  }]
                }
            }]
          }


#### Softphone, Mobiltelefon oder IP-Telefone zuweisen

Sie können aus dem ActiveDirectory heraus einem Benutzer direkt ein IP-Telefon oder Softphone zuweisen.

**IP-Telefon via MAC zuweisen:**

Fügen Sie hierzu im Reiter {{< ui-button "Variablen" >}} folgende Zeile durch {{< ui-button "Hinzufügen" >}} ein:

|Variable|Quelle|
|----|----|
|mac|return $row["ipphone"];|

Durch diese Zeile speichert der Connector den Inhalt des ActiveDirectory Feldes "ipphone" in der Variable "mac" ab.
"mac" entspricht der MAC-Adresse des IP-Telefons das zugewiesen werden soll.
Diese Variable muss nun unter {{< ui-button "Struktur" >}} dem IP-Telefon pascom Feld zugeordnet werden.

Ergänzen Sie hierzu die Zeilen:

      ,"ipphone“: [{
            "010dev_bez": "{{username}}_sipdevice“,
            „071ipp_mac“: „{{{mac}}}“
        }],

**Softphone zuweisen:**

Wenn Sie dem Benutzer ein pascom-Softphone zuweisen möchten, muss keine zusätzliche Variable angelegt werden.

Es genügt, wenn Sie unter {{< ui-button "Variablen" >}} den Eintrag **createSoftphone** auf "return true;" stellen.

**Mobiltelefon zuweisen:**

Wenn Sie dem Benutzer ein Mobiltelefon zuweisen möchten, muss keine zusätzliche Variable angelegt werden. Die Rufnummer des Mobiltelefons wird automatisch aus dem ActiveDirectory Feld "Rufnummer" > "Mobil" ausgelesen.

Es genügt, wenn Sie unter {{< ui-button "Variablen" >}} den Eintrag **createMobile** auf "return true;" stellen.

## Connector-Profil "Telefonbuch aus AD"

Erstellen Sie ein neues Connector-Profil indem Sie in der pascom Web-UI unter dem
Menüpunkt {{< ui-button "Erweitert" >}} > {{< ui-button "Connector" >}} auf {{< ui-button "Hinzufügen" >}} klicken.

Wählen Sie die Vorlage *Telefonbuch aus AD* und tragen Sie folgende Daten ein:

|Feld|Beschreibung|
|---|---|
|**Bezeichung**|Name des Connectors|
|**AD Domäne**|Active Directory Domain Name|
|**AD Server**|Server IP oder DNS-Name des Hosts|
|**SSL aktivieren**|**JA**: zu Active Directory via sicherer SSL-Verbindung verbinden. **NEIN**: zu Active Directory ohne SSL verbinden.|
|**Benutzername** und **Passwort**|Der zuvor im AD angelegte pascom Benutzer zur Authentifizierung|

Nach dem Speichern kann die Vorlage im Reiter {{< ui-button "Basisdaten" >}} bei Bedarf angepasst werden.

### Basisdaten

In den Basisdaten konfigurieren Sie die Verbindung zu Ihrem Active Directory genauer oder können die zuerst konfigurierten Einstellungen ändern.

|Feld|Beschreibung|
|---|---|
|**Bezeichung**|Name des Connectors (*wird automatisch befüllt*)|
|**Modus**|**Neue Sätze importieren, geänderte abgleichen und früher importiere Datensätze entfernen**: (*Standardauswahl*) Importiert nur neue Telefonbucheinträge und gleicht geänderte Einträge ab, alte Einträge werden entfernt. **Neue Sätze importieren und geänderte abgleichen**: Importiert neue Telefoneinträge und gleicht geänderte ab. Es werden keine Einträge entfernt.|
|**URI**|Uri zur Active Directory Domain (*wird automatisch befüllt*)|
|**Basis DN**|Basis DN Einträge zum Active Directory (*wird automatisch befüllt*)|
|**Benutzername** und **Passwort**|Der zuvor im AD angelegte pascom Benutzer zur Authentifizierung (*wird automatisch befüllt*)|
|**Suchfilter**|LDAP-Suchfilter zur Filterung des auszulesenen Telefonbuch-Ordners (*wird automatisch befüllt*)|
|**Dokumentation**|Dient zur Dokumentation/ Beschreibung des Connectors|

### Pre Filter

Im Standard importiert die Vorlage alle globalen Telefonbucheinträge aus dem AD. Über den Reiter {{< ui-button "Pre Filter" >}} können Sie den Import eines bestimmten Telefonbuchs, z. B. *company-phonebook*, einschränken. Fügen Sie dazu folgenden Code ein:

    if (strpos($row['memberOf'],'company-phonebook') !== false) {
    return true;
    }
    return false;

### Telefonbuchfelder im AD

|Active Directory|pascom|Beschreibung|
|---|---|---|
|Allgemein > Anzeigename|Anzeigename |Der Anzeigename erscheint im Telefondisplays und im pascom Client Journal. Pflichtfeld.|
|Rufnummer > Privat|Telefon|Die Rufnummer des Kontakts.|
|Allgemein > Vorname|Vorname|Vorname des Kontakts.|
|Allgemein > Nachname|Nachname|Nachname des Kontakts.|
|Organisation > Firma|Organisation|Firma des Kontakts.|
|Rufnummer > Fax|Fax|Faxnummer des Kontakts.|
|Allgemein > E-Mail|EMail|E-Mail Adresse des Kontakts.|
|Rufnummern > Mobil|Handy|Mobilnummer des Kontakts.|

Die Felder sind lediglich ein Vorschlag der Vorlage. Sie können Felder hinzufügen und entfernen bzw. die gesamte Import-Struktur beliebig anpassen.

### Importlauf testen und aktivieren

Nachdem Sie die Konfiguration abgeschlossen haben, können Sie durch die Schaltfläche {{< ui-button "Speichern und Simulieren" >}} testen welche Datensätze importiert werden würden. Wenn Sie mit dem Ergebnis zufrieden sind können Sie den Import entweder einmalig unter {{< ui-button "Aktion" >}} > {{< ui-button "Import jetzt durchführen" >}} ausführen oder durch die Schaltfläche {{< ui-button "Automatisieren" >}} eine regelmäßige Durchführung des Importes einrichten.

### Optionale Einstellungen

#### Feldzuordnung anpassen

Im Connector Profil können Sie im Reiter Variablen und Struktur die Feldzuordnung ActiveDirectory > pascom Telefonbuch an Ihre Bedürfnisse anpassen.

Als Beispiel möchten wir Hinweise zu dem Kontakt im Notizfeld des pascom Telefonbuches speichern.
Fügen Sie hierzu im Reiter {{< ui-button "Variablen" >}} folgende Zeile durch {{< ui-button "Hinzufügen" >}} ein:

|Variable|Quelle|
|----|----|
|Notiz|return $row["info"];|

Durch diese Zeile speichert der Connector den Inhalt des ActiveDirectory Feldes "Info" (*Rufnummern > Anmerkung*) in der Variable "Notiz" ab.
Diese Variable muss nun unter {{< ui-button "Struktur" >}} dem Notiz pascom-Telefonbuch Feld zugeordnet werden.

Ergänzen Sie hierzu die Zeilen:

          "028pho_notes" :        "{{{Notiz}}}"

**in der Struktur:**

        {
          "phonebook": [{
            "028pho_bez" :  "{{{DisplayName}}}",
            "028pho_phone" : "{{{BusinessPhone}}}",
            "028pho_firstname" :  "{{{GivenName}}}",
            "028pho_lastname" : "{{{Surname}}}",
            "028pho_organisation" : "{{{CompanyName}}}",
            "028pho_email" :  "{{{EmailAddress}}}",
            "028pho_mobile" : "{{{MobilePhone}}}",
            "028pho_homephone" :  "{{{HomePhone}}}",
            "028pho_fax" :  "{{{BusinessFax}}}",
            "028pho_notes" :  "{{{Notiz}}}"
          }]
        }

Dadurch wird der Wert der Variablen Notiz dem **Notiz** pascom Telefonbuch Feld zugewiesen.


## Connector-Profil "Kurzwahlen aus AD"

Erstellen Sie ein neues Connector-Profil indem Sie in der pascom Web-UI unter dem
Menüpunkt {{< ui-button "Erweitert" >}} > {{< ui-button "Connector" >}} auf {{< ui-button "Hinzufügen" >}} klicken.

Wählen Sie die Vorlage *Kurzwahlen aus AD* und tragen Sie folgende Daten ein:

|Feld|Beschreibung|
|---|---|
|**Bezeichung**|Name des Connectors|
|**AD Domäne**|Active Directory Domain Name|
|**AD Server**|Server IP oder DNS-Name des Hosts|
|**SSL aktivieren**|**JA**: zu Active Directory via sicherer SSL-Verbindung verbinden. **NEIN**: zu Active Directory ohne SSL verbinden.|
|**Benutzername** und **Passwort**|Der zuvor im AD angelegte pascom Benutzer zur Authentifizierung|

Nach dem Speichern kann die Vorlage im Reiter {{< ui-button "Basisdaten" >}} bei Bedarf angepasst werden.

### Basisdaten

In den Basisdaten konfigurieren Sie die Verbindung zu Ihrem Active Directory genauer oder können die zuerst konfigurierten Einstellungen ändern.

|Feld|Beschreibung|
|---|---|
|**Bezeichung**|Name des Connectors (*wird automatisch befüllt*)|
|**Modus**|**Neue Sätze importieren, geänderte abgleichen und früher importiere Datensätze entfernen**: (*Standardauswahl*) Importiert nur neue Kurzwahlen und gleicht geänderte Einträge ab, alte Einträge werden entfernt. **Neue Sätze importieren und geänderte abgleichen**: Importiert neue Kurzwahlen und gleicht geänderte ab. Es werden keine Einträge entfernt.|
|**URI**|Uri zur Active Directory Domain (*wird automatisch befüllt*)|
|**Basis DN**|Basis DN Einträge zum Active Directory (*wird automatisch befüllt*)|
|**Benutzername** und **Passwort**|Der zuvor im AD angelegte pascom Benutzer zur Authentifizierung (*wird automatisch befüllt*)|
|**Suchfilter**|LDAP-Suchfilter zur Filterung des auszulesenen Telefonbuch-Ordners (*wird automatisch befüllt*)|
|**Dokumentation**|Dient zur Dokumentation/ Beschreibung des Connectors|

### Pre Filter

Im Standard importiert die Vorlage alle Benutzer außer "mobydick" aus dem AD. Über den Reiter {{< ui-button "Pre Filter" >}} können Sie den Import einer Gruppe von Benutzern, z. B. *emergency-user*, einschränken. Fügen Sie dazu folgenden Code ein:

    if (strpos($row['memberOf'],'emergency-user') !== false) {
    return true;
    }
    return false;

### Kurzwahlfelder im AD

|Active Directory|pascom|Beschreibung|
|---|---|---|
|Allgemein > Anzeigename|Anzeigename |Der Anzeigename erscheint im Telefondisplays und im pascom Client Journal. Pflichtfeld.|
|Allgemein > Rufnummer|Telefon|Die Kurzwahl-Rufnummer des Kontakts.|
|Allgemein > Vorname|Vorname|Vorname des Kontakts.|
|Allgemein > Nachname|Nachname|Nachname des Kontakts.|
|Organisation > Firma|Organisation|Firma des Kontakts.|
|Rufnummer > Fax|Fax|Faxnummer des Kontakts.|
|Allgemein > E-Mail|EMail|E-Mail Adresse des Kontakts.|
|Rufnummer > Privat|Telefon privat|Die private Rufnummer des Kontakts.|
|Rufnummern > Mobil|Handy|Mobilnummer des Kontakts.|

Die Felder sind lediglich ein Vorschlag der Vorlage. Sie können Felder hinzufügen und entfernen bzw. die gesamte Import-Struktur beliebig anpassen.

### Importlauf testen und aktivieren

Nachdem Sie die Konfiguration abgeschlossen haben, können Sie durch die Schaltfläche {{< ui-button "Speichern und Simulieren" >}} testen welche Datensätze importiert werden würden. Wenn Sie mit dem Ergebnis zufrieden sind können Sie den Import entweder einmalig unter {{< ui-button "Aktion" >}} > {{< ui-button "Import jetzt durchführen" >}} ausführen oder durch die Schaltfläche {{< ui-button "Automatisieren" >}} eine regelmäßige Durchführung des Importes einrichten.


### Optionale Einstellungen

#### Feldzuordnung anpassen

Im Connector Profil können Sie im Reiter Variablen und Struktur die Feldzuordnung ActiveDirectory > pascom Kurzwahlen an Ihre Bedürfnisse anpassen.

Als Beispiel möchten wir Hinweise zu der Kurzwahl im Notizfeld des pascom Telefonbuches speichern.
Fügen Sie hierzu im Reiter {{< ui-button "Variablen" >}} folgende Zeile durch {{< ui-button "Hinzufügen" >}} ein:

|Variable|Quelle|
|----|----|
|hint|return $row["info"];|

Durch diese Zeile speichert der Connector den Inhalt des ActiveDirectory Feldes "Info" (*Rufnummern > Anmerkung*) in der Variable "hint" ab.
Diese Variable muss nun unter {{< ui-button "Struktur" >}} dem Notiz pascom-Telefonbuch Feld zugeordnet werden.

Ergänzen Sie hierzu die Zeilen:

          "028pho_notes" :        "{{{hint}}}"

**in der Struktur:**

        {
          "speeddial": [
            {
              "042spe_bez": "{{{displayname}}}",
              "042spe_target": "{{{phone}}}",
              "post": {
                "phonebook": [{
                  "028pho_bez" : 		    "{{{displayname}}}",
                  "028pho_phone" : 		  "{{{phone}}}",
                  "028pho_firstname" : 	  "{{{givenname}}}",
                  "028pho_lastname" : 	  "{{{surname}}}",
                  "028pho_organisation" : "{{{organisation}}}",
                  "028pho_email" : 		  "{{{email}}}",
                  "028pho_mobile" : 	  "{{{mobile}}}",
                  "028pho_homephone" : 	"{{{homephone}}}",
                  "028pho_fax" : 		    "{{{fax}}}",
                  "028pho_notes" :      "{{{hint}}}"
                }]
              }
            }
          ]
        }

Dadurch wird der Wert der Variablen Notiz dem **Notiz** pascom Telefonbuch Feld zugewiesen.
