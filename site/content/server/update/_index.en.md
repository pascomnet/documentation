---
title: pascom 18 updaten
description: Schritte für ein Update der pascom 18
weight: 80
---

{{< doctype "self" >}}

{{< description >}}

{{% notice tip %}}
Dieser Artikel betrifft nur pascom "on Premise" Kunden. pascom "on Site" bzw. Cloud-Kunden erhalten immer automatisch die neueste pascom 18 Version.
{{% /notice %}}

Derzeit ist es noch nicht möglich die pascom 18 automatisch mit einem Knopfdruck upzudaten.
Wenn Sie bereits eine pascom 18 im Einsatz haben, sind für ein Update folgende Schritte notwendig. 

## pascom ISO downloaden

Laden Sie sich die pascom Server [ISO-Datei](https://www.pascom.net/de/downloads/) der aktuellsten Version von der Download-Seite unserer Homepage herunter.

## pascom Update durchführen

Loggen Sie sich auf der **Server Management** Oberfläche Ihrer Telefonanlage ein.

Klicken Sie unter dem Menüpunkt {{< ui-button "System" >}} auf den Button {{< ui-button "Update hochladen" >}} und laden Sie dort die zuvor heruntergeladene pascom ISO-Datei hoch.

Sobald der Upload erfolgreich durchgeführt wurde, wird Ihnen der Host mit der neuen Server Version unter {{< ui-button "System" >}} > {{< ui-button "Firmwares" >}} aufgelistet.

## pascom neustarten

Die Installation des Updates wird erst bei einem Neustart der Telefonanlage durchgeführt.

Klicken Sie dazu auf {{< ui-button "System" >}} > {{< ui-button "Neustart" >}}

{{% notice warning %}}
Während dem Neustart bzw. Installations-Vorgang der Telefonanlage, ist die Telefonie nicht möglich und alle laufenden Gespräche werden beendet. Führen Sie den Neustart daher nie im laufenden Betrieb aus.
{{% /notice %}}

{{% notice note %}}
Sollte beim Update ein Problem auftreten ist es jederzeit möglich, die Telefonanlage mit der vorherigen Version neuzustarten. Nehmen Sie dazu bitte Kontakt mit unserem Support-Team auf.
{{% /notice %}}