---
title: Funktionscodes Überblick
description: Hier finden Sie eine Zusammenfassung über die pascom Funktionscodes (Sternchencodes).
weight: 125
---

{{< doctype "both" >}}
 
{{< description >}}

## Am Arbeitsplatz anmelden

|Funktionscode|Beschreibung|Beispiel|Sonstiges|
|---|---|---|---|
|**\*44**|Der aktuell angemeldete Benutzer wird an dem Arbeitsplatz abgemeldet||Kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden.|
|**\*44{Durchwahl}**|Eine bestimmte Durchwahl wird am Arbeitsplatz angemeldet. Die dazugehörige PIN wird am Telefon abgefragt.|Durchwahl 123 anmelden:<br>*\*44123*|Kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden.|
|**\*44{Durchwahl}#{PIN}**|Eine bestimmte Durchwahl wird am Arbeitsplatz angemeldet. Der Anmelde-Code enthält dabei die benötigte PIN.|Durchwahl 123 mit PIN 0000 anmelden:<br>*\*44123#0000*|Sternchencode kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden.|


## Anrufe von anderen Nebenstellen übernehmen (Pickup)

|Funktionscode|Beschreibung|Beispiel|Sonstiges|
|---|---|---|---|
|**\*8{Nebenstelle}**|Übernehmen des Anrufs auf einer bestimmten Nebenstelle.|Anruf auf der Nebenstelle 123 übernehmen:<br>*\*8123*|Wird eine Nebenstelle mit einer BLF-Taste überwacht ist es nicht notwendig zusätzlich eine Taste mit dem Sternchencode zu konfigurieren, da die BLF-Taste die Pickup-Funktionalität schon beinhaltet.|


## Rufumleitungen

|Funktionscode|Beschreibung|Beispiel|Sonstiges|
|---|---|---|---|
|**\*70{Durchwahl}**|Aktiviert eine Rufumleitung für eine bestimmte Durchwahl. Das Sprachmenü fragt nach der Zielrufnummer der Rufumleitung. Für eine externe Telefonnummer muss die Eingabe inkl. Amtskennziffer/Amtsholung erfolgen, falls diese verwendet wird.|Rufumleitung für die Durchwahl 123 aktivieren:<br>*\*70123*|Kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden.|
|**\*71{Durchwahl}**|Deaktiviert die Rufumleitung für eine bestimmte Durchwahl. Wurde bereits eine Rufumleitung gesetzt und ist diese deaktiviert, kann diese hierdurch auch aktiviert werden.|Rufumleitung für die Durchwahl 123 deaktivieren/reaktivieren:<br>*\*71123*|Kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden.|
|**\*74{Durchwahl}#{Ziel}**|Setzt eine Rufumleitung mit Zielrufnummer. Für eine externe Telefonnummer muss die Eingabe inkl. Amtskennziffer/Amtsholung erfolgen, falls diese verwendet wird.|Durchwahl 123 auf die Durchwahl 333 umleiten:<br>*\*74123#333*<br>Durchwahl 123 auf die externe Telefonnummer 0991123456789 ohne Amtsholung umleiten:<br>*\*74123#0991123456789*<br>Durchwahl 123 auf die externe Telefonnummer 0991123456789 mit der Amtsholung 0 umleiten:<br>*\*74123#00991123456789*||

## Voicemailbox

|Funktionscode|Beschreibung|
|---|---|
|**\*100**|Eigene Voicemailbox aufrufen.|
|**\*101**|Aufrufen der Voicemailbox eines anderen Benutzers. (PIN-Authentifizierung wird benötigt)|
|**\*102**|Weiterleitung auf die eigene Voicemailbox setzen.|
|**\*104**|Überwachte Voicemailbox aufrufen.|

## Ansagesystem

|Funktionscode|Beschreibung|
|---|---|
|**\*50**|Sternchencode für das Ansagesystem. Hier können Sie eine Ansage aufsprechen oder eine schon existierende abhören. Folgen Sie dem Sprachmenü.|

## Echotest

|Funktionscode|Beschreibung|
|---|---|
|**\*80**|Testen der Sprachübertragung am Telefon.|

## Team-Aktionen

|Funktionscode|Beschreibung|Beispiel|Sonstiges|
|---|---|---|---|
|**\*99#{Durchwahl}**|Einbuch/Ausbuchen eines Agenten aus allen Teams in dem er Mitglied ist.|Einbuchen/Ausbuchen des Agenten mit der Durchwahl 123:<br>*\*99#123*|Kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden.|
|**\*99#{Durchwahl}#{Pausencode}**|Pausieren/unpausieren eines Agenten unter Verwendung des Pausencodes|Pausieren/unpausieren des Agenten mit der Durchwahl 123 und dem Pausencode 10:<br>*\*99#123#10*|Kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden.|
|**\*99{Team}#{Durchwahl}**|Einbuchen/Ausbuchen eines Agenten aus einem bestimmten Team.|Einbuchen/Ausbuchen des Agenten mit der Durchwahl 123 aus dem Team 1100:<br>*\*991100#123*|Kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden.|
|**\*99{Team}#{Durchwahl}#{Pausencode}**|Pausieren/unpausieren eines Agenten aus einem bestimmten Team.|Pausieren/unpausieren des Agenten mit der Durchwahl 123 aus dem Team 1100 unter Verwendung des Pausencodes 10:<br>*\*99110#123#10*|Kann als *BLF*-Taste am IP-Tischtelefon hinterlegt werden.|

{{% notice info %}}
Funktionscodes kann man in der Web-UI unter {{< ui-button "Appliance" >}} > {{< ui-button "Systemeinstellungen" >}} > `asterisk.dialplan.global` zu finden. Bei Bedarf können diese hier angepasst werden.

Sollten Sie Funktionscodes verwenden, prüfen Sie den Paramater **asterisk.dialplan.alias.global**. Dieser sollte als Wert die Anzahl der Durchwahlstellen der Benutzer haben. Als Default-Wert ist 3 eingestellt.<br>
Wir raten davon ab Benutzern Durchwahlen mit unterschiedlicher Anzahl der Durchwahlstellen zu vergeben, da in diesem Fall bestimmte Funktionscodes nicht mehr richtig verwendet werden können.
{{% /notice %}}
