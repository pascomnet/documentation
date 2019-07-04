---
title: Dialplan-Loop entfernen
description: Erfahren Sie hier, wie Sie Dialplan-Loops erkennen, vermeiden und beheben können
weight: 122
---

{{< doctype "both"  >}}

{{< description >}}

## Übersicht

Ein Dialplan-Loop entsteht wenn im Verlauf eines Anrufverlaufs eine Durchwahl 30 mal durchlaufen wird.

<!--FIXME wann kann das passieren
abwurf von einer team a nach team b
rufumleitung im kreis -> testen -->

## Warnmeldung

Es erscheint die Meldung in der Job-Box:

    CRITICAL: A dialplan loop was detected, see /tmp/.dialplan-loop-detected

Unter */tmp/.dialplan-loop-detected* wird eine Datei geschrieben, die Hinweise enthält, welche Durchwahl den Dialplan-Loop versursacht hat.

## Was ist zu tun?

Um zu vermeiden, das der Dialplan-Loop öfters entsteht, entnehmen Sie aus der Datei die Hinweise auf die am Dialplan-Loop beteiligten Durchwahlen und bearbeiten Sie bei Bedarf den Callflow.

<!--FIXME beispiel-->

Die Meldung verschwindet erst wieder, wenn die Datei *.dialplan-loop-detected* entfernt (gelöscht oder verschoben) wird. Loggen Sie sich dafür über SSH auf die pascom ein.
