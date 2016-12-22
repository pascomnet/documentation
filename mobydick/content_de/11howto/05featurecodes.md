---
title: Funktionscodes Überblick
url: /howto/funktionscodes/
prev: /howto/festplatte-erweitern/
weight: 125
toc: true
draft: false
---

## Am Arbeitsplatz anmelden

|Funktionscode|Beschreibung|Beispiel|Sonstiges|
|---|---|---|---|
|**\*44**|Der aktuell angemeldete Benutzer wird an dem Arbeitsplatz abgemeldet||Sternchencode kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden|
|**\*44{Durchwahl}**|Eine bestimmte Durchwahl wird am Arbeitsplatz angemeldet. Die dazugehörige PIN wird am Telefon abgefragt.|Durchwahl 123 anmelden:<br>*\*44123*|Sternchencode kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden|
|**\*44{Durchwahl}#{PIN}**|Eine bestimmte Durchwahl wird am Arbeitsplatz angemeldet. Der Anmelde-Code enthält dabei die benötigte PIN.|Durchwahl 123 mit PIN 0000 anmelden:<br>*\*44123#0000*|Sternchencode kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden|


## Anrufe von anderen Nebenstellen übernehmen (Pickup)

|Funktionscode|Beschreibung|Beispiel|Sonstiges|
|---|---|---|---|
|**\*8{Nebenstelle}**|Übernehmen des Anrufs auf einer bestimmten Nebenstelle.|Anruf auf der Nebenstelle 123 übernehmen:<br>*\*8123*|Wird eine Nebenstelle mit einer BLF-Taste überwacht ist es nicht notwendig zusätzlich eine Taste mit dem Sternchencode zu konfigurieren, da die BLF-Taste die Pickup-Funktionalität schon beinhaltet.|


## Rufumleitungen

|Funktionscode|Beschreibung|Beispiel|Sonstiges|
|---|---|---|---|
|**\*70{Durchwahl}**|Aktiviert eine schon festgelegte Rufumleitung für eine bestimmte Durchwahl. Das Sprachmenü fragt nach der Zielrufnummer der Rufumleitung.|Rufumleitung für die Durchwahl 123 aktivieren:<br>*\*70123*|Sternchencode kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden|
|**\*71{Durchwahl}**|Deaktiviert die Rufumleitung für eine bestimmte Durchwahl|Rufumleitung für die Durchwahl 123 deaktivieren:<br>*\*71123*|Sternchencode kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden|
|**\*74{Durchwahl}#{Ziel}**|Setzt eine Rufumleitung mit Zielrufnummer.|Durchwahl 123 auf die Durchwahl 333 umleiten:<br>*\*74123#333*|Sternchencode kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden|

## Voicemailbox

|Funktionscode|Beschreibung|Beispiel|Sonstiges|
|---|---|---|---|
|**\*100**|Voicemailbox einrichten: Ruft ein Sprachmenü an, in dem Sie verschiedene Einstellungen Ihrer Voicemailbox steuern können|||
|**\*101**|Nachrichten eines anderen Teilnehmers abhören|||
|**\*102**|Weiterleitung auf die eigene Voicemailbox setzten|||
|**\*103**|Weiterleitung auf die Voicemailbox des Angerufenen|||
|**\*104**|Überwachte Voicemailbox abhören|||

## Ansagesystem

|Funktionscode|Beschreibung|
|---|---|
|**\*50**|Sternchencode für das Ansagesystem. Hier können Sie eine Ansage aufsprechen oder eine schon existierende abhören. Folgen Sie dem Sprachmenü.|

## Echotest

|Funktionscode|Beschreibung|
|---|---|
|**\*80**|Testen der Sprachübertragung am Telefon.|
