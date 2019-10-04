---
title: Telefonbuch aus CSV
description: Telefonbuch-Kontakte aus externen Systemen importieren
weight: 20
---

{{< doctype "both" >}}

{{< description >}}


## Connector-Profil "Telefonbuch aus CSV"

{{< youtube zK3yOniy0Ok >}} 

|Variablen|Beschreibung|
|---|---|
|**Bezeichnung**|Bezeichnung des Profils|
|**Typ**|Wählen Sie aus wie die CSV-Datei zur Verfügung gestellt wird. Optionen: <br/>*Default*: Upload in Browser<br/>Fetch from url|
|**Zeichensatz der CSV-Datei**|Gibt an in welchem Format die CSV-Datei vorliegt. Wie empfehlen Ihnen UTF-8 zu verwenden.|
|**Trennzeichen**|Mit welchem Trennzeichen wurden die Felder separiert.|
|**Zeilenende**|Wenn die CSV-Datei unter Windows oder Mac/Linux erstellt worden ist, unterscheidet sich das Zeilenende.|
|**Feldeinfassung**|Wir empfehlen die einzelnen Felder mit Zeichen einzufassen, z. B. "Max Muster"|

Nach dem Speichern kann die Vorlage im Reiter {{< ui-button "Basisdaten" >}} bei Bedarf angepasst werden.

### Basisdaten

In den Basisdaten konfigurieren Sie den CSV-Import genauer oder können die zuerst konfigurierten Einstellungen ändern.

|Feld|Beschreibung|
|---|---|
|**Bezeichung**|Name des Connectors (*wird automatisch befüllt*)|
|**Quelle**|CSV (*nicht veränderbar*)|
|**Modus**|**Neue Sätze importieren, geänderte abgleichen und früher importiere Datensätze entfernen**: (*Standardauswahl*) Importiert nur neue Telefonbucheinträge und gleicht geänderte Einträge ab, alte Einträge werden entfernt. <br/>**Neue Sätze importieren und geänderte abgleichen**: Importiert neue Telefoneinträge und gleicht geänderte ab. Es werden keine Einträge entfernt.|
|**Typ**|Wurde beim Erstellen **Upload in Browser** gewählt: Manuell Hochladen<br/>Wurde beim Erstellen **Fetch from url** gewählt: Von URL herunterladen|
|**CSV Datei**|Wurde "Upload in Browser" ausgewählt, kann hier die Datei direkt hochgeladen werden.|
|**CSV Datei URL**|Wurde "Fetch from url" ausgewählt, kann hier die URL zur Datei eingetragen werden.|
|**Trennzeichen**|Mit welchem Trennzeichen wurden die Felder separiert. (*wird automatisch befüllt*)|
|**Datei Format**|Gibt an in welchem Format die CSV-Datei vorliegt. (*wird automatisch befüllt*)|
|**Zeilenende**|Gibt das Betriebssystem an auf dem die CSV-Datei erstellt wurde (*wird automatisch befüllt*)|
|**Feld Einfassung**|Gibt an ob und welche Feldeinfassung in der CSV-Datei verwendet wird (*wird automatisch befüllt*|
|**Dokumentation**|Dient zur Dokumentation/ Beschreibung des Connectors|


### Pre Filter

Im Standard importiert die Vorlage alle Zeilen der CSV-Datei. Über den Reiter {{< ui-button "Pre Filter" >}} können Sie den Import auf bestimmte Werte einschränken, z. B. die Spalte *displayname*, ist nicht leer. Ersetzen Sie dazu "return true;" durch folgenden Code:

        return array_key_exists('displayName', $row);


### Benutzerfelder aus CSV

Im Reiter {{< ui-button "Variablen" >}} sehen Sie welche Felder in pascom importiert werden können. 
Die Feldzuordnung von CSV > pascom können Sie unter diesem Reiter an Ihre Bedürfnisse anpassen.
Standardmäßig entsprechen die CSV-Spaltennamen dem Feldnamen in pascom.

Hier ein Beispiel für eine CSV- Datei:

        "displayname","phone","givenname","surname","organisation","email","mobile","homephone","fax","homepage","customernumber"
        "Max Muster - pascom [30000]","+4999112345","Max","Muster","pascom","","","","+4999112399","www.pascom.net","30000"


### Importlauf testen und aktivieren

Nachdem Sie die Konfiguration abgeschlossen haben, können Sie durch die Schaltfläche {{< ui-button "Speichern und Simulieren" >}} testen, welche Datensätze importiert werden würden. Wenn Sie mit dem Ergebnis zufrieden sind können Sie den Import entweder einmalig unter {{< ui-button "Aktion" >}} > {{< ui-button "Import jetzt durchführen" >}} ausführen oder durch die Schaltfläche {{< ui-button "Automatisieren" >}} eine regelmäßige Durchführung des Importes einrichten.

{{% notice info%}}
Ein automatisierter Import wird nur empfohlen, wenn als Importtyp **Fetch from url** ausgewählt wurde.
{{% /notice  %}}


### Optionale Einstellungen

#### Feldzuordnung anpassen

Im Connector Profil können Sie im Reiter {{< ui-button "Variablen" >}} und {{< ui-button "Struktur" >}} die Feldzuordnung CSV > pascom an Ihre Bedürfnisse anpassen.

Als Beispiel möchten wir die URL zur Homepage des Kontakts im Notizfeld des pascom Telefonbuches speichern.
Fügen Sie hierzu im Reiter {{< ui-button "Variablen" >}} folgende Zeile durch {{< ui-button "Hinzufügen" >}} ein:

|Variable|Quelle|
|----|----|
|Homepage|return $row["homepage"];|

Durch diese Zeile speichert der Connector den Inhalt des CSV Feldes "homepage" in der Variable "Homepage" ab.
Diese Variable muss nun unter {{< ui-button "Struktur" >}} dem Notiz pascom Feld zugeordnet werden.

Ergänzen Sie hierzu die Zeilen:

          "028pho_notes" :        "{{{Homepage}}}"

**in der Struktur:**

        {
          "phonebook": [{
            "028pho_bez" : 			"{{{displayname}}}",
            "028pho_phone" : 		"{{{phone}}}",
            "028pho_firstname" : 	"{{{givenname}}}",
            "028pho_lastname" : 	"{{{surname}}}",
            "028pho_organisation" : "{{{organisation}}}",
            "028pho_email" : 		"{{{email}}}",
            "028pho_mobile" : 		"{{{mobile}}}",
            "028pho_homephone" : 	"{{{homephone}}}",
            "028pho_fax" : 			"{{{fax}}}",
            "028pho_notes" :        "{{{Homepage}}}"
          }]
        }


Dadurch wird der Wert der Variablen Homepage dem **Notiz** pascom Telefonbuch Feld zugewiesen.

**Liste der verfügbaren pascom Felder**

|Name|Bezeichnung|
|---|---|
|028pho_bez|Anzeigename|
|028pho_phone|Telefon|
|028pho_firstname|Vorname|
|028pho_lastname|Nachname|
|028pho_organisation|Organisation|
|028pho_email|Email|
|028pho_mobile|Handy|
|028pho_homephone|Telefon privat|
|028pho_fax|Fax|
|028pho_notes|Notizen|


#### Labels nutzen

pascom Labels lassen sich auch dazu nutzen zusätzliche Informationen aus der CSV-Datei mit im pascom Firmentelefonbuch anzuzeigen.

In diesem Beispiel möchten wir die Kundennummer Kontakts im Label **Kundennummer**
abspeichern. Dieses Label ist dann nicht nur im Telefonbuch sondern auch in Journaleinträgen oder diversen Anruferinformationen sichtbar.

**Label anlegen**

Labels legen Sie im Menü {{< ui-button "Anrufverteilung" >}} > {{< ui-button "Anruf Labels" >}} durch Klicken auf die Schaltfläche {{< ui-button "Hinzufügen" >}} an.

Wählen Sie {{< ui-button "Generisches Label" >}}, vergeben Sie den Namen **Kundennummer** und klicken auf {{< ui-button "Speichern" >}}.

Wenden Sie ausstehende Jobs an um das Label anzulegen.

**Connector Profil anpassen**

Fügen Sie hierzu im Reiter {{< ui-button "Variablen" >}} folgende Zeile durch {{< ui-button "Hinzufügen" >}} ein:

|Variable|Quelle|
|---|---|
|Customernumber|return $row['customernumber'];|

Durch diese Zeile speichert der Connector den Inhalt des CSV Feldes "customernumber" in der Variable "Customernumber" ab.
Diese Variable muss nun unter {{< ui-button "Struktur" >}} dem Label **Kundennummer** pascom Feld zugeordnet werden.

Ergänzen Sie hierzu die Zeilen:

      "post": {
                  "phonebook.phonebooklabel": [
                      {
                          "050lab_bez": "Kundennummer",
                          "028050pholab_value": "{{{Customernumber}}}"
                      }
                  ]
      }

in der Struktur:

        {
          "phonebook": [{
            "028pho_bez" : 			"{{{displayname}}}",
            "028pho_phone" : 		"{{{phone}}}",
            "028pho_firstname" : 	"{{{givenname}}}",
            "028pho_lastname" : 	"{{{surname}}}",
            "028pho_organisation" : "{{{organisation}}}",
            "028pho_email" : 		"{{{email}}}",
            "028pho_mobile" : 		"{{{mobile}}}",
            "028pho_homephone" : 	"{{{homephone}}}",
            "028pho_fax" : 			"{{{fax}}}",
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

Dadurch wird jedem Kontakt mit eingetragener Kundennummer das Label **Kundennummer** mit
dem entsprechenden Wert zugeteilt.

**Ergebnis prüfen**

{{% notice info%}}
Label-Zuordnungen werden NICHT unter "Speichern und Simulieren" mit angezeigt
{{% /notice  %}}

Prüfen Sie die erfolgreiche Zuordnung des Labels in der pascom Web-UI unter {{< ui-button "Benutzer" >}} > {{< ui-button "Telefonbuch" >}} indem Sie einen ensprechenden Kontakt {{< ui-button "Bearbeiten" >}} und die Zuordnung im Reiter {{< ui-button "Labels" >}} prüfen. Alternativ können Sie auch das Firmentelefonbuch im pascom Client einsehen.

{{% notice info %}}
Ggf. ist es notwendig den XMPP-Dienst unter {{< ui-button "Anwenden">}} > {{< ui-button "XMPP Server neu starten">}} neu zu starten, um alle mit der pascom verbundenen Clients neu zu starten und damit mit der Telefonanlage zu synchronisieren, damit alle konfigurierten Labels korrekt angezeigt werden.
{{% /notice %}}