---
title: mobydick Desktop Client installieren
url: /clients/client-installieren/
prev: /clients/
next: /clients/client-nutzen/
weight: 31
toc: true
---

## Installation
Der mobydick Desktop-Client ist für jeden Benutzer ohne Authentifizierung vom mobydick Server herunterladbar.Die Installation kann auch ohne Administratorrechte erfolgen und somit auf Wunsch vom Benutzer selbst erledigt werden.
![Screenshot - mobydick Desktop Client installieren](../../images/client_themes.jpg?width=70% "mobydick Desktop Client installieren")

Surfen Sie auf die IP Ihrer mobydick und Klicken Sie auf dem Tab **Service**:
![Screenshot - Service Tab der mobydick](../../images/client_download.png?width=70% "Service Tab der mobydick")

### Windows
1. Zuerst laden Sie sich die .exe-Datein von Ihrem mobydick Server herunter.
2. Speichern Sie die Datei.
3. Anschließend gibt es je nach Anforderungen verschiedene Optionen:

#### Standardinstallation
* Ist der Download fertig, klicken Sie auf die Datei um die Installation einzuleiten:

![Screenshot - Standardinstallation](../../images/client_windows_installation.png?width=100% "Standardinstallation")

#### Installation mit Adminrechten auf einem Desktop
* Ist der Download fertig, Rechtsklick auf die .exe-Datei, und als Administrator ausführen.
* Nach dem Bestätigen der Lizenzbestimmungen werden Sie gefragt, ob es sich um eine Installation auf dem Terminalserver handelt -> Klick auf **Standard** und **Weiter** bis Installation abgeschlossen ist.

![Screenshot - Installation mit Adminrechten](../../images/client_admin_standard.png?width=100% "Installation mit Adminrechten")

#### Installation mit Adminrechten auf dem Terminal Server
Am Terminal Server reicht es aus, den mobydick Client nur einmal zu installieren (um z. B. Platz zu sparen), und kann trotzdem von allen Benutzern verwendet werden

* Ist der Download fertig, Rechtsklick auf die .exe-Datei, und als Administrator ausführen.
* Nach dem Bestätigen der Lizenzbestimmungen werden Sie gefragt, ob es sich um eine Installation auf dem Terminalserver handelt -> **Klick auf Terminal Server** und **Weiter** bis Installation abgeschlossen ist.

![Screenshot - Installation mit Adminrechten auf dem Terminal Server](../../images/client_install_terminal.png?width=100% "Installation mit Adminrechten auf dem Terminal Server")

{{% notice note %}}
Zum Updaten muss der Client erneut heruntergeladen und manuell wiederrum mit Adminrechten installiert werden.
{{% /notice %}}

#### Commandline Optionen

Beispiel:

    MobyDickClient-setup.exe /S /ISUPDATE=1 /D=C:\client

Parametererklärung:

|Parameter|Bedeutung|
|---------|---------|
|/S|Ermöglicht eine Installation im Hintergrund, ohne dass Dialogfenster angezeigt werden.|
|/ISUPDATE=1|{{% md %}}* Überspringt alle Bestätigungen und startet die Installation sofort
* Zeigt nur das "Copy"-Fenster (in Verbindung mit /S wird das "Copy"-Fenster nicht angezeigt)
* Der Client wird nach der Installation sofort angezeigt
* Der Installationsordner kann mit /D angegeben werden{{% /md %}}|
|/D=PATH|{{% md %}}* Gibt einen Installationsordner an
* Dieser Paramter muss immer der letzte in der Befehlszeile sein
* Darf keine Anführungzeichen oder ähnliches enthalten
* Unterstützt nur absolute Dateipfade{{% /md %}}||

### Mac
Um den MobyDick Client unter Mac OSx zu installieren müssen Sie folgende Schritte durchführen:

1. Laden Sie die .dmg Datei von Ihrer MobyDick Startseite herunter. Die URL (z.B. http://meinetelefonanlage.musterfirma.de oder http://10.1.1.0) wird Ihnen in der Regel von Ihrem Admin zugesendet.
2. Speichern Sie die Datei
3. Wenn der Download fertig ist, klicken Sie auf die Datei und der Installationsvorgang wird eingeleitet
Darauf erscheint dieses Fenster:
4. Schieben Sie das MobyDick Icon (rot) auf den Application Ordner
5. Sobald der Kopiervorgang abgeschlossen ist, können Sie den Client starten

### Linux
Unter Linux bringen wir keinen klassischen Installer mit.

1. Laden Sie das tar.bz2-Paket aus der MobyDick über die Service Seite herunter
2. Entpacken und führen Sie über die Shell das Paket mit folgenden Befehlen aus:
Eingabe via Terminal


    tar xfvj MobyDickClient-x.xx.xx.tar.bz2  
    ./md_client/bin/md_client


### Konfiguration

#### Im mobydick Client anmelden
Bei der Installation der mobydick beinhaltet die Rolle All Users den Rollentyp xmpp.group. Somit kann sich jeder Benutzer mit seinem Benutzernamen und Passwort an seinem mobydick Client anmelden. Möchten Sie das einschränken, müssen Sie den Rollentyp bei All Users entfernen und eine neue Rolle erstellen.

Sie können auch mehrere Rollen erstellen, z. B. wenn sie Gruppen erstellen möchten, deren Mitglieder nur miteinander über den Client kommunizieren können.

Ist ein Benutzer in mehreren Gruppen Mitglied kann er im Client zwischen den einzelnen Kontaktlisten wechseln:

Mehr zum mobydick Client unter mobydick Desktop Client für Endbenutzer.