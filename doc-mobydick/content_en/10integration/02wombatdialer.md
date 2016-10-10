---
title: WombatDialer
next: /integrationen/wombatdialer/
prev: /integrationen/queuemetrics/
next: /integrationen/wombatdialer/
weight: 101
toc: true
---

## Übersicht
WombatDialer ist ein PredictiveDialer der Firma Loway. WombatDialer automatisiert den Aufbau von Telefonverbindungen und ersetzt die umständliche, zeitaufwendige manuelle Anwahl. Somit erreichen Sie z. B. bei Telefonkampagnen eine bessere Auslastung Ihrer Callcenter Agenten. Weitere Anwendungsszenarien können Sie auf der WombatDialer Homepage nachlesen.

![Illustration - WombatDialer Konzept mit mobydick](../../images/wombatdialer_overview.png?width=90% "WombatDialer Konzept mit mobydick")


Der WombatDialer wird auf einem separaten Server (nicht direkt auf der mobydick) installiert. Zur Kommunikation mit der mobydick baut der WombatDialer eine Verbindung per Asterisk Manager Interface auf. Auf dem WombatDialer wird eine Liste mit anzurufenden Telefonnummer hinterlegt. Diese werden dann nach Start der Kampagne automatisiert angerufen (1) und, sobald ein Ruf beantwortet wird,  (2) mit einem beliebigen Ziel auf der mobydick verbunden. Als Ziele eigenen sich z. B. Teams, einzelne User, IVR-Menüs oder Skripte.

## Konfiguration

### mobydick vorbereiten

#### Asterisk Manager Interface konfigurieren
Für die Kommunikation mit dem mobydick Server benötigt WombatDialer Zugriff auf das Asterisk Manager Interface (AMI).

Hierzu müssen Sie (insofern noch nicht geschehen) zuerst das AMI für öffentliche Zugriffe freischalten. Dies machen Sie unter `Appliance > Dienste` indem Sie **Erlaubte AMI Verbindungen** auf **öffentlich** stellen:
![Screenshot - WombatDialer Konzept mit mobydick](../../images/ami_public.png?width=70% "WombatDialer Konzept mit mobydick")

Nun legen Sie auf der mobydick einen Manager Account für WombatDialer unter `Appliance > Asterisk` Managerkonten an:
![Screenshot - Manager Account für WombatDialer](../../images/wombatdialer_ami_account.png?width=70% "Manager Account für WombatDialer")

Bei **Erlaubt.Netz** können Sie die IP Adresse des WombatDialer-Servers angeben und die **Erlaubt.Mask** auf 255.255.255.255 stellen. Dadurch ist es nur von IP-Adresse des WombatDialers aus möglich auf die mobydick zuzugreifen. Dies erhöht die Sicherheit beträchtlich und ist daher zu empfehlen.

#### Skript zur WombatDialer-Integration erstellen
Zur Integration benötigen Sie ein Skript auf der mobydick. Bei neueren Versionen ist das Skript bereits auf der mobydick vorinstalliert und heißt wombat. Sollte das Skript bei Ihrer mobydick Version noch nicht vorhanden sein legen Sie es bitte unter `Erweitert > Skripte` wie folgt an:
![Screenshot - WombatDialer-Integration erstellen](../../images/wombatdialer_skript_basic.png?width=70% "WombatDialer-Integration erstellen")

Jetzt fügen Sie im Reiter Skript noch folgendes Skript ein:

    exten => _X.,1,NoOp(WombatDialer)
    same => n,Wait(0.25)
    same => n,Set(MDC_CALLER_NUM_TRUNK=${CALLERID(num)})
    same => n,Set(MDC_CALLER_NUM_INTERNAT=${CALLERID(num)})
    same => n,Set(MDC_CALLEE_NUM_TRUNK=${EXTEN})
    same => n,UserEvent(ResolveCallerName,Strategy: default,Outbound: 0,Channel: ${CHANNEL})
    same => n,Wait(0.25)
    same => n,Set(MDC_NUMPREFIX_TRUNK=0)
    same => n,Set(CHANNEL(language)=de)
    same => n,Goto(mdc_external,${EXTEN},1)
    
Optional können Sie in diesem Skript noch folgende Variablen anpassen:

|Variable|Bedeutung|
|CHANNEL(language)|Setzt die Sprache des Kanals für alle Ansagen die Sie später verwenden möchten. Mögliche Werte entnehmen Sie dem Menü Erweitert > Ansagen und dort unter der Schaltfläche Aktion > Sprachen:Verwalten. Sie können alle Werte in der Tabellenspalte Sprachkürzel für die Variable CHANNEL(language) verwenden.|
|MDC_NUMPREFIX_TRUNK|	Falls Sie mobydick so konfiguriert haben, dass Sie ein Prefix (z. B. die 0) für Ihr Standardamt vorwählen müssen, tragen Sie dieses Prefix auch in der Variable MDC_NUMPREFIX_TRUNK ein.|
{{% notice note %}}
Vergessen Sie bitte nicht jetzt alle vorgeschlagenen Jobs in der mobydick anzuwenden damit die Konfiguration aktiv wird.
{{% /notice %}}

#### Internen Namen des Amtes herausfinden
WombatDialer benötigt ein Amt um externe Teilne
hmer anrufen zu können. Dazu müssen Sie später in WombatDialer den internen mobydick Namen des Amtes kennen. Leider ist dieser nicht über die mobydick Weboberfläche zu ermitteln.  Um den Namen zu ermitteln loggen Sie sich bitte in die Asterisk CLI ein (siehe Zugriff auf MobyDick).

Geben Sie hier den Befehl sip show peers ein. Dann erhalten Sie folgende Ausgabe:

    mobydick*CLI> sip show peers
    Name/username             Host                                    Dyn Forcerport ACL Port     Status      Description
    KgZR1z3w4GBgWHa/KgZR1z3w4 172.16.214.1                             D   a             64358    OK (1 ms)
    mdc_trunk_conf-1/dev-test 172.16.214.10                                N             5060     OK (3 ms)
    2 sip peers [Monitored: 2 online, 0 offline Unmonitored: 0 online, 0 offline]
    mobydick*CLI>

Alle internen Namen für Ämter beginnen mit mdc_trunk_conf- (in unserem Fall mdc_trunk_conf-1). Anhand des Usernamen (in unserem Fall dev-test) und der Host Adresse (in unserem Fall 172.16.214.10) können Sie in den meisten Fällen ermitteln welcher interne Name zu welchem Amt gehört. 

### WombatDialer installieren
Setzen Sie WombatDialer gemäß der [Anleitung des Herstellers](https://www.wombatdialer.com/ "Zur Herstellerseite") auf einem separaten Server auf.
{{% notice note %}}
Installieren Sie bitte in keinem Fall den WombatDialer direkt auf dem mobydick Server sondern verwenden Sie dazu immer eine eigene Linux-Installation wie Ubuntu, Debian, CentOS, etc. auf einem separaten Server oder einer separaten virtuellen Maschines!
{{% /notice %}}


### WombatDialer konfigurieren
Nach der Installation des WombatDialer loggen Sie sich bitte auf diesem ein. Hier müssen Sie zuerst unter Edit basic settings die Verbindung zur mobydick konfigurieren:
![Screenshot - WombatDialer konfigurieren](../../images/wombatdialer_basic_settings.png?width=70% "WombatDialer konfigurieren")

#### Asterisk servers
Tragen Sie hier die mobydick IP-Adresse als Server address ein. Benutzen Sie als Login und Passwort die Daten des zuvor auf der mobydick erstellen Asterisk Manager Accounts.

#### Trunks
Hier geben Sie an welches mobydick Amt WombatDialer für seine Arbeit benutzen soll. Hierzu müssen Sie den zuvor ermittelten internen Namen des Amtes in den **Dial string** eintragen. Heißt Ihr Amt z. B. **mdc_trunk_conf-1** ist der Dial String:

    SIP/mdc_trunk_conf-1/${num}
${num} wird von WombatDialer später immer durch die anzurufende Telefonnummer ersetzt.

#### End Points
Ein End Point ist das Ziel in der mobydick mit dem der zuvor über den Trunk angerufene externe Teilnehmer verbunden wird. Hierzu eigenen sich z. B. mobydick Teams, Benutzer, IVR oder Skripte. Es gibt zwei verschiedene Endpointtypen:

|Parameter|Bedeutung|
|QUEUE|	Wollen Sie die Zielrufnummer mit einem mobydick Team verbinden nutzen Sie diesen Endpointtyp. Dadurch überwacht WombatDialer auch die Verfügbarkeit der Agenten, etc.|
|PHONE|	Bei allen anderen Endpoints wie Benutzer, IVR-Menüs oder Skripten nutzen Sie diesen Endponttyp|

Weitere Parameter die Sie bei einem Endpoint einstellen müssen:

|Queue name / Phone|	Name des Endpoint. Wenn Sie den Endpointtyp QUEUE benutzen muss der Name mit dem Namen des Teams in mobydick exact übereinstimmen. Ansonsten ist dieser frei wählbar|
|Located at: Extension	|Die Durchwahl des Teams, Benuter, IVR, Skript, ...|
|Located at: Context	|Ist immer wombat. Dadurch wird für den Einstieg in den mobydick Dialplan immer das weiter oben angelegte Skript benutzt.|

#### Dialer starten
Jetzt gehen Sie zurück auf das Home Tab des WombatDialer und starten den Dialer durch drücken auf den **Play-Button** unter **Dialer status**.
Nun ist die Integration zwischen mobydick und WombatDialer abgeschlossen. Weiter Details entnehmen Sie bitte der WombatDialer [Anleitung des Herstellers](https://www.wombatdialer.com/ "Zur Herstellerseite") oder dem hier in der Dokumentation folgenden Praxisbeispiel-Video

## Praxisbeispiel

{{< youtube G3rWJDqxTWg >}}