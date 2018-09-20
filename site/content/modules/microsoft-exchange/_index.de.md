---
title: Microsoft Exchange Integration
description: Integrieren Sie Microsoft Exchange / Office365 in Ihre pascom.
weight: 40
---

{{< doctype "both"  >}}

{{< description >}}


![microsoft exchange](microsoft_exchange.png?width=50%)

## Konzept


Mit dem pascom Connector für Microsoft Exchange haben Sie die Möglichkeit
öffentliche, persönliche und freigegebene Exchange Adressbücher mit den pascom Telefonbüchern serverseitig zu synchronisieren.

Microsoft Exchange wird auch unterstützt bei Verwendung des gehosteten Office 365.

### Öffentliche Adressbücher

pascom verbindet sich zum Exchange Server mit einem eigens dafür angelegten Benutzer.
Der Connector durchsucht rekursiv alle öffentlichen Ordner nach Adressbüchern und synchronisiert diese automatisch mit dem pascom Firmentelefonbuch.  

Möchten Sie bestimme öffentliche Adressbücher nicht synchronisieren, entziehen Sie
dem pascom Exchange Benutzer ensprechend die Leserechte auf dieses Adressbuch.

### Freigegebene Adressbücher

Analog zu den öffentlichen Adressbüchern synchronisiert der Exchange Connector auch
alle Telefonbücher die ein beliebiger Exchange Benutzer dem pascom Exchange Benutzer
freigegeben hat.

### Persönlicher Adressbücher

Der Connector sucht nach persönlichen Adressbüchern der Exchange Benutzer und synchronisiert diese mit dem jeweiligen persönlichen Adressbuch des pascom Benutzers.

Diese Funktion hat zwei Vorraussetzungen:

* Benutzername in pascom und Exchange müssen identisch sein.
* Der pascom Exchange Benutzer muss das Recht *Impersonation* besitzen.

### Standard Feldzuordnung

Die Feldzuordnung kann beliebig angepasst werden und ist wie folgt voreingestellt:

|pascom|Exchange|
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
Sie hierzu einen neuen Benutzer mit (beispielsweise) dem Namen **pascom** hinzu.

Sorgen Sie dafür, dass der pascom Benutzer Leserechte auf alle relevanten
öffentlichen Ordner hat.

Falls Sie auch persönliche Adressbücher synchronisieren wollen weisen Sie dem
pascom Benutzer noch die Rolle *Impersonation* (Identitätswechsel) zu. Eine
Anleitung hierzu finden Sie [hier](https://www.codetwo.com/kb/how-to-set-impersonation-rights-manually/).


### Connector Profil erstellen

Erstellen Sie ein neues Connector-Profil indem Sie in der pascom Web-UI unter dem
Menüpunkt {{< ui-button "Erweitert" >}} > {{< ui-button "Connector" >}} auf {{< ui-button "Hinzufügen" >}} klicken.

Suchen Sie Vorlage {{< ui-button "Exchange Kontakte" >}} und klicken Sie auf {{< ui-button "Auswählen" >}}.
Folgende Daten werden für die Vorlage benötigt:

|Feld|Beschreibung|
|---|---|
| **Bezeichnung*** | Bezeichnung des Connector Profiles |
| **E-Mail*** | E-Mail-Adresse des zuvor angelegten pascom Exchange Benutzers z. B. pascom@meinefirma.de |
| **Passwort*** | Passwort des zuvor angelegten pascom Exchange Benutzers|

pascom versucht anhand der E-Mail-Adresse des Exchange-Benutzers Domain und URL automatisch zu ermitteln. Dies funktioniert nur wenn DNS-Server und Domain-Struktur (z. B. bei office365.com) korrekt eingerichtet sind.

Falls die Ermittlung fehlschlägt können Sie Domain und URL manuell ergänzen:

|Feld|Beschreibung|
|---|---|
| **Domain** | Der Active Directory Domain-Name |
| **URL** | Die URL der EWS-Schnittstelle z. B. https://exchange.meinefirma.de/ews/exchange.asmx |

### Import simulieren & Automatisieren

Durch Klicken auf {{< ui-button "Speichern und Simulieren" >}} starten Sie einen Probeimport und bekommen
die ersten 500 Datensätze angezeigt. Ist die letze Spalte {{< ui-button "local_id" >}} mit einem Wert
gefüllt wird dieser Datensatz einem persönlichen Adressbuch zugeordnet. Alle andren Datensätze
werden mit dem pascom Firmentelefonbuch synchronisiert.

Wenn Sie mit dem Ergebnis zufrieden sind können Sie unter {{< ui-button "Automatisieren" >}} eine regelmäßinte
Synchronisierung aktivieren. Die Voreinstellung hierfür ist *Einmal täglich, 12:00 Uhr mittags*.

### (Optional) Feldzuordnung anpassen

Im Connector Profil können Sie im Reiter {{< ui-button "Variablen" >}} und {{< ui-button "Struktur" >}} die Feldzuordnung pascom > Exchange an Ihre Bedürfnisse anpassen.

Als Beispiel möchten wir die Exchange Kontakt-Webseitenadresse im Notizfeld des pascom Telefonbuches speichern.

Fügen Sie hierzu im Reiter {{< ui-button "Variablen" >}} folgende Zeile durch {{< ui-button "Hinzufügen" >}} ein:


|Variable|Quelle|
|---|---|
|BusinessHomePage|return $row["BusinessHomePage"];|

{{% notice info%}}
Im Gegensatz zu anderen Connector-Profilen muss der Name der Variablen und
der Name des Quellfeldes (hier "BusinessHomePage") identisch sein.
{{% /notice  %}}

Durch diese Zeile speichert der Connector den Inhalt des Exchange Feldes "BusinessHomePage" in der gleichnamigen Variable "BusinessHomePage" ab.

Diese Variable muss nun unter {{< ui-button "Struktur" >}} einem pascom Feld zugeordnet werden.
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

+ DisplayName
+ Initials
+ GivenName
+ Surname
+ MiddleName
+ NickName
+ CompleteName
+ Birthday
+ Generation
+ CompanyName
+ JobTitle
+ Department
+ OfficeLocation
+ BusinessHomePage
+ PostalAddressIndex
+ SpouseName
+ WeddingAnniversary
+ FileAs
+ FileAsMapping
+ PhoneNumbers_AssistantPhone
+ PhoneNumbers_BusinessFax
+ PhoneNumbers_BusinessPhone
+ PhoneNumbers_BusinessPhone2
+ PhoneNumbers_CompanyMainPhone
+ PhoneNumbers_HomeFax
+ PhoneNumbers_HomePhone
+ PhoneNumbers_HomePhone2
+ PhoneNumbers_MobilePhone
+ PhoneNumbers_OtherFax
+ PhoneNumbers_OtherTelephone
+ PhoneNumbers_Pager
+ PhoneNumbers_RadioPhone
+ EmailAddresses_EmailAddress1
+ EmailAddresses_EmailAddress2
+ EmailAddresses_EmailAddress3
+ PhysicalAddresses_Home
+ PhysicalAddresses_Business
+ PhysicalAddresses_Other
+ ImAddresses_ImAddress1
+ ImAddresses_ImAddress2
+ ImAddresses_ImAddress3

#### Liste der verfügbaren pascom Felder

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
abspeichern. Dieses Label ist dann nicht nur im Telefonbuch sondern auch in Journaleinträgen oder diversen Anruferinformationen sichtbar.

#### Label anlegen

Labels legen Sie im Menü {{< ui-button "Anrufverteilung" >}} > {{< ui-button "Anruf Labels" >}} durch Klicken auf die
Schaltfläche {{< ui-button "Hinzufügen" >}} an.

Wählen Sie {{< ui-button "Generisches Label" >}}, vergeben Sie den Namen **Abteilung** und klicken
auf {{< ui-button "Speichern" >}}.

Wenden Sie ausstehende Jobs an um das Label anzulegen.

#### Connector Profil anpassen

Fügen Sie hierzu im Reiter {{< ui-button "Variablen" >}} folgende Zeile durch {{< ui-button "Hinzufügen" >}} ein:

|Variable|Quelle|
|---|---|
|Department|return $row['Department'];|

{{% notice info%}}
Im Gegensatz zu anderen Connector-Profilen muss der Name der Variablen und
der Name des Quellfeldes (hier "Department") identisch sein.
{{% /notice  %}}

Durch diese Zeile speichert der Connector den Inhalt des Exchange Feldes "Department" in
der gleichnamigen Variable "Department" ab.

Diese Variable muss nun unter {{< ui-button "Struktur" >}} dem Label **Abteilung** pascom Feld zugeordnet werden.

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
dem entsprechenden Wert zugeteilt.

#### Ergebnis prüfen

{{% notice info%}}
Label-Zuordnungen werden NICHT unter "Speichern und Simulieren" mit angezeigt
{{% /notice  %}}

Prüfen Sie die erfolgreiche Zuordnung des Labels in der pascom Web-UI unter {{< ui-button "Benutzer" >}} >
{{< ui-button "Telefonbuch" >}} indem Sie einen ensprechenden Kontakt {{< ui-button "Bearbeiten" >}} und die Zuordnung
im Reiter {{< ui-button "Labels" >}} prüfen. Alternativ können Sie auch das Firmentelefonbuch im
pascom Client einsehen.
