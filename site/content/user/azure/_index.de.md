---
title: Microsoft Azure Active Directory Integration (aadds)
description: Synchronisieren und Authentifizieren Sie Ihre Benutzer gegen den Microsoft Azure Active Directory Service
weight: 60
---

{{< doctype "both" >}}

{{< description >}}

![Microsoft Azure](microsoft-azure-logo.png?width=70%)

## Über Azure Active Directory Domain Services (aadds)

Dies ist ein "klassischer" Domain-Server als Cloud-Dienst, der in Azure gehostet wird. Er ist mit dem Azure AD “gekoppelt” und synchronisiert die Benutzer automatisch.

Dieser Dienst kann verwendet werden, um klassische Domänenserver-Implementierungen in Azure zu erstellen und auf verschiedene Weise mit einer Vor-Ort-Domäne gekoppelt werden.

Er ist auch die Komponente, die notwendig ist, um ein Azure AD mit öffentlichem LDAPS-Zugriff zu erweitern, was für die Verbindung von Legacy-Anwendungen mit der Azure-Cloud nützlich ist.

[Mehr Informationen zu Microsoft aadds](https://techcommunity.microsoft.com/t5/apps-on-azure/let-s-talk-about-azure-active-directory-and-the-microsoft/ba-p/1571939)


## Aadds einrichten

Der aktuelle AD-Connector arbeitet nicht gegen einen Azure AD, stattdessen ist eine Azure Active Directory Domain Services-Installation mit aktiviertem LDAPS-Zugriff erforderlich.

Für die Einrichtung von Aadds kann die [offizielle Dokumentation](https://docs.microsoft.com/en-us/azure/active-directory-domain-services/tutorial-create-instance) verwendet werden, ebenso für die LDAPS-Konfiguration.


## Authentifizierung auf der pascom einrichten

Richten Sie den LDAP Dienst auf der pascom Telefonanlage ein, indem Sie in der pascom Web-UI unter dem
Menüpunkt {{< ui-button "Appliance" >}} > {{< ui-button "Dienste" >}} auf {{< ui-button "Authentifizierung" >}} klicken.

Füllen Sie die Felder mit folgenden Parametern aus.

|Feld|Beschreibung|
|---|---|
|LDAP-Authentifizierung aktiviert|ja|
|LDAP Host|ldaps://aadds.ihreDomain.de|
|LDAP Suchpfad|DC=aadds,DC=ihreDomain,DC=de|
|LDAP Benutzername-Feld|sAMAccountName|
|LDAP Proxy-Benutzer-DN|IhreEmail@onmicrosoft.com|
|LDAP Proxy-Passwort|Ihr Passwort|  

<br/>

![Setup Authentifizierung](setup-auth.de.png?width=80%)


## Connector-Profil "Benutzer aus AD

Erstellen Sie ein neues Connector-Profil indem Sie in der pascom Web-UI unter dem
Menüpunkt {{< ui-button "Erweitert" >}} > {{< ui-button "Connector" >}} auf {{< ui-button "Hinzufügen" >}} klicken.

Wählen Sie die Vorlage *Benutzer aus AD* und tragen Sie folgende Daten ein:

|Feld|Beschreibung|
|---|---|
|**Bezeichung**|Name des Connectors|
|**AD Domäne**|Domain Name z.B. aadds.IhreDomain.de|
|**AD Server**|Server IP oder DNS-Name z.B. aadds.IhreDomain.de|
|**Benutzername** und **Passwort**|Der zuvor im AD angelegte pascom Benutzer zur Authentifizierung|
|**Authentifizierung konfigurieren**|**NEIN**: Benutzer werden nur importiert und authentifizieren sich gegen die pascom<br>**JA**: Benutzer werden importiert und können sich gegen den AD authentifizieren. In diesem Fall wird die Authentifizierung eingerichtet und Sie können unter {{< ui-button "Appliance" >}} > {{< ui-button "Dienste" >}} im Reiter {{< ui-button "Authentifizierung" >}} bei Bedarf anpassen.|
|**pascom Softphone anlegen**|**JA**: Legt automatisch für jeden importierten Benutzer ein pascom Softphone an. **NEIN**: Legt für keinen importierten Benutzer ein pascom Softphone an.|
|**Mobilgerät anlegen**|**JA**: Legt automatisch für jeden importierten Benutzer ein Mobiltelefon mit der hinterlegten Mobilrufnummer an. **NEIN**: Legt für keinen importierten Benutzer ein Mobiltelefon an.|


### Importlauf testen und aktivieren

Nachdem Sie die Konfiguration abgeschlossen haben, können Sie durch die Schaltfläche {{< ui-button "Speichern und Simulieren" >}} testen welche Datensätze importiert werden würden. Wenn Sie mit dem Ergebnis zufrieden sind können Sie den Import entweder einmalig unter {{< ui-button "Aktion" >}} > {{< ui-button "Import jetzt durchführen" >}} ausführen oder durch die Schaltfläche {{< ui-button "Automatisieren" >}} eine regelmäßige Durchführung des Importes einrichten.

{{% notice warning %}}
Bitte beachten Sie das der Konnektor nach dem Speichern beim Benutzernamen im Konnektorprofil selbst und auch bei der LDAP Authentifizierung den Domain Namen dahinter setzt. Löschen Sie hier bitte die Domain.
{{% /notice %}}

![Fehler](delete_mail.de.png?width=80%)

### Authentifizierung testen

Haben Sie in der Vorlage *Authentifizierung konfigurieren* auf *JA* gesetzt können Sie nun unter {{< ui-button "Appliance" >}} > {{< ui-button "Dienste" >}}
im Reiter {{< ui-button "Authentifizierung" >}} mit der Schaltfläche {{< ui-button "Anmeldung Testen" >}} testen ob die Authentifizierung Ihrer Benutzer funktioniert.

{{% notice info %}}
Für eine Authentifizierung der Benutzer gegen die Azure AD muss der Benutzer auf der pascom Telefonanlage genauso heissen, wie in der AD von Azure (sAMAccountName)
{{% /notice %}}


