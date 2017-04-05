---
title: Yealink T4 Series VoIP Phones
keywords: 
    - Yealink T40P integration
    - Yealink T41P integration
    - Yealink T41S integration
    - Yealink T42G integration
    - Yealink T46G integration
    - Yealink T48P integration
    - Yealink IP Desktop Phones 
description: How to integrate Yealink IP endpoints in your pascom PBX, including the T40P, T41P, T42G, T46G and T48G
url:  /endpoints/yealink-ip-telephones-t4-series/
linkde: /endgeraete/yealink-ip-tischtelefone-t4-serie/
prev: /endpoints/snom-ip-telephones-300-700-series/
next: /endpoints/grandstream-ip-telephones-gxp-gxv-series/
weight: 42
toc: true
draft: false
---


![Yealink T46G](/yealink-t4-series1.jpg?width=400px)


## Compatibility

|Provisioning|Firmware Management|Desktop Client CTI Control|pascom Menu|
|---|---|---|---|
|yes|yes|yes|yes|

**Provisioning**: The IP phone is manageable via the PBX web UI.<br>
**Firmware Management**: Firmware can be managed and updated via the PBX web UI.<br>
**Desktop Client CTI Control**: The desktop UC client can remotely control the phone, i.e. to start calls.<br>
**pascom Menu**: A phone touch key will be assigned to access the pascom Menu. 

{{% notice tip%}}
Yealink phones have an additional menu key for the phone options.  
{{% /notice %}}

## Configuration

With [our VoIP Software] (https://www.pascom.net/en/mobydick-voip/ "pascom VoIP phone systems") it is possible to centrally and automatically configure the majority of Yealink IP Telephones. This process is know as `Provisioning`. For this purpose, pascom phone systems include a Default Configuration (`Devices > Basic Configuration`). For most deployment scenarios, these standard settings provide a sufficient set of parameters. However, in some cases, the settings may need to be modified.

{{% notice tip%}}
By new installations, you should first test the provisioning process with a telephone. Should this be successful then you will be able to deploy further telephones.
{{% /notice %}}

### Preparation

In order to automatically deploy (AutoProvision) Yealink Telephones, a functioning DHCP server is required.
[Network Planning and Configuration](../../server/network-configuration/).

### Device Commissioning

Connect the phone to your network. Yealink IP phones come with a built in switch, allowing you to connect the phone directly via the Ethernet port labelled as **Internet**. Should you not have a **PoE** option available, connect the phone to a power supply.

The Yealink IP phone will now boot and will be The phone will now boot and acquires an IP address and the corresponding Basic Configurations via DHCP. After this process is completed, the device will automatically appear under `device` > `device list` as well as adding the appropriate SIP peer.

As mentioned above, for every device mobydick will also automatically add a SIP peer. In addition, the device username and password will also be automatically generated. The username consists of a randomly generated string followed by the last six digits of the device’s MAC address (15 digits in total). As the IP phones are automatically provisioned, you will not be required to enter this data manually and it is not possible to modifiy the user data. This is designed to considerably increase security against SIP Brute Force attacks.

The Device Name will be automatically added as signified by the vendor (Yealink) and the MAC Address. On most IP phones, the MAC address is noted on the device housing, allowing phones to be more simply deployed on site in the correct locations.

After a successful provisioning, the IP phone display should show to correct language and time as well as the text `Emergency Only`

{{% notice info%}}
After the successful phone provisioning, the admin user will be reset by the PBX with the following credentials:  
<br>Username: *admin*
<br>Password: *0000*
{{% /notice  %}}

The Telephone Admin User Password can be changed within the Web UI under system settings. Use the search box and search for the parameter *sys.peripherals.access.password* and enter your desired password. Finally, you will be required to manually apply the Telephony Configurations and restart the endpoint.

### Assigning Users

As soon as the IP phone has appeared in the Device List, it can be edited via the `Edit` button. Under the `Assign` tab, the phone can be assigned to a [user (or location)](../../users/users-and-locations/). 

After saving your assignments and reapplying the telephony configurations, all affected IP phones will restart.

### Function Testing

The simplest method of testing whether a device has been successfully deployed is to call ones Voicemail box via **\*100**. On successfully provisioned phones, you should now hear your Voicemail box prompts.

### pascom Menu Key

<!--FIXME Menütaste  -->

<!--After the provisioning process, the **Menu** button on Yealink phones is no longer assigned to the Telephone Menu, but rather to a telephone specific pascom Menu making the following functions available:-->

|Function|Description|
|---|---|
|Telephone Book|Opens up the central PBX phonebook.|
|Journal|Displays answered, dialled and missed calls|
|Call Forwarding|Sets a call forwarding, activates / updates a previously configured call forwarding or deactivates an active call forwarding.|
|Voicmail Box|Voicemail box menu for activating/deactivating your mail box, plus message play backs|
|Login|Enables a user to log into the location where the phone is (Hotdesking / roaming users).|
|Logout [*username*]|Logs out the current user from this location.|
|Teams (Queues)<!--FIXME-->|Is used for agent management within a queue (login, logout, pause..) according the configuration of the queue.|


{{% notice tip%}}
Only set Call Forwardings via the pascom menu as they can then be managed by the PBX.
{{% /notice %}}

{{% notice info%}}
 Using the DND key (*do not disturb*) directly on your Yealink phone, ensures that the assigned user extension cannot be reached on the phone. The DND notice will appear only on the telephone itself and will have no impact on other endpoints or the Desktop UC client (softphone).
{{% /notice %}}

### Accessing the Yealink Web UI

In order to access your telephone's web UI, you will need to know the phone's IP address. The following outlines the different methods of discovering the phone IP Address:

**Finding the IP-Address on the Telephone**

Press the **OK** key when the phone idle screen is active and the phone IP address, MAC Address and firmware will be displayed.

Alternatively, it is possible to call up the IP address via the phone **menu** key and selecting the **status** option. 

**Finding the IP-Address via the Web UI Device List**

Log into the PBX Web UI and select the `Devices` > `Device list`, which provides you an overview of all available devices. To the left of each entry is an *Info* symbol which when clicked will open an overview of the provisioned telephone including the IP address.

### Function Keys

The function keys to the right and left of the Yealink phone's screen support a 3 page view, meaning they can be assigned with 3 different functions for each page. Should the first page be fully assigned, the last key (bottom right) will display pages numbers with the current page highlighted.

**BLF Key User / Extension Monitoring**

Using the function keys, it is possible to monitor other extensions (i.e. users). The BLF keys (Busy Lamp Field) can be used to provide status information relating to the monitored extension. In this scenario, monitoring means watching the extension to see if the user is currently on the phone, being called or to answer calls intended for this extension (call pickup).

Function Keys can be assigned in a variety of ways.

**Direct on the Yealink Phone**

Push and hold the function key on the phone which you wish to configure for 5 seconds. At this point you will be able to assign this key with a function (e.g. BLF key).

|Settings|Assignement|
|---|---|
|Type|BLF|
|Account ID|Line 1|
|Label|Enter a name for the key.|
|Value|The extension to be monitored, e.g. 123 for the ext 123|

To confirm, press *Save*.

**Via the Web UI**

Under the tab `DSSKeys` it is possible to assign the various telephone keys as BLF keys for example:

|Type|Value|Label|Line|Extension|
|---|---|---|---|
|BLF|Die zu überwachende Durchwahl, z. B. 123 für die Durchwahl 123|Geben Sie hier eine Bezeichnung für die Taste an.|Leitung 1|

Neben Benutzer-Durchwahlen können auch Einbuchcodes für Warteschlangen oder Durchwahlschalter konfiguriert werden.

**Weitere nützliche Funktionstasten**

|Funktionstaste|Beschreibung|
|---|---|
|**Speed Dial**|Hier kann eine Telefonnummer hinterlegt werden.|
|**DTMF**|Hier können DTMF-Zeichen hinterlegt werden.| -->

### Basis-Konfiguration

Wie bereits erwähnt, werden Yealink IP-Telefone  mit Hilfe der Basis-Konfiguration provisioniert. Die Basis-Konfiguration ist unter `Endgeräte` > `Basis-Konfigurationen` zu finden.

{{% notice note %}}
Bevor Sie die Basis-Konfiguration ändern, müssen Sie diese `Duplizieren`.
{{% /notice %}}

Ebenfalls können Sie eine schon bearbeitete Basis-Konfiguration als `Standard setzten`. Somit erhalten neu angelegte IP-Telefone automatisch die angepasste Basis-Konfiguration.

**Zuweisung einer Basis-Konfiguration**

Eine Basis-Konfiguration kann auf mehreren Wegen zugewiesen werden:

+ Über `Endgeräte` > `Basis-Konfigurationen` > Basis-Konfiguration auswählen und Bearbeiten, im Tab `Geräte` können gleich mehrere IP-Telefone hinzugefügt werden.
+ Über `Endgeräte` > `Geräteliste` > IP-Telefon auswählen und Bearbeiten im Tab `Basisdaten`.

**BLF-Tasten konfigurieren über die Basis-Konfiguration**

Im Tab `Konfiguration` können Sie die vorhandene Basis-Konfiguration anpassen. Im Bereich **keys** finden Sie bereits vorkonfigurierte Funktionstasten, an denen Sie sich orientieren können.

BLF-Tasten lassen sich wie folgt einrichten:

    {{!-- keys --}}
    linekey.3.type = 16
    linekey.3.value = 123
    linekey.3.label = Max

Die belegte Taste (in diesem Fall Linekey 3) besteht aus drei Parametern:

+ *type*: der Typ der Taste, 16 steht für BLF,
+ *value*: der Wert, das ist hier die Nebenstelle,
+ *label*: das Label, das ist die Bezeichnung, die am Display angezeigt wird.

Weisen Sie diese Basis-Konfiguration über den Tab `Geräte` den IP-Telefonen zu, die diese Taste auch in der Weise belegt haben sollen und speichern Sie. Nach dem Neustart der IP-Telefone werden die Änderungen auf diesen übernommen.


### Firmware Update

Ab der mobydick Version 7.14 wird die Firmware für IP-Endgeräte nicht mehr mitgeliefert. Sollte eine andere als auf dem IP-Endgerät installierte Firmware benötigt werden, muss diese selber heruntergeladen und in die mobydick Firware-Verwaltung hochgeladen werden.

**Firmware hinzufügen**

Die gewünschte Firmware kann hinzugefügt werden unter `Endgeräte` > `Firmware`:

|Einstellung|Beschreibung|
|---|---|
|Firmware-Datei|Laden Sie hier die Firware hoch. Diese finden Sie auf der [Download-Seite von Yealink](http://support.yealink.com/documentFront/forwardToDocumentFrontDisplayPage).|
|Model|Modellbezeichnung des Yealink-Telefons|
|Version|Firmware-Version|
|Dokumentation|Optionales Feld für Notizen|

**Firmware Roll Outs**

Die Firmware kann über `Endgeräte` > `Geräteliste` aktualisiert werden. Wählen Sie die Zielgeräte in der Geräteliste mit Häkchen aus und klicken Sie auf `Aktion` > `Firmware ausrollen`. Nun erhalten Sie eine Übersicht der gewählen Geräte, in der Sie die Zielfirmware auswählen können. Anschließend klicken Sie auf `Firmware update` um die gewählte Firmware auszurollen.

**Recommended Firmware**

Da es für die verschiedenen IP-Telefone eine Vielzahl von Firmwares gibt ist es uns leider nicht möglich jede zu testen, so dass es sein kann, dass manche Firmware-Versionen mobydick Funktionen nicht unterstützen. Daher finden Sie hier eine Liste der Firmwares die von uns bereits getestet wurden:

|Modell|Firmware|
|---|---|
