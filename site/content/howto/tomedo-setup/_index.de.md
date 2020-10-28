---
title: tomedo® Integration einrichten
description: In dieser Anleitung zeigen wir Ihnen wie Sie die tomedo® Integration auf der pascom Telefonanlage einrichten.
---
 
{{< doctype "both" >}} 

{{< description >}}

{{% notice warning %}}
Für die Nutzung der tomedo® Integration benötigen Sie den pascom Client ab Version 65.R1286.
{{% /notice %}}

## tomedo® im pascom Client einrichten

Das Telefonieverhalten der tomedo® Integration wird im pascom Client eingestellt. Gehen Sie dazu in die {{< ui-button "Client Einstellungen" >}} und klicken Sie auf {{< ui-button "Aktionen" >}}.

### Neue Aktionen einrichten. 

Für die tomedo® Integration werden 3 Aktionen benötigt. Für jeden **Ereignistyp** wird eine Aktion benötigt (**eingehend**/**aktiv**/**auflegen**) 

1. Aktion | **incomming**
2. Aktion | **connected**
3. Aktion | **hangup**

<br />


![Übersicht Aktionen im pascom Client](actions-overview.PNG?width=60%)  

<br />

1. Klicken Sie auf {{< ui-button "Aktion hinzufügen" >}} um eine neue Aktion zu erstellen. Wählen Sie den Aktions-Typ {{< ui-button "App-Aktion hinzufügen" >}}. 

<br />

![Neue Aktion anlegen](new-action.PNG?width=80%)

<br />

#### Aktion für eingehende Anrufe

1. **Name:** - vergeben Sie einen Namen für die Aktion z.B. ```incomming```.
2. **App-Pfad** - setzen Sie den Pfad ```/usr/bin/curl```.
3. **App-Parameter** - setzen Sie die URL für die Parameter ```http://localhost:9090/incomming/${number}```.
4. **Aktion automatisch ausführen** - Aktivieren Sie alle ```Anruftypen```.
5. **Rufrichtung** - Eingehend und ausgehend = ```Beide```.
6. **Ereignis** - ```beim Klingeln```.

#### Aktion für aktiven / angenommenen Anruf

1. **Name:** - vergeben Sie einen Namen für die Aktion z.B. ```connected```.
2. **App-Pfad** - setzen Sie den Pfad ```/usr/bin/curl```.
3. **App-Parameter** - setzen Sie die URL für die Parameter ```http://localhost:9090/connected/${number}```.
4. **Aktion automatisch ausführen** - Aktivieren Sie alle ```Anruftypen```.
5. **Rufrichtung** - Eingehend und ausgehend = ```Beide```.
6. **Ereignis** - ```beim Annehmen```.


#### Aktion zum Auflegen

1. **Name:** - vergeben Sie einen Namen für die Aktion = ```hangup```.
2. **App-Pfad** - setzen Sie den Pfad = ```/usr/bin/curl```.
3. **App-Parameter** - setzen Sie die URL für die Parameter = ```http://localhost:9090/hangup/${number}```.
4. **Aktion automatisch ausführen** - Aktivieren Sie alle ```Anruftypen```.
5. **Rufrichtung** - Eingehend und ausgehend = ```Beide```.
6. **Ereignis** - ```beim Auflegen```.


## Einrichtung in tomedo® 

Die drei Aktionen müssen in tomedo® und in pascom jeweils paarweise identisch
eingestellt werden. Alle drei Ereignisschalter (intern, extern und team)
müssen für alle drei Aktionen aktiviert werden.  
<br />

Gehen Sie dazu in die {{< ui-button "Einstellungen" >}} unter {{< ui-button "Workstation" >}} und wählen {{< ui-button "Extern" >}} aus. Dort stellen Sie
die **Telephone Connection** auf **AppleScript + URL pattern**.
<br />

![tomedo® Setup](tomedo-setup.png?width=100%)

<br />

**Aktivieren** Sie die Einstellung **always use AppleScript for outgoing calls** und setzten Sie die URL pattern welche identisch mit den **pascom Client Aktionen** sein müssen.

<br />

![tomedo® Setup](tomedo-url-pattern.png?width=100%)

<br />

Zum raustelephonieren benötigt tomedo® noch ein Applescript, welches einen URL-Aufruf
mit Schema callto: erzeugt, auf den pascom dann reagiert indem es
raustelephoniert.

<br />

![tomedo® Setup](tomedo-applescript.png?width=100%)

<br />

**AppleScript**

```
set tel to "xxx"
set telOhneSpace to do shell script "echo " & quoted form of tel & " | sed -e 's/ //g'"
set theScript to "open tel:" & telOhneSpace
do shell script theScript  

```

<br />

Wie Sie die tomedo® Integration nutzen, erfahren Sie im Benutzerhandbuch