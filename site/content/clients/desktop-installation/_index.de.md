---
title: Desktop Client Installation
description: So installieren Sie den pascom Desktop Client auf den Plattformen Windows, macOS und Linux
weight: 10
---

{{< doctype "both" >}}
 
{{< description >}}

## Ihre Firewall anpassen

Viele Unternehmen haben **keinen eingeschränkten Internetzugriff** und können den [pascom Desktop UC Client](https://www.pascom.net/de/voip-telefonanlage/unified-communications/ "pascom Unified Communications Apps für Windows, macOS & Linux") daher **sofort**, ohne jede Anpassung an der Firewall **nutzen**.

Wenn Sie jedoch genau festlegen auf welche Internetdienste Ihr Unternehmensnetzwerk zugreifen darf, schalten Sie bitte folgende Ports für den pascom Desktop Client frei, um einen reibungslosen Betrieb der pascom Telefonanlage zu ermöglichen:

[Firewall konfigurieren / Portübersicht]({{< ref "/server/port-overview" >}})


## Windows Installation

{{% notice tip %}}
Systemvoraussetzung **Windows 7, 8.1 oder 10 (32 und 64bit)**. Jeweils das neueste Patchlevel. 
{{% /notice %}}

Die Windows Installation benötigt keine Administratorrechte und erfolgt automatisch in das Home-Directory des aktuell angemeldeten Benutzers:

 * [Windows Desktop Client](https://my.pascom.net/update/client/stable/windows) herunterladen
 * **pascom-client-setup.exe** ausführen
 * Installationanweisungen folgen

### Windows QoS Einstellungen (Optional)

Um die maximale Sprachqualität zu erreichen markiert der pascom Client alle Sprachdaten entsprechend mit QoS-Flags.

Dies passiert, mit Ausnahme von Windows, auf allen weiteren Plattformen automatisch.

Unter Windows sind folgende Gruppenrichtlinien "**Richtlinienbasierter QoS**" notwendig um die Pakete entsprechend zu markieren.

Die Gruppenrichtlinien werden unter folgendem Pfad erstellt:

```
Lokaler Computer > Computerkonfiguration 
> Windows-Einstellungen > Richtlinienbasierter QoS
```

|                           | Richtlinie 1      | Richtlinie 2      | Richtlinie 3      |
| ------------------------- | ----------------- | ----------------- | ----------------- |
| *Richtlinienname*         | pascomSIP         | pascomRTP         | pascomXMPP        |
| *Anwendungsname*          | pascom Client.exe | pascom Client.exe | pascom Client.exe |
| *Protokoll*               | TCP und UDP       | UDP               | TCP               |
| *Quellport*               | \*                | \*                | \*                |
| *Zielport*                | 5060:5062         | 30000:35000       | 5222              |
| *Quell-IP*                | \*                | \*                | \*                |
| *Ziel-IP*                 | \*                | \*                | \*                |
| *DSCP-Wert*               | 24                | 46                | 24                |
| *Drosselungsrate*         | -1                | -1                | -1                |


## Terminalserver Installation

{{% notice tip %}}
Systemvoraussetzung **Windows Server 2008 R2 64bit** oder höher
{{% /notice %}}

{{% notice info %}}
Bei dieser Installationsart werden die automatischen pascom Desktop Client Updates, auch ohne das explizite setzten der Kommandozeilen Option --noUpdate, deaktiviert und Sie müssen neue Versionen selbst herunterladen und ausrollen.
{{% /notice %}}

Am Microsoft Terminal Server können Sie den pascom Desktop Client optional statt in das jeweilige Home-Directory der Benutzer direkt in das Programme Verzeichnis installieren. 

Der Nachteil dieser Installationsart ist, dass Sie sich selbst um das Update des Desktop Clients kümmern müssen da dieses Administrator Rechte Benötigt. Als Vorteil sparen Sie ca. 100 MB Plattenplatz pro Benutzer.

* [Windows Desktop Client](https://my.pascom.net/update/client/stable/windows) herunterladen
* Öffnen Sie die Eingabeaufforderung als Administrator
* Starten Sie das Setup und geben Sie das Zielverzeichnis an 

**Beispiel:**

```
pascomClient-setup.exe /D=C:\Program Files (x86)\pascom Client
```

### RDP Modus am Terminalserver nutzen

Mithilfe des Kommandozeilenparamters **- -rdp** oder durch Setzen der Umgebungsvariable **PC_RDP auf 1** ist es nun möglich, für den Client am Terminalserver, die Verwendung von Softphone und Video-Support zu deaktivieren. Dies erlaubt dem Client am Terminalserver, das Softphone einer weiteren Client-Instanz zur Telefonie zu verwenden.

Damit ist es z.B. möglich, eine Client Instanz innerhalb einer RDP Sitzung und eine weitere auf dem Host-Rechner zu starten. Die innerhalb der RDP-Sitzung laufende Instanz hat das --rdp Flag gesetzt, die äußere nicht. Somit kann ein an den PC angestecktes Headset zur Telefonie verwendet werden.



#### Was bewirkt das?

- Bessere Audioqualität, da das Audio nicht in die RDP-Sitzung übertragen werden muss.
- Headsetsteuerung (z. B. Annehmen über Taste am Headset) funktioniert dadurch.
- Integrationen in Software die auf einem Terminal-Server läuft (z. B. Outlook, Datev) funktioniert weiterhin.
- Weniger CPU-Last auf Terminal-Servern, da Audio und Video über den Client auf dem jeweilgen Endgerät enkodiert und dekodiert werden.
- Anrufsteuerung ist über jeden der Clients vollständig möglich.  

Das Feature funktioniert plattformübergreifend (Windows, macOS, Linux) und ist nicht auf RDP-Sitzungen beschränkt.



## macOS Installation

{{% notice tip %}}
Systemvoraussetzung **macOS High Sierra 10.13** oder höher
{{% /notice %}}

* [macOS Desktop Client](https://my.pascom.net/update/client/stable/macos) herunterladen
* **pascom Client.dmg** ausführen
* Schieben Sie das pascom Icon auf den Application Ordner
* Sobald der Kopiervorgang abgeschlossen ist, können Sie den Client starten

## Linux Installation

{{% notice tip %}}
Systemvoraussetzung **Ubuntu 18.04 LTS** oder höher. Andere Linux Distributionen können funktionieren, werden aber von pascom weder aktiv getestet noch offiziell unterstützt. 
{{% /notice %}}

* [Linux Desktop Client](https://my.pascom.net/update/client/stable/linux) herunterladen
* **pascom_Client.tar.bz2** im Home-Directory entpacken
* Ubuntu Application Icon mit **create-starter.sh** erstellen
* Client über Application Icon starten

Beispiel

```bash
tar jxvf ./Downloads/pascom_Client-7.17.10.R.tar.bz2
./pascom_Client/create-starter.sh 
```

## Windows Installer Kommandozeilen Parameter

|Parameter|Bedeutung|
|---------|---------|
|/S|Ermöglicht eine Installation im Hintergrund, ohne dass Dialogfenster angezeigt werden. Nützlich bei automatischer Softwareverteilung|
|/D=PATH| Gibt einen Installationsordner an. Dieser Parameter muss immer der letzte in der Befehlszeile sein, darf keine Anführungzeichen enthalten und unterstützt nur absolute Dateipfade|


## Desktop Client Umgebungsvariablen und Kommandozeilen Parameter

Der pascom Desktop Client unterstützt auf allen Betriebsystemen zahlreiche Kommandozeilen Parameter und reagiert außerdem auf etliche Umgebungsvariablen. 

Welche Parameter und Umgebungsvariablen von Ihrer Version unterstützt werden können Sie durch den Parameter `--help` abfragen.

{{% notice tip %}}
Der Desktop Client darf nicht gestartet sein um die Hilfe auszugeben.
{{% /notice %}}

Beispiel

```text
pascom Client 7.18.00.D3667_267a0cd
Environment variables without corresponding commandline parameter:
- PC_SCALE_FACTOR=<value>: Set this environment variable to override automatic DPI Scaling value. Useful if you have a Setup with multiple Monitors and non-integer scaling factors. Value is a real, e. g. 1, 0.75, 1.5, and applies as second factor to the Scaling Value QT Calculated. Example: Your screen is at 150% scaling, QT would calculate a factor of 2. So VALUE needs to be 0.75 to get to the correct real scaling of 1.5

- PC_SCENE_GRAPH_BACKEND=<value>: Set this environment variable to switch the backend used for rendering the ui. Useful if the default backend produces graphic errors on your setup. Do not set or leave empty to use automatic (Software on Windows, OpenGL on other platforms). Possible Values are: software, d3d12, openvg, opengl

- PC_QSG_RENDER_LOOP=<VALUE>: Change the used opengl render loop by setting `QSG_RENDER_LOOP` internally. Defaults to 'basic' if not set. Possible Values are: basic, windows, threaded


Options:
  --userDir <userDir>      Set user directory. Via Environment: Set PC_USERDIR
                           to desired value
  -h, --help               Displays this help.
  --exec                   Execute a command instead of starting a client
                           instance. Example: --exec dial,*104 (Calls your own
                           Voicemailbox)
  --debug                  Show debug window. Via Environment: Set
                           PC_DEBUG_WINDOW to any value.
  --noUpdate               Disable automatic update. Via Environment: Set
                           PC_NO_UPDATE to any value.
  --forceTouchMode         Show UI like touchscreen is enabled
  --disableHeadsetSupport  Set to true to disable automatic headset detection
                           and controls. Via Environment: Set
                           PC_HEADSET_SUPPORT_DISABLED to any value.
  --logSennheiserMessages  Log all communication from and to Sennheiser
                           HeadSetupApplication. Via Environment: Set
                           PC_LOG_SENNHEISER_MESSAGES to any value.
  --logXmppMessages        Log complete Xmpp Messages. Via Environment: Set
                           PC_LOG_XMPP_MESSAGES to any value.
  --logSipMessages         Log complete Sip Messages. Via Environment: Set
                           PC_LOG_SIP_MESSAGES to any value.
  --loglevel <loglevel>    Set Logging verbosity. values from 0-5. Via
                           Environment: Set PC_LOG_LEVEL to desired value.
  --minimized              Do not open the main window on startup. Via
                           Environment: Set PC_MINIMIZED to any value
  --user <user>            Override login username. Via Environment: Set
                           PC_USER to desired value.
  --password <password>    Override login password. Insecure, please use
                           PC_PASS environment variable instead
  --server <server>        Override login server. Via Environment: Set
                           PC_SERVER to desired value.
  --rdp                    Use RDP Mode. Via Environment: Set
                           PC_RDP to 1.
```
