---
title: mobydick Updaten
keywords:
    - mobydick installieren
    - Virtuelle Maschine installieren
    - mobydick auf Hardware installieren
    - mobydick Systemvoraussetzungen
description:
linken: /server/
url: /server/update/
prev:  /server/sicherung/
next: /server/automasierung/
weight: 18
toc: true

---

## Konzept

{{% notice note %}}
Dieser Artikel betrifft nur die kommerziellen mobydick Kunden. Die mobydick Community-Version erhält immer den Update-Channel **Current** und kann nicht geändert werden.
{{% /notice %}}

Für mobydick gibt es aktuell drei verschiedene Update-Cannel.

|Update-Cannel|Beschreibung|
|---|---|
|CURRENT|Der *Current*-Channel enthält die mobydick mit den aktuell freigegebenen und neuesten Funktionen. Diese wurden selbstverständlich intensiven Tests unterzogen, jedoch hat sich diese Version im Produktiveinsatz in einem kleineren Benutzerkreis und kürzerem Zeitraum bewährt.|
|STABLE|Standardmäßig ist der *Stable*-Channel für jede mobydick Installation vorausgewählt. In diesem Kanal erhalten Sie die für den produktiven Einsatz empfohlene Version der mobydick. Diese hat sich mindestens drei Monate im Produktiveinsatz bewährt, verzichtet aber dafür auf die neuesten Funktionen.|
|LTS|Der *LTS*-Channel (Long Time Support) wurde mit der Version 7.11 eingeführt, da in der Version 7.12 einige grundlegende Änderungen in der mobydick vorgenommen wurden, die mit Vorgängerversionen nicht mehr kompatibel sind (z. B. Umstellung der Lizenz von einem Installations-Paket auf einen Lizenz-Code oder der Wegfall der Unterstützung für ISDN-Karten des Herstellers Junghanns)|

{{% notice warning %}}
Führen Sie Updates nur über den Updater durch!
{{% /notice %}}

## Update Channel auswählen

Vor einem Update prüfen Sie bitte Ihren Update-Channel unter [my.pascom](https://my.pascom.net/ "my.pascom.net Lizenzportal").

{{% notice tip %}}
Sollten Sie noch keinen Zugriff auf my.pascom haben, können Sie sich als pascom-Kunde jederzeit kostenfrei über [my.pascom](https://my.pascom.net/#/buy/product) ein neues Konto erstellen. Dazu benötigen Sie Ihre E-Mail-Adresse und die System-ID Ihrer mobydick.
{{% /notice %}}

Loggen Sie sich ein, und klicken Sie im Bereich Marktplatz auf Lizenzen. Wählen Sie die zu bearbeitende Lizenz aus. Nun sehen Sie eine Übersicht und den Status des Update-Channels. Falls dieser nicht der richtige ist, klicken Sie auf `Update Channel auswählen` wählen Sie den gewünschten Channel.

## Updater aufrufen

Um Updates durchzuführen gibt es in der Web-UI einen eigenen Bereich. Dieser ist direkt über mehrere Wege erreichbar:

* über die Web-UI, wenn Sie in der Anmeldemaske auf den Tab `Service` klicken und dann auf `Softwareupdate`.
* wenn die sich schon angemeldet haben, fahren Sie mit der Maus über `Appliance` und klicken auf `Firmare/Softeware Update`.
* oder über die URL https://mobydick_ip/update.

Melden Sie sich anschließend mit Ihrem Admin-Benutzer an.
Nach dem Login sehen Sie eine Übersicht über verschiedene Pakete die mit einem Status versehen werden.

|Status|Erklärung|
|---|---|
|grün|Paket ist aktuell|
|gelb|eine neue Version des Pakets steht zur Verfügung und kann installiert werden|
|grau|ein zusätzliches Paket steht zur Verfügung und kann installiert werden|
|rot|das Paket wurde nicht richtig installiert|

{{% notice note %}}
Falls Sie keine Informationen über neueste Pakete erhalten ist es möglich, dass die mobydick keinen Zugang zum Update-Pool hat. Prüfen Sie in diesem Fall die Netzwerkverbindungen zum Update-Pool:  
**Community Version:** community.pascom.net per Port TCP 80  
**Lizensierte Version:** https://my.pascom.net Port TCP 443
{{% /notice %}}

## Updatevorgang

Das Update wird durch einen Klick auf `Install Updates` gestartet. Zunächst werden die neuen Pakete heruntergeladen und anschließend installiert.
Der Vorgang kann direkt im Browser verfolgt werden.

{{% notice warning %}}
Der Browser darf während des Updates nicht geschlossen werden!
{{% /notice %}}

Möglicherweise sind mehrere Update-Anläufe notwendig, z. B. wenn der Updater selber aktualisiert wird. Hierbei erhalten Sie entsprechende Hinweise.


## Offline-Update

Der bisher beschriebene Update-Vorgang benötigt eine Internetverbindung. Ist das Online-Update nicht möglich, weil z. B. die mobydick nicht nach außen kommunizieren darf oder aufgrund einer schlechten Internetverbindung, bieten wir alternativ die Möglichkeit des Offline-Updates.

{{% notice warning %}}
Die Pakete für das Offline-Update werden individuell pro mobydick Server zusammengestellt. Verwenden Sie ein und das selbe Update-Paket für verschiedenen Anlagen, die Sie verwalten, wird das zu Problemen führen!
{{% /notice %}}

Loggen Sie sich unter [my.pascom](https://my.pascom.net/ "my.pascom.net Lizenzportal") ein, und wählen Sie die Lizenz der Anlage bei der das Offline-Update durchgeführt werden soll.

### Updater aktualisieren

Falls Sie noch eine mobydick Version 7.00 bis 7.09 betreiben, muss zunächst der Updater aktualisiert werden. Klicken Sie auf `Aktuellen Updater herunterladen`

Wechseln Sie im Updater Ihrer mobydick zum Tab ´Upload´, laden Sie hier das Updater-Paket hoch und folgen Sie den Anweisungen auf dem Bildschirm.

### mobydick Updaten

Laden Sie nun unter [my.pascom](https://my.pascom.net/ "my.pascom.net Lizenzportal") das `Offline Update` Ihrer Installation entsprechend in 32 oder 64 Bit herunter.

Laden Sie das `Offline Update`-Paket im Reiter Upload hoch und folgen Sie den Anweisungen auf dem Bildschirm.
