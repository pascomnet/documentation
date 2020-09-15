---
title: Client Aktionen verwenden
weight: 19
description: In dieser Anleitung zeigen wir Ihnen, wie Sie Client Aktionen nutzen und Anrufdaten an eine externe Anwendung übergeben. 
---

{{< doctype "both" >}}
 
{{< description >}}

## Trainings Video

{{< youtube n9QQMU1CrTM >}} 


## Übersicht


Mit Client Aktionen können Sie Daten an Drittanwendungen übergeben, um diese weiter zu verarbeiten (z.B. ein CMS Web Anwendung mit Kundendaten). Client Aktionen können Sie manuell steuern oder auch automatisieren. 

## Neue Aktion anlegen

Die Client Aktionen finden Sie in den **Client-Einstellungen**.

1. Öffnen Sie die {{< ui-button "Client Einstellungen">}} über das pascom Menü


![Client Einstellungen öffnen](open_clientsettings.jpg)
</br>

2. Klicken Sie im **Einstellungs-Menü** auf {{< ui-button "Aktionen">}}


![Die Aktionen](actions.de.jpg)
</br>

3. Erstellen Sie eine neue Aktion über {{< ui-button "Aktionen hinzufügen">}}.


### Daten an URL oder Anwendung übergeben

An diesem Punkt, müssen Sie sich entscheiden, ob Sie Daten an eine **URL** weitergeben wollen (z.B. einer Web-Anwendung) oder an eine **Anwendung** die auf Ihrem Computer installiert ist. 

![URL oder App](actions-url-app.de.jpg)
</br>


## Aktion einrichten

Hier bestimmen Sie, welche Daten Sie übergeben möchten und wie sich Ihre Aktion verhalten soll. In unserem Beispiel übergeben wir die **Telefonnummer** des Anrufers an eine **URL** 

![Aktionen einstellen](actions-settings.de.jpg)
</br>

### Namen vergeben

Vergeben Sie beim Punkt {{< ui-button "Namen">}} eine eindeutige Bezeichnung für die Aktion, da Sie sich mehrere Aktionen anlegen können und daher gleich erkennen was die Aktion macht. 

### URL hinterlegen

Setzen Sie beim Punkt {{< ui-button "URL">}} die Adresse Ihrer Web-Anwendung, gefolgt von einer Variable und den Daten die Sie übergeben möchten.

**Beispiel**  

|Beschreibung|Parameter|
|---|---|
|URL|www.webadresse.com|
|Variable der Webanwendung|?phone=|
|Daten aus dem pascom Client|${number}|
|Ergibt|www.webadresse.com?phone=${number}|

{{% notice info %}}
Bei der Zusammensetzung der **URL** haben Sie natürlich komplett freie Hand und können die Daten daher so übergeben, wie Sie benötigt werden.
{{% /notice %}}

**pascom Parameter die verwendet werden können**

<br />

|Parameter|Beschreibung|
|---|---|
|${name}|Enthält den Namen des Anrufers, aufgelöst aus dem Telefonbuch|
|${number}|Enthält die Telefonnummer des Anrufers|
|${MDC_LABEL-X}|Enthält die Systemvariable eines Labels des Anrufers|
|${MDC_SKILL-X}|Enthält die Systemvariable eines Skills|

## Aktionen automatisch ausführen

Aktionen können in Verbindung mit der **Rufrichtung** und einem **Anrufergebnis** automatisch für folgende **Anruftypen** gestartet werden.

1. Interne Anrufe von Kollegen
2. Externe Anrufe auf der eigenen Durchwahl
3. Externe Anrufe über ein Team / Warteschlange

### Anrufrichtung bei automatischen Aktionen

Legen Sie bei der {{< ui-button "Rufrichtung">}} fest, ob die Aktion bei **eingehenden**, **ausgehenden** oder **beiden** Rufrichtungen, automatisch starten soll.

### Anrufergebnis bei automatischen Aktionen

Stellen Sie beim Punkt {{< ui-button "Ergebnis">}} ein, wann die Aktion automatisch starten soll. Schon beim **Klingeln**, nach dem **Annehmen** des Anrufs oder beim **Auflegen** des Anrufs.

## Aktionen manuell starten

Aktionen können Sie auch manuell zu jeder Zeit selbst ausführen bzw. starten. Bei Aktionen die beim jeweiligen Anruf zutreffen, finden Sie ein {{< ui-button "Aktion öffnen">}} Symbol.

![Aktionen selbst starten](actions-manuel.de.jpg)
*Aktionen mit einem Klick manuell starten*
</br>

1. Klicken Sie bei einem eingehenden Anruf auf den {{< ui-button "Aktion öffnen">}} Button. Ein PopUp zeigt Ihnen auch den Namen der Aktion an, welche ausgeführt wird.  
2. Aktionen können auch direkt aus dem **Anrufjournal** heraus gestartet werden. Dort finden Sie den selben {{< ui-button "Aktionen Öffnen">}} Button.

## Daten in Drittanwendung auslesen

Die Daten, welche Sie an eine Drittanwendung übergeben, sollten Sie natürlich auch weiter verarbeiten (z.B. Telefonnummer in einer CMS Webanwendung suchen). Hier können Sie kreativ werden. 


![Daten in Drittanwendung](data_extern.jpg)
*Daten vom pascom Client in externe Anwendung übergeben*
</br>

1. Wie Sie in der oberen Grafik erkennen können, wurde der **URL** die **Telefonnummer** des Kunden mitgegeben, welche nun **extern** weiter genutzt werden kann. 

## Aktionen verwalten

In den {{< ui-button "Client Einstellungen">}} können Sie Ihre Aktionen verwalten. Fügen Sie neue Aktionen hinzu, entfernen Sie bestehende Aktionen und favorisieren Sie Aktionen, welche standartmäßig genutzt werden sollen.

![Aktionen verwalten](actions_manage.de.jpg)
*Verwalten Sie Ihre Aktionen im pascom Client*
</br>

1. {{< ui-button "Deaktivieren">}} Sie Aktionen, welche Sie vorübergehend nicht benötigen.
2. Klicken Sie auf eine {{< ui-button "Aktion">}} um diese zu **bearbeiten**
3. Bitte beachten Sie, dass immer eine Aktion als {{< ui-button "Favorit">}} markiert werden muss. Eine einzelne Aktion ist daher immer **favorisiert**.

<br />