---
title: TAPI interface
keywords:
    - Tapi Interface 
    - TAPI Driver
    - Microsoft Telephony Application Programming Interface 
    - Telephony functionality from Windows
    - Windows Tapi Integration
    - Click to Dial under windows
    - Windows CTI 
    - Outlook CTI 
    - Outlook integration
description: TAPI is an interface between Window's telephony functions and the mobydick phone system. 
url: /clients/tapi-interface/
prev: /clients/teams-in-client/
next: /clients/mobile-hub-setup/
weight: 34
linkde: url: /clients/tapi/
toc: true
---


## What is the TAPI?
The Microsoft **T**elephony **A**pplication **P**rogramming **I**nterface is a interface from the 1990s with which any number of applications are able to communicate with phone systems (telephones respectively) via an unified interface, without having exact knowledge relating to the functions of the connected phones. Microsoft has made a set of uniform functions available, which along with the applications (e.g. Outlook, PhoneSuite CTI Client) as well as the phone system developer (mobydick TAPI driver) will need to be implemented. 

the mobydick TAPI driver is in this respect not a stand alone programme, but rather dynamic libary (DLL) which is either loaded or unloaded according to requests from the Microsoft-TAPI-Server (Telefoniedienst) 

![Illustration - Tapi Concept](../../images/tapi_driver.png?width=70% "What is the TAPI?")


The mobydick TAPI can be installed on all windows workstations. The TAPI registers itself with the server using the same user data as the mobydick client. The TAPI is therefore not connected directly to the telephone but rather to the user. Should the TAPI send a dial command to mobydick then mobydick will automatically search for the current phone being used by the user and uses this to make the call. Should the user change work location or telephone, the TAPI does not need to be reconfigured.

## TAPI and the mobydick Client

The MobyDick TAPI can be installed on any windows desktop. The TAPI will then register itself with the server using the same credentials as the //FixMe MobyDick Client, which means the TAPI is assigned to a user rather than being directly connected to a telephone. When a dial command is sent to Mobydick via TAPI, MobyDick will automatically select the current phone of the user and use this phone to make the call. If the user then changes //FixMe location or phone, the TAPI will not require any reconfiguration.


### When to use ...
#### .. the mobydick Client?

* When you want a complete overview of your colleagues presence info
* When you want easy access to faxes and voicemails as well as using chat tools
* When you have a different OS other than windows


#### .. the mobydick TAPI Driver?
* When you want to use the telephone functions of your ERP systems, Outlook etc 
* When you want to continue to use your application software with TAPI Support


## General Information

### Supported TAPI Functions

The TAPI Interface specifies a number of call related functions, of which the following are supported by the mobydick TAPI

|Function| Comments|
|---------|----------|
|Signalisation of incoming calls|  Signalling of phone numbers, call directions, further details|
|Call Origination| Initiate calls to a number|
|Hang Up   |End calls|
|Pickup    |Complete a pick up on a certain extension|
|Call Termination| Automatically terminate calls on the phone|

### Support OS versions
| Client| Server|
|-------|-------|
|Windows 7 (32bit/64bit) |Windows Server 2008R2 (32bit/64bit)|
|Windows 8 (32bit/64bit)|Windows Server 2012 (32bit/64bit)|
|Windows 8.1 (32bit/64bit)|Windows Server 2012R2 (32bit/64bit)|


//FixMe
### TAPI Versionen
Die mobydick TAPI meldet als Mindestvorraussetzung die TAPI Version 2.1 an das jeweilige Betriebssystem. Für mehr Details siehe Microsoft MSDN. Auch Programme, die die TAPI Version 3.X einsetzen, können mit der mobydick TAPI zusammen verwendet werden, da die TAPI 3.X zu 2.X Abwärtskompatibel ist. [Mehr Infos zur TAPI Version] (https://msdn.microsoft.com/en-us/library/windows/desktop/ms734214%28v=vs.85%29.aspx "Zur TAPI Webseite").


## Configuration

{{% notice warning %}}
1.Ensure no applications are running with the TAPI Interface uses  
2.Ensure that telephony services have been stopped. //FixMe (Dieser ist aufgelistet unter Systemsteuerung > Verwaltung > Dienste)  
3.You can install a debug as well as productive version, in that you can easily repeat the setup. This is also possible vice versa
{{% /notice %}}


### TAPI Software herunterladen
You can directly download the software by using the ***Service*** tab within the mobydick Commander login screen:

![Screenshot - mobydick Service Tab](../../images/tapi_service_tab.png?width=70% "download TAPI Software")


{{% notice note %}}
Please note that there are no separate downloads for 32 and 64 versions of the software. The setup process will automatically identify and install the required files.
{{% /notice %}}


### Installation on a Windows computer
{{% notice note %}}
Administrative privileges are required to execute the setup on a Windows computer. From Windows Vista / 7 upwards, the system will automatically ask for the appropriate login.
{{% /notice %}}

Start the setup procedure using the file you just downloaded:

![Screenshot - start EXE file](../../images/tapi_download.png?width=90% "start EXE file")


Accept the Terms and Conditions

![Screenshot - accept AGB](../../images/tapi_agb.png?width=50% "accept AGB")

All the necessary components will now be installed

![Screenshot - installing files](../../images/tapi_installing.png?width=70% "installing files")


After the installation has been successfully completed, you will need to configure the connection of the TAPI to mobydick

![Screenshot - configure TAPI](../../images/tapi_credentials.png?width=50% " TAPI connection to mobydick")

As stated before, the TAPI will login with the same user data just like the //FixMe mobydick Client

|Variable| Description |
|---------|------------|
|Username |username|
|Password |users´ password|
|mobydick Server| IP number of hostname of the mobydick Server|

You can now confirm the successfull installation by clicking on **Finish**:

![Screenshot - successful setup](../../images/tapi_setup_finished.png?width=50% "successful setup")


### Installation on a Terminal Server

#### Configuration of the mobydick
Should you wish to install the TAPI on a Terminal Server or on a computer that is used by more than one person, then you will need assign the users, who will connect using the TAPI, with the ***xmpp.supervisor Role***. This means that only one individual XMPP connection will be constructed from the Terminal Server, over which the total communication will be transmitted.

//FixMe
![Screenshot - Erfolgreiche Installation](../../images/tapi_terminalserver_konzept.png?width=50% "Erfolgreiche Installation")


#### Installation

{{% notice note %}}
The setup requires administrative rights for the corresponding server. From Windows Server 2008 onwards, the system will automatically ask for the appropriate login, however, if you are using Windows Server 2003 you will need to login using the appropriate identifier first.{{% /notice %}}

Start the setup using the previously downloaded file:

Accept the Terms and Conditions:

All the necessary components will now be installed

After the installation has been successfully completed, you will need to configure the connection of the TAPI to mobydick

As stated before, the TAPI will login with the same user data just like the //FixMe mobydick Client. 

|Variable| Description |
|---------|------------|
|Username |username|
|Password |users´ password|
|mobydick Server| IP number or hostname of the mobydick Server|

Now a further dialogue  box will appear, in which you will be able to select the users, who should be available later within TAPI applications (e.g. MS Outlook). All the existing users will be displayed within the list. In order to choose a user, one can double click on the desired user or use the buttons in between the two list screens:

You can now confirm the successful installation by clicking on **Finsih**:

### Example scenario with Microsoft Outlook

Start Outlook and select the desired contact entry. Using the right mouse button, select the number to call from the drop down menu:

//FixMe
Now the New Call window will appear: confirm the number by clicking ***Start call***.
//FixMe
Now your telephone should make the call.

{{% notice info %}}
On terminal server installations, every user must select their "own" line within the TAPI Software (e.g. MS Outlook), before they will be able to complete a call using their phone.
{{% /notice %}}

By clicking **Dial Options** you can select line to be used:

//FixMe

### Unattended (Silent) Installation

It is also possible to install the TAPI without needing any GUI interaction. In order to do this, the installations programme must be called up using the following options:

    md-tapi-setup-2.00.00.R.exe /S /options=username:password:server.domain.tld

    Example:
    md-tapi-setup-2.00.00.R.exe /S /options=mmuster:123456789:mobydick.example.com

If the TAPI user has the ***xmpp.supervisor*** **Role**, all available users will be automatically selected and will then be available within the TAPI application.

## TAPI Debugging
If you uncover a problem when using the TAPI Driver, you can use this manual to start a TRACE, which can then be analysed by pascom and helping in finding a solution.

### Preparation
In order to record the TAPI debug output, you will need the DebugView tool from Microsoft/Sysinternals which can be downloaded here:
 https://technet.microsoft.com/en-us/library/bb896647.aspx
In addition, it is often also a good idea to record the call construction by using the tool "Tapi Master Line Watcher"( http://www.tapimaster.eu/de/leitungsbeobachter.htm) in parallel to the Debug tool
{{% notice warning %}}
Please note: Should programme behaviour change as a result of the Line Watch tool, then complete the debugging **without** it.
{{% /notice %}}

### Install the mobydick TAPI Driver in the Debug-Version

In order to be able to record Debug Output, the debug version of the mobydick driver must be installed. Whether you have the productive or debug version installed can be easily identified using the configurations dialog.

1. Go to the command panel > telephone and modem

2. Go to the "Advanced" Tab

3. Select the entry "mobydick TAPI Service Provider"

![Screenshot - mobydick TAPI Service Provider](../../images/tapi_config_phone.png?width=60% "mobydick TAPI Service Provider")

4. Click Configure
5. If the in following mask, the warning "WARNING: DEBUG VERSION INSTALLED" appears, then clearly the Debug-Version is installed

{{% row %}}
{{% col md-6 %}}
![Screenshot - logon tapi](../../images/tapi_config_mtapi.png?width=70% " logon tapi") 
{{% /col %}}
{{% col md-6 %}}
![Screenshot logon tapi Debug](../../images/tapi_config_mtapi_debug.png?width=70% " Logon tapi Debug")
{{% /col %}}
{{% /row %}}

Should you still not be certain, then please close all programmes and run the setup again. Please take note of the installation notices and during the installation select, "Debug" and confirm this by clicking next.
![Screenshot - TAPI installation instructions](../../images/tapi_mtapi_debug.png?width=60% "TAPI installation instructions")
This will replace any productive versions installed with the Debug version

### Preforming a Debugging

You now have all the necessary components downloaded and installed, so start the required tools

#### Open DebugView

1. Start the DebugView.exe with Administrator Privileges by right clicking and selecting `Run as Administrator`
![Screenshot - open DebugView](../../images/tapi_debug_viewadmin.png?width=70% " open DebugView")


2. Under the "Capture" menu, please check the "Capture Global Win32" option. If you did not run the programme as an administrator, a error message will appear now tap
![Screenshot - Capture Global Win32](../../images/tapi_debug_viewglobal_win32.png?width=70% "Capture Global Win32")


#### Open Line Watcher

1. Start the programme - no special permissions required
2. In the Drop Down under the first tab, select the user´s TAPI Line causing the problems
3. Check the options box "More information"

![Screenshot - Line Watcher öffnen](../../images/tapi_linewatcher.png?width=90% "Line Watcher open")

Next, start your TAPI software and follow those steps which lead to the problem. In the DebugView windon, a whole range of tasks should be visible. As long as you start or receive a call information should also appear in Line Watcher
![Screenshot - open Line Watcher Output](../../images/tapi_linewatcher_output2.png?width=90% " Open Line Watcher Output")

Once the test is finished, save both trace outputs from both applications (DebugView and LineWatcher)
![Screenshot - TAPI Debug Output View](../../images/tapi_debugview_output.png?width=90% "TAPI Debug Output View")

#### Saving a DebugView Trace
1. Click on File > Save as
2. Give it an appropriate name
3. Save

#### Saving a LineWatcher Trace
1. Click on "Save Message Flow"
2. Give it an appropriate name
3. Save

You can now send both files to pascom for analysis.
