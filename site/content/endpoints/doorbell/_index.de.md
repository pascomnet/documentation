---
title: Generische Türsprechstelle |BETA
description: So binden Sie generische SIP-fähige Türsprechstellen in die pascom Telefonanalge ein
weight: 10
---

{{< doctype "both"  >}}

{{< description >}}

## Übersicht

Die pascom Telefonanlage bietet die Möglichkeit, generische Türsprechstellen zu integrieren. Für die Einbindung müssen herstellerseitig ein paar Voraussetzungen gegeben sein.

### Voraussetzungen des Endgeräts

Um eine SIP-Türsprechstelle am pascom Server betreiben zu können sind folgende Voraussetzungen notwendig:

* **SIP via TCP/TLS** (verschlüsseltes Signaling)
* **SRTP** (verschlüsselte Gesprächsdaten)
* **Outbound-Proxy** (senden der Daten via Session Border Controller)
* **RTSP-Videostream** (Übtragung von Video, mjpeg/rtsp)


## Türsprechstelle einrichten

Gehen Sie auf der pascom Admin-Weboberfläche auf {{< ui-button "Endgeräte" >}} > {{< ui-button "Geräteliste" >}} und klicken Sie auf {{< ui-button "Hinzufügen" >}}. Im nächsten Fenster wählen Sie das Template für **generic Doorbell** (generische Türsprechstelle)

### Parameter einrichten

Füllen Sie die vordefinierten Felder mit Ihren Daten aus.

|Feld|Beispiel-Wert|Beschreibung|
|---|---|---|
|Bezeichnung|**Haupteingang**|Der Name der Türsprechstelle|
|Geräte-Anmeldename|**XXXXXXXXXXX**|Anmeldename wird von der **pascom genereiert**|
|Passwort| **XXXXXXX** | Passwort wird von der **pascom generiert**|
|Bild-URL|```http://user:password@1.2.3.4/jpg/image.jpg```|URL der Standbildfunktion|
|Video-URL|```http://user:password@1.2.3.4/mjpg/video.mjpg```| URL der Videostreamfunktion|
|Türcode|**1234**| DTMF Code um die Tür zu öffnen|
|Durchwahl|**503**| Interne Durchwahl der Türsprechstelle|

</br>

**Beispiel**

![Beispiel Werte](parameter.de.PNG?width=80%)

## Türsprechstellen konfigurieren

Nachfolgend finden Sie eine Übersicht über Türsprechstellen die von pascom im Rahmen der Implementation getestet wurden. Generell können Sie jede SIP-fähige Türsprechstelle verwenden. Die nachfolgenden URL-Adressen müssen auf der Türsprechstelle selbst und auch auf der pascom Telefonanlage eingerichtet werden. Infos zum Aufbau der Video-URLS finden Sie meist direkt beim Hersteller auf der Webseite oder in den jeweiligen Handbüchern.

### Grundlegende Technologie

|Funktion|Protokoll|Beschreibung|
|---|---|---|
|Standbild|HTTP / HTTPS|JPEG/JPG|
|Video|HTTP / HTTPS / RTSP |H264 / MJPEG|

### Referenzliste

Hier finden Sie einige Referenz-URLs, für die Integration der Video- und Standbildfunktionalität, welche von pascom bereits ausprobiert wurden. **Bitte beachten Sie**, dass die URL-Adressen bei jedem Hersteller unterschiedlich aufgebaut sind. 

*Die hier aufgelisteten Hersteller, sollen keinesfalls eine Kaufempfehlung darstellen.*

**Baudisch**

|Typ|Beispiel-Wert|
|---|---|
|MJPEG via HTTP|```http://user:password@1.2.3.4/mjpg/video.mjpg```|
|JPG Bild|```http://user:password@1.2.3.4/jpg/image.jpg```|

</br>

**2N IP Base**

|Typ|Beispiel-Wert|
|---|---|
|MJPEG via HTTP|```https://admin:12345678@1.2.3.4/api/camera/snapshot?width=640&height=480&fps=15```|
|RTSP h264|```rtsp://1.2.3.4:554/h264_stream```|
|RTSP mjpeg|```rtsp://1.2.3.4:554/mjpeg_stream```|
|JPG Bild|--|

</br>

**Grandstream**

|Typ|Beispiel-Wert|
|---|---|
|RTSP h264|```rtsp://admin:1234567@1.2.3.4:554/4```|
|JPG Bild|```http://admin:1234567@1.2.3.4/snapshot/view0.jpg```|

</br>

**Behnke**

|Typ|Beispiel-Wert|
|---|---|
|RTSP h264|```rtsp://root:Admin@1.2.3.4/axis-media/media.amp```|
|JPG Bild |```http://root:Admin@1.2.3.4/axis-cgi/jpg/image.cgi```|



## Funktionen der Türsprechstelle im pascom Client

Der pascom Client ermöglicht eine umfangreiche Interaktion mit angebundenen Türsprechstellen. Hierzu gehöhrt die Bedienung der Gegensprechanlage, das öffnen der Tür und auch der Stream der Videokamera. Für eine vollumfängliche Nutzung aller Funktionen, muss die Türsprechstelle eine direkte Verbindung zum pascom Client haben

Eine direkte Verbindung bedeutet, der pascom Client muss sich im selben Netzwerk wie die Türsprechstelle befinden. Egal, ob es sich dabei um den pascom Desktop oder Mobile Client handelt.


![Netzwerkübersicht](network.de.png)
*Mobile Client ohne Videostream, außerhalb des Firmennetzwerk*
</br>

### Videostream und Standbild im pascom Client

Wie Sie der obigen Grafik entnehmen können, ist ein Videostream zwischen der Türsprechstelle und dem pascom Client nur im selben Netzwerk möglich. Geräte außerhalb des Firmennetzwerk müssen auf das Videobild verzichten.

### Gegensprechanlage nutzen

Die Türsprechanlage baut beim betätigen der Klingel einen ganz normalen Anruf auf, welcher über SIP/SRTP von überall aus, entgegengenommen werden kann. Hier muss sich der pascom Client nicht im selben Netzwerk befinden.

### Türöffner nutzen

Um eine Tür zu öffnen, sendet der pascom Client, während dem aktiven Gespräch, einen DTMF Code. Hier muss sich der pascom Client nicht im selben Netzwerk befinden und der Türöffner kann von überall aus, betätigt werden.

### Nützliche Hinweise

1. **Wie kann ich den Videostream meiner Türsprechstelle auch außerhalb des Firmennetzwerk bereitstellen?**
</br>
Hierzu müssen Sie Einstellungen an Ihrem Netzwerk/Router vornehmen. Nutzen Sie als Hilfestellung unsere Anleitung für den [Mobilzugriff via Internet]({{< ref "/howto/mobile-access" >}}) .

2. **Warum haben Iphone Geräte ein schwarzes Bild bei der Übertragung des Videostream?**
</br>
Wenn die Türsprechstelle die Bild-/Videodaten via HTTPS mit einem selbstsignierten Zertifkat ausliefert, kann es auf iOS Geräten dazu kommen, dass kein Bild angezeigt wird. Dies ist eine iOS-Sicherheitsrichtlinie. Um ein Bild zu erhalten, muss entweder ein vertrauenswürdiges Zertifikat installiert oder die Türsprechstelle auf HTTP umgeschaltet werden.




