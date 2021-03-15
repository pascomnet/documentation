---
title: pascom Client
description: pascom bietet native Clients für Windows, MacOS, Linux, iOS und Android
weight: 990
---

{{% notice tip %}}
Für weitere Informationen zu unserem pascom Client finden Sie in unserer ausführliche [Client-Dokumentation]({{< ref "/clients" >}}).
{{%/notice%}}

## What's New
 
{{< youtube cnSuDvVzl5Q >}}

## Wichtige Änderungen

{{% notice changes %}}  
In diesem Abschnitt geben wir Ihnen einen Überblick aller wichtigen Änderungen im pascom Client
{{% /notice %}}

* Kompatibilität zu pascom 16 und älter wurde eingestellt. Ältere Client Versionen finden Sie in unserem [Release-Archiv](https://www.pascom.net/de/downloads/#release-archive).
* Der pascom macOS Client setzt jetzt mindestens macOS 10.12 voraus
* pascom Client mit Apple M1 Silicon CPU nutzen. [Weitere Informationen]({{< ref "/clients/desktop-installation">}})

## Bekannte Probleme

{{% notice issues %}}
Diese Probleme sind uns bekannt und wir arbeiten bereits an einer Lösung  
{{% /notice %}}

* [CL-1165] Outlook Support ist auf einigen Systemen instabil und führt zu Abstürzen des pascom Clients.
* [CL-1344] Screensharing funktioniert unter Ubuntu Linux nicht wenn eine Wayland-Session verwendet wird. Als Workaround kann auf eine X11-Session umgeschaltet werden.
* [CL-1501] Beim Update von v64 auf v65 kann es zu Problemen beim Abspielen von Klingeltönen kommen. Als Lösung reicht es aus, den konfigurierten Klingelton bzw. Klingelton-Lautsprecher in den Einstellungen einfach erneut auszuwählen.
* [CL-1748] Accessibility Support ist unter Windows momentan deaktiviert um ein einfrieren des Clients zu vermeiden.

## Release 71.R1640 (15.03.2021)


**Auf einen Blick**

- Hinweis: Diese Version ist nur noch zu pascom 19 servern kompatibel

Neue Funktionen mit pascom 19.14 Server:
- Unterstützung für Video-Türklingeln
– Ein iOS/Android Gerät kann im Desktop Client nun als bevorzugtes Gerät gewählt und ferngesteuert werden
– Verbesserter Dateitransfer mit Anzeige im Chat und auch auf iOS/Android Geräten

Neue Funktionen:
- Verbesserte Suchfunktion mit As-you-type Live-Suche
- Konferenzanrufe werden nun in einer Benachrichtigung dargestellt
- iOS/Android: Der gewünschte Lautsprecher (Bluetooth, Intern, Lautsprechen) kann nun während des Gespräches umgeschaltet werden
- iOS/Android: Während eines Videotelefonates kann nun der Bildschirm gedreht werden
- Kuando Busylight funktioniert nun auch mit anderen Geräten als dem Softphone
- Ausgehende Anrufe können nun mit dem “Smart Offhook” Tastenkürzel aufgelegt werden
- Telefonnummern werden im Chat erkannt und sind Klickbar
- Performanceverbesserungen unter Windows in RDP Sitzungen/Terminal-Server Umgebungen
- Dialog zum setzen von Rufumleitungen verbessert
- Android: System DND Einstellungen werden nun korrekt beachtet
- Verbesserte Unterstützung für iPads

**Tickets**

* [CL-150] - Use mobile app as preferred Device in Client
* [CL-359] - Improve conference call notification
* [CL-449] - Support switching audio devices during call on mobile
* [CL-1033] - Provision BLF Keys from pascom Client, Milestone 1
* [CL-1034] - Doorbell support in pascom Client
* [CL-1139] - Open journal details from missed call notification
* [CL-1212] - Sennheiser rebrand to EPOS
* [CL-1269] - Enhance FollowMe UI with "gsmonly" switch
* [CL-1325] - Roaming to location doesn't add phone device section
* [CL-1334] - Invalid softphone state after exception
* [CL-1406] - Switch to dxgiscreencapsrc for desktop sharing on windows
* [CL-1440] - Show a "Ringing Indicator" if the app is backgrounded while ringing on android
* [CL-1448] - Kuando busylight not working if desktop phone is preferred device
* [CL-1451] - Get rid of QDateTime::toTime_t() calls in client
* [CL-1452] - Show dtmf pad for a ringing outgoing internal queue call
* [CL-1454] - Consistently handle open external link failures in client
* [CL-1455] - update_tmstmp in client database is never updated
* [CL-1472] - Replace QML copy with QClipboard in c++
* [CL-1473] - Improve UsbMonitor rescan logic
* [CL-1478] - Avatar is sometimes re-generated without user interaction
* [CL-1523] - Also hangup outgoing ringing calls when using pascom smart offhook shortcut
* [CL-1536] - Fix Phonebook notes field, it should accept line breaks
* [CL-1542] - Add press and hold for search input field in client
* [CL-1555] - Add trunk prefix to call forwarding input field in settings
* [CL-1563] - Restoring ringtone device is broken on macOS
* [CL-1572] - Disable phonebook section in journal details for group and system calls
* [CL-1574] - Fix iPad glitches
* [CL-1578] - Sunset support for servers older than pascom 19
* [CL-1600] - Improve client search usability
* [CL-1611] - Make phone numbers in chat clickable
* [CL-1619] - Remember last journal filter and position
* [CL-1632] - Do not allow editing of user phonebook entries in client
* [CL-1637] - Refactor Toast API
* [CL-1638] - Displaying many notifications at once lock up windows if native notifications are in use
* [CL-1642] - Copy group dial number and pin separately
* [CL-1643] - No toast is shown if call is rejected in some cases
* [CL-1648] - Fix crash on shutdown in pascom Client
* [CL-1671] - Shaking an iPhone invokes default undo dialog
* [CL-1674] - Introduce a 'downloaded file' toast with 'open file/open folder' buttons
* [CL-1676] - Commandline parameters are cut off on windows
* [CL-1677] - Possibility to mute the ringtone/vibration for an incoming call on android
* [CL-1687] - Android notification problems
* [CL-1691] - Improve Team Details View, allow avatar uploads
* [CL-1697] - Show counter for missed call in pascom icon on iOS
* [CL-1703] - Improve mobile client speaker selection for playing voicemails or recordings
* [CL-1705] - Asset based file Transfer (Milestone 1)
* [CL-1710] - Do not enforce OpenGL Software backend on Windows/RDP
* [CL-1714] - Increment file names instead of overwriting old ones after download
* [CL-1719] - Improve message on failed update download
* [CL-1720] - Provide a "remove filter link" on the "no matches" pane in contact list
* [CL-1723] - Phonebook entry not updated after creating in journal details
* [CL-1724] - Phone book roster entry number not shown
* [CL-1725] - No emoji live translation in custom chat notification
* [CL-1726] - Sign all pascom Client binaries, not only setup and main executable
* [CL-1733] - Layout on iPhone with iPhone SE is broken
* [CL-1735] - Add call waiting buttons to windows native notification
* [CL-1737] - Button texts in notifications elide too early
* [CL-1743] - Weird behavior if user calls own extension with the iOS application
* [CL-1749] - Remove xmppuser_FindClientInfoByOsUser
* [CL-1753] - pascom Client can't register softphone if tls version is not exactly specified in kamailio config
* [CL-1755] - Client crashes on macOS on state sync to jabra device
* [CL-1762] - Hover tooltip 'blinking' during video call
* [CL-1769] - Clean up userprofile getValue and setValue
* [CL-1771] - Unequal spacing in UI
* [CL-1773] - Select screen for screensharing transparent
* [CL-1774] - Android does not show chat notifications anymore if in app
* [CL-1777] - Improve pjsip dependency build
* [CL-1780] - Client should log environment variables and commandline parameters
* [CL-1783] - Refactor USB Bus monitoring in pascom Client
* [CL-1786] - Transfer call to favorite phone book entry via right click menu
* [CL-1789] - Collect detailed metrics about screensharing and video calls
* [CL-1790] - Rotate camera if device is rotated on mobile
* [CL-1797] - pascom client build script improvements
* [CL-1799] - Compile warning in ipcservice due to wrong memset usage
* [CL-1809] - Client resyncs on every login
* [CL-1810] - Middle section empty after relogin
* [CL-1811] - Hide chat button for external conference participant via dial in number
* [CL-1817] - Version number is cut off in start screen on macOS
* [CL-1821] - Multiple loading indicator in client when starting video
* [CL-1824] - Unset update threshold is handled incorrectly in pascom Client
* [CL-1825] - Can't accept call on iOS using CallKit
* [CL-1827] - Avatar for team is now shown if client is restarted
* [CL-1830] - Linux client fontconfig broken on ubuntu 20.10
* [CL-1831] - Client crashes after attended transfer
* [CL-1832] - Limit status text input length
* [CL-1833] - Emoji renderer in windows client broken
* [CL-1834] - Maximize video streams in fullscreen layout broken
* [CL-1835] - Chat buttons in call/video fullscreen mode broken
* [CL-1843] - Client shows "No sip connection" during wakeup
* [CL-1844] - "Softphone has no SIP connection" after roaming
* [CL-1845] - Links in client broken
* [CL-1846] - Android client crash after pairing again
* [CL-1847] - Rendering for journal cells is broken
* [CL-1849] - Improve file asset handling in pascom Client
* [CL-1852] - Client crashes when setting call forwarding
* [CL-1853] - pascom App rings despite ongoing gsm call
* [CL-1854] - Escape characters in phone book note field to avoid XSS attacks
* [CL-1860] - Removing roster smart filter takes about 3 sec on mobile
* [CL-1862] - Check both device id and name in softphone remote control commands
* [CL-1863] - Client shows new 'Today' in the chat when sending long message
* [CL-1867] - Cannot switch camera in settings with android mobile client
* [CL-1868] - Notification is sometimes displayed multiple times
* [CL-1869] - "Accept incoming calls here" message is shown if the rdp mode client is started first
* [CL-1870] - Build ios notificationExtension out of tree
* [CL-1879] - Android client stays in splash screen after accepting permissions
* [CL-1881] - Support new BLF key types
* [CL-1882] - Handle remote pushes for file assets correctly
* [CL-1885] - Handle Quota errors during file uploads correctly
* [CL-1894] - Nothing happens when we click on a play button in journal entry
* [CL-1896] - RetryUpdateToast (Popup) broken
* [CL-1902] - Message sound should not be tied to notification
* [CL-1904] - Journal Meta Notifications layout glitch
* [CL-1914] - Team Journal Filters are not visible on mobile
* [CL-1917] - client utilizes 100% of one CPU core
* [CL-1919] - Wrong queue details UI if you switch between queues
* [CL-1921] - Phonebook Search is not re-executed if search view is dismissed with an entered text
* [CL-1926] - Headset configure dialog opens if a supported headset is detached
* [CL-1927] - Preview images are sometimes not rendered in the chat pane
* [CL-1928] - Respect rotation tag from exif metadata when scaling an image
* [CL-1929] - Scroll to end if a message or file is sent
* [CL-1931] - Improve preview renderer quality and scale down algorithm
* [CL-1932] - ConnectionState is wrong on Android if a remote controlled outgoing call is started
* [CL-1933] - Download and Open media file if clicked/tapped on
* [CL-1934] - Improve file asset upload and download toasts
* [CL-1935] - Improve file asset behaviour
* [CL-1938] - fkey index in Snom configuration is negative without any default line key
* [CL-1942] - Improve client blf behavior
* [CL-1943] - Allow accepting a call for an integrated mobile phone on my desktop client
* [CL-1944] - Only add videotestsrc if no other camera was found
* [CL-1948] - Doorbell video stream starts very slowly
* [CL-1951] - Android Client stays in "incoming call" screen when accepting a call on the desktop client
* [CL-1952] - Delete file asset button does not react on click
* [CL-1954] - User should be able to delete the files sent by the guest
* [CL-1955] - Improve Contact selection for BLF keys
* [CL-1956] - Client crash after downloading fax and open file/folder
* [CL-1960] - Keep the screen active if the device is charging and pascom is in foreground
* [CL-1964] - Links in ChatNotification broken
* [CL-1965] - Client crashes often when searching or opening the search view
* [CL-1969] - Android mobile client exception after closing app
* [CL-1972] - Fix Chat Search for file transfer messages
* [CL-1973] - Copy to clipboard copies formatted text on android
* [CL-1976] - Show an error toast if preferred mobile device is gsmonly
* [CL-1979] - Deleting of file assets is unreliable
* [CL-1980] - Last search entries broken on first opening
* [CL-1982] - tgz file gets manipulated to jpg after sending it in chat
* [CL-1984] - Always select the front camera if a video call is started for the first time
* [CL-1985] - RTSP doorbell streams on android don't work
* [CL-1986] - Client crashes when searching on iOS
* [CL-1989] - Wrong display name of BLF after apply and save line key
* [CL-1991] - Sometimes "ghost calls" happen when remote controlling an android phone
* [CL-1992] - Crash in PickupList::clearData()
* [CL-1994] - iOS client doesn't stop to ring, hangup ends call on other device
* [CL-1995] - Pushed calls not started from background if android api version <28
* [CL-2003] - If on desktop mobile is preferred device with gsmonly, we show toast, but phoning is still working
* [CL-2010] - Client should disallow phonebook actions for grafana viewers
* [CL-2014] - File asset is not deleted

## Release 70.R1493 (11.01.2021)

**Auf einen Blick**

- Hinweis: Dies ist die letzte Version mit Support für pascom 17 und 18 Server.
- Stabilität des Clients verbessert und diverse Absturzursachen behoben.
- Falsche Anzeigen von Lizenzfehlermeldungen behoben.
- Schweizer Telefonnummern werden nun korrekt formatiert.
- Wird ein Benutzer umbenannt, so zeigt der Client nun immer die richtigen Anzeigenamen und Avatare an.

**Tickets**

- [CL-1716] - Crash in avatar scaling code
- [CL-1736] - Upgrade to Qt 5.15.2
- [CL-1750] - Transfer via roster is disabled for the internal user the phonecall is currently active with
- [CL-1751] - Call notification is missing queue information
- [CL-1752] - Wrong error message is shown if license is exceeded
- [CL-1754] - Missing toast message when downloading unavailable voicemails
- [CL-1756] - 'Phone Book Info' heading too small on macOS
- [CL-1757] - macOS and iOS builds fail after Qt and Xcode updates
- [CL-1758] - Swiss phone numbers are formatted wrongly
- [CL-1763] - pascom Client shows wrong information if user is recreated with same extension
- [CL-1764] - Racy init between PlatformController and GStreamerController
- [CL-1770] - Upgrade to GStreamer 1.18.2
- [CL-1791] - Set do-nack property to false in gstreamer controller


## Release 69.R1548 (08.12.2020)
 
 (iOS, Android)  

**Auf einen Blick**

- Ein Anruf an das Mobilgerät wurde nach einmaligem Klingeln beendet, ist nun behoben.
- Verbesserte Zuverlässigkeit der Anrufannahme über die CarPlay UI.

**ÄNDERUNGEN**

- [CL-1728] - Answering a call via CarPlay UI is unreliable
- [CL-1760] - SIP Debug Logging switch doesn't work
- [CL-1772] - mobile client hangs up the incoming call under certain circumstances

## Release 68.R1423 (27.11.2020)

(Windows, Linux, macOS)

**Auf einen Blick**

- In seltenen Fällen friert der pascom Client beim Klick auf einen Button ein, wenn unter Windows der Accessibility Support aktiv ist.

**ÄNDERUNGEN**

- [CL-1742] pascom Client v67 freezes on windows if accessibility support is enabled

## Release 67.R1416 (24.11.2020)

**Auf einen Blick**

- Rufnummern werden nun automatisch formattiert und mit einer Ortsangabe versehen.
- Screensharing Qualität und Stabilität verbessert.
- Volle Unterstützung für Unicode Emoticons.
- Anklopfen wird unterstützt, falls serverseitig aktiviert.
- Unterstützung für Ubuntu 20.10 "Groovy Gorilla".
- Unterstützung für macOS 11 "Big Sur".
- Linux: Support für hochauflösende Bildschirme (HiDPI / 4k).
- Windows: Unterstützung für Webcams in Microsoft Surface Geräten / Intel AVStream basierte Webcams.
- Neues App Icon.
- Jabra Integration überarbeitet.
- Sennheiser / EPOS Integration überarbeitet.
- RDP / Terminal Server Split Modus eingeführt. Weitere Infos [hier](https://www.pascom.net/doc/de/clients/desktop-installation/#rdp-modus-am-terminalserver-nutzen).
- macOS: Freisprechen über integriertes Mikrofon und Lautsprecher hat nun eine bessere Qualität.
- iOS: Probleme mit Anrufen in IPv6 LTE Netzwerken behoben.

Achtung: Diese Version hat neue Mindestanforderungen an das Betriebssystem:

- Linux: Ubuntu 18.04 LTS
- macOS: 10.13
- iOS: 12.0

**ÄNDERUNGEN**

* [CL-56] - Proper emoticon support in pascom Client
* [CL-66] - No feedback in client if a destination is not reachable
* [CL-170] - Format phone numbers nicely in client UI and show area names
* [CL-1008] - Switch the client to Qt 5.15
* [CL-1037] - Enable HiDPI Support on Linux Client
* [CL-1083] - Crash on windows if the screen geometry changes
* [CL-1260] - Video does not work on Microsoft Surface Devices with Intel AVStream Camera
* [CL-1267] - Prevent screen lock when a video call is running
* [CL-1306] - Use one consistent brand font for the UI in pascom client
* [CL-1312] - Implement bandwidth management based on twcc
* [CL-1353] - Show Journal entries in Chat View 
* [CL-1358] - Missing recording indicator in recorded client
* [CL-1359] - Re-Enable call waiting support on iOS
* [CL-1361] - Fix and enable call waiting in client
* [CL-1384] - Conference is possible despite enabled video / screenshare
* [CL-1386] - Implement team voicemail playback in Journal
* [CL-1399] - Update application logo and signet
* [CL-1400] - Remove phone.Enable and fix softphone unregister if it's not the preferred device
* [CL-1412] - Sort Audio and Video devices consistently in Settings
* [CL-1422] - Missed call notification will be closed on updating
* [CL-1434] - Remove broken JobScheduler implementation in android client
* [CL-1435] - Screensharing on macOS flaps between stale images
* [CL-1444] - iOS switches to handsfree if video/screenshare gets enabled
* [CL-1462] - Update API Level to 30 on android until November 2020
* [CL-1464] - Android client crashes with OpenGL error
* [CL-1465] - Android client needs 13 seconds to boot main activity
* [CL-1479] - Client crashes on macOS when restoring audio devices
* [CL-1483] - Remove stale chat notifications on mobile phone when app is synced
* [CL-1486] - Improve Layout for Journal list cells
* [CL-1488] - LinkButton underline property inconsistent
* [CL-1492] - Settings glitches
* [CL-1493] - Client glitches with multiple actions 
* [CL-1494] - Phone book details consumes too much space for phone book info sometimes
* [CL-1495] - Back in journal instead of team after closing details of team call
* [CL-1496] - Show a phone icon in front of the "activity description"
* [CL-1510] - Pick up call via right click on ringing roster contact not possible
* [CL-1512] - Highlight colors match background color
* [CL-1513] - Disable team pause button if there is no pause reason at all
* [CL-1516] - After backup restore previous calls are visible
* [CL-1517] - Call fullscreen is closed on click on call notification
* [CL-1518] - Immediately check for updates if client version is too old for server version
* [CL-1526] - List of participants in group shows chat button for external web clients
* [CL-1529] - Close 'add action' and dropdowns in settings after click in background
* [CL-1535] - Show own phone status correctly in the queue overview
* [CL-1539] - Client increases output every time recording starts 
* [CL-1541] - Using different color for hovering texts and rects
* [CL-1545] - Fix news box layout on all platforms
* [CL-1547] - Redial in client loads last journal entry instead of last outgoing
* [CL-1557] - Hangup on Headsetbutton should hangup all calls in a conference
* [CL-1567] - Play 'knock' tone sequence for waiting calls
* [CL-1575] - Upgrade Jabra SDK to latest version
* [CL-1577] - Jabra Headsets immediately Unmute after muting
* [CL-1581] - Some chat search results are not jumping to correct chat history
* [CL-1582] - Tapping on a notification only opens the client, not the chat
* [CL-1583] - Sort-by-recent breaks if the client is on sleep while chat messages are sent
* [CL-1584] - iOS Client emoticon keyboard overlays text input on iOS 14
* [CL-1585] - Info toast buttons are hard to read
* [CL-1588] - Xmpp connection fails with "KeepAliveError" because of XEP-198
* [CL-1589] - Current calling info in roster does not elide
* [CL-1594] - Double replication started
* [CL-1597] - Too wide chat cell if multiline text
* [CL-1602] - Do not show error toast when 'playing' silence as notification tone
* [CL-1603] - File transfer broken with client 67
* [CL-1606] - Android client freezes after hang up of video conference
* [CL-1607] - Opening links in chat broken on mobile
* [CL-1608] - Header in client on iPhone X is short
* [CL-1609] - More UI glitches from feedback
* [CL-1612] - Initial Scaling of the Client Window is wrong after update
* [CL-1613] - pascom Client UI glitches from Feedback.
* [CL-1616] - More ui glitches from feedback
* [CL-1617] - Use VPIO on macOS
* [CL-1618] - Improve journal entries in chat room
* [CL-1621] - Incoming call auto declined on mobile client because of wrong call counter status
* [CL-1622] - Client actions layout broken
* [CL-1623] - macOS + Ubuntu client crash because of broken database after switching user/server
* [CL-1626] - Implement fax pdf download
* [CL-1628] - Automatic device selection breaks with Jabra Evolve 65
* [CL-1630] - Links in Chat notifications are broken and have wrong color in dark theme
* [CL-1635] - Can't play recordings on Android
* [CL-1636] - Broken layout shows bar in iOS settings 
* [CL-1641] - Downgrade of client failed because of version check
* [CL-1647] - Sennheiser plays call waiting tone after pickup
* [CL-1650] - Client call notification click broken
* [CL-1652] - Bubble roster items to the top if call happened
* [CL-1654] - Test client compatibility to Ubuntu 20.10
* [CL-1655] - Improve linker speed on Linux during debug builds
* [CL-1656] - Upgrade to GStreamer 1.18.1
* [CL-1659] - Android armeabi-v7a (32bit) devices are broken
* [CL-1660] - Can't open chats with 18.12 server after initial sign in
* [CL-1661] - Android client layout issue on initial screen when red toast 
* [CL-1662] - Recordings are not saved to customized download folder
* [CL-1666] - Open journal entry from search broken
* [CL-1667] - Improve redial button
* [CL-1668] - Crash in connection service if you put an unpaired app in the background
* [CL-1669] - File transfer displays success after accept timeout
* [CL-1670] - Handle discardEvents only when fastForward was received
* [CL-1672] - Client shows "No sip connection" during wakeup
* [CL-1673] - Add app version to crash reports on android
* [CL-1678] - Hide fax button in details of fax journal entry on mobiles
* [CL-1679] - Update OpenGL windows blacklist
* [CL-1680] - Client audio devices / camera selection are wrong after restart
* [CL-1681] - Open chat takes a long time on MacOS
* [CL-1685] - Fix pascom notification glitches
* [CL-1688] - Android client crashes after pairing
* [CL-1690] - Support a "split mode" for the client, run UI and Audio / Video input and output on different machines
* [CL-1692] - Active group calls not indicated in roster after re-login
* [CL-1693] - Client doesn't show name of joined web client participant in chat
* [CL-1694] - Missing ringing tone for softphone with follow me delay
* [CL-1701] - Phone numbers of external participants are not formatted in groups
* [CL-1706] - pascom Client code signature is invalid on macOS 11
* [CL-1707] - Issues with iOS and LTE with IPv6
* [CL-1708] - Fix glitches in phone book and call details
* [CL-1709] - Client phonecall list datamodel not synchronized with hardware phone datamodel
* [CL-1712] - Can't install client apk on Pixel 3a
* [CL-1717] - Creating a phonebook entry from journal during running call replaces name of internal user
* [CL-1722] - Click on chat entry in search results not jumping to the correct time
* [CL-1731] - Do not send empty avatar updates

## Release 66.R1326 (23.09.2020)

**Auf einen Blick**

- Durchwahlschalter sind über den pascom Client steuerbar (sobald der Server dieses Feature auch unterstützt).
- Verbesserter Headset Support - Wenn ein kompatibles Headset eingesteckt wird, werden die passenden Audiogeräte automatisch ausgewählt.
- Stabilitätsverbesserung des Clients in Verbindung mit Plantronics Headsets:  
--  Native Plantronics Bibliothek entfernt.  
--  Für die Headset Integration muss Plantronics Hub installiert werden.
- Screensharing kann während einem aktiven Anruf gewechselt werden.
- Bildschirmauswahl für Screensharing auf Linux Betriebssystemen hinzugefügt.
- iOS 14 Kompatibilität.

**ÄNDERUNGEN**

* [CL-4] - Missing audio with Plantronics D100 after headset was charging in dock
* [CL-320] - Picked up call lost after pickup and plantronics or jabra headset on macOS
* [CL-321] - Missing audio after hold with plantronics and status problems on macOS
* [CL-371] - Make Extension-Switches available in the Client
* [CL-482] - Clean up location dropdown if location gets deleted/changed
* [CL-1071] - Get rid of plantronics native library
* [CL-1076] - Improved Headset Support - auto-select the correct audio devices
* [CL-1277] - Implement a protocol to "switch" screensharing during a call
* [CL-1279] - Call Notifications show a hold button for a group call
* [CL-1307] - Empty phonebook entry after initiating GSM call
* [CL-1313] - Implement "select screen to share" on linux
* [CL-1316] - Improve handsfree button
* [CL-1319] - Correctly handle unpair push messages in the client (iOS)
* [CL-1330] - Prevent opening both drawer in call fullscreen layout
* [CL-1331] - Crash after wipe the client on conference and start again
* [CL-1334] - Invalid softphone state after exception
* [CL-1338] - Mobile pairing failed error page
* [CL-1342] - Client synchronization performance very slow if chat is opened
* [CL-1345] - Cannot handle login button on the pair login screen on android
* [CL-1348] - Resolving numbers from android phonebook is broken with international format
* [CL-1350] - Toast is not removed if timed-out file transfer is accepted
* [CL-1365] - Start single chat from group details participants list
* [CL-1392] - Correctly handle unpair push messages in the client (Android)
* [CL-1410] - Top-right settings button is not disabled while settings are loading
* [CL-1411] - Improve macOS usb monitor to report both vendor and product id
* [CL-1414] - Notifications for unread chat messages missing after log in
* [CL-1417] - Integrate Backtrace Crash Reporting on Android and keep debug symbols
* [CL-1437] - Empty roster if unread messages filter active
* [CL-1438] - Add trunk prefix drop-down to transfer and add call screen
* [CL-1443] - No offhook via iOS client if call was not accepted via native call notification on iOS 14
* [CL-1468] - Windows native notification fades in twice on an incoming call
* [CL-1522] - Memory leaks in client
* [CL-1537] - Move Confident to notification sounds instead of ringtones
* [CL-1538] - Client crashes when notifications are disabled in windows
* [CL-1556] - Ringtone plays on wrong device after reconnecting headset

## Release 65.R1286 (05.08.2020)

**Auf einen Blick**

- Es können jetzt beliebig viele App- und Url-Aktionen konfiguriert werden.
- Aktionen im Client können nun auf mehrere Anrufzustände reagieren.
- Journal wird jetzt vollständig auf den Client synchronisiert und ist schneller, filterbar und durchsuchbar (ab pascom Server 19.09).
- Support für Sennheiser / EPOS Connect 4.1.
- Updates mit inkompatiblen Server- oder Betriebssystemversionen werden nun automatisch verhindert.
- Screensharing funktioniert nun auch über schlechte Internetverbindungen zuverlässiger.

**ÄNDERUNGEN**

* [CL-111] - Improve "No microphone permission" error message on iOS
* [CL-123] - Improve chat search results to get the whole conversation
* [CL-158] - Proper shutdown and unregister client on kill signal
* [CL-243] - Multiple Actions in Desktop Client
* [CL-679] - Modernize Journal API, synchronize it using the Event Stream
* [CL-1137] - Improve client behavior if no usable phone device is available
* [CL-1138] - Client shows that latest version is used if connection is broken
* [CL-1160] - Headset dialog opens automatically after reconnecting
* [CL-1211] - Time counter is not updated during phonecall
* [CL-1257] - Unread messages counter badge to small for three-digit numbers
* [CL-1268] - pascom Client update breaks on macOS if installed via user account
* [CL-1278] - Client shows "Sennheiser HeadSetup not started" if autostart is enabled
* [CL-1283] - Use GStreamer for Ringtone, Notifications
* [CL-1289] - Consistently use device id instead of display name in Commands
* [CL-1291] - Make phone numbers and email clickable in phonebook details
* [CL-1296] - Introduce a Copy URL button for group urls
* [CL-1302] - Implement http based wav player for recordings and voicemails
* [CL-1332] - Improve screen selection for screensharing
* [CL-1337] - Show notifications and do not mark as read if chat view is scrolled upwards
* [CL-1363] - Display Team members using the RosterCell in Team View
* [CL-1366] - Client leaves fullscreen mode if another participant joins
* [CL-1369] - Android's context menu for e.g. pasting text broken
* [CL-1370] - Assertion in AudioDeviceList model on screen lock / unlock
* [CL-1371] - Crash in pjsip when logging out
* [CL-1373] - Crash in GStreamer audio player on incoming call
* [CL-1378] - Refactor fax uploads to use http API
* [CL-1379] - Native notifications crash on Windows 10 LTSB 2016
* [CL-1380] - Windows client doesn't use native dialogs for selecting files
* [CL-1381] - Screensharing is not reliable on a 4k Screen on windows
* [CL-1383] - Call waiting sound is played instead of normal ringtone even if call waiting is disabled
* [CL-1385] - Can't call group via button in chat view 
* [CL-1387] - Copy and paste not working in phone book edit mode
* [CL-1389] - Upgrade to Qt 5.12.9
* [CL-1390] - Wrong camera orientation on iOS
* [CL-1391] - Missing ringtones in pascom Client on window
* [CL-1398] - iOS client crashes if a screenshare is started
* [CL-1401] - Windows client crash after hangup with 19.09
* [CL-1402] - Client gstreamer devices is missing default pulse audio sink under linux
* [CL-1404] - Client roster alphabetical ordering is case sensitive
* [CL-1408] - "Journal fully loaded" toast covers full screen again
* [CL-1413] - Handle discard events for journal entries
* [CL-1416] - Away status is displayed with DND symbol on client
* [CL-1419] - Disable missed call notifications for teams if you're logged out
* [CL-1420] - Duplicate team entries in journal team filter list
* [CL-1423] - Allow *103 and similar codes for call redirection
* [CL-1425] - Provide a setting to "Disable HD Audio" in Client
* [CL-1426] - Adjust EPOS Connect path
* [CL-1432] - Add a "Internal/External" drop down to journal filter
* [CL-1436] - Screensharing has huge delay on some machines
* [CL-1439] - Make picked up calls more obvious in journal
* [CL-1442] - Camera is sometimes not detected on windows
* [CL-1445] - Android client logs an Exception when receiving an incoming chat message
* [CL-1446] - Disable AEC by default again everywhere except iOS
* [CL-1450] - Desktop client doesn't continue in pairing process
* [CL-1460] - Fix translation of unconfigured dial in number hint
* [CL-1463] - Label editing for phonebook entries is broken
* [CL-1466] - Custom ringtone is lost after client restart
* [CL-1469] - Show fax calls correctly in journal
* [CL-1471] - Adjust Call detail fields for group calls
* [CL-1474] - Legacy Journal does not reload if the client wakes up from sleep on Android
* [CL-1475] - Client crashes on ringtone playback
* [CL-1484] - Wrong status of play button in client settings
* [CL-1485] - Dropdown for outgoing calls shows wrong device name after video call



## Release 64.R1156 (16.06.2020)

**Auf einen Blick**

* Windows/macOS/Linux: Unterstützung für Kuando Busylights
* Windows/macOS: Beim Screensharing kann nun der zu teilende Bildschirm ausgewählt werden
* Windows: Video / Screensharing wird nun auch innerhalb von RDP-Sitzungen / auf Terminal-Servern aktiviert
* iOS/Android: Probleme mit NAT64 Netzwerken (z.B. via LTE) behoben
* iOS/Android: Während des Gesprächs kann nun zwischen Front und Rückkamera umgeschaltet werden
* Windows: Wenn das Windows Info Center deaktiviert ist, werden nun automatisch pascom-Benachrichtungsfenster verwendet
* Android: "tel:" Uris werden nun verarbeitet
* Videoqualität verbessert, es gibt nun weniger glitches
* Diverse Verbesserungen beim Screensharing
* Bandbreite und Auflösung für Screensharing wird nun dynamisch ausgewählt
* Die maximale Auflösung beim Screensharing ist nun 2560x1440
* Verbessertes herunterskalieren von höheren Bildschirmauflösungen
* Windows/macOS/Linux: Tastenkürzel können deaktiviert werden
* Linux: Kompatibilität mit Ubuntu 20.04 LTS “Focal Fossa” geprüft
* Kleinere UI Verbesserungen
* iOS: Zurück-Button ist nun sichtbar wenn die Tastatur im Chat geöffnet ist
* DTMF Eingabefeld kann nun wieder geschlossen werden
* “Es gibt keine Journaleinträge die auf den Filter zutreffen”-Toast wird nicht mehr mehrfach angezeigt

**ÄNDERUNGEN**

* [CL-1] - Prohibit to add a call if GSM switch is active
* [CL-76] - Chat header disappear when the keyboard is visible
* [CL-350] - Support for Kuando Busylight
* [CL-536] - Completely close client if login mask window gets closed
* [CL-626] - Always send callerId Updates for locally resolved names
* [CL-855] - Select screen to share if multiple are connected
* [CL-898] - Adaptive quality for video and screensharing in pascom Client
* [CL-960] - Chat history jumps back to most recent message frequently
* [CL-1108] - Use pascom Mobile Client as standard telephony app on Android
* [CL-1119] - Group mute menu is elided too much 
* [CL-1122] - Mute a pascom group forever
* [CL-1131] - Unify journal entry icons
* [CL-1136] - Ensure pascom Client compatiblity to Ubuntu 20.04 LTS 
* [CL-1149] - iOS  mobile client shows warning to insert SIM card sometimes
* [CL-1155] - System tray tooltip format is broken if no instancename is given on login
* [CL-1161] - Blind transfer to external number needs trunk prefix
* [CL-1166] - Enhance contact list "List view" 
* [CL-1172] - Decoded video often breaks and shows glitches when displaying
* [CL-1179] - Allow to disable keyboard shortcuts
* [CL-1187] - Play busy tone in softphone if a call ends with a "busy" status code
* [CL-1190] - Make DND state more visible
* [CL-1194] - Show user provided device name instead the generated one
* [CL-1209] - Correctly reset settings fields for invalid inputs
* [CL-1217] - Toast shown in background if popup is in foreground
* [CL-1218] - Automatically switch to Handsfree on mobile if video is started
* [CL-1223] - Hide "..." button and replace it directly with "microphone off"
* [CL-1227] - Only start video in settings if the element is visible
* [CL-1228] - Implement live camera switching in mobile client
* [CL-1230] - Enhance Fullscreen UI with a contact list, showing all active call participants (just like webclient)
* [CL-1234] - pascom Client crashes on file transfer
* [CL-1236] - Conversation is not closed if a user is removed from a group
* [CL-1237] - Phone button looses active call indication
* [CL-1238] - No phonecall duration indicator in list view
* [CL-1239] - Color bindings for buttons in client broken
* [CL-1246] - Error toasts covers call fullscreen layout
* [CL-1251] - Location dropdown not usable if name is too long
* [CL-1253] - Enable video in RDP sessions and Terminal Servers
* [CL-1265] - Support "mac native" fullscreens
* [CL-1272] - Client crashes if native Notifications are enabled and Windows Notification Center is disabled
* [CL-1280] - Native notifications on Windows 10 are flickering again
* [CL-1281] - Stack Overflow due to "openCall" signal on iOS
* [CL-1282] - Open call from android notification broken
* [CL-1284] - Highlight color for marked text is not red
* [CL-1285] - Can't close DTMF input window
* [CL-1286] - Existing video in group call does not open automatically
* [CL-1287] - Client shows multiple registrations if no sip connection is possible
* [CL-1288] - Enhance client fullscreen layout, show videos side-by-side if client window is landscape
* [CL-1292] - Android group notification does not open chat dialog
* [CL-1293] - iOS app has wrong color theme after pairing
* [CL-1294] - pascom App doesn't work with 6to4 nat gateways via LTE on Android / iOS
* [CL-1295] - Improve screen sharing video scaling and aspect ratio
* [CL-1298] - Awake pascom app for call failed message
* [CL-1311] - Get rid of misleading "dll could not be found" error message when initializing gstreamer
* [CL-1321] - Do not show "There are no Journal entries which match the filter" toast multiple times
* [CL-1347] - "Hide System Calls in Journal" is unset after app restart on iOS

## Release 62.R1061 (20.04.2020)

**Auf einen Blick**

* Unterstützung für Gäste via WebClient mit pascom 19.06R Server.
* Linux: Support für Jabra Headsets.
* Windows/macOS: Der pascom Client kann jetzt gleichzeitig mit Jabra Direct installiert sein.
* Windows/macOS: Stabilität der Jabra-Integration verbessert.
* macOS/Linux/Android/iOS: QOS / TOS Flags für SIP und SRTP werden nun korrekt gesetzt.
* Android: Der Client prüft nun ob die Energiespareinstellungen korrekt konfiguriert sind.
* Android/Xiaomi: Wenn die "Bildschirm-Aufwecken"-Berechtigung auf Xiaomi-Geräten mit MIUI nicht gesetzt ist, erscheint nun eine Warnungmeldung nach dem ersten fehlgeschlagenen Anruf.
* Audioqualität bei Gesprächen über das Softphone, auf allen Plattformen verbessert.
* Windows/macOS/Linux: "dynamisches Scrollen" kann nun deaktiviert werden.
* AEC ist standardmäßig deaktiviert, wenn ein unterstütztes Headset (Jabra, Sennheiser, Plantronics) verwendet wird.
* Acoustic Echo Cancellation (AEC) Einstellungen sind nun konfigurierbar.
* Sowohl pascom Client.exe als auch das Setup haben nun ein gültiges Codesign-Zertifikat.
* Wenn zwei Desktop Clients angemeldet sind, verbleibt die SIP-Registrierung beim zuletzt angemeldeten Client.
* Synchronisierung mit einem pascom19 Server ist schneller und blockiert den Client nicht mehr.
* Behoben: Wenn der pascom Client auf mehreren Geräten verwendet wurde, wurden bereits gelesene Chat-Nachrichten manchmal wieder als ungelesen angezeigt (mit pascom19 Server).

**ÄNDERUNGEN**

* [CL-22] - Hide headset configuration message during login
* [CL-114] - Improved Jabra Headset support (SDK v2)
* [CL-540] - Cursor stays in input mode
* [CL-542] - Implement QOS / TOS support in client
* [CL-583] - Disable background-clicking in settings
* [CL-629] - Apple Call Kit Overlay won't work for iOS client
* [CL-633] - Right click menu glitches
* [CL-643] - Show a hint if the android client is not on the "Battery Whitelist"
* [CL-762] - Support iOS13 SDK and Remote Notification pushes in iOS
* [CL-847] - Allow to disable / reduce scroll inertia
* [CL-1007] - Implement a "Detail overlay" for (error) toast messages on mobile
* [CL-1024] - Support Public Groups and Guests in pascom Client
* [CL-1054] - Remove unread messages of deleted user (sender)
* [CL-1059] - Scrolling glitches on mobile clients
* [CL-1082] - Disable tooltips on mobile client
* [CL-1085] - Content entered in the chat input is lost if you put the app into the background
* [CL-1093] - You can click through the resync screen
* [CL-1099] - Yellow stated user should also be visible if filter is 'online'
* [CL-1110] - App does not open if you tap on a missed call notification on android
* [CL-1111] - Android app doesn't handle vendor specific additional permissions correctly
* [CL-1115] - Sennheiser Headset treats forwarded calls incorrectly
* [CL-1134] - Follow me settings are out of box on mobile if config is blocked by admin
* [CL-1135] - Client does not notify me if i do not have a usable phone
* [CL-1144] - Show "audio only" users in group details and stream list
* [CL-1146] - Optimize AEC and Gain Parameters
* [CL-1156] - pascom Client sometimes crashes when rescanning video devices on Windows
* [CL-1162] - User entered content is not properly filtered, and will be treated as html
* [CL-1167] - pascom Client checks for updates too often
* [CL-1173] - Pickup to a queue with Jabra Headset results in a hangup of the picked call
* [CL-1174] - Can't change selected audio device after start up
* [CL-1180] - Client steals sip registration if two desktop clients are online
* [CL-1181] - Link buttons on blue background are hard to read
* [CL-1186] - Message ordering is wrong if you send a message in a group chat
* [CL-1188] - Handle aspect-ratio changes in the video stream correctly
* [CL-1191] - Additionally sign pascom Client.exe, not only setup
* [CL-1193] - Clean chat history on discardEvent
* [CL-1198] - Invalid Displayed marker is sent to server
* [CL-1203] - Group vanishes if you star and unstar it
* [CL-1204] - Sometimes, video is hidden in client for no apparent reason
* [CL-1206] - Missing camera device in settings after startup sometimes
* [CL-1208] - Better Interactivity with incremental handling of Events
* [CL-1213] - utf-8 error when loading gstreamer plugins
* [CL-1215] - Client shows "You need to assign a number to the device in order to dial" error
* [CL-1219] - Close video fullscreen mode if the last video stream stops
* [CL-1225] - Client crashes during datev import
* [CL-1231] - Client displays "login failed" before actually logging in
* [CL-1235] - iOS App doesn't play notification sound if a message is received via push
* [CL-1240] - Broken translation for HeadsetToast
* [CL-1242] - Client shows notifications for displayed or already acknowledged messages
* [CL-1255] - Message content is not visible in push notification


## Release 61.R919 (19.02.2020)

**Auf einen Blick**

- Im Betriebssystem konfigurierte Http-Proxies werden nun beim Update berücksichtigt.
- Automatische Updates können nun in den erweiterten Einstellungen deaktiviert werden.
- Filtern der Kontaktliste ist jetzt zuverlässiger, es werden keine Zeichen mehr doppelt eingegeben.
- Android: Eingehende Anrufe werden nun in einem optimierten Bildschirm dargestellt um Fehlbedienungen zu vermeiden.
- Android/iOS: Die Freisprech-Funktion ist nun zuverlässiger und “lauter”.
- Android: Die App wacht jetzt zuverlässiger auf, bei eingehenden Anrufen.
- Android: Umschalten auf Freisprechen funktioniert nun wieder.
- Lautstärke des Softphones auf allen Plattformen angehoben.
- Echo-Cancelling (AEC) bei Anrufen und Freisprechen verbessert.
- Automatische-Gain-Anpassung (AGC) abgeschaltet.
- SIP-Re-Registrierung auf Mobilgeräten beschleunigt.

**ÄNDERUNGEN:**

* [CL-94] - Proper http proxy support in pascom Client
* [CL-370] - Weird behaviour if recording stops
* [CL-534] - Disable menu buttons if we already are in the correct view
* [CL-564] - Always set MODE_IN_COMMUNICATION for AudioManager
* [CL-686] - Disable automatic updates via "Advanced Settings"
* [CL-693] - Improve logging of client proxy
* [CL-729] - Introduce chat inline notifications
* [CL-839] - Disable proxymity sensor when handsfree speaker is active
* [CL-879] - Correctly handle pushed messages on iOS and Android
* [CL-894] - Show group chat message origin in android and ios notification
* [CL-909] - Hide away (yellow) user state on pascom 19
* [CL-928] - Switching to handsfree speaker doesn't work
* [CL-971] - Prohibit to open empty settings on mobile during pairing process
* [CL-950] - Save outgoing message immediately to the database
* [CL-980] - pascom Client looses characters when typing into the roster filter
* [CL-994] - Bring back redial function on dial button
* [CL-998] - Resolve caller number of local (DATEV) phone book in pickup notifications
* [CL-1004] - Do not resynchronize on every server version change
* [CL-1006] - Implement a special incoming call screen on android
* [CL-1018] - Check for microphone access is broken on windows
* [CL-1019] - Re-Implement alert() / request attention feature in desktop client
* [CL-1031] - Client crashes on shutdown on macOS in pjsip libDestroy()
* [CL-1040] - Crash in WinnotificationController::findToastFromHistory()
* [CL-1044] - TAPI doesn't immediately use changed preferred device
* [CL-1047] - You can't use Escape to close the settings screen
* [CL-1061] - Switch NSIS installer to Unicode
* [CL-1068] - Hover for outlook settings button 'add' vanishes text
* [CL-1074] - Change status text after switching focus
* [CL-1078] - Fix macOS 10.15 notarization
* [CL-1079] - An active redirection is not shown in the roster anymore
* [CL-1080] - Don't change position of filtered roster (sorted by name) after presence change
* [CL-1081] - Crash in MdTonePlayer::stop() on android
* [CL-1084] - Back button does not work correctly on android
* [CL-1086] - User chat is opened instead of group chat when clicking on a group notification
* [CL-1089] - Mobile apps shows sip connection error message after wakeup
* [CL-1090] - Handsfree speaker is not correctly handled if gain increase is disabled
* [CL-1102] - android pascom Client sometimes does not wake up to calls
* [CL-1104] - Gain increase doesn't work on certain ios devices
* [CL-1106] - Use Connection Service Switch is missing from the Advanced Settings on android
* [CL-1114] - Changing roster sort broken
* [CL-1116] - libgstqtvideo is searched in wrong path on android armv7 (32bit)
* [CL-1120] - Improve echo cancellation and audio quality in pascom Client
* [CL-1140] - Client always shows resync screen after login
* [CL-1142] - WebCam stream leaks and crashes Client if usb monitor is restared while a stream is running


## Release 60.R872 (13.01.2020)

**Auf einen Blick**

- Wenn das Softphone die Verbindung verliert, registriert es sich wieder deutlich schneller.
- Die Kontaktliste kann nun wieder nach den Server konfigurierten Rollen gefiltert werden.
- Linux: Der Client verbraucht nicht mehr 100% CPU nach einem Telefonat auf Ubuntu ab 18.10. (Known Issue CL-1002)
- Linux: Die Auswahl von Audiogeräten zeigt nun leserliche Namen und funktioniert wieder. (Known Issue CL-491)
- Linux: Kompatibilität zu verschiedenen Linux Distributionen / Versionen verbessert.
- Windows: Native Benachrichtungen sind zuverlässiger. (Known Issues CL-1009)
- Windows: Der Client startet nun automatisch beim Systemstart. (Option in den Client Einstellungen und bei der Installation)
- Android: Connection-Service Implementation verbessert. (Known Issues CL-957)
- iOS: Amtspräfix wird nun nicht mehr vor der Rufnummer gezeigt, bei einem eingehenden Anruf. (Known Issues CL-800)

**ÄNDERUNGEN:**

* [CL-357] - Client doesn't remember pdf watcher folder after closing settings
* [CL-394] - Inconsistent behavior for adding a call
* [CL-426] - Speedup client installation time on windows
* [CL-431] - Improve registration of softphone after instance/xmpp restart
* [CL-491] - pascom Client shows wrong audio devices on Linux
* [CL-585] - Ask user if setup should create autostart link on windows
* [CL-676] - Client crashes on older Nvidia GPUs during QSGDefaultDistanceFieldGlyphCache creation
* [CL-677] - Client crashes on older ATI / AMD GPUs during QOpenGLContext destructor
* [CL-688] - Wrong device used for team pickup
* [CL-755] - Implement hardened runtime / sandboxing in pascom Client until 2020
* [CL-783] - Automate Upload to the iOS App Store
* [CL-793] - Speed up Settings Screen
* [CL-800] - iOS client shows trunk prefix in call push notification
* [CL-871] - Only show applicable Rendering Modes on MacOS/Linux Clients
* [CL-891] - Smart Filters, Milestone 1 - Filter Roles
* [CL-906] - Apple phonebook contact not populated after switching to settings
* [CL-911] - Open 'join group' info from group details
* [CL-917] - Mark phonebookentry as favorite broken
* [CL-919] - Store pin in groupparticipant table
* [CL-932] - Improve Android Connection Service Integration
* [CL-947] - Match different ringing icons
* [CL-951] - Impossible to invite newly created user into the group
* [CL-952] - Improve client resynchronisation logic
* [CL-957] - Sometimes, a connection service screen shows up despite self managed is enabled
* [CL-967] - Custom status not immediately visible
* [CL-972] - MdSoftphone::findCall(PhonecallPtr) breaks mute and handsfree feature
* [CL-978] - Client requests prohibited contacts
* [CL-982] - Can't copy phonebook contact to private phonebook if added to group before
* [CL-986] - Update to Qt 5.12.6
* [CL-987] - Include type in monitor init transfer
* [CL-991] - Call list layout broken
* [CL-992] - Details of favorite phone book contact not updated
* [CL-993] - Bring back details and chat in ringing screen
* [CL-995] - Message counter wrong in group edgecase
* [CL-1001] - Windows native notification shows group avatar
* [CL-1002] - Linux Client freeze/high-cpu after each call starting from ubuntu 18.10
* [CL-1003] - Fix phonebook UI glitches on mobile clients
* [CL-1005] - Fix fpic and other build problems on modern linux systems
* [CL-1009] - Problems with Windows Notification Center
* [CL-1012] - Roster not shown after new log in 
* [CL-1016] - Client settings partly broken
* [CL-1017] - Linux client crashes on startup
* [CL-1020] - Crash due to invalid read in winFileTransfer notification
* [CL-1023] - Linux: Check which system libraries should be used
* [CL-1028] - Chat view is broken if you put the app into background and bring it back again
* [CL-1032] - Windows native notification not shown for missed voicemail call
* [CL-1045] - Ringback tone during call on mobile
* [CL-1046] - Auto sending of fax setting disabled after client restart
* [CL-1053] - Can't add favorite contact to group 
* [CL-1055] - Client crashes when there is no matching ContactFactory
* [CL-1057] - Logout or restart causes problems with smart filter in roster
* [CL-1060] - NSIS 3.05 breaks pascom client setup script
* [CL-1066] - Name of phonebook contact missing in group overview
* [CL-1069] - Sound for incoming message is played multiple times in a row
* [CL-1070] - Client allows to add phonebook contacts to 'removed' groups 
* [CL-1075] - Open android phonebook entry is broken


## Release 59.R726 (26.11.2019)

**Auf einen Blick**

- Die Favoriten werden mit pascom 17 / 18 Servern wieder korrekt angezeigt
- Chat-Nachrichten werden bei pascom 17 / 18 Servern nicht mehr mehrfach angezeigt
- Der Client verbindet sich schneller zu pascom 17 und 18 Servern
- Die Telefonbuch Listenansicht enthält jetzt wieder Icons, um direkt eine Rufnummer zu wählen
- Chat-Nachrichten werden auf pascom 19 Servern nicht mehr mehrfach angezeigt
- Gruppenchats zeigen jetzt den Avatar des Absenders an

**ÄNDERUNGEN:**

* [CL-853] - Introduce a refresh button on the contactlist
* [CL-913] - Roster contacts slowly shown on mobiles with pascom 17 and pascom18
* [CL-925] - No phonebook details visible after adding phonebook contact to group
* [CL-933] - Improve contact search provider
* [CL-943] - "filtered" message not shown when text filter is active 
* [CL-944] - Active smart filter + click on message indicator makes strange things
* [CL-949] - Respect XDG Specification in linux create-starter.sh
* [CL-953] - Improve Toast Messages after login
* [CL-962] - Fax via phone book contact not correctly working
* [CL-964] - Improve Phonebook list view cells
* [CL-970] - Pascom 19: The same chat message is shown multiple times in a notification 
* [CL-973] - Missing call buttons  if renderer mode is 'software'
* [CL-976] - Avatar is missing in notification
* [CL-983] - The same chat message is shown multiple times in a notification on pascom 17 / 18 (again)
* [CL-984] - pascom Client crashes after startup


## Release 58.R676 (07.11.2019)

**Auf einen Blick**

- Die Icons in den Details eines Telefonbucheintrages können wieder zum Wählen angeklickt werden
- Avatare flackern nicht mehr, wenn ein Smart Filter gesetzt ist
- Chat-Nachrichten werden nicht mehr mehrfach angezeigt (pascom 17 / 18 Server)
- Seltenen Crash beim Empfangen einer Chat-Nachricht behoben
- Pickup Benachrichtigungen aus Teams zeigen wieder korrekte Informationen an

**ÄNDERUNGEN:** 

- [CL-905] - Wrong datev icon size 
- [CL-923] - Hide 'Add to group' button if phonebook entry is in edit mode
- [CL-934] - Do not show video buttons in a external 1:1 phonecall
- [CL-935] - Renaming a group is tricky
- [CL-936] - Group + Icon missing when starting with empty user directory 
- [CL-937] - You can't click on a phone number within phonebook entry details to dial it
- [CL-938] - Speed up Avatar Displaying, avoid flickering images
- [CL-939] - If you pair a mobile, your avatar is sometimes broken
- [CL-940] - Native windows notifications still flicker sometimes
- [CL-948] - Pickup notification doesn't show team information anymore and it's not possible to pickup a team
- [CL-955] - Integrate User Feedback 
- [CL-958] - Client crashes with a stackoverflow when receiving a chat message
- [CL-968] - Pascom 18: The same chat message is shown multiple times in a notification
- [CL-969] - pascom Client does not ring in background on android 10 (again)


## Release 57.R661 (30.10.2019)

{{% notice note %}}
Bei diesem Release gibt es keine eigene Client-Version, da die Änderungen nur die Mobile iOS-Applikation betrifft.
{{% /notice %}}

**Auf einen Blick**

- iOS Anruf Problem in Verbindung mit pascom 18 Server behoben.

**ÄNDERUNGEN:** 

- [CL-942] - iOS App can't phone with a pascom 18 server

## Release 56.R659 (29.10.2019)

**Auf einen Blick**
 
- Kontaktliste neu gestaltet
- Chat UI überarbeitet
- Suchbildschirm verbessert
- Android: Connection Service integriert, dies ermöglicht u. a. Anrufsteuerung via Headset und im Auto
- Android 10 kompatibilität
- Android 6.0 oder neuer erforderlich
 
**Im Zusammenspiel mit einem pascom19 Server außerdem:**  

- Video-Anrufe
- Flexible permanente Gruppenchats, Anrufe und Videokonferenzen
 
**ÄNDERUNGEN:**
 
- [CL-921] - Sometimes deleted contacts show up in the contactlist
- [CL-895] - Emoticon Keyboard is broken on iOS 13
- [CL-882] - Answer a call in a car does not work on android
- [CL-816] - Use native notifications by default on windows
- [CL-809] - iOS somtimes continues ringing after push
- [CL-807] -  Android client does not hang up softphone call if a gsm call is already running
- [CL-792] -  Auto update doesn't work sometimes on macOS
- [CL-763] -  Be compatible to Android 9 privacy settings
- [CL-751] -  pascom Client does not ring in background on android 10
- [CL-748] -  pascom Client compatibility to iOS 13
- [CL-728] -  Broken timestamp formatting on iOS/Android journal
- [CL-726] -  Wrong translation for "Hide System Calls in Journal"
- [CL-710] -  Implement workaround: Call Specific actions are broken for softphone calls
- [CL-647] -  Prevent connecting to server versions lower than 17
- [CL-567] -  CallKit on Lockscreen should have an icon for the "pascom" button
- [CL-508] -  Sennheiser keeps ringing after offhook on desktop phone

## Release 54.R534 (12.09.2019)

{{% notice note %}}
Bei diesem Release gibt es keine eigene Client-Version, da die Änderungen nur die Mobile iOS-Applikation betrifft.
{{% /notice %}}

**Auf einen Blick**

- Kompatibilität zu iOS 13

**ÄNDERUNGEN:**

- [CL-748] - pascom Client compatibility to iOS 13


## Release 53.R453 (03.07.2019)

**Auf einen Blick**

- Android: Anrufhandling bei gesperrtem Bildschirm verbessert
- iOS: Wenn der DND-Modus von iOS aktiv ist, wird der Anruf direkt abgelehnt
- Desktop: Ein Update wurde trotz gesetztem --noUpdate-Flag heruntergeladen, aber nicht installiert. Der Client gibt nun nur noch einen Hinweis, dass eine neue Version zur Verfügung steht
- Windows: Auf Systemen mit Intel-Grafikkarte wird nun standardmäßing Angle als Rendering-Backend verwendet

**ÄNDERUNGEN:**

- [CL-260] - Broken attended transfer with locked screen on android
- [CL-354] - Check iPhone "DND" mode *before* setting up an incoming call
- [CL-500] - Message badge is not reset on iOS if no Chats are opened
- [CL-515] - Prevent Screen Locking while phoning on android
- [CL-528] - Proximity Screen Turn Off is not handled correctly on android
- [CL-546] - Show unix path as example action app path on macOS/Linux 
- [CL-549] - Add a red background again to Buttonless iOS-Devices
- [CL-584] - Setup "Angle" as default rendering for all Intel GPUs
- [CL-605] - FindPhonebookEntry is sent for journal without phonebook entry 
- [CL-653] - pascom Client prevents screen locking on Android if no passcode or similar locking mechanism is defined
- [CL-657] - Volume too low on iOS handsfree speaker
- [CL-658] - Bump target api level to 28 on android client
- [CL-660] - pascom Client downloads update despite NO_UPDATE is set


## Release 52.R428 (18.06.2019)

**Auf einen Blick**

- Alle Plattformen: Die App sperrt die UI nicht mehr während Daten nachgeladen werden. Dies verbessert insbesondere auf Mobilgeräten die Reaktionszeit
- Windows: Das verwendete Renderbackend lässt sich nun direkt in den Client-Einstellungen umschalten
- Android: Die App ist jetzt als 32bit / 64bit "Universal APK" verfügbar
- Android / iOS: Notrufe an die 110 und 112 werden nun immer direkt über das Mobiltelefon (GSM) aufgebaut

**ÄNDERUNGEN:**

- [CL-11] - Wrong call state if second call via hardware phone
- [CL-31] - Remember selected journal filter in client
- [CL-84] - Ensure 64bit compatibility in android client for play store
- [CL-469] - Copy private phonebook entry to global company phonebook
- [CL-492] - Do not block the client UI by default if a cmd is sent
- [CL-511] - Switch the Rendering mode directly in the client
- [CL-531] - No popup notification if chattab is open in background on mobile
- [CL-533] - Close right click menu in phonebook details after click on different area
- [CL-544] - Convert capital letters to lower case in login mask
- [CL-554] - Force openglSoftware on Intel G41 express
- [CL-561] - Mute in 3 party conference causes missing audio for all participants
- [CL-569] - Get rid of "libpng warning: iCCP: known incorrect sRGB profile" warnings
- [CL-572] - Chat Notification does not immediately close if you click on it
- [CL-601] - Enforce mobile client emergency call via GSM
- [CL-602] - Update cocoasudo version in macOS client
- [CL-627] - pascom Client on iOS looses pairing after update
- [CL-631] - Phonebook entry details are not showing any details in the client
- [CL-649] - No chat notification sent if chat is already open
- [CL-650] - No chat notification sent if client was closed
- [CL-651] - Remove server version deprecated warning again


## Release 51.R365 (27.05.2019)

**Auf einen Blick**

- Es stehen jetzt mehr integrierte Klingeltöne zur Auswahl
- Benachrichtigungen zeigen nun wieder die Quelle (z. b. eine Warteschlange an)
- Diverse Performance und Stabilitätsverbesserungen

**ÄNDERUNGEN:**

- [CL-67] - Remove keyboard lowercase hints on android again
- [CL-286] - Sennheiser status LED stays busy and call control problems
- [CL-327] - Include more ringtones in pascom Client
- [CL-383] - Update opus codec to version 1.3
- [CL-403] - Select dark theme automatically if the main theme of macOS is dark
- [CL-407] - Open chat shortcut broken in normal and extended mode
- [CL-429] - You can select multiple messages in the chat room, but copy only one
- [CL-448] - No error message if password change in pascom Client fails
- [CL-450] - Implement ‘select all’ for group chats
- [CL-478] - Improve behavior of client if a call gets cancelled
- [CL-481] - Copy and paste via right click menu in login mask
- [CL-489] - Chat UI is broken after resizing
- [CL-495] - Show message that no journal entries are matching the filter
- [CL-502] - Introduce a toast message if the client is outdated and updates are disabled
- [CL-503] - Native notification avatar resolution is too low
- [CL-532] - Improve avatar handling for larger (> 50 User) installations with huge images
- [CL-539] - Client crashes after connecting to appliance without maintenance
- [CL-545] - Client doesn’t remember auto PDF faxing setting
- [CL-552] - Wrong shortcut appears after recording key press
- [CL-558] - Attended Transfer is broken on iOS
- [CL-565] - Display a warning if the client connects to a deprecated or outdated server version
- [CL-586] - Avatar in roster still gray if contact switches to available
- [CL-589] - Avatar Caching mechanism sometimes loops, consuming huge amounts of bandwith
- [CL-599] - Use “callDisplayName” property to show correct title for a phonecall in new call notifications
- [CL-614] Number shown twice instead of name


## Release 50.R318 (24.04.2019)

**Auf einen Blick**

- "Flackernde Anzeige" des Clients auf macOS 10.14.4 behoben
- Alle Benachrichtungen im Desktop-Client wurden neu gestaltet und verbessert
- Viele Absturzprobleme auf Android behoben
- Schnellerer Client-Start durch beschleunigtes Avatar-Rendering
- Bei wartenden Anrufern in einem Team werden nun die Labels des Anrufs angezeigt

**ÄNDERUNGEN:**

- [CL-127] - Upgrade Client to Qt 5.12
- [CL-151] - Show incoming file transfer requests also as toast
- [CL-244] - Mobile client crashes on Huawei and Android 6.x 
- [CL-310] - pascom Client crashes when Acessibility Support is enabled in Windows
- [CL-358] - Close open fax dialog if connection interrupts
- [CL-382] - Can't scroll via mouse wheel on non-primary screen
- [CL-404] - Improve custom notifications in client
- [CL-435] - Improve layout for "Edit" button of phone book entry in call details
- [CL-441] - Introduce Database migration during updates
- [CL-444] - Show labels in queue waiting calls
- [CL-464] - Autofocus in LoginPane
- [CL-465] - Use OpenGL fragmentShader for drawing avatar images
- [CL-470] - Deactivate call action buttons if device doesn't support remote control
- [CL-471] - Exception on registerSoftphone after selecting softphone as prefered device
- [CL-475] - Phonebook entry layout broken after incoming call on mobile client
- [CL-476] - Roster button schedules callback notification instead of calling destination of call forwarding
- [CL-479] - Mark text if you tab to input filed in login mask
- [CL-483] - Client Crash when displaying pickup notifications
- [CL-487] - Mobile pairing glitches
- [CL-494] - Client Freezes with ANGLE in an Windows Server 2012R2 Terminal Server Environment
- [CL-497] - Some database settings are read too early during client startup
- [CL-498] - Test client release 50
- [CL-501] - Client crashes on Windows and OSX if you initiate a call
- [CL-504] - Decline button on left side after take off on mobile
- [CL-509] - Copy from phonebook is broken
- [CL-513] - Client flickers when displaying notifications on macOS 10.14.4
- [CL-521] - Wrong avatar shown in roster
- [CL-522] - copy from a chat search result cell copies the wrong text
- [CL-523] - Client crash after receiving incoming chat message
- [CL-525] - Can't show more details to missed call notification with labels 
- [CL-527] - Inconsistent and too low call volume on android
- [CL-529] - Broken Menubar Layout for iPhone X devices with Qt 5.12
- [CL-530] - No default avatar shown in team overview
- [CL-537] - Android client sometimes crashes during first startup
- [CL-555] - Windows client shows both native and custom callback notification


## Release 49.R265 (21.03.2019)

**Auf einen Blick**
 
- Systemanrufe können nun aus dem Journal gefiltert werden
- Bei eingehenden Chat-Nachrichten wird nun ein Ton abgespielt
- Beim pascom Softphone kann nun eine Verstärkung für Mikrofon und Lautsprecher konfiguriert werden
 
**ÄNDERUNGEN:**
 
- [CL-14] - Switches changing color in client settings
- [CL-38] - Scroll loop in client journal
- [CL-100] - Save Settings (FollowMe) on pressing Home-Button
- [CL-281] - Chat room glitches
- [CL-299] - Simplify login forms for pascom.cloud users
- [CL-326] - Play a sound when receiving an incoming chat message
- [CL-345] - Improve tabbing through settings
- [CL-366] - Bright context menu in dark theme
- [CL-390] - Call volume is still to low on certain mobile devices
- [CL-395] - Pickup call clicking on phone icon
- [CL-396] - Preserve entered mobile number if the app goes to sleep
- [CL-401] - Remove deprecated logging window and model
- [CL-402] - Select dark theme automatically if the main theme of windows is dark
- [CL-405] - Callback notification shown twice
- [CL-415] - Headset not selected as speaker
- [CL-419] - Enhance “offline contact filter” - also filter out user that have a paired mobile but an offline phone presence
- [CL-422] - Introduce a switch to filter out system calls from journal
- [CL-442] - Missing activity after voicemailbox answers
- [CL-446] - Notifications has incorrect position on windows
- [CL-452] - pascom Client does not recognize eSim on a iPhone Xr/Xs
- [CL-453] - Phonecall duration is incorrect
- [CL-455] - Softphone not reacting on rejected call
- [CL-473] - Pairing not working

## Release 48.R196 (08.03.2019)

**Auf einen Blick**

- Automatischer Faxversand: Wenn ein PDF Steuerzeichen enthält und GhostScript installiert und konfiguriert ist, kann der pascom Client dieses nun automatisch an die Zielrufnummer faxen
- Der iOS Client zeigt nun eine Benachrichtigung bei verpassten Anrufen an
- Auch mit aktiviertem Jabra-Headset-Support können nun wieder 3er-Konferenzen erstellt werden

**ÄNDERUNGEN:**

* [CL-7] - You can open a grayed out dial pad 
* [CL-41] - Missed call notification is empty after moving it
* [CL-251] - Make search editable to correct typos
* [CL-252] - Buttons for creating phonebook entry layout broken
* [CL-258] - Reset changed phonebook entry after invalid input
* [CL-267] - Copy outlook/apple contacts to private and company phonebook
* [CL-289] - Show a missed call notification on iOS additionally
* [CL-302] - Multiple push notifications with same content are not displayed on android
* [CL-305] - Schedule call back notification if phone is offline
* [CL-313] - Mobile client shows no number after pairing
* [CL-331] - Additional timestamp of current date in journal
* [CL-338] - Improve Settings Dialog - Use a consistent layout for checkboxes / switches
* [CL-341] - Duration in call details overlapping with info button on iPod
* [CL-349] - Sending fax documents unattended
* [CL-355] - If you click on a native chat notification, the client is not moved to the foreground
* [CL-385] - Jabra Pro prohibits to add a call to a running one
* [CL-399] - Playing Voicemail in journal glitches
* [CL-411] - App-Icon Unread messages counter is not reset on iOS
* [CL-413] - Client crashes quite often on macOS
* [CL-416] - Client crashed when try to close all native notifications
* [CL-418] - Can't open settings screen on iPhone
* [CL-423] - Client UI freezes sometimes on macOS
* [CL-433] - Can't create phonebook entry without email address
* [CL-437] - Broken layout of the Chat Input Box on macOS
* [CL-457] - Chat input box does not reset correctly on mobile.


## Release 47.R161 (11.02.2019)

{{% notice note %}}
Bei diesem Release gibt es keine eigene Mobile-Version, da die Änderungen nur die Destop Applikation betreffen.
{{% /notice %}}

**Auf einen Blick**

Diese Version behebt ein Problem auf manchen älteren Windows-Systemen (z. B. Windows 2008 R2 Terminal Server), auf dem die Version v46 mit einer OpenGL-Fehlermeldung nicht mehr startet.

**ÄNDERUNGEN:**

- [CL-414] - Default ANGLE Renderer doesn't work on Windows Server 2008R2


## Release 46.R152 (06.02.2019)

**Auf einen Blick**

- Die UI-Darstellung unter Windows basiert nun auf OpenGL/Angle für mehr Stabilität und bessere Performance
- Die Mindestvorraussetzung ist nun macOS 10.12
- Die Startgeschwindigkeit auf iOS und Android wurde verbessert
- bessere Kompatibilität zu macOS 10.14 

**ÄNDERUNGEN:**

* [CL-16] - Don’t stack ‘configure headset’ messages
* [CL-78] - Status text not in default language
* [CL-116] - Switch back to OpenGL rendering on windows
* [CL-147] - Check client macOS 10.14 "Mojave" compatibility
* [CL-232] - Switch iOS App to iOS12-SDK (iPhone iOS 12)
* [CL-268] - Log in and contact list has slow performance on android
* [CL-285] - Client crashed when import outlook contacts
* [CL-280] - Add possibility to hide notifications of new group chat messages
* [CL-285] - Client crashed when import outlook contacts
* [CL-311] - Improve layout of device settings on mobile
* [CL-325] - Show “default” roster group in client with a nice translated name
* [CL-334] - Calls waiting list position is misleading
* [CL-335] - Crash when clicking on a letter in the phonebook view
* [CL-347] - Send number to dialpad if call is running
* [CL-352] - QR-Code is very big
* [CL-353] - Generate QR-Code in pairing information with long press
* [CL-362] - Client crash in MdSoftphone::muteAllCalls()
* [CL-368] - Labels in native call notifications
* [CL-377] - Regularly vacuum the client settings database
* [CL-379] - Show message that Qt requires macOS 10.12.0 or later
* [CL-397] - Mobile client shows different layout in pairing screen
* [CL-380] - Missing “Play” and “Upload” button for ringtones in client settings
* [CL-400] - No native missed call notification for calls with voicemail
* [CL-408] - Request microphone permissions for client on macOS Mojave


## Release 45.R93 (17.12.2018)

**Auf einen Blick**

- Windows Benutzer können nun optional Windows-Integrierte (Windows Info Center) Benachrichtigungen verwenden. Dies verbessert die Anzeige der Benachrichtigungen insbesondere auf Multi-Monitor-Systemen mit verschiedenen UI-Skalierungsfaktoren
- Der Client kann nun PDF-Dateien aus einem bestimmten überwachten Ordner automatisch zum Faxversand vorschlagen
- Der Android-Client zeigt nun bei einem verpassten Anruf eine Benachrichtigung an
- Wenn zwei Anrufe am pascom Softphone vorhanden sind, dann kann der aktive mit dem gehaltenen Anruf getauscht werden

**ÄNDERUNGEN:**

* [CL-55] - Use native notification systems on Windows
* [CL-70] - Number in journal search results is very small on tablet
* [CL-156] - Send PDF files as Fax by watching a folder
* [CL-237] - Show a persistent notification if a call is missed on android
* [CL-250] - Android client ignores phone locking state on android 9
* [CL-256] - Received invalid call data after *44 on location device
* [CL-261] - Prohibit multiple shortcuts in recording state
* [CL-273] - Improve multi-call handling ("Makeln") when using pascom Softphone
* [CL-274] - Call volume is too low on mobile
* [CL-277] - Cant mark chat message as seen because of incorrect autoaway db value
* [CL-279] - Touchable area for the phone number input field is too small on mobile
* [CL-284] - Proximity sensor not darken call screen after transfer
* [CL-288] - Handle incoming GSM call on android if softphone is already in call
* [CL-292] - Missing busy tone if softphone is unavailable
* [CL-303] - Generating new QR code by pressing enter
* [CL-306] - Client crash on Ubuntu 18.04.1 LTS 
* [CL-309] - Incorrect phone number matching in DATEV phonebook
* [CL-333] - Improve client starter entry on Ubuntu


## Release 44.R66 (27.11.2018)

**Auf einen Blick**

- Plantronics Headset Bibliothek auf die neueste Version aktualisiert
- Die iOS-App empfängt nun noch zuverlässiger Anrufe via Push
- Der GSM-Schalter behält seinen Zustand nun zuverlässig

**ÄNDERUNGEN:**

* [CL-10] - Adapt tooltip in client to current state
* [CL-15] - Do not acknowledge chat message if received in settings menu
* [CL-27] - Message counter broken with pascom client and LTS
* [CL-35] - Can’t close permanent group chat in macOS client
* [CL-53] - Update plantronics spokes sdk in client to the latest version
* [CL-62] - Pickup waiting callers via ‘Calls Waiting’ list
* [CL-64] - Do not allow Update Channel Switching if user has no permission to update client
* [CL-65] - Duplicate error message if voip is disabled on the proxy
* [CL-71] - pascom Client tel callto and sip uri handlers don’t work if the numbers have spaces
* [CL-92] - Audio doesn’t work on windows 10 after upgrade 1803
* [CL-95] - iOS App still misses some calls
* [CL-97] - Contact list / roster filter is not correctly restored on startup
* [CL-168] - Show Team Call names in iOS Client and improve name generation
* [CL-236] - Mobile application displays “Login failed” screen, but logs in sucessfully
* [CL-238] - GSM Switch is still unreliable and activates itself
* [CL-240] - Sort trunk dropdown in client
* [CL-255] - Make settings scrollable on whole width
* [CL-259] - Android client crashes very often with “Illegal State Exception”
* [CL-283] - Android has incorrect version name


## Release 42.R34 (17.10.2018)

**Auf einen Blick**

- Integration der Android Kontakte
- Integration der macOS und iOS Kontakte
- Verbesserte Sennheiser Headset Unterstützung
- Verbesserung der Anrufweiterleitung mit Rücksprache auf iOS

**ÄNDERUNGEN:**

* [CL-23] - Improve behavior of shortcut settings in client
* [CL-34] - Headset buttons on Plantronics D100 not working with macOS
* [CL-37] - Right click in chat binds menu to cursor
* [CL-42] - Multiple dials after long click-to-dial shortcut press
* [CL-43] - Improve input validation for phonebook editing in client
* [CL-47] - Inconsistent behavior of xmpp groups and teams in classic and pascom client
* [CL-86] - Client reconnects after sending special character
* [CL-88] - client crash in SingleChat::unreadMessages()
* [CL-104] - Client phonebook search provider should also search incomplete numbers
* [CL-108] - Sennheiser Headset stays in call if call is accepted simultaneously by another user
* [CL-121] - Include dump files during creation of Support Information in client
* [CL-125] - Check and upgrade to pjsip release 2.8
* [CL-133] - Detect and prevent installing on unsupported windows Versions
* [CL-145] - Integrate Apple macOS/iOS Address Book in Client
* [CL-149] - Show a toast if the device changes after switching the location
* [CL-152] - Message counter in close button on mobile
* [CL-163] - Android Phonebook Integration
* [CL-172] - Add "Load older messages" button to chat view
* [CL-220] - Multi-Line chat messages are not possible anymore in pascom client
* [CL-221] - Client tray icon translation sometimes doesn't work
* [CL-222] - Wrong contact details in chat history
* [CL-223] - Prohibit inconsistent phonebook entries of users
* [CL-224] - Improve fax dialog
* [CL-225] - No hint if softphone is not ready
* [CL-226] - "preferred device" toast is shown also on mobile
* [CL-227] - Create High-Resolution Versions for Phonebook Icons
* [CL-228] - Show hint that sennheiser activation failed
* [CL-245] - No audio after transfer of external call to ios mobile client

