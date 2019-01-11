---
title: Univention (UCS) Integration
description: Synchronisieren und Authentifizieren Sie Ihre Benutzer gegen den Univention Server
weight: 60
toc: true
---

{{< doctype "both"  >}}

{{< description >}}


![Univention Server](ucs.png?width=10%)

## Konzept

Univention Corporate Server (kurz UCS) ist ein auf Debian basierender Server, mit integriertem Managementsystem für zentrale und plattformübergreifende Verwaltung von Servern, Diensten, Desktops und Benutzern. Weitere Informationen finden Sie [hier](https://www.univention.de/).

Mit dem pascom Connector für UCS können Sie Benutzer importieren und synchronisieren. Zusätzlich kann die Authentifizierung der pascom Benutzer gegen UCS aktivieren werden.

## Konfiguration

### Vorbereitung

#### Installation der pascom App auf dem UCS

Bevor Benutzer aus dem UCS in die pascom importiert werden können, müssen auf dem UCS eine App installiert werden und ein paar Einstellungen vorgenommen werden. Loggen Sie sich hierfür auf die Weboberfläche Ihres UCS-Servers ein.
Apps können über das App Center heruntergeladen und installiert werden. Das App Center findet man unter dem Menüpunkt {{< ui-button "Software" >}} > {{< ui-button "App Center" >}}.
Suchen Sie über die Suchfunktion nach der gewünschten App, in unserem Fall *mobydick*. Die App kann nun ausgewählt installiert werden.

#### UCS Rechner für pascom anlegen

Ist die *mobydick* App erfolgreich installiert, muss der pascom Server als Rechner im UCS hinzugefügt werden.
Über {{< ui-button "Geräte" >}} > {{< ui-button "Rechner" >}} kann der pascom Server hinzugefügt werden.
Anschließend erscheint ein Popup-Fenster, wählen Sie unter dem Punkt *Rechner: Windows Workstation/Server* den Typ *Rechner:Linux* und klicken Sie weiter. Im nächsten Fenster müssen Sie nur einen Rechnernamen vergeben (z. B. pascom), die anderen Felder sind ortional. Diesen Namen wird die pascom nachher verwenden um sich beim UCS zu authentifizieren.

Wählen Sie nun in der Rechnerliste den neu angelegten Server aus und vergeben Sie unter {{< ui-button "Erweiterte Einstellungen" >}} ein Passwort. Dieses Passwort wird die pascom nachher verwenden um sich beim UCS zu authentifizieren.

#### UCS Benutzer für pascom frei schalten

Benutzer die im UCS angelegt sind werden nicht automatisch von der pascom importiert. In den Benutzereinstellungen unter {{< ui-button "Erweiterte Einstellungen" >}} muss bei jedem Benutzer der imporiert werden soll bei *MobyDick* ein Häkchen gesetzt werden für *Mobydick erlaubt*.


### Connector-Profil für UCS anlegen

Erstellen Sie ein neues Connector-Profil indem Sie in der pascom Web-UI unter dem
Menüpunkt {{< ui-button "Erweitert" >}} > {{< ui-button "Connector" >}} auf {{< ui-button "Hinzufügen" >}} klicken.

Wählen Sie die Vorlage *Benutzer aus UCS* und tragen Sie folgende Daten ein:

|Feld|Beschreibung|
|---|---|
|**Bezeichung**|Name des Connectors|
|**UCS Domäne**|UCS Domain z.B. mydomain.intranet|
|**UCS Server**|Server IP oder DNS-Name des Hosts|
|**Benutzername** und **Passwort**|Der zuvor angelegte pascom Rechner und das dazugehörige Passwort|
|**Authentifizierung konfigurieren**|**NEIN**: Benutzer werden nur importiert und authentifizieren sich gegen die pascom<br>**JA**: Benutzer werden importiert und können sich gegen USC authentifizieren. In diesem Fall wird die Authentifizierung eingerichtet und Sie können unter {{< ui-button "Appliance" >}} > {{< ui-button "Dienste" >}} im Reiter {{< ui-button "Authentifizierung" >}} bei Bedarf anpassen.|
|**pascom Softphone anlegen**|**JA**: Legt automatisch für jeden importierten Benutzer ein pascom Softphone an.<br>**NEIN**: Legt für keinen importierten Benutzer ein pascom Softphone an.|
|**Mobilgerät anlegen**|**JA**: Legt automatisch für jeden importierten Benutzer ein Mobiltelefon mit der hinterlegten Mobilrufnummer an.<br>**NEIN**: Legt für keinen importierten Benutzer ein Mobiltelefon an.|

Nach dem Speichern kann die Vorlage im Reiter {{< ui-button "Basisdaten" >}} bei Bedarf angepasst werden.

#### Benutzerfelder im UCS

|UCS|pascom|Bescheibung|
|---|---|---|
|Allgemein > Benutzeranmeldename|Anmeldename|Der Anmeldename wird für sämtliche Anmeldung verwendet und darf nur Kleinbuchstaben enthalten. Pflichtfeld.|
|Allgemein > Anzeigename|Anzeigename |Der Anzeigename erscheint auf allen Telefondisplays und im pascom Client. Pflichtfeld.|
|Allgemein > Vorname|Vorname|Vorname des Benutzers für den pascom Telefonbucheintrag.|
|Allgemein > Nachname|Nachname|Nachname des Benutzers für den pascom Telefonbucheintrag.|
|Allgemein > Primäre E-Mail-Adresse|EMail|E-Mail Adresse des Benutzers. Wird für den Versand von Voicemails und Faxen benötigt.|
|Kontakt > Telefonnummer|Durchwahl|Die interne Durchwahl des Benutzers. Wird diese nicht im AD gepflegt, vergibt pascom automatisch die nächste freie Durchwahl aus dem Telefonnummernpool.|
|Kontakt > Telefonnummer Festnetz|Telefon privat|Private Telefonnummer des Benutzers für den pascom Telefonbucheintrag.|
|Kontakt > Telefonnummer Mobil|Handy|Mobilnummer des Benutzers für den pascom Telefonbucheintrag und das automatisch angelegte Mobiltelefon.|

Die Felder sind lediglich ein Vorschlag der Vorlage. Sie können Felder hinzufügen und entfernen bzw. die gesamte Import-Struktur beliebig anpassen.

#### Importlauf testen und aktivieren

Nachdem Sie die Konfiguration abgeschlossen haben, können Sie durch die Schaltfläche {{< ui-button "Speichern und Simulieren" >}} testen welche Datensätze importiert werden würden. Wenn Sie mit dem Ergebnis zufrieden sind können Sie den Import entweder einmalig unter {{< ui-button "Aktion" >}} > {{< ui-button "Import jetzt durchführen" >}} ausführen oder durch die Schaltfläche {{< ui-button "Automatisieren" >}} eine regelmäßige Durchführung des Importes einrichten.

#### Authentifizierung testen

Haben Sie in der Vorlage *Authentifizierung konfigurieren* auf *JA* gesetzt können Sie nun unter {{< ui-button "Appliance" >}} > {{< ui-button "Dienste" >}}
im Reiter {{< ui-button "Authentifizierung" >}} mit der Schaltfläche {{< ui-button "Anmeldung Testen" >}} testen ob die Authentifizierung Ihrer Benutzer funktioniert.



### Optionale Einstellungen

#### Feldzuordnung anpassen

Im Connector Profil können Sie im Reiter Variablen und Struktur die Feldzuordnung Univention > pascom an Ihre Bedürfnisse anpassen.

Als Beispiel möchten wir die Raumnummer des Büros des Benutzers im Notizfeld des pascom Telefonbuches speichern.
Fügen Sie hierzu im Reiter {{< ui-button "Variablen" >}} folgende Zeile durch {{< ui-button "Hinzufügen" >}} ein:

|Variable|Quelle|
|----|----|
|roomnumber|return $row["roomnumber"];|

Durch diese Zeile speichert der Connector den Inhalt des Univention Feldes "Kontakt" > "Raumnummer" (roomnumber) in der Variable "roomnumber" ab.
Diese Variable muss nun unter {{< ui-button "Struktur" >}} dem Notiz pascom-Telefonbuch Feld zugeordnet werden.

Ergänzen Sie hierzu die Zeilen:

          "028pho_notes" :        "{{{roomnumber}}}"

**in der Struktur:**

        {
          "identity": [{

            "003use_bez": "{{{displayname}}}",
            "003use_name": "{{{username}}}",
            "009ext_extension": "{{{phone}}}",
            "016voi_email": "{{{email}}}",            
            "003use_auth_method": "EXTERN"          
            ,"post": {
              "phonebook": [{
                "028pho_bez" :  "{{{displayname}}}",
                "028pho_firstname" :  "{{{givenname}}}",
                "028pho_lastname" : "{{{surname}}}",
                "028pho_email" :  "{{{email}}}",
                "028pho_mobile" : "{{{mobile}}}",
                "028pho_homephone" :  "{{{homephone}}}",
                "028pho_notes" :  "{{{roomnumber}}}"
              }]
            }
          }]
        }


Dadurch wird der Wert der Variablen roomnumber dem **Notiz** pascom Telefonbuch Feld zugewiesen.

<!-- mit der aktuellen Abfrage noch nicht möglich 
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
            $list = explode(',', str_replace(array('[', ']', 'cn=', 'dc=', '"'), '', $group));
            foreach($list as $elem) {
             if(in_array($elem, $rolesToFilter)) {
                $output[]=$elem;
              }
            }
          }

          return $output;

Das Feld "rollen" entspricht einer Liste an Rollen, denen der Benutzer zugeordnet werden soll.
Über die Mitgliedszuweisung in Univention können Sie die Rollen in pascom bestimmen.
Durch diese Zeile kann der Connector die Mitgliedszuweisung aus dem Univention auslesen und in dem Benutzerrollen pascom Feld zuordnen.

{{% notice note%}}
Tragen Sie in der PHP-Variable `rolesToFilter` im Code des *Quelle* Feldes, die Rollenbezeichnungen ein, nach denen der Connector in Univention suchen soll. Alle anderen Univention Mitgliedszuweisungen werden ignoriert.
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
              "009ext_extension": "{{{phone}}}",
              "016voi_email": "{{{email}}}",
              "003use_auth_method": "EXTERN"
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
                  "028pho_email":     "{{{email}}}",
                  "028pho_homephone": "{{{homephone}}}",
                  "028pho_mobile": "{{{mobile}}}"
                  }]
                }
            }]
          }
-->

#### Softphone oder Mobiltelefon zuweisen

Sie können aus dem Univention heraus einem Benutzer direkt ein Softphone oder Mobiltelefon zuweisen.

**Softphone zuweisen:**

Wenn Sie dem Benutzer ein pascom-Softphone zuweisen möchten, muss keine zusätzliche Variable angelegt werden.

Es genügt, wenn Sie unter {{< ui-button "Variablen" >}} den Eintrag **createSoftphone** auf "return true;" stellen.

**Mobiltelefon zuweisen:**

Wenn Sie dem Benutzer ein Mobiltelefon zuweisen möchten, muss keine zusätzliche Variable angelegt werden. Die Rufnummer des Mobiltelefons wird automatisch aus dem Univention Feld "Kontakt" > "Telefonnummer Mobil" ausgelesen.

Es genügt, wenn Sie unter {{< ui-button "Variablen" >}} den Eintrag **createMobile** auf "return true;" stellen.

