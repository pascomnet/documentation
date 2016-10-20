---
title: IVR - Auswahlmenüs
keywords:
    - Auswahlmenü
    -IVR
description: Auswahlmenüs (IVR) dienen dazu dem Anrufer durch das Drücken einer Taste durch das Telefonmenü zu lenken.
url: /anrufverteilung/ivr/
prev: /anrufverteilung/callrouter/
next: /anrufverteilung/time-calendar/
weight: 73
toc: true
---

## Konzepty

Auswahlmenüs (IVR) dienen dazu dem Anrufer durch das Drücken einer Taste durch das System zu lenken. Beispielsweise kann es sein, dass 50% der Anrufer auf der Zentrale nur entweder mit dem Vertrieb oder dem Support verbunden werden möchten. Hier kann man die Zentrale sinnvoll entlasten indem man ein Auswahlmenü vor die Zentrale schaltet.

Dies kann dem Anrufer dann anbieten:

*"Drücken Sie die **1** für den **Vertrieb** die **2** für den **Support**. Treffen Sie **keine Auswahl** werden Sie automatisch mit der **Telefonzentrale** verbunden ..."*

### Ablauf eines Auswahlmenüs

Wird ein IVR Menü gerufen findet folgender Ablauf statt:
![Illustration - Ablauf eines Auswahlmenüs](../../images/ivr_ablauf.png?width=90% "Ablauf eines Auswahlmenüs")

Zuerst spielt ein IVR Menü eine Ansage Ihrer Wahl ab. Wie man eigene Ansagen aufsprechen können Sie unter Eigene Ansagen und Wartemusik nachlesen. Diese Ansage beinhaltet beispielsweise den Text: *"Drücken Sie die **1** für den **Vertrieb** die **2** für den **Support**. Treffen Sie **keine Auswahl** werden Sie automatisch mit der **Telefonzentrale** verbunden ..."*.

Danach wartet das System den von Ihnen im IVR Menü definierten **Timeout** lang auf einen Tastendruck des Anrufers. Ein 5 Sekunden Timeout hat sich hier als praktikabel erwiesen.

Hat der Anrufer eine Taste gedrückt, für die ein **Eintrag vorhanden** ist, werden die Aktionen ausgeführt die dort hinterlegt sind.

Drückt der Anrufer eine Taste für die **kein Eintrag vorhanden** ist wird automatisch der Eintrag mit der Sondernummer i (für Invalid) gerufen. In den hier hinterlegten Aktionen ist es sinnvoll den Anrufer darauf hinzuweisen, dass er eine falsche Taste gedrückt hat und ihn wieder auf das selbe IVR abzuwerfen um ihm erneut die Auswahlmöglichkeiten vorzulesen.

Drückt der Anrufer innerhalb des Timeouts **keine Taste** wird automatisch der Eintrag mit der Sondernummer t (für Timeout) gerufen. In den hier hinterlegten Aktionen ist es entweder sinnvoll den Anrufer darauf hinzuweisen, dass er keine Taste gedrückt hat und ihn wieder auf das selbe IVR abzuwerfen um ihm erneut die Auswahlmöglichkeiten vorzulesen oder den Anrufer z.B. auf die Zentrale abzuwerfen.

### Mehrstufige Auswahlmenüs

In machen Fällen ist es sinnvoll mehrere Fragen hintereinander zu stellen um den Anrufer mit dem gewünschten Ziel zu verbinden. Beispielsweise können Sie einen Anrufer zuerst fragen ob er mit dem Support verbunden werden will und danach eine Supportkategorie (Probleme mit Windows, Linux, usw..) abfragen um ihn mit den richtigen Ansprechpartnern zu verbinden.

Hier können Sie einfach beliebig viele IVRs anlegen und einfach von einem in ein andres abwerfen. Somit ist eine beliebige Verschachtelung möglich.

{{% notice tip %}}
Vermeiden Sie wenn möglich mehr als zwei Ebenen. Stark verschachtelte Abfragemenüs werden i.d.R. vom Anrufer nicht akzeptiert.
{{% /notice %}}

## Konfiguration
### IVR verwalten

Wählen Sie in der mobydick Weboberfläche `Erweitert > IVR`. Wenn Sie ein neues IVR hinzufügen möchten drücken Sie `+Hinzufügen`. Falls Sie ein bestehendes IVR bearbeiten wollen markieren Sie dies in der Liste und wählen `Bearbeiten`.
![Screenshot - IVR hinzufügen](../../images/ivr_hinzufuegen.png?width=90% "IVR hinzufügen")
|Parameter|Bedeutung|
|---------|---------|
|Bezeichnung|Allgemeine Bezeichnung des IVR Menüs.
|Kanal beantworten|Normalerweise wird der Kanal sofort beantwortet falls Wartemusik oder eine Ansage abgespielt werden soll. Dies kann man hier verzögern (in Millisekunden). Bei manchen Anrufern kommt es vor, dass bei einer sofortigen Beantwortung die erste Silbe der Ansage "verschluckt" wird. Durch eine Verzögerung kann dies vermieden werden.|
|Timeout|Wie lange wartet mobydick auf einem Tastendruck des Anrufers nachdem die Ansage vorgelesen wurde in Sekunden.
|Durchwahl|Die Durchwahl unter der dieses IVR erreichbar ist.|
|Ansage vorschalten|Diese Ansage wird beim Betreten des Menüs vorgelesen und sollte Text wie "Drücken Sie die 1 um ..., die 2 um ..., usw." enthalten. Wie Sie eigene Ansagen aufnehmen können entnehmen Sie Eigene Ansagen und Wartemusik.|

### Einträge erstellen

Wählen Sie in der mobydick Weboberfläche Erweitert > IVR markieren Sie das gewünschte IVR und drücken Sie auf die Schaltfläche Einträge. Hier können Sie definieren was bei welchem Tastendruck passieren soll:

Wählen Sie `+Hinzufügen` um einen neuen Eintrag hinzuzufügen.
![Screenshot - IVR Einträge erstellen](../../images/ivr_eintrage.png?width=90% "IVR Einträge erstellen")
|Parameter|Bedeutung|
|---------|---------|
|Bezeichnung|Allgemeine Bezeichnung des Eintrages.|
|Nummer| Die Nummer die vom Anrufer per Telefontaste gedrückt wurde. Gültige Werte sind beliebige **Ziffern** oder **Ziffernfolgen**. <br/>Die Sondernummern **t** für Timeout und **i** für ungültige Taste sind schon vordefiniert.<br/> Um Überlappungen zu vermeiden verwenden Sie entweder einstellige, zweistellige, dreistellige, ... Nummern und mischen diese nicht.|

### Aktionen zum Eintrag hinterlegen

Jeder Eintrag braucht Aktionen die ausgeführt werden wenn die entsprechende Taste gedrückt wird.

Wählen Sie in der mobydick Weboberfläche `Erweitert > IVR` markieren Sie das gewünschte IVR und drücken Sie auf die Schaltfläche **Einträge**. Wählen Sie den entsprechenden Eintrag und drücken `Bearbeiten`. Im Reiter **Intern** und **Extern** finden Sie die Aktionen zum jeweiligen Eintrag:
![Screenshot - IVR Aktionen zum Eintrag hinterlegen](../../images/ivr_entry_detail.png?width=90% "Aktionen zum IVR Eintrag hinterlegen")

In unserem Beispiel werfen wir auf die Warteschlange Support ab wenn jemand durch Drücken der entsprechenden Taste diesen Eintrag wählt. Details können Sie unter Aktionen nachlesen.
