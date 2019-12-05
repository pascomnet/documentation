---
title: pascom Client
description: pascom phone systems include native clients for Windows, MacOS, Linux, iOS and Android
weight: 990
---

{{% notice tip %}}
For further information, please refer to our detailed [Client documentation]({{< ref "/clients" >}}).
{{%/notice%}}

## What's New 
 
{{< youtube 1oK8OLRG624 >}}  

## Breaking Changes

{{% notice changes%}}
In this section, we give you an overview of all breaking changes in the pascom client
{{% / notice%}}

* Compatibility with pascom 16 and older has been discontinued. Older client versions can be found in our [Release archive] (https://www.pascom.net/en/downloads/#release-archive).
* The pascom macOS client now requires macOS 10.12 and higher

## Known Issues

{{% notice issues%}}
These problems are known to us and we are already working on a solution
{{% / notice%}}

* [CL-1018] - Windows 10 (since 1903): Check for the microphone privacy settings does not work. The user is therefore not automatically warned if the client does not have access to the microphone. Must be checked manually.
* [CL-1009] - Windows 10: Native notifications do not work properly in rare situations.
* [CL-800] - iOS: In-prefix of the trunk is shown before the caller number for the incoming call.
* [CL-491] - Linux: selection of audio devices does not work - only pulse is usable.
* [CL-1002] - Linux: Starting with Ubuntu 18.10, the CPU usage is 100% after a call.
* [CL-957] - Android: In rare cases there are still problems with the Connection Service. For example, "Hang up a call on the steering wheel button in the car"



## Release 59.R726 (26.11.2019)

**Overview**

- Favourites are correctly displayed in pascom 17 / 18 platforms
- Chat notifications are no longer displayed multiple times on pascom 17 / 18 platforms
- Phone book list view again contains icons for calling numbers directly
- Chat messages on pascom 19 platforms are no longer displayed in duplicate / multiple times
- Group chats now display the senders Avatar / profile image

**MODIFICATIONS:**

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

**Overview** 

- Phone book entry icons are once again clickable for dialing purposes
- Avatars no longer flicker when a Smart Filter is active
- Chat messages are no longer displayed multiple times (pascom 17 / 18 servers)
- Resolved the seldom occuring crash issue caused by receiving a chat message
- Team pickup notifications once again show the correct information

**MODIFICATIONS:** 

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
This release does not include a desktop version update as the changes only affect the mobile iOS-application.
{{% /notice %}}

**Overview** 

- Fixed iOS calling issues in combination with pascom 18 server

**MODIFICATIONS:** 

- [CL-942] - iOS App can't phone with a pascom 18 server

## Release 56.R659 (29.10.2019)

**Overview**
 
- New improved contact list design
- Enhanced chat UI 
- Improved search tool window
- Android: Integrated Connection Service which enables a.o. headset and in car call control
- Added Android 10 compatibility
- Requires Android 6.0 or newer
 
**And when in combination with a pascom 19 server:**  

- Video calls
- Flexible always on permenant chat groups
- Audio and video conferencing tools
 
**MODIFICATIONS:**
 
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
This release does not include a desktop version update as the changes only affect the mobile iOS-application.
{{% /notice %}}

**Overview**

- Compatibility to iOS 13

**MODIFICATIONS:**

- [CL-748] - pascom Client compatibility to iOS 13


## Release 53.R453 (03.07.2019)

**Overview**

- Android: Improved locked screen call handling
- iOS: If DND is active on an iOS device, calls will no longer be routed to the device and handled in accordance to the FollowMe settings
- Desktop: Despite a set --noUpdate-Flag, an update will be downloaded but not installed. The client will now only display an notification that a new version is available
- Windows: For systems with Intel graphics cards, the Rendering Backend Angle is now used per default

**MODIFICATIONS:**

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

**Overview**

- All platforms: The app no longer locks the UI during data reloads. This improves usability and reaction times on mobile devices in particular
- Windows: The renderbackend to be used can now be switched directly within the client settings
- Android: The Android app is now available as a 32bit / 64bit "Universal APK"
- Android / iOS: Emergency calls to 110 and 112 will now always be made via the mobile phone itself using GSM

**MODIFICATIONS:**

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

**Overview**

- More integrated ringtones are now available as standard
- Notifications popups again include source (e.g. a queue) information
- Diverse performance and stability enhancements

**MODIFICATIONS:**

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

**Overview**

- Fixed "flickering display" issues related to clients running on macOS 10.14.4
- New and improved design of all desktop client pop up notifications
- Fixed numerous crash problems on Android platforms 
- Faster client start-up thanks to quicker avatar rendering
- Call labels are now also displayed for calls waiting in a team queue

**MODIFICATIONS:**

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

**Overview**
 
- System calls can now be hidden to not appear in the call history journal
- Notification tone now played when a new chat message is received
- pascom Softphone microphone and speaker gain levels can now be configured. 
 
**MODIFICATIONS:**
 
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

**Overview**

- Automatic fax transmission: If a PDF contains control characters and GhostScript is installed and configured, the pascom client can now automatically fax it to the destination number
- The iOS client now displays notifications of missed calls
- Even with activated Jabra headset support, now 3er conferences can be created again

**MODIFICATIONS:**

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
This release does not include a mobile version update as the changes only affect the desktop application.
{{% /notice %}}

**Overview**

This version fixes an issue affecting some older Windows systems (e.g. Windows 2008 R2 Terminal Server) where V46 does not start as a result of an OpenGL error message.

**MODIFICATIONS:**

- [CL-414] - Default ANGLE Renderer doesn't work on Windows Server 2008R2


## Release 46.R152 (06.02.2019)

**Overview**

- Windows UI rendering is now based on OpenGL/Angle offering improved stability and performance
- macOS 10.12 is now the minimum requirement for mac desktop apps
- Improved iOS and Android app startup speeds
- Improved compatibility with macOS 10.14 

**MODIFICATIONS:**

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

**Overview**

- Windows users can now optionally use Windows integrated notifications (Windows Info Center). This improves displaying notifications, in particular on mutli-monitor systems with differing UI scalings
- The client can now use a monitored folder to automatically suggest PDF files to send as a Fax
- The Android client now displays nofitications for missed calls
- When two calls are being handled using the pascom softphone, it is now possible to switch the active call with the held call

**MODIFICATIONS:**

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

**Overview**

- Updated Plantronics Headset Library to the latest version
- The iOS-App now gets calls via push more reliable
- The GSM-Switch now keeps it’s state reliably

**MODIFICATIONS:**

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

**Overview**

- Integration for Android contacts
- Integration for macOS and iOS contacts
- Improved Sennheiser headset Support
- Improved reliability of attended transfer on iOS

**MODIFICATIONS:**

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

