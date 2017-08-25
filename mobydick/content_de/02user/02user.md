---
title: Benutzer und Arbeitsplätze
keywords:
    - Benutzer
    - SIP User
    - IP Arbeitsplätze
    - Roaming User
    - Benutzer anlegen
    - Arbeitsplätze anlegen
description: Was ist ein Benutzer, Arbeitsplatz in mobydick und wie lassen diese sich einfach einrichten und verwalten?  
url: /benutzer/benutzer-arbeitsplaetze/
prev: /benutzer/
next: /benutzer/teams/
weight: 22
toc: true
---

## Konzept

### Benutzer

Benutzer in mobydick repräsentieren eine **reale Person**. Dem Benutzer wird eine **Durchwahl** zugeteilt, nicht dem Telefon. Jeder mobydick Benutzer hat zwei **Präsenzstati**:

* **Telefonstatus**: zeigt an, ob dem Benutzer ein Telefon zur Verfügung steht oder an einem Arbeitsplatz angemeldet ist.
* **Clientstatus**: zeigt die Erreichbarkeit im mobydick Client, z. B. ob der Benutzer im mobydick Client an seinem PC-Arbeitsplatz angemeldet ist, ob er telefoniert, oder gerade seinen Platz verlassen hat.

Sind einem Benutzer mehrere Geräte zugeteilt oder nutzt er mehrere PCs oder Smartphones gleichzeitig wird der Präsenzstatus zusammengefasst.

![Illustration - Konzept der mobydick Benutzer](../../images/benutzer_uebersicht.png?width=90% "Benutzerkonzept in der mobydick")

### Telefone dem Benutzer direkt zuteilen

Im einfachsten Fall werden die Telefone dem Benutzer direkt zugeteilt. Alle zugeteilten Telefone sind dann unter der Durchwahl des Benutzers erreichbar. In welcher Reihenfolge und wie lange diese klingeln sollten wird beim Benutzer eingestellt.

![Illustration - Benutzer mit Endgeräten](../../images/benutzer_persoenliches_setup.png?width=50% "Benutzer und seine Endgeräte")

Diese Methode ist gut wenn Ihre Benutzer jeden Tag am selben Arbeitsplatz sitzen da nur der Administrator die Zuweisung der Telefone ändern kann, nicht der Benutzer selbst.

### Arbeitsplätze nutzen

Haben Sie jedoch Benutzer die den Arbeitsplatz wechseln oder an manchen Tagen von zu Hause aus arbeiten, sollten Sie Ihre Telefone nicht direkt dem Benutzer sondern **Arbeitsplätzen** zuweisen.
In diesem Fall werden die Telefone nicht direkt dem Benutzer sondern einem virtuellen **Arbeitsplatz** zugeteilt. Ein Benutzer kann selbst per mobydick Client oder per Menü an seinem IP-Telefon entscheiden an welchem Arbeitsplatz er jetzt arbeiten möchte. Sobald sich der Benutzer an einem Arbeitsplatz angemeldet hat sind alle dem Arbeitsplatz zugeteilten Telefone unter der Durchwahl des Benutzer erreichbar.  In welcher Reihenfolge und wie lange die Telefone klingeln sollten wird beim Arbeitslatz eingestellt.

Ein Benutzer kann immer nur genau einem Arbeitsplatz zugeteilt werden. Standardmäßig kann sich jeder Benutzer auf jedem Arbeitsplatz anmelden. Möchte man dies nicht, kann man das per **Rolle** einschränken.

In unserem Beispielbild haben wir zwei Arbeitsplätze für den Chef eingerichtet. Einen für das Büro und einen zu Hause.

![Illustration - Benutzer- und Arbeitsplatzprinzip](../../images/benutzer_arbeitsplatz_prinzip.png?width=50% "Benutzer und Arbeitsplätze")

### Mischbetrieb

Es ist möglich, dass ein Benutzer einen Arbeitsplatz und gleichzeitig direkt zugewiesene Telefone benutzt.

Das ist bei Telefonen sinnvoll die dem Benutzer persönlich gehören und die man an jeden Arbeitsplatz mitführen kann, z. B. Mobiltelefone.

Wechselt ein Benutzer seinen Arbeitsplatz ändert dies nichts an den direkt zugewiesenen Telefonen. Diese bleiben auf jedem Fall dem jeweiligen Benutzer zugeteilt.

![Illustration - Benutzer- und Arbeitsplatz Mischbetrie](../../images/benutzer_arbeitsplatz_persoenlich.png?width=50% "Benutzer und Arbeitsplätze und persönliche Endgeräte")

## Konfiguration

### Benutzer anlegen

Benutzer werden in der Web-UI unter `Benutzer` > `Benutzerliste` > `Hinzufügen` angelegt.

Anschließend müssen Sie das Formular zur Schnellanlage ausfüllen:

|Einstellung|Beschreibung|
|---|---|
|**Anmeldename**|Dieser muss aus Kleinbuchstaben bestehen, er dient zur Anmeldung, z. B. im mobydick CLient.|
|**Anzeigenamen**|Diesen Namen sehen andere Teilnehmer wenn die von diesem Benutzer angerufen werden.|
|**Durchwahl**|Unter dieser Durchwahl ist der Benutzer intern erreichbar.|
|**Anmeldung**|Diese Einstellung legt fest wie sich der Benutzer z. B. an seinem mobydick Client anmeldet. Zur Auswahl stehen <br>* *mobydick*, wenn das Passwort in der mobydick gespeichert wird <br>* *Extern/LDAP*, wenn die Authentifizierung über ein mobydick-fremdes System stattfindet <br>* *Keine*|
|**Passwort**|Muss mindestens 8 Stellen haben. Das Passwort wird zur Anmeldung im Client verwendet. Der Benutzer kann es im Client ändern.|
|**Pin**|Muss mindestens 4 Stellen haben und sollte nur Zahlen enthalten, da diese Pin für die Anmeldung am Telefon verwendet wird|
|**Fax-Durchwahl**|Gibt man hier eine Nummer an wird für diesen Benutzer automatisch ein virtuelles Faxgerät angelegt.|
|**EMail-Adresse**|Diese E-Mail-Adresse wird verwendet um dem Benutzer eingehende Faxe und Voicemails zuzusenden.|
|**Bevorzugte Sprache**|In dieser Sprache wird der Benutzer Systemansagen hören.|
|**Voicemailbox verwenden**|Mit dieser Einstellung kann man dem Benutzer eine eingene Voicemailbox aktivieren und eine Aktion anlegen.<br> * *Nicht verwenden*: Es wird keine Aktion hinterlegt, die Voicemailbox kann später angelegt werden,<br> * *Für externe Gespräche*: es wird eine Aktion Extern/Nachher angelegt,<br> * *Für interne Gespräche*: es wird eine Aktion Intern/Nachher angelegt,<br>* *Für alle Gespräche*: es werden für Intern/Nachher und Extern/Nachher je eine Aktion hinterlegt.|
|**mobydick Softphone aktivieren**|Legt dem Benutzer automatisch ein mobydick Softphone an.|

Sind Sie mit dem Formular fertig, klicken Sie auf

* **Speichern** um zu speichern und zur Benutzerliste zurück zu kehren.
* **Speichern und Details** um zu speichern und den Benutzer weiter zu Bearbeiten.
* **Speichern und nächster** um diesen Benutzer zu speichern und einen weiteren anzulegen.

#### Benutzer anlegen über den .xlsx-Import

Für die Erstinstallation eignet es sich die Benutzer aus eine .xlsx-Datei zu importiern. Die Datei mit dem Namen Benutzerimport.xmls finden Sie unter `Appliance` > `Importieren` >`Benutzerimport`. Sie könnern zuerst die Vorlage herunterladen, ausfüllen und wieder importieren. Achten Sie bitte auf die Hinweise in der Datei.

Alternativ können Sie auch den *Erweiteren Import* verwenden (`Appliance` > `Importieren` >`Erweiterter Import`). Hier können Sie bereits beim Anlegen der Benutzer weitere Einstellungen vornehmen:

* IP-Telefone zuweisen
* mobydick Soptphone zuweisen
* Aktionsvorlagen zuweisen
* Arbeitsplätze anlegen
* ein globales Telefonbuch erstellen
* Kurzwahlen definieren

Beachten Sie bitte auch hier auf die Hinweise in der Datei.

{{% notice warning %}}
Verwenden Sie den Benutzerimport nur einmalig bei der Erstkonfiguration Ihrer mobydick. Weitere Benutzer müssen Sie manuell anlegen. Erneute Verwendung des Benutzerimports überschreibt die bisher angelegten Benutzer.
{{% /notice %}}

### Benutzerrechte im Web-UI

Standardmäßig kann nur der Administrator zur Administration der mobydick in die Web-UI einloggen. Zusätzlich können Sie aber an jeden beliebigen Benutzer Administrationsrechte vergeben. Aktuell stehen Ihnen fix vier Berechtigungsstufen zur Verfügung:

|Rolle | Berechtigungen |
|------|----------------|
|**System Administrator**|Die höchste Rechte-Stufe. Der System Administrator hat alle verfügbaren Rechte.|
|**Administrator**| Rechte wie der System-Administrator jedoch **ohne**:<br> - mobydick Update<br> - Sicherung des kompletten Systems<br> - Dienste-Einstellungen<br> - mobydick herunterfahren/neustarten<br> - Netzwerk-Konfiguration<br> - Cluster Management|
|**Telefonie Verwaltung**|Rechte wie der Administrator jedoch **ohne**:<br> - Verwaltung von Gateways/Ämter<br> - Restart von Diensten<br> - Datenbank-Backup und Wiederherstellung<br> - Endgeräte-Firmware ausrollen<br> - mobydick Connector<br> - Cronjob-Verwaltung|
|**Telefonbuch Verwaltung**|Der Benutzer kann das mobydick Telefonbuch bearbeiten.|

### Voicemailbox

Jedem Benutzer wird automatisch eine persönliche Voicemailbox zugeteilt. Standardmäßig existiert diese zwar, Anrufer werden aber noch nicht auf die Voicemailbox abgeworfen.

Zuerst muss festgelegt werden, wie mit den Voicemails umgegangen werden soll. Unter `Benutzer` > `Benutzerliste` > Benutzer auswählen und `Bearbeiten` im Tab `Basisdaten` finden Sie folgende Einstellungsmöglichkeiten:

|Einstellung|Beschreibung|
|---|---|
|**Voicemails speichern**|**JA** bedeutet, die Voicmails werden nach dem Versenden oder nachdem sie abgehört werden auf der mobydick gespeichert bleiben. Durch einen Cronjob können ältere Voicemails gelöscht werden.<br>**NEIN** bedeutet, dass die Voicemails nach dem Versenden per E-Mail von der mobydick gelöscht werden. Diese Einstellung ist zu empfehlen, da Voicemails viel Speicherplatz verwenden.|
|**Voicemail Email**|An diese E-Mail-Adresse werden die Voicemails verschickt.|
|**Überwachte Voicemailbox**|Als Standardeinstellung wird die eigene Voicemailbox überwacht. Hier kann man die Voicemailbox eines anderen Benutzers auswählen.|

Anschließend muss die Voicemailbox als Aktion hinterlegt werden, falls das nicht schon bei der Benutzerlanlage geschehen ist.

### Alternative CallerID (CID Nummer)

Beim Anlegen erhält der Benutzer eine eigene Durchwahl unter der er angerufen werden kann. Im Normalfall wird einem anderen Teilnehmer diese Durchwahl auch angezeigt, wenn er von dem Benutzer angerufen wird. Wird dies nicht erwünscht, so kann unter Unter `Benutzer` > `Benutzerliste` > Benutzer auswählen und `Bearbeiten` im Tab `Basisdaten` eine alternative **CID Nummer** angegeben werden.

{{% notice tip %}}
Soll ein Benutzer bei externen Anrufen eine andere Durchwahl als seine eigene signalisieren, konfigurieren Sie das bitte im Amt unter Ausgehende Rufe.
{{% /notice %}}

### Telefonbuch

Standardmäßig erhält jeder Benutzer einen Eintrag im **Telefonbuch** mit seinem **Anzeigenamen** und seiner **Durchwahl**. Hier hat man die Möglichkeit weitere Daten einzugeben. Der Eintrag ist dann auf mobydick Client, Mobility Client und IP-Telefonen verfügbar.

Es ist auch möglich den Telefonbucheintrag zu **deaktivieren**, falls nicht erwünscht ist, dass mache Einträge für alle mobydick Benutzer sichtbar sind.

Einstellungen zum Benutzer-Telefonbucheintrag können Sie unter `Benutzer` > `Benutzerliste` > Benutzer auswählen und `Bearbeiten` im Tab `Telefonbuch` vornehmen.

### Virtuelles Faxgerät

Unter `Benutzer` > `Benutzerliste` > Benutzer auswählen und `Bearbeiten` im Tab `Faxgerät` können Sie dem Benutzer ein virtuelles Faxgerät anlegen:

|Einstellung|Beschreibung|
|---|---|
|E-Mail|Diese E-Mail-Adresse wird verwendet, um Faxe zu empfangen und Benachrichtigungen über die virtuell versendeten Faxe zu erhalten.|
|Durchwahl|Die Durchwahl, unter der die Faxnummer erreichbar ist.|
|ausgehende Faxkennung|Diese Nummer steht auf dem versendeten Fax.|
|Format|Gibt das Foramat an, in dem der Benutzer eingehende Faxe per E-Mail erhält.|

### Endgeräte

Unter `Benutzer` > `Benutzerliste` > Benutzer auswählen und `Bearbeiten` im Tab `Geräte` können Sie dem Benutzer Telefone zuweisen.  
Aus der linken Seite ist eine Übersicht über alle verfügbaren Telefone. Über den blauen Pfeil können Sie das gewünschte Telefon wählen und auf die rechte Seite ziehen zu den zugewiesenen Geräten. Benötigen Sie ein Telefon nicht mehr, dann ziehen Sie es über den blauen Pfeil (Richtung nach links) zurück auf die linke Seite.  
Einem Benutzer können mehrere Endgeräte zugewiesen werden. Welches Endgerät für ausgehende Rufe verwendet wird, kann über den mobydick Client gewählt werden.

Für die zugewiesenen Geräte können Sie Timeouts einstellen:

|Timeouts|Beschreibung|
|---|---|
|**Warten Intern**|Nach wie vielen  Sekunden soll das Telefon bei internen Rufen klingeln.|
|**Läuten Intern**|Wie viele Sekunden soll das Telefon klingeln, bevor der Anrufer in eine Aktion  Intern/Nachher übergeht.|
|**Warten Extern**|Nach wie vielen Sekunden soll das Telefon bei internen Rufen klingeln.|
|**Läuten Intern**|Wie viele Sekunden soll das Telefon klingeln, bevor der Anrufer in eine Aktion  Extern/Nachher übergeht.|
|**Warten Agent**|Nach wie vielen Sekunden soll das Telefon klingeln, wenn der Benutzer als Agent einen Anruf über ein Team bekommt.|
|**Läuten Agent**|Wie viele Sekunden soll das Telefon klingeln, wenn der Benutzer über ein Team angerufen wird. Dieser Timeout überschreibt den Timeout, der beim Team eingestellt ist.|

Benutzer-Timeouts müssen pro Gerät und pro Benutzer eingestellt werden.

### Arbeitsplatz

Unter `Benutzer` > `Arbeitsplätze` > `Hinzufügen` können Sie Arbeitsplätze anlegen. Im Tab `Geräte` können Sie die Telefone zuweisen. Ein Arbeitsplatz kann mehrere Geräte haben.  
Im Tab `Benutzerzuordnung` können Sie Benutzer zuweisen. Der Arbeitsplatz kann aber bei der Erstellung auch erstmal leer bleiben. Benutzer können sich über ihr Telefon oder dem mobydick Client selber am Arbeitsplatz anmelden.

|Am Arbeitsplatz anmelden:||
|---|---|
|**über den mobydick Client**|Rechts neben dem Profilbild können Sie den Arbeitsplatz auswählen.<br>Falls Sie öfters die gleichen Arbeitsplätze verwenden, sehen Sie diese gleich beim Klick auf den Pfeil. Ansonsten wählen Sie *Weitere Arbeitsplätz*.<br>Möchten Sie sich von dem Arbeitsplatz abmelden, wählen Sie *Kein Arbeitsplatz*|
|**über das IP-Telefon**|IP-Telefone, die von der mobydick provisioniert werden haben eine mobydick Menütaste. Drüken Sie diese und wählen Sie *Anmelden*. Nun geben Sie Ihre Durchwahl ein und Ihre PIN.<br>Zum Abmelden Drücken Sie ebenfalls die mobydick Menütaste und wählen Sie *Abmelden*|

Unter `Benutzer` > `Benutzerliste` > Benutzer auswählen und `Bearbeiten` im Tab `Arbeitsplatz` können Sie auch dem Benutzer einen Arbeitsplatz zuteilen bzw. sehen an welchem Arbeitsplatz der Benutzer aktuell arbeitet.

{{% notice note %}}
**Das FollowMe Prinzip der mobydick**<br>
Benutzern und Arbeitspätzen können mehrere Telefone zugewiesen werden. Die Konfiguration, welches Telefon wann und wie lange läutet, bezeichnen wir als FollowMe.
![Illustration - FollowMe Prinzip mobydick](../../images/benutzer_followme.png?width=90% "Endgeräte folgen Ihnen")
{{% /notice %}}

### Rufumleitungen (anlagenbasiert)

Eine Übersicht über Rufumleitungen finden Sie unter `Benutzer` > `Rufumleitung`. Hier sehen Sie die von den Benutzern angelegten Rufumleitungen, ob sie aktiv oder inaktiv sind, und Sie können hier auch neue Rufumleitungen setzen.

{{% notice warning %}}
Richten Sie bitte nur Rufumleitungen über die mobydick ein (über den mobydick Client oder der mobydick-Menütaste Ihres IP-Telefons). Damit vermeiden Sie unkontrollierte Umleitungs-Endlosschleifen.
{{% /notice %}}


### Aktionen

Aktionen sind in der mobydick ein wichtiges Werkzeug um den Anrufablauf zu steuern. Aktionen ermöglichen es

* dem Anrufer Ansagen vorzuspielen,
* außerhalb der Geschäftszeiten den Anrufer auf eine Voicemailbox umzuleiten,
* einen Anrufen auf einen anderen Benutzer oder Team abzuwerfen, falls der eigentlich Angerufene im Gespräch,
* und vieles mehr.

Lesen Sie dazu bitte den Artikel über [Aktionen](../../anrufverteilung/aktionen/).

### Rollen

Benutzer ebenso wie Geräte, Arbeitsplätze oder Teams können Mitglieder in einer oder mehreren Rollen sein. Der Rolle selbst können Eigenschaften und Rechte zugeteilt werden. Sie steuern telefonie-relevante Eigenschaften und Rechte wie bsw. die Erlaubnis Gespräche anderer Benutzer heranzuholen.

Rollen können eingerichtet werden unter `Benutzer` > `Rollen`.

Es gibt eine spezielle Rolle mit dem Namen **All Users**. Diese Rolle ist standardmäßig allen Benutzern, Geräten, Arbeitsplätzen und Teams zugeteilt und kann auch nicht entzogen werden.

Ein häufiger Anwendungsfall (und unsere Empfehlung) ist es, dass man pro Abteilung oder Team eine Rolle erstellt. Z. B. ist es häufig gewünscht, dass Benutzer nur innerhalb Ihrer Abteilung Gespräche heranholen können und sich gegenseitig im mobydick Client sehen. Dazu entziehen Sie einfach der Rolle *All Users* die Eigenschaft *xmpp.group* und weisen dies einer neuen Rolle z. B. Support zu in der Sie dann alle Support-Benutzer zu Mitgliedern machen.  

|Rollentype|Beschreibung|Auswirkung|
|---|---|---|
|**billing.group**|Abrechnungsgruppe des Billing-Moduls. Dient zur Gruppierung der Gesprächsdaten.|Benutzer, Rufgruppen, Warteschlangen|
|**xmpp.supervisor**|Benutzer mit dieser Rolle können Gespräche aller Benutzer managen. Wichtig für Flexpanel und TAPI.|Benutzer|
|**location.group**|Diese Rolle legt fest, welche Benutzer sich an Arbeitsplätzen anmelden können. Wird diese Rolle nicht konfiguriert, können sich Benutzer an allen Arbeitsplätzen anmelden. Wird eine solche Rolle angelegt, können sich Benutzer die nicht in einer Rolle *location.group* Mitglieder sind, nicht mehr an Arbeitsplätzen anmelden.|Benutzer, Arbeitsplätze|
|**pickup.group**|Alle Mitglieder der Rolle haben das Recht, eingehende Anrufe die an ein anderes Mitglied der Gruppe gerichtet sind, heranzuholen. Dies kann dann entweder per Telefon \*8<Durchwahl> oder Client erfolgen.|Benutzer, Rufgruppen, Warteschlangen|
|**redirect.choice**|Eine Identität mit diesem Rollentyp wird nie von einer anlagenbasierten Rufumleitung umgeleitet, sondern ruft immer das direkte Ziel.|Benutzer|
|**xmpp.group**|Alle Identitäten die eine Rolle mit dem Rollentyp *xmpp.group* zugewiesen haben, werden in eine *XMPP shared Group* eingebunden. D. h. in den Kontaktliste der Clients müssen sich diese Personen nicht mehr gegenseitig hinzufügen sondern sind sofort sichtbar. Falls Sie die *xmpp.group* der Rolle allen Identitäten zuordnen, sieht im Client immer jeder jeden.|Benutzer|



### FollowMe

Benutzern und Arbeitsplätzen können mehrere Endgeräte zugewiesen werden. Die Konfiguration welches Endgerät wann, wie lange und ob überhaupt klingelt bezeichnet man als **FollowMe**.

![FollowMe](/followme.png)

Klicken Sie im Web-UI zunächst auf `Benutzer` > `Benutzerliste` > Benuzter auswählen > im Tab `Geräte`. In der rechten Spalte erhalten Sie die Übersicht der direkt zugewiesenen Geräte mit den FollowMe-Einstellungen. Klicken Sie nun auf die FolloMe-Einstellung:

![FollowMe](/followme_einstellungen_commander.png?width=50%)

|Einstellung|Beschreibung|
|---|---|
|Vom Benutzer konfigurierbar|**Ja/Nein**: Der Admin kann entscheiden ob der Benutzer FollowMe-Einstellungen zu diesem Gerät über seinen Client vornehmen kann.|
|Aktiviert|**Ja/Nein**: Das Endgerät läutet bei einem eingehenden Anruf mit oder nicht.|
|Warten|Zeit in Sekunden, wie lange das Gerät wartet bis es mitklingelt bei einem eingehenden Anruf|
|Timeout|Zeit in Sekunden, wie lange das Gerät klingelt|

Die Einstellungen erfolgen für

* **Intern**: wenn der Anruf mobydick-intern erfolgt,
* **Extern**: wenn der Anruf über das Amt kommt,
* **Team**: wenn der Benutzer als Agent in einem Team angerufen wird.

**FollowMe über den Client steuern**

Darf der Benutzer (je nach Berechtigung) selber seine FollowMe-Einstellungen verwalten, kann er dies über seinen mobydick Desktop Client (`Einstellungen` > `FollowMe`) tun.

![FollowMe](/followme_einstellungen_client.png?width=100%)

Der Benutzer kann Einstellungen vornehmen für Anrufe von intern und extern und für Anrufe die aus einer Warteschlange kommen. Dafür wechselt er zwischen dem Tabs `Extern`, `Intern` und `Teams`.

|Einstellungen|Beschreibung|
|---|---|
|**Client kontrolliert**|Über dieses Auswahlmenü kann gewählt werden welches Telefon, falls mehrere vorhanden, über den Desktop Client kontrolliert wird.|
|**Meine Geräte**|Hier sind alle Telefone des Benutzers gelistet. Telefone zu denen der Benutzer keine FollowMe-Einstellungen vornehmen darf sind ausgegraut.<br>Der Benutzer kann Geräte aktivieren/deaktivieren, also entscheiden ob ein Telefon mitläutet oder nicht. Ebenfalls kann eine **Verzögerung** (Telefon wartet bis es mitläutet) und Dauer des **Läuten**s eingestellt werden.|

Zur Übersicht über die FollowMe-Einstellungen sieht man in der rechten Spalte eine grafische Übersicht über die Geräte und deren Zeiten.

<!--FIXME wenn Client fertig übersetzt ist Felder nochmal prüfen -->
<!-- ### Followme über den Mobility Client steuern -->
<!--FIXME mobility client!!!  -->
