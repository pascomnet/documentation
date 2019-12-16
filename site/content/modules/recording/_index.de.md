---
title: Mitschnittsystem
description: Nehmen Sie Gespräche als Vertragswerkzeug oder zu Trainingszwecken auf.
weight: 30
---

{{< doctype "both"  >}}

{{< description >}}

## Übersicht

{{% notice warning %}}
Das Mitschneiden von Gesprächen kann rechtlich problematisch, in speziellen Fällen, sogar strafbar sein. Es müssen je nach Szenario bestimmte Rahmenbedingungen, Datenschutzrichtlinien und Hinweispflichten erfüllt werden. Bitte lassen Sie sich im Zweifel vor der Verwendung dieser Funktion durch einen Rechtsbeistand beraten.
{{% /notice %}}

Das Mitschnittsystem basiert auf einem in der pascom hinterlegten Regelwerk. Dieses Regelwerk veranlasst pascom dazu, ein bestimmtes Gespräch automatisch mitzuschneiden oder dem Benutzer einen manuellen Mitschnitt zu erlauben. 

![Illustration - pascom Mitschnitt System](concept.de.png?width=100% "pascom Mitschnitt System")

Egal ob Mitschnitte manuell oder automatisch erfolgen, diese werden auf der Festplatte der pascom abgelegt und können bei berechtigten Personen im pascom Client angezeigt werden. Optional können Mitschnitte per Regelwerk an beliebige E-Mail-Empfänger versendet oder per Skript auf beliebige Ziele kopiert werden.

## Konfiguration

### Regelwerk
Um das Mitschnittsystem zu aktivieren müssen Sie mindestens eine Regel anlegen, die entweder bestimmte Gespräche automatisch mitschneidet oder einem gewissen Nutzerkreis erlaubt manuell einen Mitschnitt anzustoßen. Gehen Sie hierzu in der pascom Weboberfläche in das Menü {{< ui-button "Erweitert" >}} > {{< ui-button "Mitschnitte" >}} und fügen dort durch Drücken der Schaltfläche {{< ui-button "+Hinzufügen" >}}  eine neue Regel ein:  

![Screenshot - Mitschnitt Regeln](rules.de.png?width=80% "Mitschnitt Regeln verwalten")  

|Parameter|Bedeutung|
|---------|---------|
|Bezeichnung|Bezeichnung der Regel|
|Regel aktiv|Hier kann die Regel aktiviert und deaktiviert werden|
|Wer darf aufnehmen?|**pascom nimmt automatisch auf** bewirkt, dass jedes Gespräch automatisch mitgeschnitten wird, welches von den unter **Was wird mitgeschnitten?** gewählten Rollenmitgliedern geführt wird. **Gesprächspartner dürfen manuell mitschneiden** bewirkt, dass die unter **Was wird mitgeschnitten?** gewählten Rollenmitglieder per pascom Client oder per Record Taste am Telefon Gespräche manuell mitschneiden dürfen.|
|Was wird aufgenommen?|	Das Aufnahmeziel ist rollenbasiert. Wählen Sie eine Rolle aus. Alle Mitglieder dieser Rolle, egal ob Benutzer oder ganze Teams, werden aufgenommen. Die Rolle braucht keinen speziellen Rollentyp sondern dient rein zur Gruppierung. Details zu Rollen finden Sie unter Konzept: Rollen.|
|Rufrichtung|	Nur eingehende, ausgehende oder Telefonate in beide Richtungen mitschneiden|
|Herkunft|	Nur interne, externe oder beide Gesprächsarten mitschneiden|
|Versandart	|Alle Mitschnitte werden standardmäßig auf der Festplatte gespeichert und können per pascom Client abgefragt werden. Zusätzlich kann man jeden Mitschnitt an eine beliebige E-Mail Adresse versehen oder eine Bash-Skript erstellen das z. B. den Mitschnitt auf einen externen Fileserver kopiert. Der Versand wir durch einen Cronjob geregelt der standardmäßig nur einmal täglich um 20 Uhr ausgeführt wird. Details siehe **Conjob für Mitschnittsystem** weiter unten.|

### Versandart Bash Skript
Wird die Versandart Bash Skript gewählt wird ein Bash-Editor eingeblendet in den man das gewünschte Skript direkt eingeben kann. Das Skript wird nach jedem Mitschnitt aufgerufen und es werden folgende Parameter übergeben, die dann in den Variablen **$1** und **$2** abgerufen werden können:

|Variable|Inhalt|Beispiel|
|--------|------|--------|
|$1|	/absoluter/pfad/zu/aufnahme.wav |/var/spool/asterisk/monitor/na_1392064129-3_1392064129-10_29_001.wav|
|$2|	/absoluter/pfad/zum/journal.json| Darin befinden sich Metainformationen wie z. B. Gesprächsteilnehmer, Dauer, usw. des Mitschnittes|	/var/spool/asterisk/monitor/n_1392064129-3_1392064129-10.json|

### Cronjob für Mitschnittsystem

Für den Versand der Mitschnitte per E-Mail oder Skript und das Bereinigen der Festplatte (siehe Festplattenspeicher verwalten) wird standardmäßig jeden Tag um 20 Uhr ein Cronjob ausgeführt. Alle Daten über den Versand werden zur Laufzeit im System gespeichert und dann durch den Cronjob batchmäßg abgearbeitet.

Dies gilt wirklich nur für den Versand der Mitschnitte per E-Mail oder Skript. Im pasocm Client werden die Mitschnitte sofort nach Fertigstellung der Aufnahme angezeigt.

Möchten Sie den Intervall des Cronjobs erhöhen, z. B. alle 15 Minuten die Mitschnitte per E-Mail versenden, können Sie dies unter {{< ui-button "Erweitert" >}} > {{< ui-button "Mitschnitte" >}} > {{< ui-button "Aktionen" >}} > {{< ui-button "Versand Automatisieren" >}}  bzw. {{< ui-button "Appliance" >}} > {{< ui-button "Cronjobs" >}} > {{< ui-button "Mitschnitte" >}} verarbeiten anpassen.


### Festplattenspeicher verwalten (nur Onsite)
Alle Mitschnitte, ob manuell oder automatisch, werden zentral auf der Festplatte der pascom gespeichert. Für eine Minute Mitschnitt wird auf der Festplatte ca. 1 Megabyte belegt. Wenn Sie beispielsweise das Supportteam aus Trainingszwecken permanent mitschneiden wollen und in dieser Abteilung 4 Personen ca. jeweils 3 Stunden am Tag telefonieren wächst der Festplattenbedarf pro Tag um 720 Megabyte an. Dimensionieren Sie also den verfügbaren Festplattenspeicher entsprechend.

Um das Volllaufen der Festplatte zu verhindern, werden alle Mitschnitte standardmäßig nur 90 Tage archiviert. Die Einstellung können Sie in der pascom Weboberfläche unter {{< ui-button "Appliance" >}} > {{< ui-button "Systemeinstellungen" >}} anpassen. In der Baumstruktur finden Sie unter `sys.monitor.configure.monitorcron` den Parameter **expiration**. Dieser ist auf 90 Tage gesetzt und kann beliebig angepasst werden.

### Mitschnitt per Variable steuern
Zusätzlich bietet pascom die Möglichkeit das Mitschnittsystem dynamisch per Dialplan Variablen ein- und auszuschalten bzw. bestehende Regeln zu übergeben.

Beispielsweise kann es der Fall sein, dass Sie Ihrem Anrufer ein IVR Menü anbieten wollen in dem er selbst entscheiden kann ob er mit einem Mitschnitt zur Qualitätssicherung einverstanden ist oder nicht.

Vom Dialplan aus kann man das Mitschnittsystem bei Bedarf durch die Variable `MDC_MON_MODE` beeinflussen:

#### Beim Rufaufbau **MDC_MON_MODE** setzen

|Variable|Beschreibung|
|--------|------------|
|MDC_MON_MODE|nicht definiert oder Wert=auto: Regelwerk greift, s.u. **DEFAULT**|
|MDC_MON_MODE=force|Dieser Anruf wird in **jedem** Fall aufgenommen (Regelwerk übergehen)|
|MDC_MON_MODE=deny|Dieser Anruf wird in **keinem** Fall aufgenommen(Regelwerk übergehen)|
|MDC_MON_MODE=manual|Regelwerk wird übersprungen, Manuelle Aufnahme wird ermöglicht|
|MDC_MON_MODE=caller|Nimmt nur den Anrufer auf|
|MDC_MON_MODE=callee|Nimmt nur den Gesprächsteilnehmer auf|
|MDC_MON_MODE=splited|Nimmt Anrufer und Gesprächsteilnehmer auf, jedoch jeweils in separaten Dateien |


Ein Beispielskript zum Abschalten des Recordings kann so aussehen:

    exten => s,1,Set(__MDC_MON_MODE=deny)
    exten => s,n,Return()

Dieses Skript kann dann in ein IVR Menü eingebunden werden und den Mitschnitt deaktivieren.

### Record Taste am Telefon konfigurieren
Manche Telefone haben eine eigene Record-Taste. Diese Taste belegt pascom automatisch mit der korrekten URL für die Steuerung des Mitschnittsystems. Bei Telefonen die keine extra Record-Taste besitzen, können Sie eine beliebige andere Taste umfunktionieren.

#### Zentrale Verteilung der Tasteneinstellung
Am einfachsten erledigen Sie das Zentral durch das Provisioning System und weisen dort einer Taste diesen Wert zu:

    url http://$httpip/mobydickcmd/provisioning/snom/snom-record.php?mac=$071ipp_mac&sipcallid=$call-id

#### Tasteneinstellung direkt individuell am Telefon
Alternativ können Sie auch die folgende URL direkt auf einer Telefon-Taste vom Typ "Aktions URL" eintragen, wobei Sie **PASCOM_SERVER_IP** mit der konkreten **IP-Adresse** des pascom-Servers ersetzen müssen:

    http://PASCOM_SERVER_IP/provisioning/0004132cd0c5/pui/monitor/record?callid=$call-id

Beispiel:

    http://192.168.100.1/mobydickcmd/provisioning/snom/snom-record.php?mac=$mac&sipcallid=$call-id

### Mitschnitte im pascom Client verwalten
Erlaubt eine Regel dem Benutzer das manuelle Mitschneiden ist während des Gespräches ein Aufnahmeknopf im pascom Client sichtbar um den Mitschnitt zu starten:  

![Screenshot - Mitschnitte im pascom Client](client_manual.de.png?width=100% "Mitschnitte im pascom Client")

Wurde ein Mitschnitt erstellt können Sie dies nachträglich am REC Kennzeichnung in Ihrem Journal einsehen:
Durch Klicken auf das **REC** Symbol werden Ihnen alle Mitschnitte zu diesem Telefonat angezeigt:  

![Screenshot - Journal im pascom Client](client_journal.de.png?width=50% "Journal im pascom Client")

Duch Klicken auf das Play Symbol können Sie den Mitschnitt direkt anhören und mit dem Download-Symbol herunterladen.  

![Screenshot - Mitschnitte wiedergeben](client_play.de.png?width=100% "Mitschnitte wiedergeben")


### Mitschnitte über die REST-Schnittstelle verwalten
Über die REST-Schnittstelle können Sie diverse Abfragen und Parameter zum Monitoring setzen sowie Gesprächsmitschnitte herunterladen.
Nachfolgend eine URL, die mit Ihren Parametern angepasst werden muss. 

- https://$ip/$instance/services/monitor/r_$recordID/$ruleID/1/wav -> Anrufer Gesprächsdatei
- https://$ip/$instance/services/monitor/t_$recordID/$ruleID/1/wav -> Teilnehmer Gesprächsdatei

Über die Interaktive REST Dokumentation der pascom Anlage, können Sie Abfragen testen und entsprechend anpassen. 

![Screenshot - Mitschnitte über REST](REST.png?width=100% "Mitschnitte per REST")