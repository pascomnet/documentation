---
title: LDAP Integration
description: Synchronisieren und Authentifizieren Sie Ihre Benutzer gegen LDAP
weight: 70
---

{{< doctype "both" >}}

{{< description >}}

## LDAP

Das "Lightweight Directory Access Protocol" (LDAP) ist ein Netzwerkprotokoll zur Durchführung von Abfragen und Änderungen in einem verteilten Verzeichnisdienst. LDAP selbst ist kein Verzeichnis, sondern das Protokoll, über das man mit einer bestimmten Syntax, Informationen eines LDAP-Verzeichnisses abfragen kann. 

Um die Daten aus LDAP auslesen zu dürfen brauchen Sie einen Benutzer mit entsprechender Berechtigung. Vergeben Sie für den diesen Benutzer ein Passwort und markieren Sie *Kennwort läuft nie ab*. 
pascom authentifiziert sich an LDAP bei jedem Connector-Lauf. Wenn Sie das Passwort ändern möchten müssen Sie das sowohl in LDAP als auch im pascom Connector machen:

## Connector-Profil "Benutzer aus LDAP"

Erstellen Sie ein neues Connector-Profil indem Sie in der pascom Web-UI unter dem
Menüpunkt {{< ui-button "Erweitert" >}} > {{< ui-button "Connector" >}} auf {{< ui-button "Hinzufügen" >}} klicken.

Wählen Sie die Vorlage *Benutzer aus LDAP* und tragen Sie folgende Daten ein:

|Feld|Beschreibung|
|---|---|
|**Bezeichung**|Name des Connectors|
|**LDAP URI**|URL zum LDAP-Verzeichnis|
|**BaseDN**|BaseDN gibt die Position im LDAP-Verzeichnis an, die ausgelesen werden soll|
|**LDAP bindDN**|Benutzer mit Zugriff auf das LDAP-Verzeichnis|
|**Passwort**|Passwort zur Authentifizierung an LDAP|
|**Suchfilter**|Filter zur detaillierten Suche im LDAP-Verzeichnis|
|**Externe Authentifizierung**|**NEIN**: Benutzer werden nur importiert und authentifizieren sich gegen die pascom<br>**JA**: Benutzer werden importiert und können sich gegen LDAP authentifizieren. In diesem Fall wird die Authentifizierung eingerichtet und Sie können unter {{< ui-button "Appliance" >}} > {{< ui-button "Dienste" >}} im Reiter {{< ui-button "Authentifizierung" >}} bei Bedarf anpassen.|
|**Feld für Benutzernamen**|(Optional) Hier können Sie das Feld eintragen, aus dem der Anmeldename für den anzulegenden Benutzer ausgelesen werden soll. *Default: samAccountName*|
|**pascom Softphone anlegen**|**JA**: Legt automatisch für jeden importierten Benutzer ein pascom Softphone an. **NEIN**: Legt für keinen importierten Benutzer ein pascom Softphone an.|
|**Mobilgerät anlegen**|**JA**: Legt automatisch für jeden importierten Benutzer ein Mobiltelefon mit der hinterlegten Mobilrufnummer an. **NEIN**: Legt für keinen importierten Benutzer ein Mobiltelefon an.|

Nach dem Speichern kann die Vorlage im Reiter {{< ui-button "Basisdaten" >}} bei Bedarf angepasst werden.

### Pre Filter

Im Standard importiert die Vorlage alle Benutzer aus dem LDAP. Über den Reiter {{< ui-button "Pre Filter" >}} können Sie den Import von Benutzern auf bestimmte Faktoren, z. B. *displayName* ist gefüllt, einschränken. Ersetzen Sie hierzu "*return true;*" durch folgenden Code :


    return array_key_exists('displayName', $row);


### Benutzerfelder aus LDAP

Über den Reiter {{< ui-button "Variablen" >}} können Sie in der Spalte **Quelle** definieren aus welchem Benutzerfeld in LDAP die Informationen ausgelesen werden können. Auf der linken Seite ist die **Variable** definiert, die zum Importieren der Daten in die pascom Telefonanlage gesetzt werden kann.

Die bereits gesetzten Felder sind lediglich ein Vorschlag der Vorlage. Sie können Felder hinzufügen und entfernen bzw. die gesamte Import-Struktur beliebig anpassen.

### Importlauf testen und aktivieren

Nachdem Sie die Konfiguration abgeschlossen haben, können Sie durch die Schaltfläche {{< ui-button "Speichern und Simulieren" >}} testen welche Datensätze importiert werden würden. Wenn Sie mit dem Ergebnis zufrieden sind können Sie den Import entweder einmalig unter {{< ui-button "Aktion" >}} > {{< ui-button "Import jetzt durchführen" >}} ausführen oder durch die Schaltfläche {{< ui-button "Automatisieren" >}} eine regelmäßige Durchführung des Importes einrichten.

### Authentifizierung testen

Haben Sie in der Vorlage *Authentifizierung konfigurieren* auf *JA* gesetzt können Sie nun unter {{< ui-button "Appliance" >}} > {{< ui-button "Dienste" >}}
im Reiter {{< ui-button "Authentifizierung" >}} mit der Schaltfläche {{< ui-button "Anmeldung Testen" >}} testen ob die Authentifizierung Ihrer Benutzer funktioniert.


### Optionale Einstellungen

#### Feldzuordnung anpassen

Im Connector Profil können Sie im Reiter {{< ui-button "Variablen" >}} und {{< ui-button "Struktur" >}} die Feldzuordnung LDAP > pascom an Ihre Bedürfnisse anpassen.

Als Beispiel möchten wir die Berufsbezeichnung des Benutzers im Notizfeld des pascom Telefonbuches speichern.
Fügen Sie hierzu im Reiter {{< ui-button "Variablen" >}} folgende Zeile durch {{< ui-button "Hinzufügen" >}} ein:

|Variable|Quelle|
|----|----|
|Job|return $row["Job"];|

Durch diese Zeile speichert der Connector den Inhalt des LDAP Feldes "Job" in der gleichnamigen Variable "Job" ab.
Diese Variable muss nun unter {{< ui-button "Struktur" >}} dem Notiz pascom-Telefonbuch Feld zugeordnet werden.

Ergänzen Sie hierzu die Zeile im "phonebook"-Abschnitt:

          "028pho_notes" :        "{{{Job}}}"

**in der Struktur:**

    {
      "identity": [{

        "003use_bez": "{{{displayname}}}",
        "003use_name": "{{{username}}}",
        "003use_auth_method": "EXTERN",
        "011acc_pin": "{{{pin}}}",
        "009ext_extension": "{{{phone}}}",
        "016voi_email": "{{{email}}}",

        "post": {
          "phonebook": [{
            "028pho_bez":       "{{{displayname}}}",
            "028pho_firstname": "{{{givenname}}}",
            "028pho_lastname":  "{{{surname}}}",
            "028pho_email":     "{{{email}}}",
            "028pho_notes" :  "{{{Job}}}"
          }]
        }
      }]
    }


Dadurch wird der Wert der Variablen Job dem **Notiz** pascom Telefonbuch Feld zugewiesen.


#### Rollenzuweisung

Um Benutzer direkt beim Import einer Rolle zuweisen zu können muss die Struktur um die Rollenzuweisung erweitert werden. Sie können die zugehörigen Benutzerrollen aus dem LDAP Benutzerfeld **memberOf** auslesen. 

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
Über das Benutzerfeld "memberOf" können Sie die Rollen in pascom bestimmen.
Durch diese Zeile kann der Connector die Mitgliedszuweisung via LDAP auslesen und in dem Benutzerrollen pascom Feld zuordnen.

{{% notice note%}}
Tragen Sie in der PHP-Variable `rolesToFilter` im Code des *Quelle* Feldes, die Rollenbezeichnungen ein, nach denen der Connector suchen soll. Alle anderen Mitgliedszuweisungen werden ignoriert.
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
        "003use_auth_method": "EXTERN",
        "011acc_pin": "{{{pin}}}",
        "009ext_extension": "{{{phone}}}",
        "016voi_email": "{{{email}}}",
      {{#if rollen}}
        ,"user_roles": [
          {{#each rollen}}
          "{{this}}",
          {{/each}}
          "default"
        ],
      {{/if}}
        "post": {
          "phonebook": [{
            "028pho_bez":       "{{{displayname}}}",
            "028pho_firstname": "{{{givenname}}}",
            "028pho_lastname":  "{{{surname}}}",
            "028pho_email":     "{{{email}}}"
          }]
        }
      }]
    }


{{% notice note%}}
Die Rolle "default" entspricht der System-Rolle "Alle", der alle Benutzer zugewiesen sind.
{{% /notice%}}

#### Softphone, Mobiltelefon oder IP-Telefone zuweisen

Sie können aus dem LDAP-Verzeichnis heraus einem Benutzer direkt ein IP-Telefon oder Softphone zuweisen.

**IP-Telefon via MAC zuweisen:**

Im Benutzerimport via LDAP sind bereits alle notwendigen Variablen und die Struktur für das Anlegen eines IP-Telefons vorhanden.
Stellen Sie sicher, das in den Benutzerfeldern Ihres LDAP-Verzeichnisses die Werte befüllt sind, die Sie in der pascom WebUI im Reiter {{< ui-button "Variablen" >}} finden:

|Variable|Quelle|Beschreibung|
|----|----|----|
|phonemac|return $row["phonemac"];|MAC-Adresse des IP-Telefons|
|phoneip|return $row["phoneip"];|IP der IP-Telefons in Ihrem Netz|
|phoneuser|return $row["phoneuser"];|Benutzername zur Authentifizierung am IP-Telefon|
|phonepass|return $row["phonepass"];|Passwort zur Authentifizierung am IP-Telefon|

Optional können auch direkt beim Import die FollowMe-Einstellungen des IP-Telefons gesetzt werden:

|Variable|Quelle|Beschreibung|
|----|----|----|
|inttimeout|return $row["inttimeout"];|Interne Anrufe: Timeout in Sekunden|
|intdelay|return $row["intdelay"];|Interne Anrufe: Wartezeit in Sekunden|
|exttimeout|return $row["exttimeout"];|Externe Anrufe: Timeout in Sekunden|
|extdelay|return $row["extdelay"];|Externe Anrufe: Wartezeit in Sekunden|
|quetimeout|return $row["quetimeout"];|Team Anrufe: Timeout in Sekunden|
|quedelay|return $row["quedelay"];|Team Anrufe: Wartezeit in Sekunden|


Durch diese Zeilen speichert der Connector den Inhalt der LDAP Benutzerfelder in der entsprechenden pascom Variable ab.

**Softphone zuweisen:**

Wenn Sie dem Benutzer ein pascom-Softphone zuweisen möchten, muss keine zusätzliche Variable angelegt werden.

Es genügt, wenn Sie unter {{< ui-button "Variablen" >}} den Eintrag **createSoftphone** auf "return true;" stellen.

**Mobiltelefon zuweisen:**

Wenn Sie dem Benutzer ein Mobiltelefon zuweisen möchten, muss keine zusätzliche Variable angelegt werden. Die Rufnummer des Mobiltelefons wird automatisch aus dem LDAP Benutzerfeld "mobile" ausgelesen.

Es genügt, wenn Sie unter {{< ui-button "Variablen" >}} den Eintrag **createMobile** auf "return true;" stellen.
