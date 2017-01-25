---
title: Analog- und ISDN-Endgeräte anlegen
keywords:
description:
url:  /endgeraete/analog-und-isdn-geraete/
next: /endgeraete/aastra-dect-system-anbinden/
prev: /endgeraete/beliebiges-ip-geraet-einrichten/
weight: 46
toc: true
draft: true

---

## Anbindung über ein Gateway oder Karte

Analog- und ISDN-Endgeräte werden entweder via beroNet Gateway oder via Junghanns Karte angeschlossen. Voraussetzung dafür ist, dass Ihre Gateways korrekt vorkonfiguriert wurden. Siehe ISDN, Analog und GSM Gateways einrichten.

Um ein Analog- bzw. ISDN-Endgerät anzulegen drücken Sie in der Geräteliste auf  und wählen als Gerätetyp je nach verwendetem Gateway und dort eingerichteter Anschlussart einen Eintrag Via Junghanns Karte: ISDN Endgerät oder Via beroNet Gateway: TECHNOLOGIE aus:

![Screenshot - Analog- und ISDN-Endgeräte Menü](../../images/device_add_analog_isdn.png?width=30% "Analog- und ISDN-Endgeräte Menü")

Im Beispiel wählen wir Via beroNet Gateway: Analoges Endgerät direkt da dies ein sehr häufiger Anwendungsfall ist um ein Fax anzuschließen.

![Screenshot - Analog- und ISDN-Endgeräte anlegen](../../images/device_beronet.png?width=100% "Analog- und ISDN-Endgeräte anlegen")

|Parameter|Bedeutung|
|---------|---------|
|Angeschlossen an|	An welchem physikalischen Port ist das Gerät angeschlossen. Wie man Ports definiert können Sie unter ISDN, Analog und GSM Gateways einrichten nachlesen.|
|Bezeichnung|	Eine Bezeichnung für dieses Gerät|
|Durchwahl|	Die Durchwahl unter der dieses Gerät zu erreichen ist|
|Amtsholung|	Nur bei Geräten vom Typ direkt (siehe ISDN, Analog und GSM Gateways einrichten). Muss das Gerät eine 0 vorwählen um ein Amt zu benutzen?|
|Portgruppe ausgehend|	Nur bei Geräten vom Typ direkt (siehe ISDN, Analog und GSM Gateways einrichten). Da das Gerät direkt am Gateway geroutet wird kann es ein dort angeschlossenes Amt direkt benutzen. Wählt man hier - nur intern - kann das Gerät nur interne Nebestellen erreichen.|
|Portgruppe eingehend|	Nur bei Geräten vom Typ direkt (siehe ISDN, Analog und GSM Gateways einrichten). Da das Gerät direkt am Gateway geroutet wird kann es ein dort angeschlossenes Amt direkt benutzen. Wählt man hier - nur intern - kann das Gerät von Außen nicht erreicht werden.|

Haben Sie ein Gerät vom Typ via SIP angelegt fahren Sie mit Benutzer und Arbeitsplätze anlegen fort. Alle anderen Geräte sind jetzt betriebsbereit.



## Über ein Amt erreichbare Geräte einbinden

mobydick ist in der Lage beliebige Endgeräte die über ein Amt zu erreichen sind in die Anlage einzubinden. Z.B. Ihr Telefon zuhause oder ein beliebiges Mobiltelefon.

Um ein Gerät via Amt einzubinden drücken Sie in der Geräteliste auf  und wählen als Gerätetyp Via Amt: Beliebiges externes Telefon:
![Screenshot - Über ein Amt erreichbare Geräte einbinden](../../images/device_extern.png?width=100% "Über ein Amt erreichbare Geräte einbinden")

|Parameter|Bedeutung|
|---------|---------|
|Bezeichnung	|Eine Bezeichnung des Gerätes.|
|Zielrufnummer|	Unter welcher Zielrufnummer ist das Gerät zu erreichen. Incl. Prefix zur Amtsholung. Hier die 0.|
|Kurzwahl	|Eine Kurzwahl unter der das Gerät zu erreichen ist.|
