---
title: Telefonbuch aus CSV
description: Telefonbuch-Kontakte aus externen Systemen importieren
weight: 30
---

### Telefonbuch aus CSV

|Variablen|Beschreibung|
|---|---|
|**Bezeichung**|Bezeichnung des Profils|
|**Pfad zur CSV-Datei**|Die zu importierende Datei. Diese Angabe bezieht sich auf das Dateisystem der pascom und nicht auf Ihr lokales Dateisystem.|
|**Zeichensatz der CSV-Datei**|Gibt an in welchem Format die CSV-Datei vorliegt. Wie empfehlen Ihnen UTF-8 zu verwenden.|
|**Trennzeichen**|Mit welchem Trennzeichen wurden die Felder separiert.|
|**Zeilenende**|Ob die CSV-Datei unter Windows oder Mac/Linux erstellt worden ist, unterscheidet sich das Zeilendende.|
|**Feldeinfassung**|Wir empfehlen die einzelnen Felder mit Zeichen einzufassen, z. B. "Max Muster"|

CSV-Quelle aus Freigabe laden:

|Variablen|Beschreibung|
|---|---|
|**Pfad zur CSV-Datei**|Bezieht sich nun relativ zur Freigabe.<br>*Beispiel*: Befindet sich in der Freigabe \\192.168.100.10\pascom der Unterordner test mit der Datei address.csv tragen Sie hier test\address.csv ein.|
|**CIFS/SMB Freigabe verwenden**|Wählen Sie **JA** um eine CSV-Quelle aus einer Freigabe zu laden|
|**CIFS/SMB Freigabe**|UNC-Pfad zur Freigabe im Format \\\servername oder ip\freigabe<br>*Beispiel*: \\192.168.100.10\pascom|
|**CIFS/SMB Benutzer**|Benutzer mit der Berechtigung auf diese Freigabe lesend zuzugreifen.|
|**CIFS/SMB Passwort**|Zugehöriges Passwort.|

Nach dem Speichern kann der Importmodus noch eingestellt werden. Hier wird definiert, wie der Connector mit bereits vorhandenen Datensätzen umgehen soll. Folgende Möglichkeiten stehen zur Verfügung:

* Neue Sätze importieren und geänderte abgleichen
* Neue Sätze importieren, geänderte abgleichen und früher importierte Datensätze entfernen.

Im Tab {{< ui-button "Variablen" >}} sehen Sie welche Felder imporiert werden können. Hier ein Beispiel für eine CSV-Datei:

    "displayname","phone","givenname","surname","organisation","email","mobile","homephone","fax"
    "Max Muster - pascom [30000]","+4999112345","Max","Muster","pascom","","","","+4999112399"

#### (Optional) Feldzuordnung anpassen

Im Connector Profil können Sie im Reiter Variablen und Struktur die Feldzuordnung CSV-Datei > pascom an Ihre Bedürfnisse anpassen.

Als Beispiel möchten wir die URL zur Homepage des Kontakts im Notizfeld des pascom Telefonbuches speichern.
Fügen Sie hierzu im Reiter {{< ui-button "Variablen" >}} folgende Zeile durch {{< ui-button "Hinzufügen" >}} ein:

|Variable|Quelle|
|----|----|
|Homepage|return $row["Homepage"];|

Durch diese Zeile speichert der Connector den Inhalt des CSV Feldes "Homepage" in der gleichnamigen Variable "Homepage" ab.
Diese Variable muss nun unter {{< ui-button "Struktur" >}} dem Notiz pascom Feld zugeordnet werden.

Ergänzen Sie hierzu die Zeilen:

          "028pho_notes" :        "{{{Homepage}}}"

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
                "028pho_notes" :  "{{{Homepage}}}"
              }]
            }
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

#### (Optional) Labels nutzen

pascom Labels lassen sich auch dazu nutzen zusätzliche Informationen aus der CSV-Datei mit im pascom Firmentelefonbuch anzuzeigen.

In diese Beispiel möchten wir die Abteilung des Kontakts im Label **Abteilung** abspeichern. Dieses Label ist dann nicht nur im Telefonbuch sondern auch in Journaleinträgen oder diversen Anruferinformationen sichtbar.

**Label anlegen**

Labels legen Sie im Menü `Anrufverteilung` > `Anruf Labels` durch Klicken auf die Schaltfläche `Hinzufügen` an.

Wählen Sie `Generisches Label`, vergeben Sie den Namen **Abteilung** und klicken auf `Speichern`.

Wenden Sie ausstehende Jobs an um das Label anzulegen.

**Connector Profil anpassen**

Fügen Sie hierzu im Reiter `Variablen` folgende Zeile durch `Hinzufügen` ein:

|Variable|Quelle|
|---|---|
|Department|return $row['Department'];|

{{% notice info%}}
Im Gegensatz zu anderen Connector-Profilen muss der Name der Variablen und der Name des Quellfeldes (hier "Department") identisch sein.
{{% /notice  %}}

Durch diese Zeile speichert der Connector den Inhalt des CSV Feldes "Department" in der gleichnamigen Variable "Department" ab.

Diese Variable muss nun unter `Struktur` dem Label **Abteilung** pascom Feld zugeordnet werden.

Ergänzen Sie hierzu die Zeilen:

      "post": {
                  "phonebook.phonebooklabel": [
                      {
                          "050lab_bez": "Abteilung",
                          "028050pholab_value": "{{{Department}}}"
                      }
                  ]
      }

in der Struktur:

        {
          "phonebook": [{
            "028pho_bez" :          "{{{DisplayName}}}",
            "028pho_phone" :        "{{{PhoneNumbers_BusinessPhone}}}",
            "028pho_firstname" :    "{{{GivenName}}}",
            "028pho_lastname" :     "{{{Surname}}}",
            "028pho_organisation" : "{{{CompanyName}}}",
            "028pho_email" :        "{{{EmailAddresses_EmailAddress1}}}",
            "028pho_mobile" :       "{{{PhoneNumbers_MobilePhone}}}",
            "028pho_homephone" :    "{{{PhoneNumbers_HomePhone}}}",
            "028pho_fax" :          "{{{PhoneNumbers_BusinessFax}}}",
            "028pho_notes" :        "{{{BusinessHomePage}}}",
            "011acc_id":            "{{{local_id}}}",
            "post": {
                    "phonebook.phonebooklabel": [
                        {
                            "050lab_bez": "Abteilung",
                            "028050pholab_value": "{{{Department}}}"
                        }
                    ]
            }
          }]
        }

Dadurch wird jedem Kontakt mit eingetragener Abteilung das Label **Abteilung** mit dem entsprechenden Wert zugeteilt.

**Ergebnis prüfen**

{{% notice info%}}
Label-Zuordnungen werden NICHT unter "Speichern und Simulieren" mit angezeigt
{{% /notice  %}}

Prüfen Sie die erfolgreiche Zuordnung des Labels in der pascom Web-UI unter `Benutzer` > `Telefonbuch` indem Sie einen ensprechenden Kontakt `Bearbeiten` und die Zuordnung im Reiter `Labels` prüfen. Alternativ können Sie auch das Firmentelefonbuch im pascom Client einsehen.
