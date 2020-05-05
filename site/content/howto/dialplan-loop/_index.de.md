---
title: Dialplan-Loop entfernen
description: Erfahren Sie hier, wie Sie Dialplan-Loops erkennen, vermeiden und beheben können
weight: 122
---

{{< doctype "both"  >}}

{{< description >}}

## Übersicht

Ein Dialplan-Loop entsteht wenn im Verlauf eines Anrufs, eine Durchwahl 30 mal durchlaufen wird. Dies geschieht z.B. durch Rufumleitungen und Abwürfen die falsch gesetzt sind und dadurch in einer Schleife enden.

{{% tabs %}}
{{% tab "Onsite - alle Versionen" %}}

## Warnmeldung

Es erscheint die Meldung in der Job-Box:

    CRITICAL: A dialplan loop was detected, see /tmp/.dialplan-loop-detected

Unter */tmp/.dialplan-loop-detected* wird eine Datei geschrieben, die Hinweise enthält, welche Durchwahl den Dialplan-Loop versursacht hat.

## Was ist zu tun?

Um zu vermeiden, das der Dialplan-Loop öfters entsteht, entnehmen Sie aus der Datei die Hinweise auf die am Dialplan-Loop beteiligten Durchwahlen und bearbeiten Sie bei Bedarf den Callflow.

<!--FIXME beispiel-->

Die Meldung verschwindet erst wieder, wenn die Datei *.dialplan-loop-detected* entfernt (gelöscht oder verschoben) wird. Loggen Sie sich dafür über SSH auf die pascom ein. Wechseln Sie in den /tmp Ordner und löschen Sie die Datei: *dialplan-loop-detected*.
{{% /tab %}}

{{% tab "Cloud - pascom 19" %}}
## Warnmeldung

Es erscheint die Meldung in der Job-Box:

    CRITICAL: A dialplan loop was detected

## Warnmeldung entfernen

Das pascom Cloud System bereinigt diese Warnmeldung automatisch, sobald Sie das nächste mal Änderungen über **"Telefoniekonfiguration anwenden"** speichern.

## Dialplan Loop vermeiden

Prüfen Sie, bei auftreten dieser Warnmeldung, unbedingt Ihre Rufumleitungen und Abwürfe innerhalb des Anrufverlauf. Hier wird sich an irgendeinem Punkt, eine Schleife bilden. Bauen Sie Ihren Anrufverlauf so um, das Schleifen vermieden werden. 

{{% /tab %}}
{{% /tabs %}}


