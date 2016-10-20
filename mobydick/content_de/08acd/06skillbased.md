---
title: Skill Based Routing
keywords:
    - Skill Based Routing
    - Fähigkeiten
    - Warteschlgen
    - Anrufverteilung
description: Skill Based Routing - dient der Verteilung von Anrufern anhand Benutzern zugewiesenen Fähigkeiten
url: /anrufverteilung/skillbased/
prev: /anrufverteilung/moh-prompts/
weight: 76
toc: true
---


## Konzept
Verteilung von Anrufern anhand Benutzern zugewiesenen Fähigkeiten

Funktionen:

* Fähigkeiten von Agenten in einem Team
* Warteschlangen die Skill Based Routing unterstützen
* Inline Skripte (Einzeilige Skripte, die in einer Aktion vorher/nachher durch Hinzufügen integriert werden können)
* Generische Labels (Labels, die für einen Anrufer gesetzt werden, z. B. als Information für den Agenten, Priorisierung eines Anrufers...)
* Anrufverteiler (prüft Bedingungen und löst Aktionen aus)

## Beispiel 1

### Übersicht

Der Anrufer muss über ein IVR-Menü die Sprache auswählen, anschließend gelangt er zum Team Support. Es klingelt nur bei den Agenten, die den Support in der ausgewählte Sprache anbieten.
![Illustration - Skill Based Routing](../../images/skill_based_routing_beispiel1.png "Skill Based Routing Beispiel 1")

### Konfiguration

1. Als erstes müssen Fähigkeiten für die Sprachen definieren werden: `Anruferverteilung -> Anruf Labels -> Hinzufügen -> Fähigkeiten`.
![Screenshot - Skill Based Routing Labels](../../images/skill_based_routing_labels.png "Skill Based Routing Labels")

2. Den Benutzern werden nun die Fähigkeiten zuweisen: `Benutzer -> Benutzerliste -> Benutzer auswählen -> Bearbeiten` -> **im Tab Fähigkeiten**.
![Screenshot - Fähigkeiten zuweisen](../../images/skill_based_routing_user_skills.png "Fähigkeiten zuweisen")

3. Damit in einem Team Fähigkeiten berücksichtigt werden,  muss beim Anlegen des Teams das schon vorhandene Skript "Skill based routing" ausgewählt werden: `Benutzer -> Teams -> Warteschlange auswählen -> Bearbeiten` -> im Tab **Basisdaten**, das vierte Auswahlfeld **"Routing Skript"**.
{{% notice note%}}
Die Verwendung von Fähigkeiten hat den Vorteil, dass z. B. nur eine Warteschlange angelegt werden muss, obwohl man Anrufer hat, die verschiedene Sprachen sprechen. Es werden nur die Agenten angeklingelt, die die benötigte Fähigkeit haben.
{{% /notice%}}

4. Für die Sprachauswahl erstellen wir ein IVR-Menü: `Anrufverteilung -> IVR -> Hinzufügen`. Ist das **IVR** angelegt, müssen noch die Einträge angelegt werden: das gerade angelegte IVR markieren und auf **Einträge** klicken.![Screenshot - Skill Based Routing IVR Menü](../../images/skill_based_routing_ivr.png "Skill Based Routing IVR Menü")
Nun müssen für die IVR-Einträge Aktionen konfiguriert werden. Als Beispiel wird hier der Eintrag "deutsch" beschrieben:![Screenshot - IVR-Einträge Aktionen konfigurieren](../../images/skill_based_routing_ivr_2.png "IVR-Einträge Aktionen konfigurieren")
Zuerst wird das Label gesetzt: `Hinzufügen -> Label setzen ->` als Name die Fähigkeit "deutsch" auswählen -> als Ausdruck muss hier das mindeste Level stehen das der Agent (Benutzer) bei seiner Fähigkeit zugewiesen bekommen hat.
Hier kann auch die Channel-Sprache gesetzt werden, damit der Anrufer ab hier alle automatischen Ansagen in seiner ausgewählten Sprache hört.
Anschließend wird auf die Warteschlange (Support) abgeworfen.
{{% notice note%}}

Wird für einen Anrufer ein Label gesetzt, gilt das Label bis zur Beendigung des Anrufs.
{{% /notice%}}
{{% notice note%}}
Labels werden einem Queue-Agenten als Information im Client angezeigt. Es können beliebig viele Labels pro Anrufer gesetzt werden.
{{% /notice%}}


## Beispiel 2
### Übersicht

Nun wird das vorherige Beispiel erweitert. Nach der Sprachauswahl wird die Kundennummer abgefragt um zwischen VIP- und Nicht-VIP-Kunden zu unterscheiden. VIP-Kunden werden gleich zum Team Support weiterlgeleitet, bei Nicht-VIP-Kunden werden Geschäftszeiten geprüft.
 ![Illustration - Skill Based Routing](../../images/skill_based_routing_beispiel2.png "Skill Based Routing Beispiel 2")

### Konfiguration

1. Nach der Sprachauswahl muss der Anrufer seine Kundennummer eingeben. Das wird mit einem **Generichen Label** realsiert: unter `Anruferverteilung -> Anruf Labels -> Hinzufügen -> Generisches Label`.
![Screenshot - Generiches Label](../../images/skill_based_routing_label_generic.png "Generiches Label")
Das Generische Label hat eine **Kanalvariable** (in diesem Fall MDC_LABEL-9), die wir uns für die weitere Konfiguration merken müssen. Den Variablennamen erhalten wir durch markieren des Labels in der Übersicht und Klick auf Bearbeiten:
![Screenshot - Variablennamen](../../images/skill_based_routing_genericlabel.png "Variablennamen")


2. Zur Unterscheidung von VIP- und Nicht-VIP-Kunden verwenden wir ein Generisches Label mit Aktionsbedingung: Anruferverteilung -> Anruf Labels -> Hinzufügen -> Generisches Label und Aktionsbedingung anlegen auf JA setzten.
![Screenshot - Aktionsbedingung](../../images/skill_based_routing_label_condition.png "Aktionsbedingung")


3. Bei den IVR-Einträgen wird nun nicht mehr gleich auf die Warteschlage Support abgeworfen. Es muss vorher noch die Kundennummer abgefragt werden. Der Anrufverteiler übernimmt diese Funktion.
![Screenshot - IVR mit Skill based Routing](../../images/skill_based_routing_ivr_3.png "IVR")


4. Der Anrufverteiler wird allgemein verwendet um Bedingungen zu prüfen und Aktionen auszulösen.
 Als erstes wird mit einem Inline Skript die Kundennummer abgefragt. Ein Inline Skript erlaubt es einzeilige Asterisk-Skripte gleich in Aktionen einzubinden.
 Mit Hilfe z. B. eines Skripts kann die eingegeben Kundennummer überprüft werden, es setzt somit die Labels VIP-Kunde und Nicht-VIP-Kunde. Ein Anrufer mit dem Label und der daraus entstehende Aktionsbedingung VIP-Kunde würde dann gleich zum Support weitergeleitet werden. Für Anrufer mit dem Label Nicht-VIP-Kunde müssen noch Geschäftszeiten geprüft werden.
![Screenshot - Aktionsbedingung](../../images/skill_based_routing_call_router_2.png "Aktionsbedingung")
Die Geschäftszeiten-Prüfung wird ebenfalls mit einem Anrufverteiler realisiert:
![Screenshot - Geschäftszeiten-Prüfung](../../images/skill_based_router_call_router.png "Geschäftszeiten-Prüfung")
