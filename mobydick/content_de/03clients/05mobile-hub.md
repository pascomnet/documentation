---
title: Mobile Hub einrichten
keywords:
    - Mobile Hub für Mobility Client einrichten
    - Mobilgeräte für Mobile Hub anlegen
    - Handy in mobydick integrieren
description: Mit dek mobydick Mobile Hub können Sie Mobilgeräte nativ in mobydick integrieren.
url: /clients/mobile-hub-einrichten/
prev: /clients/tapi/
next: /clients/flexpanel-erstellen/
weight: 35
toc: true
---

## Übersicht

Wählt man manuell oder aus dem Telefonbuch eine Nummer im Mobility Client, ist dieser in der Lage den Anruf über den mobydick Server zu führen. Somit sieht der Angerufene nicht die Mobilnummer sondern die geschäftliche Telefonnummer und auf Wunsch die persönliche Durchwahl. Auch zur Optimierung der Telefonkosten kann diese Option interessant sein. Beispielsweise wenn man von Unterwegs aus über die mobydick ins Ausland rufen möchte.

![Illustration - Mobile Hub Konzept](../../images/mobile_hub_konzept.png?width=70% "Mobile Hub Konzept in der mobydick")


## Konfiguration

### Mobile Hub für Mobility Client einrichten
Um den Mobile Hub zu konfigurieren wählen Sie `Appliance > Dienste > Mobile Hub`:
![Screenshot - Mobile Hub einrichten](../../images/mobile_hub_einrichten.png?width=90% "Mobile Hub für Mobility Client einrichten")

Unter **Nummer** tragen Sie die Nummer ein. unter welcher der mobydick **Mobile Hub** erreichbar ist. Geben Sie hier Ihre Rufnummer an und wählen Sie eine freie Durchwahl. Hier z.B. **99**. Das Smartphone verwendet dann diese Nummer um den Mobile Hub zu erreichen. Geben Sie diese Nummer unbendigt im **internationalen Format** an damit der Mobile Hub auch im Ausland erreichbar ist.

Wenn Sie möchten legt mobydick auch gleich die passende eingehende **Regel** an. Geben Sie hierzu das **Ziel** an. Leider kann das Ziel von Provider zu Provider im Format variieren.

<!-- //FixME Details siehe Aemter und Rufregeln anlegen. -->

### Mobilgeräte für Mobile Hub anlegen
Nachdem der Mobile Hub eingerichtet ist, müssen noch die zur Nutzung des Mobile Hub berechtigen Mobilgeräte angelegt und den entsprechenden Benutzern zugeteilt werden.
![Screenshot - Mobilgeräte für Mobile Hub anlegen](../../images/mobile_hub_hinzufuegen.png?width=70% "Mobilgeräte für Mobile Hub anlegen")

Wählen Sie hierzu in der mobydick Weboberfläche `Endgeräte > Geräteliste` und drücken auf `+Hinzufügen`.  

Aus der Liste wählen Sie `Via Mobile Hub: Integriertes Mobiltelefon`:

Tragen Sie hier eine **Bezeichnung** und die entsprechende Mobilnummer im **nationalen Format (0172123123)** in das Feld **Zielrufnummer** ein. Nur genau diese Zielrufnummer ist berechtigt den Mobile Hub zu nutzen
![Screenshot - Mobilgeräte für Mobile Hub anlegen](../../images/mobile_hub_externes_telefon.png?width=90% "Mobilgeräte für Mobile Hub anlegen")

Unter `Benutzer > Benutzerliste` wählen Sie nun den entpsrechenden Benutzer aus und weisen ihm das eben angelegte Mobiltelefon direkt zu. Möchten Sie, dass das Mobiltelefon bei eingehenden Anrufen nicht mit läutet tragen Sie im Followme System überall den Wert *0* ein:

![Screenshot - Einrichtung für FollowMe](../../images/mobile_hub_followme.png?width=90% "FollowMe Settings für Mobilgeräte")


### Client-Nutzung über das Internet zulassen

mobydick Desktop Client und mobydick Mobility Client verwenden den TCP Port 5222 um mit dem mobydick Server zu kommunizieren. Möchten Sie diesen Service für Ihre Mobilgeräte auch über das Internet nutzen tragen Sie für den **TCP Port 5222** ein Forwarding auf den mobydick Server ein bzw. erstellen Sie eine entsprechnende Zugriffsregel in Ihrer Firewall falls sich der mobydick Server in Ihrer DMZ befindet.

Der Port 5222 ist so voreingestellt, dass er **ausschließlich SSL** Verbindungen akzeptiert.
