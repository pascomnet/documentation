---
title: Telephone Provisioning via DHCP
description: Instead of coupling each individual desktop phone with the pascom phone system via provisioning URLs, you can also automatically distribute the provisioning URLs via DHCP
---
 
{{< doctype "self" >}} 

{{< description >}}

{{% notice warning %}}
DHCP provisioning is only possible when the desktop phones AND the pascom server are both located in the same local network!
{{% /notice %}}

## Using your Own DHCP Server (Recommended)

As a DHCP servers are already available in almost ever local network, it is recommended to update this DHCP server to deliver the provisioning URLs to the desktop phones.

### Allow DHCP Provisioning on the pascom Server

Per default, the local DHCP provisioning is activated. 

Should you have deactivated this function in the past, log into the pascom Management UI (not the phone system) and under `Interfaces` sekect the corresponding network card and click `Edit`. Activate the option `Allow local DHCP provisionioning` and save your new configuration.

### Configure the DHCP Server
{{% notice tip %}}
On Windows DHCP servers (or DHCP servers which follow this options schema), you will now need to set the **DHCP Option** **66** and possibly **67**. With Linux/Unix DHCP servers these options are known as **tftp-server-name** and **filename**.
{{% /notice  %}}

The provisioning URLs differ depending on the telephones to be deployed.

In the following example, please **replace** **[pascom_Server]** with the IP address or DNS name of your pascom server and **[phonesystemname]** with the name of your pascom phone system:

|Phone Manufacturer|Option 66 (tftp-server-name) |Option 67 (filename) |
|---|---|---|
|Snom|https://[pascom_Server]:8884/p/[phonesystemname]/{mac}||
|Yealink, Grandstream, Aastra, Mitel|https://[pascom_Server]:8884/p/[phonesystemname]/||
|Auerswald|https://[pascom_Server]:8884/p/[phonesystemname]/|\<MACADR\>|

Should you only wish to send these options exclusively to telephones, then you can restrict the use of the option to the manufactures used by you:

|Phone Manufacturer|MAC address|
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

Loggen Sie sich hierzu in das Management des pascom Servers ein, wählen unter `Schnittstellen` die entsprechende Netzwerkkarte aus und klicken auf `Bearbeiten`.

Aktivieren Sie die Optionen `Lokale DHCP Provisionierung erlauben` und `DHCP-Server`.

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
