---
title: Telefon-Provisonierung via DHCP
description: Statt jedes einzelne Hardware Telefon mit dem pascom Server per URL zu pairen können Sie Provisionierungs-URLs auch per DHCP automatisiert übergeben
---
 
{{< doctype "self" >}} 

{{< description >}}

{{% notice warning %}}
Die DHCP Provisionierung ist nur möglich wenn sich die Telefone und der pascom Server im gleichen, lokalen Netzwerk befinden!
{{% /notice %}}

## Eigenen DHCP-Server verwenden (empfohlen)

Da in fast allen, lokalen Netzwerken bereits ein DHCP-Server vorhanden ist empfiehlt es sich diesen anzupassen um die Provisionierungs-URLs an die Telefone zu übergeben.

### DHCP Provisionierung am pascom Server erlauben

Standardmäßig ist die lokale DHCP Provisionierung aktiviert. 

Haben Sie diese in der Vergangenheit deaktiviert, loggen Sie sich in das Management des pascom Servers ein, wählen unter {{< ui-button "Schnittstellen" >}} die entsprechende Netzwerkkarte aus und klicken auf {{< ui-button "Bearbeiten" >}}. Aktivieren Sie die Option {{< ui-button "Lokale DHCP Provisionierung erlauben" >}} und speichern Sie die Konfiguration ab.

### DHCP-Server konfigurieren
{{% notice tip %}}
Beim Windows DHCP-Server (oder anderen DHCP Servern die diesem Optionsschema folgen) müssen Sie die **DHCP-Option** **66** und ggf. 
die  **67** setzen. Bei Linux/Unix DHCP-Servern heißen die Optionen **tftp-server-name** und **filename**.
{{% /notice  %}}
Je nach verwendeten Telefonen unterscheiden sich die Provisionierungs-URLs.

**Ersetzen** Sie folgedem Beispiel **[pascom_Server]** mit der IP-Adresse oder DNS-Namen des pascom Servers und **[Telefonanlagenname]** mit dem Namen Ihrer Telefonanlage:

|Telefonhersteller|Option 66 (tftp-server-name) |Option 67 (filename) |
|---|---|---|
|Snom|http://[pascom_Server]:8880/p/[Telefonanlagenname]/{mac}||
|Yealink, Grandstream, Aastra, Mitel|http://[pascom_Server]:8880/p/[Telefonanlagenname]/||
|Auerswald|http://[pascom_Server]:8880/p/[Telefonanlagenname]/|\<MACADR\>|

Falls Sie diese Optionen ausschließlich an Telefone versenden möchten können Sie die Vergabe dieser Option auf den von Ihnen 
verwendeten Hersteller einschränken:

|Telefonhersteller|MAC-Adresse|
|---|---|
|Snom|00-04-13-\*-\*-\*|
|Yealink|00-15-65-\*-\*-\*|
|Grandstream|00-0B-82-\*-\*-\*|
|Aastra|00-08-5D-\*-\*-\*|
|Auerswald|00-09-52-\*-\*-\*|

### Provisionierung testen

Setzen Sie ein Hardware Telefon auf Werkseinstellungen zurück. Funktioniert der DHCP-Server mit den Optionen korrekt konfiguriert sich das Telefon nun automatisch. War das provisionieren erfolgreich sehen Sie im Display des Telefones "Nur Notrufe" oder den Namen des zugewiesenen Benutzers oder Arbeitsplatzes.

## pascom DHCP-Server verwenden

Alternativ können Sie auch den DHCP-Server der pascom nutzen.

Loggen Sie sich hierzu in das Management des pascom Servers ein, wählen unter {{< ui-button "Schnittstellen" >}} die entsprechende Netzwerkkarte aus und klicken auf {{< ui-button "Bearbeiten" >}}.

Aktivieren Sie die Optionen {{< ui-button "Lokale DHCP Provisionierung erlauben" >}} und {{< ui-button "DHCP-Server" >}}.

Konfigurieren Sie den DHCP-Server:

|Option|Beschreibung|Beispiel|
|---|---|---|
|DHCP-Modus|**Alle Anfragen:** Alle DHCP Anfragen beantworten <br> **Nur unterstützte Telefone:** Nur IP-Adressen an unterstützte Telefone verteilen ||
|DHCP Bereich von|Erste IP-Adresse die vom DHCP vergeben werden soll|192.168.1.100|
|DHCP Bereich bis|Letzte IP-Adresse die vom DHCP vergeben werden soll|192.168.1.150|
|DHCP Gateway|Gateway des Netzwerks|192.168.1.1|
|DHCP DNS|DNS Server|192.168.1.1|
|Telefonanfragen zu dieser Telefonanlage weiterleiten|pascom|Name der Telefonanlage an die Provisionierungs-Anfragen weiter gegeben werden sollen|

Speichern Sie die Konfiguration ab.

### Provisionierung testen

Setzen Sie ein Hardware Telefon auf Werkseinstellungen zurück. Funktioniert der DHCP-Server mit den Optionen korrekt konfiguriert sich das Telefon nun automatisch. War das provisionieren erfolgreich sehen Sie im Display des Telefones "Nur Notrufe" oder den Namen des zugewiesenen Benutzers oder Arbeitsplatzes.
