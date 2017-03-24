---
title: FollowMe
keywords:
description:
prev: /clients/client-nutzen/
url: /clients/followme/
next: /clients/teams-im-client/
weight: 33
toc: true
---


## Konzept

Benutzern und Arbeitsplätzen können mehrere Endgeräte zugewiesen werden. Die Konfiguration welches Endgerät wann, wie lange und ob überhaupt klingelt bezeichten man als **FollowMe**.

![FollowMe](/followme.png)


## Konfiguration

Voraussetzung für die Konfiguration ist, dass bereits  [Benutzer](../../benutzer/benutzer-arbeitsplaetze/) angelegt sind und Ihnen mindestens ein Endgerät zugewiesen wurde.

Klicken Sie im Web-UI zunächst auf `Benutzer` > `Benutzerliste` > Benuzter auswählen > im Tab `Geräte`. In der rechten Spalte erhalten Sie die Übersicht der direkt zugewiesenen Geräte mit den FollowMe-Einstellungen. Klicken Sie nun auf die FolloMe-Einstelung:

![FollowMe](/followme_einstellungen_commander.png?width=50%)

|Einstellung|Beschreibung|
|---|---|
|Vom Benutzer konfigurierbar|**Ja/Nein**: Der Admin kann entscheiden ob der Benutzer FollowMe-Einstellungen zu diesem Gerät über seinen Client vornehmen kann.|
|Aktiviert|**Ja/Nein**: Das Endgerät läutet bei einem eingehenden Anruf mit oder nicht.|
|Warten|Zeit in Sekunden, wie lange das Gerät wartet bis es mitklingelt bei einem eingehen Anruf|
|Timeout|Zeit in Sekunden, wie lange das Gerät klingelt|

Die Einstellungen erfolgen für

* **Intern**: wenn der Anruf mobydick-intern erfolgt,
* **Extern**: wenn der Anruf über das Amt kommt,
* **Team**: wenn der Benutzer als Agent in einem Team angerufen wird.

{{% notice note %}}
Für Endgeräte die einem Arbeitsplatz zugewiesen sind können keine FollowMe-Einstellungen vorgenommen werden.
{{% /notice %}}

### FollowMe über den Client steuern

Darf der Benutzer (je nach Berechtigung) selber seine FollowMe-Einstellungen verwalten, kann er dies über seinen mobydick Desktop Client (`Einstellungen` > `FollowMe`) tun.

![FollowMe](/followme_einstellungen_client.png?width=100%)

Der Benutzer kann Einstellungen vornehmen für Anrufe von intern und extern und für Anrufe die aus einer Warteschlagen kommen. Dafür wechselt er zwischen dem Tabs `Extern`, `Intern` und `Teams`.

|Einstellungen|Beschreibung|
|---|---|
|**Client kontrolliert**|Über dieses Auswahlmenü kann gewählt werden welches Telefon, falls mehrere vorhanden, über den Desktop Client kontrolliert wird.|
|**Meine Geräte**|Hier sind alle Telefone des Benutzers gelistet. Telefone zu denen der Benutzer keine FollowMe-Einstellungen vornehmen darf sind ausgegraut.<br>Der Benutzer kann Geräte aktivieren/deaktivieren, also entscheiden ob ein Telefon mitläutet oder nicht. Ebenfalls kann eine **Verzögerung** (Telefon wartet bis es mitläutet) und Dauer des **Läuten**s eingestellt werden|

Zur Übersicht über die FollowMe-Einstellungen sieht man in der rechten Spalte eine grafische Übersicht über die Geräte und deren Zeiten.

<!--FIXME wenn Client fertig übersetzt ist Felder nochmal prüfen -->




<!-- ### Followme über den Mobility Client steuern -->
<!--FIXME mobility client!!!  -->
