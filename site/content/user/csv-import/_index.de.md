---
title: Benutzer aus CSV Import
description: Importieren Sie Ihre Benutzer aus externen Systemen via CSV
weight: 50
---

{{< doctype "both" >}}

{{< description >}}

## Training Video

{{< youtube 8Zt1Ojdoxn0 >}}

## Connector-Profil "Benutzer aus CSV"

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

        "displayname","username","password","pin","phone","givenname","surname","email","mobile","homephone","job"
        "Max Muster","mmuster","12ab34cd56","1234","345","Max","Muster","","","","Vertriebsleiter"


### Importlauf testen und aktivieren

Nachdem Sie die Konfiguration abgeschlossen haben, können Sie durch die Schaltfläche {{< ui-button "Speichern und Simulieren" >}} testen, welche Datensätze importiert werden würden. Wenn Sie mit dem Ergebnis zufrieden sind können Sie den Import entweder einmalig unter {{< ui-button "Aktion" >}} > {{< ui-button "Import jetzt durchführen" >}} ausführen oder durch die Schaltfläche {{< ui-button "Automatisieren" >}} eine regelmäßige Durchführung des Importes einrichten.

{{% notice info%}}
Ein automatisierter Import wird nur empfohlen, wenn als Importtyp **Fetch from url** ausgewählt wurde.
{{% /notice  %}}


### Optionale Einstellungen

#### Feldzuordnung anpassen

Im Connector Profil können Sie im Reiter {{< ui-button "Variablen" >}} und {{< ui-button "Struktur" >}} die Feldzuordnung CSV > pascom an Ihre Bedürfnisse anpassen.

Als Beispiel möchten wir die Berufsbezeichnung des Benutzers im Notizfeld des pascom Telefonbuches speichern.
Fügen Sie hierzu im Reiter {{< ui-button "Variablen" >}} folgende Zeile durch {{< ui-button "Hinzufügen" >}} ein:

|Variable|Quelle|
|----|----|
|job|return $row["job"];|

Durch diese Zeile speichert der Connector den Inhalt des CSV Feldes "job" in der gleichnamigen Variable "job" ab.
Diese Variable muss nun unter {{< ui-button "Struktur" >}} dem Notiz pascom-Telefonbuch Feld zugeordnet werden.

Ergänzen Sie hierzu die Zeilen:

          "028pho_notes" :        "{{{job}}}"

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
                "028pho_bez" :  "{{{displayName}}}",
                "028pho_firstname" :  "{{{givenName}}}",
                "028pho_lastname" : "{{{surname}}}",
                "028pho_email" :  "{{{email}}}",
                "028pho_notes" :  "{{{job}}}"
              }]
            }
          }]
        }


Dadurch wird der Wert der Variablen job dem **Notiz** pascom Telefonbuch Feld zugewiesen.


#### IP-Telefone zuweisen

Sie können via CSV einem Benutzer direkt ein IP-Telefon zuweisen.

**IP-Telefon via MAC zuweisen:**

Wenn Sie dem Benutzer ein pascom-Softphone zuweisen möchten, muss keine zusätzliche Variable im pascom Connector angelegt werden.

Fügen Sie hierzu lediglich in Ihrer CSV-Datei die Spalten "phonemac" und "phoneip" hinzu, in der Sie die MAC-Adresse und IP-Adresse des IP-Telefons eintragen.

Dadurch wird dem importierten Benutzer automatisch ein IP-Telefon mit dieser MAC-Adresse zugewiesen.

