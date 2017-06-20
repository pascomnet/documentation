---
title: Microsoft Exchange Integration
keywords:
    - microsoft
    - exchange
    - office365
    - cti
description: Integrieren Sie Microsoft Exchange / Office365 in Ihre pascom.
prev: /integrationen/datev-telefonie-integration/
url: /integrationen/microsoft-exchange-server-integration/
weight: 104
toc: true
---

![microsoft exchange](/connector_microsoft_exchange.png)

## Konzept

Mit dem pascom Connector für Microsoft Exchange haben Sie die Möglichkeit
öffentliche, persönliche und freigegebene Exchange Adressbücher mit den pascom Telefonbüchern
serverseitig zu synchronisieren.

### Öffentlicher Adressbücher

pascom verbindet sich zum Exchange Server mit einem eigens dafür angelegten Benutzer.
Der Connector durchsuch rekursiv alle öffentlichen Ordner nach Adressbüchern und synchronisiert
diese automatisch mit dem pascom Firmentelefonbuch.  

Möchten Sie bestimme öffenltiche Adressbücher nicht synchronisieren, entziehen Sie
dem pascom Exchange Benutzer ensprechend die Leserechte auf dieses Adressbuch.

### Freigegebene Adressbücher

Analog zu den öffentlichen Adressbüchern synchronisiert der Exchange Connector auch
alle Telefonbücher die ein beliebiger Exchange Benutzer dem pascom Exchange Benutzer
freigegeben hat.

### Persönlicher Adressbücher

Der Connector sucht nach persönlichen Adressbüchern der Exchange Benutzer und synchronisiert
diese mit dem jeweiligen persönlichen Adressbuch des pascom Benutzers.

Diese Funktion hat zwei Vorraussetzungen:

* Benutzername in pascom und Exchange müssen identisch sein
* Der pascom Exchange Benutzer muss das Recht "Impersonation" besitzen

### Standard Feldzuordnung

Die Feldzuordnung kann belibig angepasst werden und ist wie folgt voreingestellt:

| pascom | Exchange |
|---|---|
|Anzeigename|Name|
|Telefon|Telefonnummern > Geschäftlich|
|Vorname|Vorname|
|Nachname|Nachname|
|Organisation|Firma|
|Fax|Telefonnummern > Fax geschäftlich|
|Email|E-Mail|
|Handy|Telefonnummern > Mobiltelefon|
|Telefon privat|Telefonnummern > Privat|

## Konfiguration

### Microsoft Exchange

Wie oben erwähnt benötigt der Connector einen eigenen Exchange Benutzer. Fügen
Sie hierzu einen neuen Benutzer mit (beispielswise) dem Namen **pascom** hinzu.

Sorgen Sie dafür, dass der pascom Benutzer Leserechte auf alle relevanten
öffentlichen Ordner hat.

Falls Sie auch persönliche Adressbücher synchronisieren wollen weisen Sie dem
pascom Benutzer noch die Rolle "Impersonation" (Identitätswechsel) zu. Eine
Anleitung hierzu finden Sie unter [hier](https://www.codetwo.com/kb/how-to-set-impersonation-rights-manually/).


### Connector Profil erstellen

Erstellen Sie ein neues Connector Profil indem Sie in der pascom Web-UI unter dem
Menüpunkt `Erweitert`>`Connector` auf `Hinzufügen` klicken.

Suchen Sie Vorlage `Exchange Kontakte` und klicken Sie auf `Auswählen`.
Folgende Daten werden für die Vorlage benötigt:

| Feld | Beschreibung |
|---|---|
| Bezeichnung* | Bezeichnung des Connector Profiles |
| E-Mail* | E-Mail-Adresse des zuvor angelegten pascom Exchange Benutzers z.B. pascom@meinefirma.de |
| Passwort* | Passwort des zuvor angelegten pascom Exchange Benutzers|

pascom versucht anhand der E-Mail-Adresse des Exchange Benutzers Domain und URL
automatisch zu ermitteln. Dies funktioniert nur bei korrekt eingerichtetem DNS-Server und
Domain Struktur (z.B. bei office365.com).

Falls die Ermittlung fehlschlägt können Sie Domain und URL manuell ergänzen:

| Feld | Beschreibung |
|---|---|
| Domain | Der Active Direcory Domain Name |
| URL | Die URL der EWS Schnittstelle z.B. https://exchange.meinefirma.de/ews/exchange.asmx |

### Import simulieren & Automatisieren

Durch Klicken auf `Speichern und Simulieren` starten Sie einen Probeimport und bekommen
die ersten 500 Datensätze angezeigt. Ist die letze Spalte `local_id` mit einem Wert
gefüllt wird dieser Datensatz einem persönlichen Adressbuch zugeordnet. Alle andren Datensätze
werden mit dem pascom Firmentelefonbuch synchronisiert.

Wenn Sie mit dem Ergebnis zufreiden sind können Sie unter `Automatisieren` eine regelmäßinte
Synchronisierung aktivieren. Die Voreinstellung hierfür ist "Einmal täglich, 12:00 Uhr mittags".

### (Optional) Feldzuordnung anpassen

Im Connector Profil können Sie im Reiter `Variablen` und `Struktur` die Feldzuordnung pascom > Exchange
an Ihre Bedürfnisse anpassen.

Als Beispiel möchten wir die Exchange Kontakt Webseitenadresse im Notiz Feld des pascom Telefonbuches speichern.

Fügen Sie hierzu im Reiter `Variablen` folgende Zeile durch `Hinzufügen` ein:

```
Variable                        Quelle

BusinessHomePage                return $row["BusinessHomePage"];
```

{{% notice info%}}
Im Gegensatz zu anderen Connector Profilen muss der Name der Variablen und
der Name des Quellfeldes (hier "BusinessHomePage") identisch sein.
{{% /notice  %}}

Durch diese Zeile speichert der Connector den Inhalt des Exchange Feldes "BusinessHomePage" in
der gleichnamigen Variable "BusinessHomePage" ab.

Diese Variable muss nun unter `Struktur` einem pascom Feld zugeordnet werden.

Ergänzen Sie hierzu die Zeile:

```
"028pho_notes" :        "{{{BusinessHomePage}}}",
```

in der Struktur:

```
{
  "phonebook": [{
    "028pho_bez" :            "{{{DisplayName}}}",
    "028pho_phone" :          "{{{PhoneNumbers_BusinessPhone}}}",
    "028pho_firstname" :      "{{{GivenName}}}",
    "028pho_lastname" :       "{{{Surname}}}",
    "028pho_organisation" :   "{{{CompanyName}}}",
    "028pho_email" :          "{{{EmailAddresses_EmailAddress1}}}",
    "028pho_mobile" :         "{{{PhoneNumbers_MobilePhone}}}",
    "028pho_homephone" :      "{{{PhoneNumbers_HomePhone}}}",
    "028pho_fax" :            "{{{PhoneNumbers_BusinessFax}}}",
    "028pho_notes" :          "{{{BusinessHomePage}}}",
    "011acc_id":              "{{{local_id}}}"
  }]
}
```
Dadurch wird der Wert der Variablen **BusinessHomePage** dem pascom Telefonbuch Feld
**028pho_notes** zugewiesen.

#### Liste der verfügbaren Exchange Felder

|Verfügbare Exchange Felder||
|---|---|
|DisplayName|PhoneNumbers_BusinessPhone|
|Initials|PhoneNumbers_BusinessPhone2|
|GivenName|PhoneNumbers_CompanyMainPhone|
|Surname|PhoneNumbers_HomeFax|
|MiddleName|PhoneNumbers_HomePhone|
|NickName|PhoneNumbers_HomePhone2|
|CompleteName|PhoneNumbers_MobilePhone|
|Birthday|PhoneNumbers_OtherFax|
|Generation|PhoneNumbers_OtherTelephone|
|CompanyName|PhoneNumbers_Pager|
|JobTitle|PhoneNumbers_RadioPhone|
|Department|EmailAddresses_EmailAddress1|
|OfficeLocation|EmailAddresses_EmailAddress2|
|BusinessHomePage|EmailAddresses_EmailAddress3|
|PostalAddressIndex|PhysicalAddresses_Home|
|SpouseName|PhysicalAddresses_Business|
|WeddingAnniversary|PhysicalAddresses_Other|
|FileAs|ImAddresses_ImAddress1|
|FileAsMapping|ImAddresses_ImAddress2|
|PhoneNumbers_AssistantPhone|ImAddresses_ImAddress3|
|PhoneNumbers_BusinessFax||


#### Liste ver verfügbaren pascom Felder

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

### (Optional) Labels nutzen

pascom Labels lassen sich auch dazu nutzen zusätzliche Informationen aus Exchange
mit im pascom Firmentelefonbuch anzuzeigen.

In diese Beispiel möchten wir die Abteilung des Exchange Kontakts im Label **Abteilung**
abspeichern. Dieses Label ist dann nicht nur im Telefonbuch sondern auch in Journaleinträgen oder
diversen Anruferinformationen sichtbar.

#### Label anlegen

Labels legen Sie im Menü `Anrufverteilung`>`Anruf Labels` durch Klicken auf die
Schaltfläche `Hinzufügen` an.

Wählen Sie `Generisches Label`, vergeben Sie den Namen **Abteilung** und klicken
auf `Speichern`.

Wenden Sie ausstehende Jobs an um das Label anzulegen.

#### Connector Profil anpassen

Fügen Sie hierzu im Reiter `Variablen` folgende Zeile durch `Hinzufügen` ein:

```
Variable                        Quelle

Department                      return $row["Department"];
```

{{% notice info%}}
Im gegensatz zu anderen Connector Profilen muss der Name der Variablen und
der Name des Quellfeldes (hier "Department") identisch sein.
{{% /notice  %}}

Durch diese Zeile speichert der Connector den Inhalt des Exchange Feldes "Department" in
der gleichnamigen Variable "Department" ab.

Diese Variable muss nun unter `Struktur` dem Label **Abteilung** pascom Feld zugeordnet werden.

Ergänzen Sie hierzu die Zeilen:

```
"post": {
            "phonebook.phonebooklabel": [
                {
                    "050lab_bez": "Abteilung",
                    "028050pholab_value": "{{{Department}}}"
                }
            ]
}
```

in der Struktur:

```
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
```

Dadurch wird jedem Kontakt mit eingetragener Abteilung das Label **Abteilung** mit
dem entsprechnden Wert zugeteilt.

#### Ergebnis Prüfen

{{% notice info%}}
Label Zuordnungen werden NICHT unter "Speichern und Simulieren" mit angezeigt
{{% /notice  %}}

Prüfen Sie die erfolgreiche Zuordnung des Labels in der pascom Web-UI unter `Benutzer`>
`Telefonbuch` indem Sie einen ensprechenden Kontakt `Bearbeiten` und die Zuordnung
im Reiter `Labels` prüfen. Alternativ können Sie auch das Firmentelefonbuch im
pascom Client einsehen.
