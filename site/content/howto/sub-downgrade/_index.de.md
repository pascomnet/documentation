---
title: Abonnement Downgraden
description: Diese Schritte sind notwendig um Ihr Abonnement Downzugraden
weight: 70
---

{{< doctype "both" >}}

{{< description >}}

## Allgemeine Hinweise

Sie können Ihr Abonnement jederzeit downgraden.

Da pascom Abonnements jährlich im Voraus berechnet und pascom im Fall einer Kündigung keine Gutschrift über die Restlaufzeit erteilt, bietet es sich an, das Downgrade am **Ende eines Abonnementsjahres** durchzuführen.

pascom verzichtet auf jegliche Kündigungsfristen. Daher ist es möglich den Downgrade auch an einem Tag **kurz vor Ende des Abonnementjahres** durchzuführen.

## Cloud Abonnement Downgraden

{{< num 1 "Backup erstellen" >}}

Loggen Sie sich in Ihre Telefonanlage ein und erstellen unter {{< ui-button "Appliance" >}} > {{< ui-button "Datenbanksicherung" >}} eine Datensicherung.

Nach erfolgreich durchgeführter Datensicherung erscheint ein Downloadlink in der Datenbanksicherungsmaske.

**Laden Sie nun das Backup auf Ihren Computer herunter**.

{{< notice warning >}}
Fahren Sie **keinesfalls OHNE BACKUP** fort. Ihre Daten werden beim Kündigen des Abonnements unwiderruflich gelöscht!
{{< /notice >}}

{{< num 2 "Aktuelles Abonnement kündigen" >}}

Loggen Sie sich in https://my.pascom.net ein und öffnen Sie das entsprechende Abonnement unter {{< ui-button "Abonnements" >}} durch klicken auf die Schaltfläche {{< ui-button "Details" >}}

**Notieren Sie sich Ihren Instanznamen! (Name nach der Nummer in eckigen Klammern)**

Klicken Sie im Bereich Details auf {{< ui-button "Kündigen" >}}.

Wählen Sie die Option {{< ui-button "Jetzt Kündigen" >}}. Nur so können Sie den Namen Ihrer Instanz sofort für ein neues Abonnement verwenden.

{{< num 3 "Neues Abonnement erstellen" >}}

Erstellen Sie nun in https://my.pascom.net ein neues Cloud-Abonnement Ihrer Wahl und vergeben hierbei den zuvor notierten Instanznamen.

{{< num 4 "Backup einspielen" >}}

Folgen Sie dem **Setup-Assistenten** bis Sie die Möglichkeit haben eine **Datensicherung zur Einrichtung verwenden**. Spielen Sie das zuvor erstellte Backup ein.

{{< num 5 "(Optional) Endgeräte neu starten" >}}

Ihre Endgeräte (z. B. Tischtelefone) werden sich nach einigen Minuten automatisch wieder an Ihrer Instanz registrieren. Um diesen Vorgang zu **beschleunigen** können Sie auch alle Endgeräte neu starten, indem Sie diese von **Stromnetz trennen und wieder anschließen**.

## Onsite Abonnement Downgraden

{{< num 1 "Aktuelles Abonnement kündigen" >}}

Loggen Sie sich in https://my.pascom.net ein und öffnen Sie das entsprechende Abonnement unter {{< ui-button "Abonnements" >}} durch klicken auf die Schaltfläche {{< ui-button "Details" >}}

**Notieren Sie sich Ihren Instanznamen! (Name nach der Nummer in eckigen Klammern)**

Klicken Sie im Bereich Details auf {{< ui-button "Kündigen" >}}.

Wählen Sie die Option {{< ui-button "Jetzt Kündigen" >}}.

{{< num 2 "Neues Abonnement erstellen" >}}

Erstellen Sie nun in https://my.pascom.net ein neues Onsite-Abonnement Ihrer Wahl und vergeben hierbei den zuvor notierten Instanznamen.

{{< num 3 "Anlage mit neuem Abonnement pairen" >}}

Loggen Sie sich auf der Management-Oberfläche Ihres pascom Servers ein (z.B. https://192.168.0.1:8443) und pairen unter {{< ui-button "System" >}} > {{< ui-button "Abonnementdetails" >}} das neue Abonnement mit diesem Server.
