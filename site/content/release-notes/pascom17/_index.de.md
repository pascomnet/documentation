---
title: pascom Server 17
description: Mit dem pascom Release 17 stehen Ihnen eine Vielzahl an neuen Funktionen zur Verfügung.
weight: 997
---

{{% notice tip%}}
Bitte benutzen Sie bei Fragen zunächst das [Community Forum](https://www.pascom.net/forum/ "Zu unserem Forum").
{{% /notice %}}

{{% notice warning %}}
![Aastra/ Mitel DECT RFPs](aastra-mitel-dect-system.png?width=18%&classes=left)
The update will break an environment with Aastra or Mitel DECT RFPs                           
Ensure to do the following before the update to this version:<br><br>
  - Update your Aastra DECT RFP to firmware 7.0SP1 or greater.                                              
  - Use the OM configurator tool to configure the previously used IP as static IP for the RFP (serves as OMM)            
  - Enter the provisioning URL to the DECT gateway and reboot it                                     
  - You have to upload the configuration for the handsets manually
{{% /notice %}}

{{% notice warning %}}  
**Wichtige Hinweise zu diesem Update:**  
- Auch wenn vorher bereits Mobiltelefone genutzt wurden, muss der Mobile Hub nach dem Update auf 17.00 oder höher neu konfiguriert werden.           
- alle vorher benutzten Mobiltelefone bleiben in der Konfiguration erhalten, müssen aber dennoch via Pairing neu konfiguriert werden. Sie sollten vorab für diese Geräte die Konfiguration durch den Endbenutzer erlauben, ansonsten ist das Pairing nur via Admin WebUI möglich.           
- die neue Mobile App funktioniert nur mit Servern ab Version 17 und aufwärts. Die alte Mobile App kann weiterhin für ältere Systeme genutzt werden.      
- die Community Version funktioniert mit der Mobile App, kann aber keine Push Nachrichten verschicken. Sie sind damit also nur per Chat erreichbar, wenn die App aktiv im Vordergrund ist. Anrufe werden, wie bei allen Classic Clients, per GSM weitergeleitet.                      
- Sie sollten nach einem Cloudstack Update Ihren Proxy konfigurieren. Dort finden Sie eine neue Option für das Pairing der Mobiltelefone. Aktivieren Sie diese nur bei dem Proxy, der aus dem Internet erreichbar ist.                  
- aktualisieren Sie bitte nach einem Cloudstack Update Ihre Lizenz um die Push Funktionalität freizuschalten.              
- das FollowMe ist jetzt für pascom Softphones und Mobilgeräte standardmäßig vom Benutzer konfigurierbar.            
- Für die Wiederherstellung von Backups muss das Backup von einer LTS oder neuer stammen
{{% /notice %}}


## Release 17.11. (25.09.2018)

**Auf einen Blick**

* Serverseitige Unterstützung, um aus einem laufenden Anruf oder einem Journaleintrag einen Telefonbucheintrag zu erstellen
* Die Firmware-Version 4.0 beim Snom M700 wird nun mit Autoprovisionierung unterstützt
* Wichtig: Für die Wiederherstellung von Backups muss das Backup von einer LTS oder neuer stammen

**ÄNDERUNGEN:**

* [MD-5352] - Improve translation code of voicemailConf.php
* [MD-8007] - Optimize phonecallrecord, journal and eventlog table
* [MD-9220] - Create a phonebook entry out of a journal entry or running phonecall
* [MD-9837] - Limit database import to LTS onwards 
* [MD-9923] - No RTP stream after hold / unhold using snom desk phone via mobydick.cloud
* [MD-10122] - Improve Microsoft AD Template
* [MD-10143] - Snom M700 provisioning broken with new firmware 4.00 
* [MD-10179] - Implement provider template for "envia TEL"
* [MD-10252] - Cleanup orphaned roster and archive xmppserver DB entries
* [MD-10277] - Aastra/mitel dect handset auth code is empty after migration
* [MD-10313] - Wrong labels are attached to outgoing mobile hub calls
* [MD-10397] - Modify Seabix trunk template


## Release 17.10 (19.06.2018)

**Auf einen Blick**

* Die Outlook-Integration wurde in Stabilität und Performance stark verbessert
* Wiederverbinden Problem der iOs und Android Clients wurde behoben
* Ein work-around-Skript zur Behebung der Telekom DNS Probleme, wenn sich die IP-Adresse des Registrierungsservers ändert, wurde eingebaut
* Updates des pascom Clients werden jetzt direkt via my.pascom.net heruntergeladen. Für weitere Details siehe: [Forum](https://www.pascom.net/forum/t/pascom-client-update-channels/3994) und [Dokumentation]({{< ref "/clients/desktop-installation">}})

**ÄNDERUNGEN:**

* [MD-9364] - Improve Outlook Integration
* [MD-10198] - Centralized Web http based Client updates
* [MD-10255] - Improve click to dial handling on windows
* [MD-10269] - Show pascom softphone in Sennheiser Headsetup
* [MD-10273] - Improve contact list row displaying in client
* [MD-10287] - Chat archive does not load history on scroll for messages without message marker
* [MD-10298] - Show counts in team view section headings
* [MD-10301] - Enable command doesn't contain to attribute
* [MD-10305] - Missing hover effect for Close-Button in Chat Tabs
* [MD-10331] - Threading-Problem within pjsip threads and qt message logging
* [MD-10333] - Location storage can't be created
* [MD-10337] - GSM fallback switcher broken
* [MD-10379] - Show message that audio devices are not ready in client
* [MD-10381] - iOS client sometimes misses calls
* [MD-10393] - Linux client main executable has extremely huge binary size
* [MD-10406] - Wrong active chat after click on user in client
* [MD-10411] - Crackling sound if a ringtone is played in client
* [MD-10423] - Test release 17.10
* [MD-10468] - Renew windows code signing certificate
* [MD-10479] - Increase call sound volume gain in client softphone
* [MD-10488] - Write all messages to syslog on iOS
* [MD-10514] - Broken installation of classic pascom
* [MD-10517] - Outlook contacts not shown if you switch from private phonebook
* [MD-10591] - HTTP Update problems
* [MD-10599] - Telekom SIP trunk fails if remote ip-address changes


## Release 17.09 (24.05.2018)

**iOS/ Android Release**

* MD-10337: der GSM-Fallback-Schalter wird nun wieder zuverlässig angezeigt

{{% notice note %}}
Bei diesem Release gibt es keine eigene Serverversion, da die Änderungen nur die mobile Applikation betreffen.
{{% /notice %}}


## Release 17.08 (23.04.2018)

**ÄNDERUNGEN:**

* MD-8953 - Umlaut/special chars in mails were not correctly converted to fax
* MD-9283 - Possible high-load due to client redirect implementation
* MD-9503 - SRTP in classic pbx causes problem with QT client/softphone
* MD-9814 - client crashes due to an early delete within System Tray Menu
* MD-9983 - Switching between call details broken in client
* MD-10177 - GSM Fallback switch should not be visible if paired without mobile number
* MD-10192 - RTPEngine throws srtp warnings when our client phones
* MD-10204 - Make dropdowns great again
* MD-10208 - Emoticon parser fails on consecutive emoticons in client
* MD-10218 - Deactivate landscape format for iOS
* MD-10221 - Hide line in client if only one device is assigned
* MD-10224 - Fix notification font colors
* MD-10226 - Start group chat button is too small on mobile devices
* MD-10228 - DTMF pad usability is very bad in client
* MD-10243 - Audio device names are truncated on Windows
* MD-10258 - Cursor does not change to text input cursor if a TextInput is hovered in client
* MD-10260 - Missing hover animation for Phone-Icon in Contact list
* MD-10261 - Hover animation for Main Menu Buttons
* MD-10275 - iOS App shows "Unknown" instead of Number on incoming call if no name is available
* MD-10278 - Show to-be-dialed phone number also in phonebook list row
* MD-10280 - Underlined button has no underline anymore
* MD-10283 - Do not show "pair" button in client if server version is lower than 17
* MD-10310 - Phone number is not correctly registered in iOS CallKit
* MD-10320 - Client displays wrong status text from other user
* MD-10321 - pascom Client drains battery on iOS
* MD-10332 - Auto update on macOS doesn't work anymore if you need admin privileges to update the app
* MD-10350 - Monitoring control buttons do not look nice in client
* MD-10354 - Threading-Problem within MdWavPlayer
* MD-7163 - Ignore very short voicemail calls
* MD-9353 - Implement monitoring in pascom Client
* MD-9450 - Improve search ui
* MD-9468 - Implement datev integration
* MD-9535 - Add --help commandline option in Desktop Client
* MD-9691 - Show 'open download dir' button in file transfer notification
* MD-10034 - Fix number determination for incoming trunk calls
* MD-10049 - Show the current calling party in the pascom client roster
* MD-10139 - Split "Smart Offhook" hotkey in desktop Client into two hotkeys
* MD-10140 - Automatically cut off too long texts in client UI
* MD-10150 - "Close other" in clients conversationsTabs
* MD-10183 - Missing audio if you call an iOS device from an android device
* MD-10251 - Implement "close all" for conversationsList on mobile client
* MD-10279 - Make headings in settingsView bigger on mobile client

**From 15.10:**

* MD-8119 - Options are not working on spying a channel in Queuemetrics
* MD-9317 - Connector deletes and recreates internal phonebook entries on each run
* MD-9879 - Add subjectAltName to Cloudstack self signed proxy certificate
* MD-10185 - Wrong input highlighted after changing fax extension to invalid one
* MD-10194 - Link to overview in virtual fax device not working

**From LTS 7.11.08:**

* MD-9168 - Apply telephony and system cleanup task corrupts datamodel
* MD-8628 - TabWidget children does not remove subscription when the flex panel is closed
* MD-8703 - Toast in flex panel is broken


## Release 17.07 (05.04.2018)

**ÄNDERUNGEN:**

* [MD-10295] - Client crashes on every login on some macOS systems


## Release 17.06 (03.04.2018)

**ÄNDERUNGEN:**

* MD-9655 - Support push message lifetime
* MD-9813 - Client displays wrong location
* MD-9868 - Implement provider template for EWE
* MD-9943 - Updates are sometimes not delivered to the client in a pascom classic
* MD-9993 - macOS uses wrong device after logout
* MD-10018 - PC_LOG_SIP_MESSAGES has no effect on windows client
* MD-10023 - External calls with GSM fallback causes wrong call state at desktop client
* MD-10025 - mobile client for iOS plays no ringback tone on internal call
* MD-10026 - macOS client crashes during wakeup
* MD-10084 - Print to fax fallback to qt client
* MD-10088 - Location text update broken in client
* MD-10113 - DND is broken if user uses mobile client
* MD-10125 - Cam is mirrored if app was started in landscape format
* MD-10156 - Elided content is not fully copied in client
* MD-10173 - client crash if application stops with a running call
* MD-10175 - pc::MdCall::getCallState crashing in assert
* MD-10176 - poor scroll performance in client roster on mobile
* MD-10189 - Prohibit search for empty string in client
* MD-10197 - Disable keyboard input in dtmf pad
* MD-10203 - Chat Tab ordering is wrong after restarting client
* MD-7089 - Write eventlog entries when user roams from/to location
* MD-9825 - Auto provisioning support for current mitel/aastra dect systems
* MD-10079 - Better handling for mobile number verification errors during pairing
* MD-10108 - Increase usability of settings
* MD-10130 - Automatically close MUC notification
* MD-10184 - Sort Chat Messages from newest to oldest in search results
* MD-9165 - Support for Sennheiser Headsets
* MD-10246 - React on Audio Device Changed events in Windows / macOS
* MD-10205 - Sennheiser Headset Glitches
* MD-10211 - Stop playing ringtone after leaving headset configurator
* MD-9915 - Improved USB-Device Detection
* MD-10195 - Sennheiser support will not activate after restarting client or HeadSetup app
* MD-10010 - Headset doesn't signalize about new incoming call
* MD-9692 - Wrong audio devices after connecting headset
* MD-9956 - desktop Client uses wrong audio device with Jabra Headset on Windows
* MD-10164 - headset toast message shows no device
* MD-10213 - Client doesn't remember that headset was turned to inactive
* MD-10230 - Jabra Headset Support fails on macOS when re-plugging

**Included fixes from 15.09**

* MD-10014 - Improve prompt of dialplan loop detection
* MD-10031 - Fix typo in /services/apidoc
* MD-10071 - Missing device info if receiving call while call forwarding is active
* MD-10105 - Correct typos in cloudstack job results
* MD-10144 - Exception after deleting a gateway assigned to role
* MD-10146 - Wrong error message after entering wrong fax extension
* MD-10039 - Hide button to test connection if exchange server connector is not configured
* MD-10082 - Update gloox version to 1.0.20 in tapi


## Release 17.05 (12.03.2018)

**ÄNDERUNGEN:**

* MD-9134 - Handle Very long Label names / values in a better way
* MD-9252 - TAPI connections fail if Office 365 is installed and go-based xmppproxy is used
* MD-9715 - Show the right icon for softphones in client
* MD-9873 - NL Translation doesn't work on mobile devices
* MD-9875 - Automatic client relogin after disconnect
* MD-9978 - GSM fallback will not change call status on desktop client
* MD-9980 - client resets to wrong view after a call
* MD-9988 - Lock double click in location menu
* MD-9990 - Ability to skip mobile number in mobile app during pairing
* MD-9997 - Improve look of location chooser
* MD-10002 - Location and state are overlapping
* MD-10005 - You can't accept phonecalls on a classic via GSM if the client is in foreground
* MD-10009 - Wrong follow me information after roaming
* MD-10057 - Glitch in avatar editor
* MD-10058 - Android Google Play Store: pascom Client is not visible for all devices
* MD-10076 - Do not show 'today' multiple times in chat
* MD-10096 - Current device is not highlighted in client settings - device list when paired with a classic
* MD-10101 - Empty or wrong avatar letters generated
* MD-10141 - Restore defaults button is broken in mobile client
* MD-10148 - Can't copy from the phonebook on mobile
* MD-8611 - Improve django logging
* MD-9817 - 'group by presence' ignores phone/mobile status
* MD-9842 - Use local postgresql database for all cloudstack containers by default
* MD-9930 - Introduce "Clear local data" button in desktop Client
* MD-9979 - Client text copy context menu should behave like the OS' ones
* MD-10062 - Allow 4gb postgresql container for huge cloudstack hosts
* MD-10069 - Show message when trying to send a fax in mobile client
* MD-10098 - Detect and prevent starting on unsupported macOS versions
* MD-10126 - Switch default rendering backend to SOFTWARE in windows desktop Client

**Included fixes from 15.08**

* MD-9924 - Confirmation dialog for deleting an instance has wrong text
* MD-10013 - Can’t delete call forwarding that contains special chars
* MD-10016 - Increase possible length of mailserver hostname
* MD-10022 - Dial not successful if softphone name contains a +
* MD-10111 - classic Client Softphone does not login on certain environments
* MD-8363 - Increase verbosity for failed mail to fax


## Release 17.04 (26.02.2018)

**ÄNDERUNGEN:**

* MD-9765 - Number determination was set to false after update
* MD-9827 - Owner of group chat can't be added again
* MD-9861 - If a device is not user configurable when it's created, it can't be selected as outgoing phone device
* MD-9909 - Show fax number also for outlook contacts in client
* MD-9910 - Re-Select outlook phonebook after client restart or re-login
* MD-9931 - desktop Client shows Group chat invitation for my own group chats
* MD-9935 - desktop Client shows empty phonebook entries
* MD-9957 - Make hidden labels configurable in client
* MD-9966 - Users are permanently busy when using mobile app with mobile hub
* MD-10006 - Mark chat messages as read if you click on a link in a notification
* MD-10033 - Remove call-ended sound from softphone - some headsets don't handle this correctly
* MD-10048 - Entered words always start with uppercase letters on android
* MD-10051 - Chat jumps to top if older messages are loaded in client
* MD-10068 - Outlook button shows wrong state
* MD-6016 - Implement Hold / Unhold for TAPI
* MD-9938 - Implement trunk template for Seabix

**Fixes from 15.06**

* MD-8662 - Ignore not assigned devices for changing follow me settings for many devices at once
* MD-9516 - Xmppserver AstdbManager does not accept a dash in a key
* MD-9755 - Conference via client will not work with new Yealink firmware 82
* MD-9756 - Snom D785/D120 downloading language file failed for version 10.1.17.0
* MD-9830 - Wrong encoding within voicemail notification text via email
* MD-9901 - phonebook import via rest is broken
* MD-9902 - Softphone crashes in Classic Client

**Fixes from 15.07**

* MD-10072 Fixed Aastra DHCP provisioning (static ip reservation for the OMM stations)


## Release 17.03 (12.02.2018)

**ÄNDERUNGEN:**

* MD-9244 - Tray-Menu support on windows has HighDPI bugs
* MD-9402 - Hang up system call to external device in client
* MD-9665 - Client crash because of missing device attribute in ChannelEvent
* MD-9778 - Remove not existing menu entries in mobile client settings
* MD-9781 - Only use Alphabet Characters for automatic avatar generator
* MD-9801 - Broken Font rendering on iOS
* MD-9803 - Layout Glitches in client Settings
* MD-9812 - Scroll via touch does not work correctly in client chat
* MD-9820 - Hide keyboard on Back and on pressing home on Android
* MD-9821 - Push to iOS devices is unreliable
* MD-9839 - XMPPServer exception when closing a client while a filetransfer is in progress
* MD-9843 - macOS client crash when starting a phonecall
* MD-9849 - Device not changed after roaming
* MD-9862 - Phone Register CMD is broken - Softphone has no sip connection
* MD-9863 - Mobile number will not appear in webui when entered during pairing
* MD-9866 - Desktop client cancel button in pairing process is broken
* MD-9869 - Wrong number shown in mobile after gsm fallback with QSC trunk
* MD-9871 - QR-Code page stays after pairing
* MD-9874 - Right click on avatar will open menu for contact
* MD-9878 - Hidden labels are shown as empty in the phonebook view
* MD-9904 - Settings menu does not close on android's back button
* MD-9905 - "Close all chats" broken in chat tabs context menu
* MD-9914 - Follow me values are 0 after restart of client
* MD-9940 - iOS: Accepting phonecalls from push sometimes doesn't work
* MD-9948 - Client uses wrong output for beeper signal
* MD-9950 - desktop client relogin feature loops after waking up from hibernate
* MD-9952 - MacOS Client crash after logout
* MD-9955 - desktop Client crash on logout
* MD-9959 - client: border around list appearance switches is broken
* MD-9965 - Copy context menu is broken on mobile
* MD-9994 - Client deadlocks on incoming call notification
* MD-9996 - MacOS Client crash if user without phone signs in
* MD-9998 - Can't change follow me settings for devices assigned to location
* MD-9999 - linux client crashes if phone is on DND
* MD-10000 - Change password/pin in settings is broken
* MD-10012 - Client crash after calling call router
* MD-4474 - Integrate pjsip tone generator into client softphone
* MD-9684 - Rewrite Call UI in client to support small screens
* MD-9746 - Update client to Qt 5.9.4
* MD-9810 - Limit chat messages to 1500 characters
* MD-9883 - Add a "Quit" link button to the settings menu of the client
* MD-9976 - Show user and instance in desktop client tray icon

**Included fixes from 15.05**

* MD-8571 - Gateway status in webinterface was broken
* MD-9654 - Do not allow to delete default music on hold class
* MD-9676 - Import contacts from shared mailbox via exchange connector
* MD-9724 - Manual update of mobydick container will not resets RAM anymore
* MD-9836 - Introduced more dynamic hints for pascom based redirections
* MD-9880 - Wrong syntax for inbound rule within Tele2 trunk template
* MD-9900 - Change ‘mobydick’ to ‘pascom’ in TRC210909
* MD-9671 - Remove AAstra / Mitel firmware from distribution


## Release 17.02 (22.01.2018)

**ÄNDERUNGEN:**

* MD-9668 - Patton/berofix analog/ISDN sip device will be automatically renamed
* MD-9690 - Missed call notification is shown but is empty
* MD-9731 - Show hint in desktop client if no pairing proxy is available
* MD-9758 - Improved mobilehub rule generator for telekom trunk
* MD-9824 - Refresh phonebook in client after deleting an entry
* MD-9829 - After changing a team name, actions don't work in pascom Client
* MD-9835 - Fixed missing dial button in small view of contact list
* MD-9841 - Client crashed when displaying missed call notifications
* MD-9852 - Client crashed because a ChatRoom object was deleted too early
* MD-9860 - Journal only showed last call
* MD-7553 - Assigned softphone after LDAP import
* MD-9677 - Updated 1und1 trunk template
* MD-9848 - Upgraded pjsip to 2.7.X again on macOS


## Release 17.01 (08.01.2018)

### pascom Client

* Die Start-Performance wurde verbessert
* Übersetzungen wurden verbessert
* Der Client kann nun mittels Kommandozeilenschalter auch minimiert gestartet werden
* Diverse Ursachen für Crashes behoben
* Die Kontaktliste springt nun nicht mehr grundlos an den Anfang
* Eine neue Version der Plantronics Headset Bibliothek wurde integriert
* Die Darstellung bei 150% Skalierung wurde verbessert
* Die UI für Rufumleitungen wurde überarbeitet und verbessert
* Der Client zeigt nun auch die eigene Durchwahl, je nach Konfiguration im Profil, an
* Ein häufiges Absturzproblem behoben, wenn das pascom Softphone verwendet wird
* Umlaut-Problem bei (Headset)-Audiogerätenamen unter Windows behoben
* Crash behoben, wenn während eines Telefonats die Netzwerkverbindung abbricht
* Tray Menü funktioniert nun auch wenn das Hauptfenster minimiert ist
* Das Dropdown für das Amtsholungs-Prefix wurde unter bestimmten Umständen nicht zuverlässig angezeigt
* Manchmal wurden eingehende Chat-Nachrichten nicht richtig angezeigt
* Crash behoben, wenn das Avatar-Bild eines Benutzers nicht quadratisch ist
* Crash bei bestimmten Avatar-Bildformaten behoben
* Probleme bei der Anzeige von Gruppenchats behoben

### pascom Server

* Übersetzungen wurden verbessert
* Für die mobile Hub Domain kann nun eine IP-Adresse oder ein nach RFC1123 valider Domain Name verwendet werden


## Release 17.00 (14.12.2017)

### pascom Desktop Client

* Im Chat wird nun angezeigt, ob der Empfänger die Nachricht gelesen hat
* Spezielle Installationsart für Terminal Server wieder eingeführt, siehe Dokumentation
* Oberfläche für Einstellungen überarbeitet und vereinfacht
* Es wird nun zuverlässiger angezeigt, welche Audiogeräte tatsächlich verwendet werden
* Globale Shortcuts werden nun unter Windows auch über Anwendungs-Neustarts hinweg gespeichert
* Es können nur noch Geräte ausgewählt werden, die auch wählen können
* Der Transfer Button wird nur bei Geräten gezeigt, welche dies auch unterstützen
* In den Einstellungen können nun Mobilgeräte gepairt werden

### pascom Classic Client

* Problem bei Follow Me Einstellungen gelöst
* Ungelesene Nachrichten sind nun besser erkennbar

**ÄNDERUNGEN:**

**md-cmd**

* Oberfläche für Mobilgeräte Pairing
* Berofix Gateways können nun uneingeschränkt mit der neusten Berofix-Firmware betrieben werden
* Transfer Return Feature wurde entfernt
* SIP Ämter grundsätzlich überarbeitet und die Konfiguration vereinfacht
* Anpassungen für Pairing mit Mobile Client durchgeführt
* Mobile Hub grundlegend überarbeitet und vereinfacht
* Firmwareanpassungen für Yealink W52P DECT System implementiert
* Neue Yealink Geräte werden zuverlässig provisioniert
* pascom Softphone und Mobilgerät ist nun standardmäßig vom Benutzer konfigurierbar

**cs-controller**

* Beim Erstellen einer neuen pascom Instanz kann die Systemsprache ausgewählt werden
* pascom Support Zugriff via VPN kann nun in der Weboberfläche freigeschaltet werden

**cs-proxy**

* Ein Proxy kann nun als "Zielproxy" für das Pairing mobiler Clients definiert werden
