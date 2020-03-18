---
title: Rollen
description: Mit Rollen können Sie den Benutzern, Teams, Geräten und Arbeitsplätzen diverse Rechte und Funktionen erteilen.
weight: 40
---

{{< doctype "both" >}}

{{< description >}}

## Training Video

{{< youtube vsqXY-HsueY >}}

## Konzept

Benutzer ebenso wie Geräte, Arbeitsplätze oder Teams können Mitglieder in einer oder mehreren Rollen sein. Der Rolle selbst können Eigenschaften und Rechte zugeteilt werden. Sie steuern telefonie-relevante Eigenschaften und Rechte wie bsw. die Erlaubnis Gespräche anderer Benutzer heranzuholen.

Rollen können eingerichtet werden unter {{< ui-button "Benutzer" >}} > {{< ui-button "Rollen" >}}.

Es gibt eine spezielle Rolle mit dem Namen **All Users**. Diese Rolle ist standardmäßig allen Benutzern, Geräten, Arbeitsplätzen und Teams zugeteilt und kann auch nicht entzogen werden.

Ein häufiger Anwendungsfall (und unsere Empfehlung) ist es, dass man pro Abteilung oder Team eine Rolle erstellt. 
*Z. B. ist es häufig gewünscht, dass Benutzer nur innerhalb Ihrer Abteilung Gespräche heranholen können und sich gegenseitig im pascom Client sehen. Dazu entziehen Sie einfach der Rolle All Users die Eigenschaft xmpp.group und weisen dies einer neuen Rolle z. B. Support zu in der Sie dann alle Support-Benutzer zu Mitgliedern machen.*


## Erstellen einer Rolle

Rollen sind unter  {{< ui-button "Benutzer" >}} > {{< ui-button "Rollen" >}} zu finden.

Um eine Rolle zu erstellen klicken Sie auf  {{< ui-button "Hinzufügen" >}}.

Geben Sie der Rolle eine Bezeichnung, je nach Zuweisung oder Funktion/ Recht der Rolle.
Optional können Sie in dem Feld Beschreibung Hinweise hinzufügen welchen Zweck diese Rolle erfüllt.

Sie können einer Rolle einen oder mehrere Rollentypen hinzufügen. Jeder Typ hat eine andere Funktion.

|Rollentyp|Beschreibung|Auswirkung|
|---|---|---|
|xmpp.supervisor|Benutzer mit dieser Rolle können Gespräche aller Benutzer managen. Wichtig für die TAPI.|Benutzer|
|location.group|Diese Rolle legt fest, welche Benutzer sich an Arbeitsplätzen anmelden können. Wird diese Rolle nicht konfiguriert, können sich Benutzer an allen Arbeitsplätzen anmelden. Wird eine solche Rolle angelegt, können sich Benutzer die nicht in einer Rolle location.group Mitglieder sind, nicht mehr an Arbeitsplätzen anmelden.|Benutzer, Arbeitsplätze|
|pickup.group|Alle Mitglieder der Rolle haben das Recht, eingehende Anrufe die an ein anderes Mitglied der Gruppe gerichtet sind, heranzuholen. Dies kann dann entweder per Telefon *8 oder Client erfolgen.|Benutzer, Rufgruppen, Warteschlangen|
|redirect.choice|Eine Identität mit diesem Rollentyp wird nie von einer anlagenbasierten Rufumleitung umgeleitet, sondern ruft immer das direkte Ziel.|Benutzer|
|xmpp.group|Alle Identitäten die eine Rolle mit dem Rollentyp xmpp.group zugewiesen haben, werden in eine XMPP shared Group eingebunden. D. h. in den Kontaktliste der Clients müssen sich diese Personen nicht mehr gegenseitig hinzufügen sondern sind sofort sichtbar. Falls Sie die xmpp.group der Rolle *All Users* zuordnen, sieht im Client immer jeder jeden.|Benutzer|
|redirect.group|Alle Benutzer in dieser Rolle haben das Recht für andere Benutzer Rufumleitungen setzen (via [Funktions-Code]({{<ref "/howto/featurecodes">}}))|Benutzer|

Jetzt können Sie der erstellten Rolle Benutzer, Teams, Geräte und/oder Arbeitsplätze zuweisen - je nach dem worauf sich der definierte Rollentyp auswirken soll.


## Anwendungsbeispiele

### Sichtbarkeit im Client

Wenn Sie Teams im [Desktop und Mobile Client]({{<ref "/clients">}}) sichtbar machen möchten benötigen Sie eine Rolle mit dem Rollentyp **xmpp.group**.

Beispiel:           
*Unter* {{< ui-button "Benutzer" >}} > {{< ui-button "Rollen" >}} > {{< ui-button "Hinzufügen" >}} *eine neue Rolle anlegen mit der Bezeichung "Support-Team".*               
*Weisen Sie unter* {{< ui-button "Rollentypen" >}} ***xmpp.group*** *hinzu.*             
*Weisen Sie unter {{< ui-button "Benutzer" >}} alle Benutzer des "Support" Team hinzu.*          
*Weisen Sie unter {{< ui-button "Teams" >}} das Team "Support" hinzu.*    
*Klicken Sie auf {{< ui-button "Speichern" >}} und wenden Sie die Änderungen an.*       
*Jetzt sehen alle Support-Benutzer in Ihrem Client eine eigene Kontaktliste "Support-Team" und unter der Kontaktanzeige "Teams" ist die Warteschlange "Support" sichtbar.*

Wenn Sie im Client angezeigt bekommen möchten, wer mit wem telefoniert, müssen Sie in der Weboberfläche der pascom Telefonanlage die Einstellung ***sys.xmpp.properties.roster.shownumbers*** auf "true" setzen. *(Verfügbar seit pascom 17.08)*


### Pickup

Grundsätzlich kann jeder Benutzer von jedem einen Anruf via *8 heranholen, bis irgendeine Rolle mit dem Rollentyp "pickup.group" angelegt wurde. Ab diesem Zeitpunkt muss das Pickup-Recht explizit definiert werden.

In einem Team ist es möglich einzustellen, welche Benutzer im pascom Client Pickup-Benachrichtigungen über eingehende Rufe erhalten. 
Wenn die zu benachrichtigenden Benutzer nicht in der Pickup-Konfiguration im [Team]({{<ref "/teams/configuration#pickup-benachrichtigungen">}}) abgedeckt werden können ist das Erstellen einer Pickup-Gruppe notwendig. 

Mit einer Pickup-Rolle vom Typ **pickup.group** ist es auch möglich einzustellen, dass Benutzer untereinander eingehende Anrufe von intern oder extern heranholen können.

Beispiel:       
*Unter* {{< ui-button "Benutzer" >}} > {{< ui-button "Rollen" >}} > {{< ui-button "Hinzufügen" >}}      
*eine neue Rolle anlegen mit der Bezeichung "Pickup-Gruppe".*        
*Weisen Sie unter* {{< ui-button "Rollentypen" >}} ***pickup.group*** *hinzu.*  
*Weisen Sie unter {{< ui-button "Teams" >}} das betroffen Team hinzu.*   
*Weisen Sie unter {{< ui-button "Benutzer" >}} die gewünschten Benutzer hinzu.*       
*Klicken Sie auf {{< ui-button "Speichern" >}} und wenden Sie die Änderungen an.*

*Anschließend können Sie im [Team]({{<ref "/teams/configuration#pickup-benachrichtigungen">}}), das zur angelegten Pickup-Rolle gehört festlegen, dass die Pickup-Gruppe als Regelung verwendet werden soll.*


### Rufumleitung durchbrechen

Wenn Benutzer 'A' trotz eingerichteter Rufumleitung bei Benutzer 'B' diesen dennoch intern direkt erreichen möchte, ohne dass die Rufumleitung bei ihm greift, wird eine Rolle mit dem Rollentyp **redirect.choice** benötigt. Jeder Benutzer in dieser Rolle durchbricht die Rufumleitungsregel und wird direkt zur gewählten Nebenstelle durchgestellt.

Beispiel:           
*Unter* {{< ui-button "Benutzer" >}} > {{< ui-button "Rollen" >}} > {{< ui-button "Hinzufügen" >}} *eine neue Rolle anlegen mit der Bezeichung "Chef Redirect".*               
*Weisen Sie unter* {{< ui-button "Rollentypen" >}} ***redirect.choice*** *hinzu.*             
*Weisen Sie unter {{< ui-button "Benutzer" >}} den Benutzer "Chef" hinzu.*           
*Klicken Sie auf {{< ui-button "Speichern" >}} und wenden Sie die Änderungen an.*       
*Jetzt erreicht der Benutzer "Chef" trotz eingerichteter Rufumleitung immer alle anderen Benutzer direkt.*


### TAPI

Wenn Sie in Ihrer Windows Umgebung die [pascom TAPI]({{<ref "/clients/tapi-installation">}}) verwenden möchten wird eine eigene Rolle benötigt.
Erstellen Sie dazu eine eigene Rolle mit dem Rollentyp **xmpp.supervisor** und weisen Sie im Falle von einem Terminal Server einen Benutzer hinzu, über den die Telefonie gesteuert werden soll.

Beispiel:           
*Unter* {{< ui-button "Benutzer" >}} > {{< ui-button "Rollen" >}} > {{< ui-button "Hinzufügen" >}} *eine neue Rolle anlegen mit der Bezeichung "TAPI-Benutzer".*            
*Weisen Sie unter* {{< ui-button "Rollentypen" >}} ***xmpp.supervisor*** *hinzu.*           
*Weisen Sie unter {{< ui-button "Benutzer" >}} den Benutzer "Superuser" hinzu.*            
*Klicken Sie auf {{< ui-button "Speichern" >}} und wenden Sie die Änderungen an.*       


### flexible Arbeitsplätze

Wenn Ihre Mitarbeiter in Ihrem Unternehmen keine festen Arbeitsplätze haben oder bestimmte Mitarbeiter regelmäßig Ihre [Arbeitsplätze]({{<ref "/concept/user">}}) wechseln (zb. auch ins Homeoffice) ist es ratsam die entsprechenden Geräte in Ihrer pascom Anlage nicht Benutzern direkt, sondern einem [Arbeitsplatz]({{<ref "/user/user#arbeitsplatz">}}) zuzuweisen.

Standardmäßig kann sich jeder Benutzer an jedem Arbeitsplatz in Ihrer pascom Telefonanlage anmelden.
Möchten Sie dies verhindern und jedem Benutzer nur bestimmte Arbeitsplätze anbieten/ zugänglich machen benötigen Sie hierfür eine Rolle mit dem Rollentyp **location.group**.

Diese Konfiguration ist dann für jeden Benutzer, der Arbeitsplätze flexibel nutzen möchte, notwendig.

Beispiel:       
*Unter* {{< ui-button "Benutzer" >}} > {{< ui-button "Rollen" >}} > {{< ui-button "Hinzufügen" >}} *eine neue Rolle anlegen mit der Bezeichung "Arbeitsplatz Praktikant".*               
*Weisen Sie unter* {{< ui-button "Rollentypen" >}} ***location.group*** *hinzu.*             
*Weisen Sie unter {{< ui-button "Benutzer" >}} den Benutzer "Praktikant" hinzu.*           
*Weisen Sie unter {{< ui-button "Arbeitsplätze" >}} den oder die verfügbaren/ erlaubten Arbeitsplätze hinzu.*               
*Klicken Sie auf {{< ui-button "Speichern" >}} und wenden Sie die Änderungen an.*           
*Jetzt kann sich der Benutzer "Praktikant" nur an den zugewiesenen Arbeitsplätzen anmelden.*


### Rufumleitung setzen

Wenn ein Benutzer das Recht haben soll für andere Benutzer via [Funktions-Codes]({{<ref "/howto/featurecodes">}}) eine Rufumleitung einzustellen wird eine Rolle mit dem Rollentyp **redirect.group** benötigt.

Beispiel:       
*Unter* {{< ui-button "Benutzer" >}} > {{< ui-button "Rollen" >}} > {{< ui-button "Hinzufügen" >}} *eine neue Rolle anlegen mit der Bezeichung "Rufumleitungen".*               
*Weisen Sie unter* {{< ui-button "Rollentypen" >}} ***redirect.group*** *hinzu.*             
*Weisen Sie unter {{< ui-button "Benutzer" >}} den Benutzer "Sekretärin" hinzu.*         
*Klicken Sie auf {{< ui-button "Speichern" >}} und wenden Sie die Änderungen an.*       
*Jetzt kann die Benutzerin "Sekretärin" für einen Benutzer mit der Durchwahl 15 via Funktionscode \*7415#100 eine Rufumleitung auf die Zentrale mit der Durchwahl 100 setzen.*

