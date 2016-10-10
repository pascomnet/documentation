---
title: HA Cluster Einrichten
keywords:
    - HA Cluster Einrichten
    - Failover-Cluster einrichten
    - Cluster Master und Slave konfigurieren
    - Hochverfügbarkeitscluster Settings
description: Das mobydick Cluster Modul beherrscht aktuell einen zwei Node Cluster. Es handelt sich um einen Failover-Cluster.
linken: /module/
url: /module/cluster-einrichten/
prev:  /module/konferenzsystem/
weight: 94
toc: true

---


## mobydick Cluster Konzept

![mobydick Cluster Konzept](../../images/cluster_uebersicht.png?width=90% "mobydick Cluster Konzept - Übersicht")


Das mobydick Cluster Modul beherrscht aktuell einen **zwei Node Cluster**. Es handelt sich um einen **Failover-Cluster**, nicht um einen LoadBalancer. Dies dedeutet, dass im Normalfall alle mobydick Services auf der aktuellen Master Node laufen und im Fehlerfall in einem Rutsch auf die Slave Node migriert werden.
Dieser Umschaltvorgang dauert nur **wenige Sekunden**, allerdings werden alle aktiven Gespräche unterbrochen.

### Gleichberechtigte Nodes
Beide Nodes sind gleichberechtigt. Kommt es zu einem Failover, so übernimmt die aktuell als Slave laufende Node alle Dienste und wird zum Master ernannt. Ein Zurückschwenken der Dienste nach Reparatur der defekten Node ist daher nicht notwendig und stört nur unnötig den Telefonbetrieb.

### Stickiness
Die mobydick Services bleiben nach einem Failover auf der neuen Node "kleben". Fährt die andere Node wieder hoch muss diese als Slave neu eingegliedert werden und übernimmt nicht automatisch wieder alle mobydick Services. Auch diese Maßnahme sorgt für einen möglichst störungsfreien Telefonbetrieb im Failover-Fall.

### Netzwerk planen
Für den Betrieb eines mobydick Clusters benötigen Sie pro Node zwei Netzwerkschnittstellen. Eine für das **Telefonnetz-** und eine für das **interne Cluster Netzwerk**.

![Illustration - Cluster Netzwerk](../../images/cluster_netzwerk.png?width=90% "mobydick Cluster Netzwerk")


#### Telefonnetz
Die beiden Nodes haben jeweils eine Netzwerkkarte im Telefonnetz. Sie benötigen dort also **eine IP-Adresse pro Node** und eine weitere **Cluster-IP-Adresse** die immer am aktuellen Master hochgefahren wird. Die Telefone und Gateways im Telefonnetz melden sich ausschließlich an der Cluster-IP-Adresse an. Auch die mobydick Weboberfläche steht nur unter der Cluster-IP-Adresse zur Verfügung.

#### Internes Cluster Netzwerk
{{% notice note %}}
Verbinden Sie die beiden Nodes über die zweite Netzwerkschnittstelle, ohne Umweg über einen Switch, direkt miteinander um das Ausfallrisiko der Strecke zu minimieren. Hierzu genügt ein gewöhnliches Patchkabel (kein Crossover-Kabel).
{{% /notice %}}

Als internes Cluster Netzwerk können Sie ein beliebiges privates ipv4-Netzwerk verwenden, welches in Ihrer Firma noch nicht benutzt wird. z.B. *172.16.1.0/24*. Der Einfachheit halber sollte Sie eine 24-Bit Netzmaske (255.255.255.0) verwenden. Theoretisch würde eine Netzgröße von 4 IP Adressen (Netzwerkadresse, IP-Adresse-Node1, IP-Adresse-Node2, Broadcastadresse) genügen.


## Konfiguration

### mobydick auf beiden Nodes installieren (optional)
Auf allen von pascom ausgelieferten mobydick Servern ist die mobydick Software bereits vorinstalliert. Sollten Sie ein solches System besitzen, können Sie diesen Schritt überspringen.
Ansonsten setzen Sie jetzt bitte zwei identische mobydick Maschinen auf, wie unter [mobydick installieren]({{< relref "02server-installation.md" >}}) beschrieben.

{{% notice note %}}
Für den Cluster brauchen Sie einen separate Lizenz, diese ist in der Community Version nicht enthalten. Für Fragen kontaktieren Sie bitte unsere Vertrieb unter +49 991 29691-200.
{{% /notice %}}

### Netzwerk auf beiden Nodes vorbereiten
Richten Sie, wie weiter oben beschrieben, jeweils eine Netzwerkkarte für das **Telefon-** und das **interne Cluster Netzwerk** auf beiden Cluster Nodes ein.
Loggen Sie sich hierzu auf der mobydick Weboberfläche von beiden Nodes ein und öffnen Sie den Menüpunkt `Appliance > Netzwerkschnittstellen`.
In unserem Beispiel bereiten wir **eth0** für das **Telefon-** und **eth1** für das **interne Cluster Netzwerk** vor.

Die Beispiel-Konfiguration auf der ersten Node:
![Illustration - Netwerk Node 1](../../images/cluster_netzwerk_node1.png?width=90% "Netzwerk der Node 1")

Die Beispiel-Konfiguration auf der zweiten Node:
![Illustration - Netwerk Node 2](../../images/cluster_netzwerk_node2.png?width=90% "Netzwerk der Node 1")

Details siehe [Netzwerk einrichten]({{< ref "05network-config.md" >}} "Netzwerk in mobydick einrichten").

### Hostnamen auf beiden Nodes setzen

{{% notice warning %}}
Die beiden Nodes dürfen auf keinen Fall den selben Hostnamen haben!
{{% /notice %}}

Öffnen Sie auf mobydick Weboberfläche von beiden Nodes den Menüpunkt `Appliance > Dienste` und tragen unter Hostnamen z.B. **node1** auf der einen und **node2** auf der anderen Node unter dem Feld **Hostname** ein.

### Master Node Dienste konfigurieren
Entscheiden Sie sich nun welche der beiden Nodes initial als Master arbeiten soll. Loggen Sie sich auf dieser Node in die mobydick Weboberfläche ein und öffnen dort den Menüpunkt `Appliance > Dienste`.

Stellen Sie sicher, dass folgende Dienste am Master eingerichtet sind und funktionieren:

* DNS Server
* DHCP Server (optional)
* NTP Server
* EMail-Server
* Faxserver (Grundkonfiguration auch wenn dieser nicht benutzt wird)

Details siehe [Netzwerk einrichten]({{< ref "05network-config.md" >}} "Netzwerk in mobydick einrichten") und [Virtueller Faxserver]({{< ref "01faxserver.md" >}} "Faxserver einrichten").

Die Dienste müssen Sie nur auf der Master Node einstellen da die Konfiguration automatisch mit der anderen Node abgeglichen wird.

{{% notice note %}}
Bitte das Anwenden der Jobs nicht vergessen
{{% /notice %}}

{{% notice warning %}}
Die Dienste und die Netzwerkkonfiguration können, nachdem Sie den Cluster aktiviert haben, nicht mehr ohne weiteres verändert werden!
{{% /notice %}}

### Master Node aktivieren
Loggen Sie sich auf der Master Node in die mobydick Weboberfläche ein, öffnen Sie dort den Menüpunkt `Appliance > Cluster Verwaltung` und klicken Sie auf die Schaltfläche `Master einrichten`:


![Screenshot - Master in mobydick einrichten](../../images/cluster_master_einrichten.png?width=90% "Master Node 1 aktivieren")

|Parameter|Bedeutung|
|---------|----------|
|Aktueller Hostname |Hier sehen Sie den aktuell konfigurierten Hostnamen|
| Shared Cluster IP| Die IP-Adresse des Clusters. Diese wird automatisch auf der aktuellen Master Node hochgefahren. Die Telefone und Gateways im Telefonnetz melden sich ausschließlich an der Cluster-IP-Adresse an. Auch die mobydick Weboberfläche steht nur unter der Cluster-IP-Adresse zur Verfügung.|
| Telefonnetzwerk |Wählen Sie hier die Netzwerkschnittstelle die Sie für das Telefonnetz vorbereitet haben|
| Internes Cluster Netzwerk |Wählen Sie hier die Netzwerkschnittstelle die Sie für das interne Cluster Netzwerk vorbereitet haben|
| Benachrichtigungs-Email |An die hier angegebene E-Mail Adresse versendet der Cluster alle Statusinformationen wie z.B. Failover oder den Umzug/Ausfall einzelner Dienste.|

Nachdem Sie die Maske entsprechend ausgefüllt haben drücken Sie die Schaltfläche `Einrichten`:
![Screenshot - Cluster Master einrichten](../../images/cluster_master_init_wait.png "mobydick Master einrichten")

Nach erfolgreicher Konfiguration startet der mobydick Server neu und folgende Information erscheint:
![Screenshot - Cluster Master reboot ](../../images/cluster_master_init_reboot.png?width=90% "mobydick Master rebooten")


Nachdem die Node wieder online ist, loggen Sie sich auf der Cluster-IP in die mobydick Weboberfläche ein und öffnen den Menüpunkt `Appliance > Cluster Verwaltung`. Dort sollte der Staus wie folgt aussehen:

![Screenshot - Cluster Master bereit ](../../images/cluster_master_bereit.png?width=90% "mobydick Master bereit")

### Slave Node vorbereiten

{{% notice note %}}

Bevor Sie sich auf der Slave Node einloggen, kopieren Sie bitte den SSH-Schlüssel auf der Master Node in die Zwischenablage Ihres Rechners
{{% /notice %}}

Loggen Sie sich auf der Node-IP der Node die initial als Slave arbeiten soll in die mobydick Weboberfläche ein, öffnen Sie den Menüpunkt `Appliance > Cluster Verwaltung` und klicken auf die Schaltfläche `Slave vorbereiten`:

![Screenshot - Cluster Vorbereitung](../../images/cluster_slave_init.png?width=90% "mobydick Cluster Slave vorbereiten")

Fügen Sie hier den zuvor in die Zwischenablage kopierten SSH-Public-Key des Masters ein und klicken Sie auf die
`SPEICHERN` Schaltfläche.

Warten Sie bis der **Slave** vorbereitet wurde:
![Screenshot - Cluster Einbindung](../../images/cluster_slave_einbindung_wait.png "mobydick Cluster Einbindung")

Nach erfolgreicher Vorbereitung sollte der Status des Slave wie folgt aussehen:


![Screenshot - Cluster Slave bereit](../../images/cluster_slave_bereit.png?width=90% "mobydick Cluster bereit")


### Slave Node eingliedern
Loggen Sie sich nun wieder auf der **Cluster-IP** in die mobydick Weboberfläche auf der aktellen **Master Node** ein, öffen Sie den Menüpunkt `Appliance > Cluster Verwaltung` und klicken Sie auf die Schaltfläche `Slave hinzufügen`:

![Screenshot - Cluster Slave hinzufügen](../../images/cluster_slave_hinzufuegen.png?width=90% "mobydick Cluster hinzufügen")

|Parameter|Bedeutung|
|---------|----------|
|Hostname |Der Hostname der Slave Node|
|Telefonnetz-IP des Slaves| IP-Adresse der Slave Node im Telefonnetz|
|Sync IP des Slaves| IP-Adresse der Slave Node im internen Cluster Netzwerk |
|SSH Schlüssel des Masters| Der SSH Keys des Masters zur nochmaligen Ansicht (nur zur Information)|


Nachdem Sie die Daten eingetragen haben klicken Sie auf die Schaltfläche `Einrichten`:
![Illustration - Cluster Einbindung](../../images/cluster_slave_einbindung_wait.png "mobydick Cluster Einbindung")
Der Slave wird nur eingegliedert und die Daten werden initial synchronisiert.

{{% notice note %}}
Dieser Vorgang kann etliche Minuten dauern
{{% /notice %}}

Warten Sie bis die Slave Node neu startet. Beim Bootvorgang meldet sich die Slave Node am Cluster an. Warten Sie den gesamten Bootvorgang ab. Danach sollte der Cluster folgenden Status anzeigen:
![Illustration - Cluster integriert](../../images/cluster_finished.png?width=90% "mobydick Cluster fertig eingerichtet")


## mobydick Cluster updaten

### Übersicht

Die Software eines mobydick Clusters kann während des Clusterbetriebes nicht aktualisiert werden - der mobydick Updater ist gesperrt.

Der Cluster-Update-Prozess gliedert sich wie folgt:

* Die Slave Node muss aus dem Cluster augegliedert werden und kann als Backup dienen
* Nun kann die Master-Node auf dem herkömmlichen Weg per mobydick Updater upgedatet werden
* Nach einem erfolgreichen Update der Master Node muss die Slave Node wieder eingegliedert werden
* Die Master Node updatet nun die Slave Node incl. Firmware

### Konfiguration

#### Slave Node ausgliedern
Loggen Sie sich auf der Cluster-IP in die mobydick Weboberfläche ein und öffnen den Menüpunkt `Appliance > Cluster Verwaltung`.
Dort Gliedern Sie nun die Slave Node durch Klicken auf die Schaltfläche Entfernen`aus:
![Screenshot - Cluster Slave Node entfernen](../../images/cluster_update_slave_entfernen.png?width=90% "Slave Node ausgliedern")

{{% notice note %}}
Dieser Schritt gliedert die Slave Node aus, hat aber keinen weiteren Einfluss auf den Betrieb des Clusters. Die Telefonie wird nicht unterbrochen.
{{% /notice %}}

#### Master Node updaten
Updaten Sie den Master Node jetzt auf dem herkömmlichen Weg per mobydick Updater.
Je nach Art des Updates muss die Master Node nun rebooten.

#### Funktion der Master Node prüfen

Prüfen Sie nun ob die Master Node nach dem Update zu Ihrer Zufriedenheit funktioniert. Gliedern Sie den Slave Node erst dann ein wenn Sie mit diesem Schritt fertig sind. Dadurch bleibt der Status vor dem Update auf der Slave Node erhalten. Diese kann dann im Notfall als Backup dienen.

#### Slave Node wieder eingliedern

{{% notice warning %}}
Beim Update einer älteren mobydick auf eine Version ab 7.07.00 erscheint die Slave-Node als "Vorhanden, aber gerade nicht erreichbar" in der UI. Klicken Sie hier bitte zuerst auf Entfernen, führen Sie alle vorgeschlagenen Jobs aus und klicken Sie dann wieder auf Slave hinzufügen. IP-Adressen und Hostname sind dann bereits vorbelegt und Sie können die Node ganz normal wieder hinzufügen.
{{% /notice %}}

Loggen Sie sich auf der Cluster-IP in die mobydick Weboberfläche ein und öffnen den Menüpunkt `Appliance > Cluster Verwaltung`.Dort Gliedern Sie nun die Slave Node durch Klicken auf die Schaltfläche `Erneut hinzufügen` wieder ein:
![Screenshot - Cluster Update Slave](../../images/cluster_update_slave_hinzufuegen1.png?width=90% "Slave bei Cluster Update")


mobydick merkt sich die Daten der zu letzt verwendeten Slave Node und schlägt diese vor. Klicken Sie auf di Schaltfläche `Einrichten`:
![Screenshot - Cluster Update Slave](../../images/cluster_update_slave_hinzufuegen_detail.png?width=50% "Slave im Detail")
Nach erfolgreicher Wiedereingliederung bootet die Slave Node neu. Nach dem Reboot ist der Cluster Status wieder ok.

## Failover und Monitoring

### Übersicht
Der mobydick Cluster wird von der Monitoring Software Icinga überwacht. Bei der Überwachung gibt es zwei Arten von Service Checks:

* Failover Checks
* Notify Checks

#### Failover Checks
Schlägt ein Failover Check fehl, werden alle Dienste auf die Slave Node umgezogen und diese zum neuen Master ernannt. Folgende Checks führen zu einem Failover:

|                   |       |   Läuft auf Master      | Läuft auf Slave|
|-------------------|-------|:-----------------------:|:----------------:|
|Master Node Alive  | Ist die Master Node über keine der beiden Netzwerkschnittstellen mehr erreichbar? |  | <i class="fa fa-check-square" aria-hidden="true"></i> |
|Cluster Status     |	Meldet das Cluster Management einen Fehler auf der aktuellen Master Node? |	<i class="fa fa-check-square" aria-hidden="true"></i> | |
|3ware RAID (optional)|	Enthält das System einen Raid Controller und meldet dieser einen schwerwiegenden Fehler?| <i class="fa fa-check-square" aria-hidden="true"></i> |  |	 
|Network Failover	|Ist das Telefonnetz auf der Master Node nicht mehr verfügbar, aber von der Slave Node aus noch erreichbar?	| 	| <i class="fa fa-check-square" aria-hidden="true"></i> |

#### Notify Checks
Schlägt ein Notify Check fehl, wird der Systemadministrator darüber informiert jedoch kommt es zu keinem automatischen Failover. Der Systemadministrator entscheidet dann selbst ob er einen manuellen Failover durchführen möchte oder nicht. Folgende Checks führen zu einem Notify:


| 	                |                                                                   |Läuft auf Master|Läuft auf Slave|
|-------------------|-------------------------------------------------------------------|:----:|:----:|
|Asterisk AMI       |Ist das Management Interface des Asterisk Server noch erreichbar?	|<i class="fa fa-check-square" aria-hidden="true"></i>	|   |
|Asterisk SIP	    |Antwortet der SIP Stack noch korrekt?	                            |<i class="fa fa-check-square" aria-hidden="true"></i>	|   |
|Database Query	    |Kann eine SQL Query für den Sync-Test abgestellt werden?	        |<i class="fa fa-check-square" aria-hidden="true"></i>	|   |
|Default Services	|Laufen alle von mobydick benötigten Dienste?	                    |<i class="fa fa-check-square" aria-hidden="true"></i>	|   |
|Disk Usage         |Hat das System genügend freien Plattenplatz?	                    |<i class="fa fa-check-square" aria-hidden="true"></i>	|<i class="fa fa-check-square" aria-hidden="true"></i> |
|Filesystem Sync    |Ist das Filesystem auf beiden Nodes synchron?	                    |<i class="fa fa-check-square" aria-hidden="true"></i>	|<i class="fa fa-check-square" aria-hidden="true"></i> |
|Time	            |Stimmt die Uhrzeit am System?	                                    |<i class="fa fa-check-square" aria-hidden="true"></i>	|<i class="fa fa-check-square" aria-hidden="true"></i> |
|Rsync Server	    |Läuft der rsync Server zur Filesystem Synchronisierung?            |	|<i class="fa fa-check-square" aria-hidden="true"></i> |
|Database Sync	    |Ist die Datenbank mit dem Master synchron?	                        |	|<i class="fa fa-check-square" aria-hidden="true"></i> |

### Konfiguration

#### Status abrufen
Loggen Sie sich auf der Cluster-IP in die mobydick Weboberfläche ein und öffen den Menüpunkt `Informationen > Dienste Status`:
![Screenshot - Cluster Monitoring](../../images/cluster_monitor.png?width=90% "Monitoring des Clusters in mobydick")

Alternaiv gelagen Sie auch per klick auf die **Statuslampe** in der Jobbox auf diese Seite:
![Screenshot - Statuslampe](../../images/cluster_monitor_jobbox.png "Jobbox und Statuslampe in der mobydick")

Außerdem wechselt die Jobbox die Farbe nach **Gelb** oder **Rot** falls **Warnungen** bzw. **kritische** Meldungen vorliegen.



#### Node nach Failover neu eingliedern
Nach einem manuellen oder automatischen Failover wird die defekte Node automatisch in Standby gesetzt und muss wieder eingegliedert werden. Siehe [mobydick Cluster einrichten]({{< relref "02server-installation.md" >}}).
Loggen Sie sich auf der Cluster-IP in die mobydick Weboberfläche ein und öffnen den Menüpunkt `Appliance > Cluster Verwaltung`.
Dort Gliedern Sie nun die Slave Node durch Klicken auf die Schaltfläche `Erneut hinzufügen` wieder ein:

![Screenshot - Cluster Update Slave](../../images/cluster_update_slave_hinzufuegen1.png?width=90% "Slave bei Cluster Update")

mobydick merkt sich die Daten der zu letzt verwendeten Slave Node und schlägt diese vor. Wurde die Node **getauscht**, können Sie hier auch die Daten der neuen Node angeben. In diesem Fall müssen Sie aber erst den SSH Key auf die neue Node kopieren. Wenn Sie fertig sind klicken Sie auf die Schaltfläche `Einrichten`:



![Screenshot - Cluster Update Slave](../../images/cluster_update_slave_hinzufuegen_detail.png?width=50% "Slave im Detail")

Nach erfolgreicher Wiedereingliederung bootet die Slave Node neu. Nach dem Reboot ist der Cluster Status wieder ok.


#### Slave-Node als Single-Node ohne Cluster-Konfiguration betreiben
Bei einer Cluster-Installation werden die Einstellungen auf dem Master-Node vorgenommen, und anschließend auf dem Slave synchronisiert. Ist der Master z. B. defekt, und ein Zugriff auf den Commander nicht mehr möglich, muss der Slave zum Single-Node "umgewandelt" werden.
Loggen Sie sich hierfür über SSH auf den Slave und führen Sie folgendes Script aus:

    /sbin/mdresetcluster.sh

Anschließend bootet der Slave neu und der Zugriff über den Commander ist möglich.
