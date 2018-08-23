---
title: pascom Server von USB-Stick installieren
description: So erzeugen Sie einen USB-Stick als Installationsmedium. Optional können Sie das Setup zusätzlich automatisieren (unattended setup).
weight: 10
---
 
{{< doctype "self" >}}
 
{{< description >}}

## Vorraussetzungen

* USB-Stick mit mindestes 8 GB Kapazität
* Kostenlosen Flash Tool [Etcher](https://etcher.io/) (erhältich für Windows, Linux und MacOS)
* pascom Server [ISO-Dateien](https://www.pascom.net/de/download/)
 
## USB-Stick flashen

Verbinden Sie den USB-Stick mit Ihrem Computer und starten Sie das Tool Etcher. Wählen Sie nun das pascom Server ISO unter {{< ui-button "Select image" >}}, wählen Sie den USB-Stick via {{< ui-button "Select drive" >}} und klicken Sie im Anschluss auf {{< ui-button "Flash" >}}:

![Etcher](etcher.png "Etcher")

## USB-Stick booten

Den so vorbereiteten USB-Stick können Sie nun direkt an die von Ihnen verwendete Hardware anschließen und als pascom Server Bootmedium nutzen. Das Setup unterscheidet sich im weiteren Verlauf nicht vom herhömmlichen ISO Setup. Siehe z.B. [Virtuelle Maschine aufsetzen]({{< ref "server/virtual" >}}).
 
## Setup Automatisieren (Optional)

Dieser Schritt ist optional um das Setup zu automatisiere (unattended). Automatisiert bedeutet, dass Sie alle Fragen die Ihnen das Setup direkt auf dem Bildschrim (TUI) des Servers stellen würde bereits per Konfigurationsdatei im Vorfeld beantwortet werden.

Dies ist z.B. nützlich wenn Sie sehr viele pascom Server aufsetzen möchten oder die verwendete Hardware keine Monitoranschluss hat (z.B. der früher genutze pascom SOHO Server).

