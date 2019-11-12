---
title: Gesprächsteilnehmer in Kontaktliste anzeigen 
description: Lassen Sie sich die Rufnummern der Gesprächspartner Ihres Teams direkt in der Client-Kontaktliste anzeigen
weight: 65
---

{{< doctype "both" >}} 
 
{{< description >}}

## Konzept

Wenn es für Ihr Team sinnvoll ist jederzeit im pascom Client überprüfen zu können, mit wem ein Kollege oder Mitarbeiter gerade spricht, können Sie mit dem Setzen einer zusätzlichen Systemvariable diese Information in Ihrem [pascom Desktop Client]({{< relref "/clients/desktop-userguide">}}) und [pascom Mobile Client]({{< relref "/clients/mobile-userguide">}}) anzeigen lassen.
So ist für jeden Benutzer des pascom Clients direkt in der Kontaktliste die Nummer, und bei vorhandenem Telefonbucheintrag, der Name des Gesprächspartners sichtbar.

{{% notice info %}}
Die Darstellung des Anrufers/ Gesprächsteilnehmers in der Kontaktliste des pascom Clients gilt global für jeden Benutzer des Desktop und Mobile Clients unabhängig von zugewiesenen Rollen und Benutzerrechten.
{{% /notice %}}


## Systemvariable setzen

Wählen Sie in der WebUI Ihrer pascom Telefonanlage unter {{< ui-button "Appliance">}} > {{< ui-button "Systemeinstellungen">}} aus klicken Sie auf {{< ui-button "Hinzufügen">}}.
Legen Sie eine Variable mit dem Parameter **sys.xmpp.properties.roster.shownumbers** an und setzen Sie den Wert der neu erstellten Variable auf **true**.           
Sollte die Variable bereits angelegt sein, können Sie die Variable in der Baumstruktur links finden, unter {{< ui-button "sys">}} > {{< ui-button "xmpp">}} > {{< ui-button "properties">}} > {{< ui-button "roster">}} und dort den Wert des Parameters **shownumbers** anpassen.              
Speichern Sie anschließend diese Änderung.

Um die Anpassung anzuwenden ist es notwendig, den XMPP-Server über {{< ui-button "Anwenden">}} > {{< ui-button "XMPP Server neu starten">}} neu zu starten.

{{% notice warning %}}
Beim Anwenden des XMPP Server Dienstes starten ausnahmslos alle Desktop Clients neu. Aktive Gespräche via Softphone werden dadurch unterbrochen.
{{% /notice %}}

 
## Beispiel

Anhand folgendem Beispiel sehen Sie die Auswirkung dieser Systemeinstellung.           

            
![ohne definierte Systemvariable oder Wert auf "false"](shownumbers-false.de.png?width=550px)
*Systemvariable* ***sys.xmpp.properties.roster.shownumbers*** *nicht gesetzt, oder Wert auf* '***false***'           


![definierte Systemvariable mit Wert auf "true"](shownumbers-true.de.png?width=550px)
*Systemvariable* ***sys.xmpp.properties.roster.shownumbers*** *gesetzt mit Wert auf* '***true***'
