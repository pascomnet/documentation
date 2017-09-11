---
title: Mobile Hub einrichten
keywords:
    - Mobile Hub für Mobility Client einrichten
    - Mobilgeräte für Mobile Hub anlegen
    - Handy in pascom integrieren
description: Mit dem pascom Mobile Hub können Sie Mobilgeräte nativ in pascom integrieren.
prev: /clients/classic-client/
url: /clients/mobile-hub-einrichten/
next: /clients/tapi/
weight: 34
toc: true
---

## Übersicht

Wählt man manuell oder aus dem Telefonbuch eine Nummer im Mobility Client, ist dieser in der Lage den Anruf über den  Server zu führen. Somit sieht der Angerufene nicht die Mobilnummer sondern die geschäftliche Telefonnummer.

![Mobile Hub Konzept](/mobile_hub_konzept.png?width=50%)


## Konfiguration

### Mobile Hub für Mobility Client einrichten
Um den Mobile Hub zu konfigurieren wählen Sie `Appliance` > `Dienste` > und den Tab `Mobile Hub`.
Folgende Einstellungen sind notwendig:

|Einstellung|Beschreibung|
|---|---|
|**Nummer**|Tragen Sie hier die Nummer ein, unter welcher der Mobile Hub erreichbar ist. Wählen Sie eine Nummer aus Ihrem Rufnummernblock die noch frei ist. Wenn ein Anruf über den Mobile Hub getätigt wird, ruft das Mobiltelefon diese Nummer an. Geben Sie diese Nummer unbendigt im *internationalen Format* an damit der Mobile Hub auch im Ausland erreichbar ist.|
|**Regel Anlegen**|Setzen Sie hier ein Häckchen, wird automatisch eine eingehende Regel im Amt angelegt.|
|**Amt**|Wählen Sie hier das Amt über das die Mobile Hub-Anrufe getätigt werden.|
|**Ziel**|Geben Sie hierzu das **Ziel** an. Orientieren Sie sich dabei an die anderen eingehen Rufregeln in Ihrem Amt. Nachträglich können Sie die Regel im Amt auch anpassen.|

### Mobilgeräte für Mobile Hub anlegen

Nachdem der Mobile Hub eingerichtet ist, müssen noch die zur Nutzung des Mobile Hub berechtigen Mobilgeräte angelegt und den entsprechenden Benutzern zugeteilt werden.

Wählen Sie hierzu in der pascom Weboberfläche `Endgeräte` > `Geräteliste` > `Hinzufügen`. Aus der Liste wählen Sie **Via Mobile Hub: Integriertes Mobiltelefon**.

Tragen Sie hier eine **Bezeichnung** und die entsprechende Mobilnummer im *nationalen Format* (0171...) in das Feld **Zielrufnummer** ein. Nur genau diese Zielrufnummer ist berechtigt den Mobile Hub zu nutzen.

Im Tab `Zuweisung` können Sie dieses Gerät nun einem Benuter zuweisen.


### Client-Nutzung über das Internet zulassen

pascom Desktop Client und pascom Mobility Client verwenden den TCP Port 5222 um mit dem pascom Server zu kommunizieren. Möchten Sie diesen Service für Ihre Mobilgeräte auch über das Internet nutzen tragen Sie für den **TCP Port 5222** ein Forwarding auf den pascom Server ein bzw. erstellen Sie eine entsprechnende Zugriffsregel in Ihrer Firewall falls sich der pascom Server in Ihrer DMZ befindet.
Der Port 5222 ist so voreingestellt, dass er **ausschließlich SSL** Verbindungen akzeptiert.
