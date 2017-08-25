---
title: HFO Telecom
weight: 12
toc: true
prev: /sip-provider/database
url:  /sip-provider/hfo-telecom/

---

## Übersicht

Informationen über Leistungsmerkale und Tarife finden Sie hier: [HFO Telecom](http://www.hfo-telecom.de/).

## Ihr Account

Nach dem Erwerb und der Freischaltung Ihres HFO SIP-Trunks erhalten Sie eine Bestätigung mit Ihren Accountdaten:

![Ihr HFO Telecom Account](/hfo-account.png)

**Welche Daten können Sie daraus entnehmen?**

+ *Ortsvorwahl*: 0991
+ *Stammnummer*: 9881499
+ *Rufnummernblock*: 0-99, daraus ergeben sich 2-stellige Durchwahlen (Nebenstellen)
+ *Die Registrierungs-Daten für Ihr Amt*, bestehend aus Benutzername und Passwort (aus Datenschutzgründen hier mit Sternchen dargestellt).

## Einrichtung

Fügen Sie ein neues HFO-Amt ein unter `Gateways` > `Ämter` > `Hinzufügen`. Sie gelangen nun zur Ämter-Datenbank. Über den Filter können Sie direkt nach *HFO* suchen und die Vorlage anschließend auswählen. Befüllen Sie die Vorlage mit den erhaltenen Account-Daten.

|Variable|Beschreibung|
|---|---|
|**Bezeichnung**|Geben Sie Ihrem Amt einen Namen, dieser taucht dann in der Ämterliste auf.|
|**Benutzername**|Entnehmen Sie den Benutzernamen aus Ihren Zugangsdaten.|
|**Passwort**|Tragen Sie hier das dazu gehörige Passwort ein.|
|**Ortskennzahl**|Tragen Sie die Ortskennzahl bzw. Ortsvorwahl ohne führende 0 ein. In unserem Beispiel *991*.|
|**Stammnummer**|Basisnummer des Telefonanschlusses ohne Nebenstellen. In unserem Beispiel *9881499*.|
|**Präfix eing. Nummer**|Ist eine beliebige Ziffer, die bei eingehenden Telefonanrufen über dieses Amt vorangestellt wird. Wenn Sie hier eine 0 eingeben erscheint beispielsweise in der Anruferliste von IP-Telefonen dann nicht die 0172123123 sondern die 00172123123. Dadurch können Sie direkt aus der Anruferliste wieder über das selbe Amt zurückrufen.|
|**Anzahl der Durchwahlstellen**|Anzahl der Stellen der Benutzer-Durchwahlen. (NICHT die Anzahl der Nummern im Rufnummernblock!)|
|**Durchwahl Zentrale**|Geben Sie hier an, auf welche interne Durchwahl die erste Nummer Ihres Rufnummernblocks (meistens die 0) abgeworfen werden soll.|

Nach dem `Speichern` wird das Amt angelegt. Dabei werden automatisch Rufregeln angelegt. Diese können Sie gemäß Ihren Anforderungen und Wünschen konfigurieren. Lesen Sie dazu den Artikel über [Rufregeln](../../aemter/aemter-konfigurieren/#rufregeln).

## Änderungen im Amt vornehmen

### Passwort ändern

Klicken Sie auf `Gateways` > `Ämter`, wählen Sie Ihr Amt zum `Bearbeiten`. Im Tab `Account` in der Spalte `Passwort` können Sie mit einem Doppelklick auf das gewünschte Feld das Passwort ändern. Bestätigen Sie zunächst die Änderung mit `Ok` und wenden Sie sie mit `Speichern` und anschließendem Anwenden der Telefonie-Konfiguration an.

### Einen weiteren HFO-Account hinzufügen

Möchten Sie Ihren HFO-Anschluss um einen weiteren Account erweitern, fügen Sie diesen unter dem aktuellen Amt im Tab `Accounts` ein. Da die grundsätzlichen Einstellungen die gleichen sind, können Sie den schon angelegten Account verwenden. Markieren Sie diesen mit einem Klick und klicken Sie anschließend auf den Button `Duplizieren`.
In der neuen Account-Zeile können Sie nun **Benutzername** und **Passwort** und bei Bedarf weitere Felder anpassen.

Nun müssen [eingehende und ausgehende Rufregeln](../../aemter/aemter-konfigurieren/#rufregeln) angepasst werden. Bei den ausgehenden Regeln müssen Sie nun auswählen welcher Account pro Regel verwendet werden soll. Scrollen Sie hierfür nach rechts und wählen in der Spalte `Account` den entsprechenden aus.
