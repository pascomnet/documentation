---
title: M-net SIP-Trunk
description: So konfigurieren und verwalten Sie Ihren M-net SIP-Trunk richtig
weight: 30
---

{{< doctype "both"  >}}

{{< description >}}

## Übersicht

Informationen über Leistungsmerkmale und Tarife finden Sie [hier](https://www.m-net.de/sip-trunk/).

## Übersicht

Nach dem Erwerb und der Freischaltung Ihres M-net SIP-Trunks erhalten Sie einen Brief mit Ihren Account-Daten. Dieses Dokument enthält wichtige Informationen zu Ihrem Telefon-Anschluss:

![Ihre M-net-Zugangsdaten](mnet-account.de.png?width=60%)

**Welche Daten können Sie daraus entnehmen?**

+ *Ortsvorwahl*: 089
+ *Stammnummer*: XXXXXX (aus Datenschutzgründen hier mit XXXXXX dargestellt)
+ *Rufnummernblock*: 0-29, daraus ergeben sich 2-stellige Durchwahlen (Nebenstellen)
+ *Registrierungs-Daten für Ihr Amt*, bestehend aus SIP-Benutzername und SIP-Passwort

## Einrichtung

Fügen Sie ein neues M-net-Amt ein unter {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}} > {{< ui-button "Hinzufügen" >}}. Sie gelangen nun zur Ämter-Datenbank. Über den Filter können Sie direkt nach *M-net* suchen. Wählen Sie die Vorlage *M-net SIP-Trunk* und befüllen Sie die Vorlage mit den erhaltenen Account-Daten.

|Variable|Beschreibung|
|---|---|
|**Bezeichnung**|Geben Sie Ihrem Amt einen Namen, dieser taucht dann in der Ämterliste auf.|
|**Benutzername**|Entnehmen Sie den SIP-Benutzernamen aus Ihren Zugangsdaten.|
|**Passwort**|Tragen Sie hier das dazu gehörige SIP-Passwort ein.|
|**Ortskennzahl**|Tragen Sie die Ortskennzahl bzw. Ortsvorwahl ohne führende 0 ein. In unserem Beispiel *89*.|
|**Stammnummer**|Basisnummer des Telefonanschlusses ohne Nebenstellen. In unserem Beispiel als *XXXXXXXX* dargestellt.|
|**Präfix eing. Nummer**|Ist eine beliebige Ziffer, die bei eingehenden Telefonanrufen über dieses Amt vorangestellt wird. Wenn Sie hier eine 0 eingeben erscheint beispielsweise in der Anruferliste von IP-Telefonen dann nicht die 0172123123 sondern die 00172123123. Dadurch können Sie direkt aus der Anruferliste wieder über das selbe Amt zurückrufen.|
|**Anzahl der Durchwahlstellen**|Anzahl der Stellen der Benutzer-Durchwahlen. (NICHT die Anzahl der Nummern im Rufnummernblock!)|
|**Durchwahl Zentrale**|Geben Sie hier an, auf welche interne Durchwahl die erste Nummer Ihres Rufnummernblocks (meistens die 0) abgeworfen werden soll.|
<!--FIXME satz zu zentrale verwirrend  -->

Nach dem {{< ui-button "Speichern" >}} wird das Amt angelegt. Dabei werden automatisch Rufregeln angelegt. Diese können Sie gemäß Ihren Anforderungen und Wünschen konfigurieren. Lesen Sie dazu den Artikel über [Rufregeln]({{< ref "/trunks/rules">}}).

## Änderungen im Amt vornehmen

### Passwort ändern

Klicken Sie auf {{< ui-button "Gateways" >}} > {{< ui-button "Ämter" >}}, wählen Sie Ihr Amt aus und klicken Sie auf {{< ui-button "Bearbeiten" >}}. Im Tab {{< ui-button "Account" >}} in der Spalte {{< ui-button "Passwort" >}} können Sie mit einem Doppelklick auf das gewünschte Feld das Passwort ändern. Bestätigen Sie zunächst die Änderung mit {{< ui-button "Ok" >}} und wenden Sie sie mit {{< ui-button "Speichern" >}} und anschließendem Anwenden der Telefonie-Konfiguration an.

### Einen weiteren M-net-SIP-Account hinzufügen

Möchten Sie Ihren M-net SIP-Trunk-Anschluss um einen weiteren Account erweitern, fügen Sie diesen unter dem aktuellen Amt im Tab {{< ui-button "Accounts" >}} ein. Da die grundsätzlichen Einstellungen die gleichen sind, können Sie den schon angelegten Account verwenden. Markieren Sie diesen mit einem Klick und klicken Sie anschließend auf den Button {{< ui-button "Duplizieren" >}}.
In der neuen Account-Zeile können Sie nun **Benutzername** und das **Passwort** (und bei Bedarf weitere Felder) anpassen.

Nun müssen [eingehende und ausgehende Rufregeln]({{< ref "/trunks/rules">}}) angepasst werden. Bei den ausgehenden Regeln müssen Sie nun auswählen welcher Account pro Regel verwendet werden soll. Scrollen Sie hierfür nach rechts und wählen in der Spalte {{< ui-button "Account" >}} den entsprechenden aus.
