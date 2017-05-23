---
title: Mitschnittsystem
keywords:
    - Mitschnitt
    - Mitschnitt eines Gespräches
description: Nehmen Sie Gespräche als Vertragswerkzeug oder zu Trainingszwecken auf.
url: /module/mitschnitt/
prev: /module/fax-server/
next: /module/konferenzsystem/
weight: 92
toc: true
---


## Übersicht

{{% notice warning %}}
Das Mitschneiden von Gesprächen kann rechtlich problematisch, in speziellen Fällen sogar strafbar sein. Es müssen je nach Szenario bestimmte Rahmenbedingungen, Datenschutzrichtlinien und Hinweispflichten erfüllt werden. Bitte lassen Sie sich im Zweifel vor der Verwendung dieser Funktion durch einen Rechtsbeistand beraten.
{{% /notice %}}

Das Mitschnitt System basiert auf einem in der mobydick hinterlegtem Regelwerk. Dieses Regelwerk veranlasst mobydick entweder dazu ein bestimmtes Gespräch automatisch mitzuschneiden oder dem Benutzer einen manuellen Mitschnitt zu erlauben. Ist der Benutzer durch das Regelwerk berechtig einen manuellen Mitschnitt zu veranlassen wird ihm sowohl im mobydick Client als auch auf IP-Telefonen, welche diese Funktion unterstützen, ein Aufnahme-Symbol zum Starten und Stoppen des Mitschnittes angezeigt.

![Illustration - mobydick Mitschnitt System](../../images/mitschnitt_konzept.png?width=100% "mobydick Mitschnitt System")


Egal ob sie manuell oder automatisch erfolgen, die Mitschnitte werden auf der Festplatte der mobydick abgelegt und können bei berechtigten Personen im mobydick Client angezeigt werden. Optional können Mitschnitte per Regelwerk an beliebige E-Mail-Empfänger versendet oder per Skript auf beliebige Ziele kopiert werden.

## Konfiguration

### Regelwerk
Um das Mitschnitt System zu aktivieren müssen Sie mindestens eine Regel anlegen die entweder bestimmte Gespräche automatisch mitschneidet oder einem gewissen Nutzerkreis erlaubt manuell einen Mitschnitt anzustoßen. Gegen Sie hierzu in der mobydick Weboberfläche in das Menü `Erweitert > Mitschnitte` und fügen dort durch Drücken der Schaltfläche `+Hinzufügen`  eine neue Regel ein:
![Screenshot - Mitschnitt Regeln](../../images/mitschnitt_regeln.png?width=100% "Mitschnitt Regeln verwalten")

|Parameter|Bedeutung|
|---------|---------|
|Bezeichnung|Bezeichnung der Regel|
|Regel aktiv|Hier kann die Regel aktiviert und deaktiviert werden|
|Wer darf aufnehmen?|**mobydick nimmt automatisch auf** bewirkt, dass mobydick jedes Gespräch automatisch mitschneidet das von unter **Was wird mitgeschnitten?** gewählten Rollenmitgliedern geführt wird. **Gesprächspartner dürfen manuell mitschneiden bewirkt,** dass die unter **Was wird mitgeschnitten?** gewählten Rollenmitglieder per mobydick Client oder per Record Taste am Telefon Gespräche manuell mitschneiden dürfen.|
|Was wird aufgenommen?|	Das Aufnahmeziel ist rollenbasiert. Wählen Sie eine Rolle aus. Alle Mitglieder dieser Rolle, egal ob Benutzer oder ganze Teams, werden aufgenommen. Die Rolle braucht keinen speziellen Rollentyp sondern dient rein zur Gruppierung. Details zu Rollen finden Sie unter Konzept: Rollen.|
|Rufrichtung|	Nur eingehende, ausgehende oder Telefonate in beide Richtungen mitschneiden|
|Herkunft|	Nur interne, externe oder beide Gesprächsarten mitschneiden|
|Versandart	|Alle Mitschnitte werden standardmäßig auf der Festplatte gespeichert und können per mobydick Client abgefragt werden. Zusätzlich kann man jeden Mitschnitt an eine beliebige E-Mail Adresse versehen oder eine Bash-Skript erstellen das z.B. den Mitschnitt auf einen externen Fileserver kopiert. Der Versand wir durch einen Cronjob geregelt der standardmäßig nur einmal täglich um 20 Uhr ausgeführt wird. Details siehe **Conjob für Mitschnittsystem** weiter unten.|

### Versandart Bash Skript
Wird die Versandart Bash Skript gewählt wird ein Bash-Editor eingeblendet in man das gewünschte Skript direkt eingeben kann. Das Skript wird nach jedem Mitschnitt aufgerufen und es werden folgende Parameter übergeben die dann in den Variablen **$1** und **$2** abgerufen werden können:

|Variable|Inhalt|Beschreibung|Beispiel|
|--------|------|------------|--------|
|$1|	/absoluter/pfad/zu/aufnahme.wav |	Der Dateiname incl. Pfad zum eben erzeugten Mitschnitt|	/var/spool/asterisk/monitor/na_1392064129-3_1392064129-10_29_001.wav|
|$2|	/absoluter/pfad/zum/journal.json|	Der Dateiname incl. Pfad zur json Datei für diesen Mitschnitt.| Darin befinden sich Metainformationen wie z.B. Gesprächsteilnehmer, Dauer, usw. des Mitschnittes|	/var/spool/asterisk/monitor/n_1392064129-3_1392064129-10.json|

### Cronjob für Mitschnittsystem

Für den Versand der Mitschnitte per E-Mail oder Skript und das Bereinigen der Festplatte (siehe Festplattenspeicher verwalten) wird standardmäßig jeden Tag um 20 Uhr ein Cronjob ausgeführt. Alle Daten über den Versand werden zur Laufzeit im System gespeichert und dann während des Laufes des Cronjobs batchmäßg abgearbeitet.

Dies gilt wirklich nur für den Versand der Mitschnitte per E-Mail oder Skript. Im mobydick Desktop Client werden die Mitschnitte sofort nach Fertigstellung der Aufnahme angezeigt.

Möchten Sie den Intervall des Cronjobs erhöhen, z.B. alle 15 Minuten die Mitschnitte per E-Mail versenden, können Sie dies unter `Erweitert > Mitschnitte > Aktionen > Versand Automatisieren`  bzw. `Appliance > Cronjobs > Mitschnitte` verarbeiten anpassen.


### Festplattenspeicher verwalten
Alle Mitschnitte, ob manuell oder automatisch, werden in jedem Fall zentral auf der Festplatte der mobydick gespeichert. Für eine Minute Mitschnitt wird auf der Festplatte ca. 1 Megabyte belegt. Wenn Sie beispielsweise das Supportteam aus Trainingszwecken permanent mitschneiden wollen und in dieser Abteilung 4 Personen ca. jeweils 3 Stunden am Tag telefonieren wächst der Festplattenbedarf pro Tag um 720 Megabyte an. Dimensionieren Sie also den verfügbaren Festplattenspeicher entsprechend.

Um das Überlaufen der Festplatte zu verhindern heben wir alle Mitschnitte standardmäßig nur 90 Tage auf. Die Einstellung können Sie in der mobydick Weboberfläche unter `Appliance > Systemeinstellungen` anpassen. In der Baumstruktur finden Sie unter **sys.monitor.configure.monitorcron** den Parameter expiration. Dieser ist auf 90 Tage gesetzt und kann beliebig angepasst werden.

### Mitschnitt per Variable steuern
Zusätzlich bietet mobydick die Möglichkeit das Mitschnittsystem dynamisch per Dialplan Variablen ein- und auszuschalten bzw. bestehende Regeln zu übergeben.

Beispielsweise kann es der Fall sein, dass Sie Ihrem Anrufer ein IVR Menü anbieten wollen in dem er selbst entscheiden kann ob er mit einem Mitschnitt zur Qualitätssicherung einverstanden ist oder nicht.

Vom Dialplan aus kann man das Mitschnittsystem bei Bedarf durch die Variable **MDC_MON_MODE** beeinflussen:

#### Beim Rufaufbau **MDC_MON_MODE** setzen
* MDC_MON_MODE nicht definiert oder Wert=auto: Regelwerk greift, s.u. **DEFAULT**
* MDC_MON_MODE=force Dieser Anruf wird in **jedem** Fall aufgenommen (Regelwerk überspringen)
* MDC_MON_MODE=deny Dieser Anruf wird in **keinem** Fall aufgenommen (Regelwerk überspringen)
* MDC_MON_MODE=manual Regelwerk wird übersprungen, Manuelle Aufnahme wird ermöglicht

Ein Beispielskript zum Abschalten des Recordings kann so aussehen:

    exten => s,1,Set(\__MDC_MON_MODE=deny)
    exten => s,n,Return()

Dieses Skript kann dann in ein IVR Menü eingebunden werden und den Mitschnitt deaktivieren.

### Record Taste am SNOM Telefon konfigurieren
Manche SNOM Telefone (3er Serie) haben eine eigene Record-Taste. Diese Taste belegt mobydick automatisch mit der korrekten URL für die Steuerung des Mitschnitt Systems. Auf SNOM Telefonen die keine extra Record-Taste besitzen können Sie eine beliebige andere Taste umfunktionieren.

#### Zentrale Verteilung der Tasteneinstellung
Am einfachsten erledigen Sie das zentral durch das Provisioning System und weisen dort einer Taste diese Wert zu:

    url http://$httpip/mobydickcmd/provisioning/snom/snom-record.php?mac=$071ipp_mac&sipcallid=$call-id

#### Tasteneinstellung direkt individuell am Telefon
Alternativ können Sie auch die folgende URL direkt auf einer Telefon-Taste von Typ Aktions URL eintragen, wobei Sie **MOBDICK_SERVER_IP** mit der konkreten **IP-Adresse** des mobydick-Servers ersetzen müssen:

    http://MOBDICK_SERVER_IP/provisioning/0004132cd0c5/pui/monitor/record?callid=$call-id

Beispiel:

    http://192.168.100.1/mobydickcmd/provisioning/snom/snom-record.php?mac=$mac&sipcallid=$call-id

### Mitschnitte im mobydick Client verwalten
Erlaubt eine Regel dem Benutzer das manuelle Mitschneiden ist während des Gespräches ein roter Aufnahmeknopf im mobydick Client sichtbar um den Mitschnitt zu starten:
![Screenshot - Mitschnitt im Client](../../images/mitschnitt_client_manual.png?width=100% "Mitschnitt im Client")

Alternativ können Mitschnitte am Telefon per Record-Taste gestartet werden.
Wurde ein Mitschnitt erstellt können Sie dies nachträglich am REC Kennzeichnung in Ihrem Journal einsehen:

Durch Klicken auf das **REC** Symbol werden Ihnen alle Mitschnitte zu diesem Telefonat angezeigt:
![Screenshot - Journal im mobydick Client](../../images/mitschnitt_client_journal.png?width=100% "Journal im mobydick Client")

Duch Klicken auf das Play Symbol können Sie den Mitschnitt direkt anhören und mit dem Download-Symbol herunterladen.
![Screenshot - Mitschnitt Regeln](../../images/mitschnitt_client_play.png?width=100% "Mitschnitt Regeln verwalten")
