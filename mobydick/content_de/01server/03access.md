---
title: Zugriff und Nutzung der Bedienoberflächen
keywords:
    - IP-Adresse ermitteln
    - Zugriff auf die Weboberfläche
    - Zugriff auf die mobydick TUI
    - Zugriff per SSH
description: Erfahren Sie, wie Sie Zugriff auf Ihre mobydick erhalten und die Bedienoberfläche nutzen
url: /server/zugriff/
prev: /server/server-installieren/
next: /server/lizenzen-verwalten/
weight: 13
toc: true
---

## IP-Adresse ermitteln
Um auf das System zugreifen zu können, benötigen Sie die IP-Adresse der Telefonanlage.

Falls Sie einen vorinstallierten mobydick Server erworben haben, entnehmen Sie die IP aus dem Beiblatt oder der Beschriftung an den Netzwerkschnittstellen.

Wenn Sie sich mit der IP-Adresse nicht sicher sind, können Sie einen Monitor an der mobydick anschließen und die IP am mobydick TUI (siehe unten) ablesen.


## Zugriff auf die Weboberfläche

Starten Sie einen beliebigen Browser und geben Sie als URL **https://[IP_der_mobydick]** ein. Anschließend müssen Sie einem selbstsigniertem Zertifikat zustimmen.

Sollten Sie nicht https benutzen, kommt eine Meldung, die Sie darauf hinweist, dass die Netzwerkverbindung nicht verschlüsselt ist.

Loggen Sie sich im Tab Anmeldung mit dem Benutzer `admin` und dem Standardpasswort `mobydick` ein, insofern Sie nicht beim Setup ein anderes Passwort vergeben haben.

{{% notice note %}}
Arbeitssitzungen bleiben nach der letzten Eingabe 30 Minuten aktiv, innerhalb dieser Zeit ist keine Neuanmeldung erforderlich. Falls Sie an einem öffentlich zugänglichen Rechner arbeiten, sollten Sie sich daher nach Beendigung der Konfigurationen an der mobydick Benutzeroberfläche abmelden, um den Zugriff durch andere Personen zu unterbinden. Klicken Sie dazu die Schaltfläche `Abmelden`.
{{% /notice %}}

## Zugriff auf das Text User Interface (TUI)

Über das TUI können Sie sehr grundsätzliche Konfigurationen, wie z. B. IP-Adresse, Netzwerkeinstellungen usw. verändern. Schließen Sie hierzu einen Monitor direkt an den mobydick Server an oder schauen Sie auf die Console der virtuellen Maschine.

### Startseite

Die Startseite gibt Ihnen Informationen über die verfügbaren Netzwerkschnittstellen.
![Screenshot - TUI der mobydick](/tui_start.jpg?width=80%)

Sie können hier die IP-Adresse der mobydick ablesen und anschließend in einem Browser mit der eigentlichen Konfiguration der Telefonanlage fortfahren.

### Hauptmenü

{{% notice note %}}
Das TUI wird zur Installation verwendet oder falls Sie über die WEB-UI oder SSH keinen Zufriff auf die mobydick mehr haben.
{{% /notice %}}

Um ins Hauptmenü des TUI zu gelangen müssen Sie die Taste **F2** drücken und das Systempasswort (Admin-Passwort) eingeben. Im folgenden werden die wichtigsten Menüpunkte erklärt:

|Menüpunkt|Erklärung|
|---|---|
|Abmelden|Zurück zum TUI-Startbildschirm.|
|Netzwerk konfigurieren|Hier können Sie Netzwerkschnittstellen bearbeiten. Anpassungen am Netzwerk an dieser Stelle erfolgen analnog zur WEB-UI.|
|Herunterfahren|Hier kann das System heruntergefahren oder neugestartet werden.|
|Shell öffnen|Öffnet eine Shell mit root Rechten.|
|System Passwort setzen|Hier kann das Systempasswort geändert werden, dies muss durch zweimaliges Eingeben bestätigt werden. Das Systempasswort gilt für den admin und den root User.|
|Backup erstellen|Erstellt ein Backup des kompletten Systems mit allen Einstellungen in Form eines ISO-Abbilds.|


## Zugriff über SSH

Falls Sie ein Terminal auf einem Unix-System verwenden loggen Sie sich ein mit

    ssh admin@mobydick_ip

Falls Sie Windows verwenden, benötigen Sie einen SSH-Client. In diesem Fall empfehlen wir die Benutzung von PuTTY. Informationen hierzu finden Sie unter [http://www.chiark.greenend.org.uk/~sgtatham/putty/](http://www.chiark.greenend.org.uk/~sgtatham/putty/ "Informationen zum putty").
Loggen Sie sich hier mit dem Benutzer `admin` und dem entsprechenden Passwort ein.

Anschließend benötigen Sie Root-Rechte, da der Zugriff sonst sehr eingeschränkt ist. Diese erhalten Sie mit dem Befehl **su** und der Eingabe des zuvor benutzten Passworts.  

    ---
    Welcome to your asterisk PBX, admin!
    You may need to use sudo or su to become root...
    ---
    admin@mobydick:~$ su
    Password:

## Zugriff auf die Asterisk-CLI
mobydick verwendet Asterisk als Telefoniesoftware. Asterisk bietet ein Command Line Interface (CLI) in der Sie das gesamte Telefonieaufkommen beobachten und debuggen können. Voraussetzung hierfür ist, dass Sie bereits per SSH auf der Anlage eingeloggt sind und über Root-Rechte verfügen. Dort geben Sie `asterisk -r` ein:

     root@mobydick:/etc/admin# asterisk -r


     =========================================================================
     Connected to Asterisk certified/11.6-cert13 currently running on mobydick (pid = 2851)
     mobydick*CLI>

Weitere Details zur Asterisk-CLI finden Sie unter [http://www.voip-info.org/wiki/view/Asterisk+CLI](http://www.voip-info.org/wiki/view/Asterisk+CLI "Details zu Asterisk CLI")


<!--FIXME zugriff miniappl.  -->
