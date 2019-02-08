---
title: Telefonbuch aus Microsoft Active Directory
description: Synchronisieren Sie Ihre Telefonbuch-Einträge gegen das Microsoft Active Directory
weight: 20
---


## Microsoft Active Directory

Um die Daten aus dem Active Directory auslesen zu dürfen brauchen Sie einen Benutzer mit entsprechender Berechtigung. Natürlich könnten Sie dazu den Active Directory Administrator verwenden. Da pascom die Zugangsdaten für den wiederholten Import abspeichern muss und der Administrator mit wesentlich mehr als den benötigten Rechten ausgestattet ist, bietet es sich an einen eigenen Benutzer für pascom anzulegen:

Wenn Sie *mobydick* als Benutzernamen verwenden wird dieser beim Import durch den LDAP-Filter erkannt und nicht automatisch als Benutzer auf der Telefonanlage mit angelegt.

Vergeben Sie für den pascom Benutzer ein Passwort und markieren Sie *Kennwort läuft nie ab*. pascom authentifiziert sich am Active Directory bei jedem Connector-Lauf. Wenn Sie das Passwort ändern möchten müssen Sie das sowohl in Active Directory als auch im pascom Connector machen:


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

#### (Optional) Labels nutzen

pascom Labels lassen sich auch dazu nutzen zusätzliche Informationen aus Active Directory
mit im pascom Firmentelefonbuch anzuzeigen.

In diesem Beispiel möchten wir die Kundennummer des Active Directory Kontakts im Label **Kundennummer**
abspeichern. Dieses Label ist dann nicht nur im Telefonbuch sondern auch in Journaleinträgen oder diversen Anruferinformationen sichtbar.

#### Label anlegen

Labels legen Sie im Menü {{< ui-button "Anrufverteilung" >}} > {{< ui-button "Anruf Labels" >}} durch Klicken auf die Schaltfläche {{< ui-button "Hinzufügen" >}} an.

Wählen Sie {{< ui-button "Generisches Label" >}}, vergeben Sie den Namen **Kundennummer** und klicken auf {{< ui-button "Speichern" >}}.

Wenden Sie ausstehende Jobs an um das Label anzulegen.

#### Connector Profil anpassen

Fügen Sie hierzu im Reiter {{< ui-button "Variablen" >}} folgende Zeile durch {{< ui-button "Hinzufügen" >}} ein:

|Variable|Quelle|
|---|---|
|Customernumber|return $row['Customernumber'];|

{{% notice info%}}
Im Gegensatz zu anderen Connector-Profilen muss der Name der Variablen und
der Name des Quellfeldes (hier "Customernumber") identisch sein.
{{% /notice  %}}

Durch diese Zeile speichert der Connector den Inhalt des Active Directory Feldes "Customernumber" in der gleichnamigen Variable "Customernumber" ab.

Diese Variable muss nun unter {{< ui-button "Struktur" >}} dem Label **Kundennummer** pascom Feld zugeordnet werden.

Ergänzen Sie hierzu die Zeilen:

```
"post": {
            "phonebook.phonebooklabel": [
                {
                    "050lab_bez": "Kundennummer",
                    "028050pholab_value": "{{{Customernumber}}}"
                }
            ]
}
```

in der Struktur:

```
{
  "phonebook": [{
    "028pho_bez" :          "{{{DisplayName}}}",
    "028pho_phone" :        "{{{BusinessPhone}}}",
    "028pho_firstname" :    "{{{GivenName}}}",
    "028pho_lastname" :     "{{{Surname}}}",
    "028pho_organisation" : "{{{CompanyName}}}",
    "028pho_email" :        "{{{EmailAddress1}}}",
    "028pho_mobile" :       "{{{MobilePhone}}}",
    "028pho_homephone" :    "{{{HomePhone}}}",
    "028pho_fax" :          "{{{BusinessFax}}}",
    "post": {
            "phonebook.phonebooklabel": [
                {
                    "050lab_bez": "Kundennummer",
                    "028050pholab_value": "{{{Customernumber}}}"
                }
            ]
    }
  }]
}
```

Dadurch wird jedem Kontakt mit eingetragener Kundennummer das Label **Kundennummer** mit
dem entsprechenden Wert zugeteilt.

#### Ergebnis prüfen

{{% notice info%}}
Label-Zuordnungen werden NICHT unter "Speichern und Simulieren" mit angezeigt
{{% /notice  %}}

Prüfen Sie die erfolgreiche Zuordnung des Labels in der pascom Web-UI unter {{< ui-button "Benutzer" >}} > {{< ui-button "Telefonbuch" >}} indem Sie einen ensprechenden Kontakt {{< ui-button "Bearbeiten" >}} und die Zuordnung im Reiter {{< ui-button "Labels" >}} prüfen. Alternativ können Sie auch das Firmentelefonbuch im pascom Client einsehen.

{{% notice info %}}
Ggf. ist es notwendig den XMPP-Dienst unter {{< ui-button "Anwenden">}} > {{< ui-button "XMPP Server neu starten">}} neu zu starten, um alle mit der pascom verbundenen Clients neu zu starten und damit mit der Telefonanlage zu synchronisieren, damit alle konfigurierten Labels korrekt angezeigt werden.
{{% /notice %}}
