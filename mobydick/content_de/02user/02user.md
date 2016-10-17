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
linken: /server/automation/
url: /benutzer/benutzer-und-arbeitsplaetze/
prev: /benutzer/
next: /benutzer/teams-bilden/
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

Haben Sie jedoch Benutzer die den Arbeitsplatz wechseln oder an manchen Tagen von zu Hause aus arbeiten sollten Sie Ihre Telefone nicht direkt dem Benutzer sondern **Arbeitsplätzen** zuweisen.

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
|System Administrator|Die höchste Rechte-Stufe. Der System Administrator hat alle verfügbaren Rechte.|
|Administrator| Rechte wie der System-Administrator jedoch **ohne**: <br> - mobydick Update <br> - Sicherung des kompletten Systems <br> - Dienste-Einstellungen <br> - mobydick herunterfahren/neustarten <br> - Netzwerk-Konfiguration <br> - Cluster Management|
|Telefonie Verwaltung|Rechte wie der Administrator jedoch **ohne**: <br> - Verwaltung von Gateways/Ämter <br> - Restart von Diensten <br>- Datenbank-Backup und Wiederherstellung <br> - Endgeräte-Firmware ausrollen <br> - mobydick Connector <br>- Cronjob-Verwaltung|
|Telefonbuch Verwaltung|Der Benutzer kann das mobydick Telefonbuch bearbeiten.|

### Voicemailbox

Jedem Benutzer wird automatisch eine persönliche Voicemailbox zugeteilt. Standardmäßig existiert diese zwar, Anrufer werden aber noch nicht auf die Voicemailbox abgeworfen.

Zuerst muss festgelegt werden, wie mit den Voicemails umgegangen werden soll. Unter `Benutzer` > `Benutzerliste` > Benutzer auswählen und `Bearbeiten` im Tab `Basisdaten` finden Sie folgende Einstellungsmöglichkeiten:

|Einstellung|Beschreibung|
|---|---|
|**Voicemails speichern**|**JA** bedeutet, die Voicmails werden nach dem Versenden oder nachdem sie abgehört werden auf der mobydick gespeichert bleiben. Durch einen Cronjob können ältere Voicemails gelöscht werden.<br>**NEIN** bedeutet, dass die Voicemails nach dem Versenden per E-Mail von der mobydick gelöscht werden. Diese Einstellung ist zu empfehlen, da Voicemails viel Speicherplatz verwenden.|
|**Voicemail Email**|An diese E-Mail-Adresse werden die Voicmails verschickt.|
|**Überwachte Voicemailbox**|Als Standardeinstellung wird die eigene Voicemailbox überwacht. Hier kann man die Voicemailbox eines anderen Benutzers auswählen.|

Anschließend muss die Voicemailbox als Aktion hinterlegt werden, falls das nicht schon bei der Benutzerlanlage geschehen ist.

### Alternative CallerID (CID Nummer)

Beim Anlegen erhält der Benutzer eine eigene Durchwahl unter der er angerufen werden kann. Im Normalfall wird einem anderen Teilnehmer diese Durchwahl auch angezeigt, wenn er von dem Benutzer angerufen wird. Wird dies nicht erwünscht, so kann unter Unter `Benutzer` > `Benutzerliste` > Benutzer auswählen und `Bearbeiten` im Tab `Basisdaten` eine alternative **CID Nummer** angegeben werden.

{{% notice tip %}}
Soll ein Benutzer bei externen Anrufen eine andere Durchwahl als seine eigene signalisieren, konfigurieren Sie das bitte im Amt unter Ausgehende Rufe.
{{% /notice %}}

### Telefonbuch

Standardmäßig erhält jeder Benutzer einen Eintrag im **Telefonbuch** mit seinem **Anzeigenamen** und seiner **Durchwahl**. Hier hat man die Möglichkeit weitere Daten einzugeben. Der Eintrag ist dann auf mobydick Client, Mobility Client und IP-Telefonen verfügbar.

Es ist auch möglich den Telefonbucheintrag zu **deaktivieren**, falls nicht erwünscht ist, dass mache Einträge nicht für alle mobydick Benutzer sichtbar sind.

Einstellungen zum Benutzer-Telefonbucheintrag können Sie unter `Benutzer` > `Benutzerliste` > Benutzer auswählen und `Bearbeiten` im Tab `Telefonbuch` vornehmen.

### Virtuelles Faxgerät

Unter `Benutzer` > `Benutzerliste` > Benutzer auswählen und `Bearbeiten` im Tab `Faxgerät` können Sie dem Benutzer ein virtuelles Faxgerät anlegen. Das virtuelle Faxgerät benötigt eine **E-Mail-Adresse**, über die Faxe, oder Bestätigungen über gesendete Faxe empfangen werden können und eine **Durchwahl**.

### Endgerät
Teilen Sie dem Benutzer fix persönliche Endgeräte zu.
![Screenshot - Endgeräte verwalten in der mobydick](../../images/benutzer_endgeraete_verwalten.png?width=90% "Endgeräte verwalten beim Benutzer")

Einem Benutzer können beliebig viele Endgeräte zugeteilt werden. Standardmäßig leuten bei einem Anruf alle zugeteilten Endgeräte gleichzeitig für 999 Sekunden. Die Bedeutung von der verschiedenen **Warten** und **Läuten** Werte können Sie unter [FollowMe Prinzip der mobydick](#followme-prinzip-der-mobydick) nachlesen.

Wird der Anruf nicht entgegengenommen greifen die Aktionen **Extern/Nacher** oder **Intern/Nachher**. <!-- //Fix --> Me Siehe Aktionen für Details.

### Arbeitsplatz

Hier können Sie dem Benutzer einen Arbeitsplatz zuteilen bzw. sehen an welchem Arbeitsplatz der Benutzer aktuell arbeitet.
Ein Benutzer kann immer nur einen Arbeitsplatz nutzen, dem Arbeitsplatz wiederum können aber mehrere Telefone zugeteilt werden.

### Rollen

Definiert in welchen Rollen der jeweilige Benutzer Mitglied ist. Siehe [Rollen](#rollen-und-damit-verbundene-rechte) für Details.

### Aktionen (intern, extern, voher, nachher)

Mit Aktionen steuern Sie den Anruf Ablauf. <!-- //FixME --> Details siehe Aktionen und Anrufablauf steuern.

### Arbeitsplätze anlegen (optional)
Legen Sie unter `Benutzer > Arbeitsplätze` einen neuen Arbeitsplatz an indem Sie auf `+Hinzufügen` klicken.
![Screenshot - Arbeitsplatz verwalten in der mobydick](../../images/benutzer_arbeitsplatz_verwalten.png?width=90% "Arbeitsplatz anlegen")
Der Arbeitsplatz benötigt lediglich eine **Bezeichnung**. Dann können Sie Geräte zuteilen.

Sie haben die Möglichkeit gleich an dieser Stelle einen Benutzer zuzuteilen allerdings kann der Benutzer selbst jederzeit diesen Arbeitsplätze per mobydick Client und Menü-Taste am SNOM, Aastra oder Yealink Telefon wechseln.

### Benutzer und Arbeitsplätze importieren

Haben Sie relativ viele Benutzer können Sie diese importieren und auch die Telefone und Arbeitsplätze automatisch zuweisen lassen. <!--//FixMe -->Details siehe Daten importieren.


## Rollen und damit verbundene Rechte

### Übersicht
Benutzer, Geräte, Arbeitsplätze oder Teams können Mitglieder in einer oder mehreren Rollen sein. Der Rolle selbst können Eigenschaften und Rechte zugeteilt werden.

Rollen steuern "Telefonie-Relevante" Eigenschaften und Rechte wie beispielsweise die Erlaubnis Gespräche anderer Benutzer heranzuholen, usw. und können außerdem nicht nur Benutzer sondern auch Geräte, Arbeitsplätze oder Teams als Mitglieder enthalten.

### Spezielle Rolle "Alle"
Es gibt eine spezielle Rolle mit dem Namen **All Users**. Diese Rolle ist standardmäßig allen Benutzern, Geräten, Arbeitsplätzen und Teams zugeteilt und kann auch nicht entzogen werden.

### Abteilungsweise Rollen erstellen
Ein häufiger Anwendungsfall (und unsere Empfehlung) ist es, dass man pro Abteilung oder Team eine Rolle erstellet. Z. B. ist es häufig gewünscht, dass Benutzer nur innerhalb Ihrer Abteilung Gespräche heranholen können und sich gegenseitig im mobydick Client sehen. Dazu entziehen Sie einfach der Rolle "Alle" die Eigenschaft xmpp.group und weisen dies einer neuen Rolle z. B. Support zu in der Sie dann alle Support Benutzer zu Mitgliedern machen.  

### Eigenschaften und Rechte
#### location.group
In dieser Rolle können Benutzer und Arbeitsplätze hinzugefügt werden. An Arbeitsplätzen die einer Rolle mit dem Typ location.group angehören können sich nur Benutzer anmelden, die der selber Rolle angehören. Zu Beachten ist, dass sobald eine Rolle mit der Eigenschaft location.group erstellt wurde, für alle Benutzer und Arbeitsplätze eine solche Rolle existieren muss. Sonst können sich Benutzer ohne diese Rolle an keinem Arbeitsplatz anmelden.

Auswirkung: Benutzer, Arbeitsplätze

#### billing.group
Abrechnungsgruppe des Billing Moduls. Dient zur Gruppierung der Gesprächsdaten.

Auswirkung: Benutzer, Rufgruppen, Warteschlangen

#### xmpp.supervisor
Benutzer mit dieser Rolle können Gespräche aller Benutzer managen. Wichtig für Flexpanel und TAPI.

Auswirkung: Benutzer

#### pickup.group
Alle direkten Mitglieder der Rolle haben das Recht, eingehende Anrufe die an ein anderes Mitglied der Gruppe gerichtet sind, heranzuholen. Dies kann dann entweder per Telefon * \*8<durchwahl> oder Client erfolgen.

Auswirkung: Benutzer, Teams

#### redirect.choice
Eine Identität mit diesem Rollentyp wird nie von einer anlagenbasierten Rufumleitung umgeleitet, sondern ruft immer das direkte Ziel.

Auswirkung: Benutzer

#### redirect.group
Definition einer Anlagenbasierte Rufumleitungen und Rufumleitungsgruppen.

Auswirkung: Benutzer

#### xmpp.group
Alle Identitäten die eine Rolle mit dem Rollentyp xmpp.group zugewiesen haben, werden in eine XMPP shared Group eingebunden. D.H. in den Kontaktliste der Clients müssen sich diese Personen nicht mehr gegenseitig hinzufügen sondern sind sofort sichtbar. Falls Sie die xmpp.group der Rolle Alle Identitäten zuordnen, sieht im Client immer jeder jeden.

Auswirkung: Benutzer

## FollowMe Prinzip der mobydick
Benutzern und Arbeitspätzen können mehrere Telefone zugewiesen werden. Die Konfiguration, welches Telefon wann und wie lange läutet, bezeichnen wir als Followme.
![Illustration - FollowMe Prinzip mobydick](../../images/benutzer_followme.png?width=90% "Endgeräte folgen Ihnen")
Jedem Telefon kann der Parameter **Warten** und **Läuten** in Sekunden angegeben werden.

**Warten** definiert den Zeitraum zwischen einem eintreffenden Anruf und dem Zeitpunkt zu dem das Telefon zu läuten beginnen soll.  
**Läuten** definiert wie lange das Telefon gerufen werden soll.

Außerdem können sich Telefone bei internen anrufen anders verhalten als bei externen oder bei Anrufen die Sie als Agenten eines Teams erreichen. Daher gibt es die Parameter Warten und Läuten jeweils pro Telefon für **intern, extern** und **agent**.

Aktuell kann das Followme nur vom Administrator eingestellt werden. In zukünftigen Version soll dies auch vom Benutzer selbst in mobydick Client und Mobility Client erledigt werden können.
