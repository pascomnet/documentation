---
title: pascom TAPI
description: Nutzen Sie den pascom TAPI Client für Windows um TAPI-fähige Software wie ERP, CRM-Systeme, etc. in den pascom Server einzubinden
weight: 1000
---

{{% notice tip %}}
Folgen Sie bitte unserer detaillierten [Installations-Anleitung]({{< ref "/clients/tapi-installation" >}}).
{{%/notice%}}

## Release 5.R76 (19.12.2019)

**Auf einen Blick**

- Windows Feature-Updates führen nicht länger dazu, dass die Einstellungen (Benutzername, Passwort, Server etc.) gelöscht werden. Eine Neukonfiguration ist bei der Installation des TAPI Updates erforderlich.
- Pickup in einer Terminal-Serve-Installation funktioniert nun korrekt.(Erfordert ein pascom Serverupdate auf 18.13 oder höher)
- Umlaute und Sonderzeichen in Passwörtern werden nun korrekt verarbeitet.

**ÄNDERUNGEN:**

- [TAPI-20] - TAPI will loose settings after Windows 10 feature update
- [TAPI-24] - TAPI doesn't accept umlauts and special chars
- [TAPI-25] - Enhance pickup command with username attribute if xmpp.supervisor is set

## Release 4.R56 (08.03.2019)

**Auf einen Blick**

- Anrufe, die sofort nach dem Starten einer TAPI-Anwendung gestartet werden, gehen nun nicht mehr verloren
- Wenn das Passwort des TAPI-Benutzers nicht mehr gültig ist, stoppt der Treiber nun die Anmeldung nach 5 Versuchen
- Rufnummern im Format "0049 (0) 29691 0" werden nun korrekt an den pascom Server übermittelt
- Auflegen von Anrufen in Zusammenspiel mit einem pascom18 Server ist nun zuverlässiger
- XMPP Verbindungen zu einem pascom 18 Server sind nun zuverlässiger

**ÄNDERUNGEN:**

- [TAPI-4] - TAPI looses calls issued very early after initialization
- [TAPI-6] - TAPI: stop trying to reconnect if the password is invalid
- [TAPI-16] - Number cleanup for phone numbers containing (0) fails
- [TAPI-17] - Increase version field width
- [TAPI-19] - TAPI not reacting anymore after inactivity
- [TAPI-21] - Hangup does not work properly in tapi


## Release 3.R42 (09.10.2018)

**Auf einen Blick**

- Tapi ist jetzt zu pascom Server 18.01 und neuer kompatibel
- Neue Versionsnummer
- Re-Branding von mobydick zu pascom

**ÄNDERUNGEN:**

- TAPI-3 - Correct "Mobydick" to "pascom" in tapi
- TAPI-14 - Tapi can't connect if Role doesn't contain RoleTypeList
- TAPI-15 - Implement new version numbering scheme in tapi
