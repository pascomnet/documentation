---
title: Durchwahlen vergeben
keywords:
description:
url: /howto/durchwahlen/
prev: /howto/
next: /howto/sprachen/
weight: 120
toc: false
draft: false
---

## Konzept

Eine Durchwahl ist der Teil einer Rufnummer mit dem man einen Benutzer oder ein Team direkt erreichen kann. Durchwahlen werden in der pascom auch für Faxe oder Kurzwahlnummern (wenn man z. B. eine externe Mobilrufnummer über eine Durchwahl anruft) verwendet, oder als Durchwahl-Schalter um bestimmt Aktionen zu aktivieren oder zu deaktivieren.

## Extentionpool

Haben Sie sich über Durchwahlen, die Sie vergeben möchten, noch keine Gedanken gemacht, können Sie sich aus dem Extensionpool bedienen.
In den Systemeinstellungen sind Default-Startwerte definiert. Diese Startwerte können auch angepasst werden. Durchwahlen aus dem Extensionpool werden inkrementell ab dem Startwert vergeben. Wurden schon Durchwahlen manuell vergeben, werden diese übersprungen.

In den Systemeinstellungen können Sie die Startwerte anpassen. Suchen Sie in der Web-UI über das Suchfeld nach *extensionpool*:

|Parameter|Beschreibung|
|---|---|
|011account|Durchwahlen für Benutzer|
|029team|Durchwahlen für Teams|
|020faxdevice|Durchwahlen für virtuelle Faxe (bei Benutzern und Teams)|
|042speeddial|Durchwahlen für Kurzwahlnummern|
|009extension|Durchwahlen für sonstiges (z. B. Durchwahlschalter, Skripte)|

Die Defaukt-Startwerte in den Systemeinstellungen sind 3-stellig, auch wenn Sie im Amt angeben, dass Sie 2-stellige
Durchwahlen benutzen. Bitte passen Sie diese auf Ihre Rufummern an.

## Verteilung der Durchwahlen

Ob zwei, drei oder vierstellige Durchwahlen hängt natürlich von der Benutzeranzahl und dem vom Provider erhaltenen Rufnummernblock ab.
Generell kann man sagen das die Anzahl der Durchwahlstellen sich bei bedarf leichter erhöhen als verkleinern lässt.
Alles was von intern und extern direkt unter der gleichen Rufnummer/Durchwahl erreichbar sein soll, muss natürlich im Rufnummernblock des Providers angesiedelt sein.

{{% notice info %}}
**Bitte beachten Sie folgendes bei der Vergabe von Durchwahlen:**<br>
- Die Durchwahl 0 darf intern nicht vergeben werden.<br>
- Interne Durchwahlen dürfen nicht mit 0 anfangen.<br>
- Die Durchwahlen 110 und 112 dürfen nicht vergeben werden, da es sich hierbei um Notrufnummern handelt.
{{% /notice %}}

Bei einigen Durchwahlen macht es Sinn, nicht von extern erreichbar zu sein, z. B. Durchwahlschalter, Türsprechanlagen, Konferenzräume, die nur intern von den Mitarbeitern verwendet werden. Bei z. B. 3-stelligen Rufnummernblöcken sollte diese Durchwahlen mehr als drei Stellen haben.

### Beispiel

Die Firma Chaoscomputing hat drei Abteilungen: Zentrale, Vertrieb und Technik.

Ortsvorwahl + Stammnummer: 099112345.

Es stehen der Rufnummerblock von -0 bis -999 zur Verfügung.

Es werden 3-stellige Duchwahlen für Benutzer verwendet und jeder Benutzer hat ein virtuelles Faxgerät mit eingener intern erreichbaren Fax-Durchwahl. Nach extern wird die Firmenfaxnummer 999 signalisert.

**Zentrale:**

* Die Zentrale, die nach außen hin meistens die -0 wird intern als eine Warteschlange mit der Durchwahl 100 angelegt.
* An der Zentrale kann das virtuelle Firmenfax 999 angehängt werden.
* Mitarbeiter in der Zentrale erhalten die Durchwahlen 101 - 199.

**Vertrieb:**

* Die Durchwahl der Vertriebs-Warteschlange ist die 200.
* Mitarbeiter in des Vertriebs erhalten die Durchwahlen 201 - 299.

**Technik:**

* Die Durchwahl der Technik-Warteschlange ist die 300.
* Mitarbeiter in der Technik erhalten die Durchwahlen 301 - 399.


{{% notice note %}}
Durch die blockweise Verteilung der Duchwahlen, können durch ausgehende Regeln im [Amt](/aemter/aemter-konfigurieren/#rufregeln) die eigenen Durchwahlen hinter Abteilungsservicenummern maskiert werden, d. h. der Angerufenen sieht nicht die eigenen Durchwahl, sondern die Durchwahl der Abteilung.
<br><br>**Beispiel:** Alle Benutzer der Zentrale signalieren nach extern die -0<br>
*Quelle: _1XX.*<br>
*CIDNummer: 0991123450*
{{% /notice %}}

**Virtuelle Benutzerfaxe:**

Jeder Benutzer hat zum Versenden eine eigene virtuelle Faxnummer. Diese setzt sich zusammen, indem man vor die Benutzerdurchwahl eine 9 setzt.

Beispiel: 9123 für das Fax des Benutzers mit der Durchwahl 123

Durch eine einzige ausgehende Regeln im [Amt](/aemter/aemter-konfigurieren/#rufregeln) kann nun eingestellt werden, dass jeder bei einem ausgehenden Fax die Firmenfaxnummer signalisiert:

*Quelle: _9XXX.*<br>
*CIDNummer: 099112345999*
