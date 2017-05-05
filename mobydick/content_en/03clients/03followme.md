---
title: FollowMe
keywords:
description:
prev: /clients/client-user-guide/
url: /clients/followme/
next: /clients/teams-in-client/
Linkde: /clients/followme/
weight: 33
toc: true
draft: true
---


## Concept

Users and workspaces (locations) can be assigned with multiple Endpoints. The configuration setup regarding which endpoint rings, when and for how long is know as **FollowMe**.

![FollowMe](/followme_en.png)


## Configuration

A prerequisite for the configuration is that [users](../..//users/users-and-locations/) have already been added and that a minimum of one endpoint has been assigned. 

Within the Web UI, click on `User` > `Userlist` > select user > and go to the `Devices` tab. In the right hand column, you will see an overview of the directly assigned devices with the corresponding FollowMe settings. Next, click on the FollowMe setting: 

![FollowMe](/followme_webui_settings.png?width=50%)

|Setting|Description|
|---|---|
|Vom Benutzer konfigurierbar|**Ja/Nein**: Der Admin kann entscheiden ob der Benutzer FollowMe-Einstellungen zu diesem Gerät über seinen Client vornehmen kann.|
|Aktiviert|**Ja/Nein**: Das Endgerät läutet bei einem eingehenden Anruf mit oder nicht.|
|Warten|Zeit in Sekunden, wie lange das Gerät wartet bis es mitklingelt bei einem eingehenden Anruf|
|Timeout|Zeit in Sekunden, wie lange das Gerät klingelt|

Die Einstellungen erfolgen für

* **Intern**: wenn der Anruf mobydick-intern erfolgt,
* **Extern**: wenn der Anruf über das Amt kommt,
* **Team**: wenn der Benutzer als Agent in einem Team angerufen wird.

### FollowMe über den Client steuern

Darf der Benutzer (je nach Berechtigung) selber seine FollowMe-Einstellungen verwalten, kann er dies über seinen mobydick Desktop Client (`Einstellungen` > `FollowMe`) tun.

![FollowMe](/followme_einstellungen_client.png?width=100%)

Der Benutzer kann Einstellungen vornehmen für Anrufe von intern und extern und für Anrufe die aus einer Warteschlange kommen. Dafür wechselt er zwischen dem Tabs `Extern`, `Intern` und `Teams`.

|Einstellungen|Beschreibung|
|---|---|
|**Client kontrolliert**|Über dieses Auswahlmenü kann gewählt werden welches Telefon, falls mehrere vorhanden, über den Desktop Client kontrolliert wird.|
|**Meine Geräte**|Hier sind alle Telefone des Benutzers gelistet. Telefone zu denen der Benutzer keine FollowMe-Einstellungen vornehmen darf sind ausgegraut.<br>Der Benutzer kann Geräte aktivieren/deaktivieren, also entscheiden ob ein Telefon mitläutet oder nicht. Ebenfalls kann eine **Verzögerung** (Telefon wartet bis es mitläutet) und Dauer des **Läuten**s eingestellt werden.|

Zur Übersicht über die FollowMe-Einstellungen sieht man in der rechten Spalte eine grafische Übersicht über die Geräte und deren Zeiten.

<!--FIXME wenn Client fertig übersetzt ist Felder nochmal prüfen -->




<!-- ### Followme über den Mobility Client steuern -->
<!--FIXME mobility client!!!  -->
