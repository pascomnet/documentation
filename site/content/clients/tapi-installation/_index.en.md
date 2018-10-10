---
title: TAPI Client Installation
weight: 70
description: How to use the pascom TAPI client for Windows in order integrate TAPI enabled software such as MS Office, ERP and CRM systems etc. 
---

{{< doctype "both" >}}
 
{{< description >}}

## Concept

The pascom TAPI can be installed on any windows desktop. The TAPI client will then register itself with the server using the same credentials as the pascom Client, which means the TAPI is assigned to a user rather than being directly connected to a telephone.
 
 When a dial command is sent to pascom via TAPI, pascom will automatically select the current phone of the user and use this phone to make the call. If the user then changes their location or phone, the TAPI will not require any reconfiguration.

The pascom TAPI functions independently of the pascom Desktop Client.

### Supported TAPI Functions
 
 The TAPI Interface specifies a number of call related functions, of which the following are supported by the pascom TAPI:
 
 |Function| Comments|
 |---------|----------|
 |Signalization of incoming calls|  Signaling of phone numbers, call directions, further details|
 |Call Origination| Initiate calls to a number|
 |Hang Up   |End calls|
 |Pickup    |Complete a pick up on a certain extension|
 |Call Termination| Automatically terminate calls on the phone|

## Configure the Trunk Code for TAPI

When configuring or first using the TAPI interface, you will be asked for the to be used dial settings. However, phone number handling i.e. setting a 0 for outbound calls, international formatting etc etc. is done exclusively by the pascom phone system server, meaning the settings added in windows will be ignored. 

The arear code is a mandatory field. Enter your area code without the leading 0. All other fields should be left empty. <!--(FixMe) This dialog is accessible under {{< ui-button "Control Panel" >}} > {{< ui-button "Telephone and Modem" >}} > {{< ui-button "Call Rules (My location)" >}} > {{< ui-button "Edit" >}}-->.

![Location settings einstellen](location.de.png?width=50%)<!--Fix Me-->


## TAPI Client Installation

{{% notice tip %}}
System requirements: **Windows 7 (32 and 64bit)** or higher and **Windows Server 2008 R2 (32 and 64bit)** or higher. The most up-to-date patch levels must be installed. 
{{% /notice %}}

{{% notice warning %}}
1.Ensure no applications are running which the TAPI Interface uses  
2.Ensure that telephony services have been stopped.  
3.You can install a debug as well as productive version, in that you can easily repeat the setup. This is also possible vice versa
{{% /notice %}}


### TAPI Software Download

The current pascom TAPI client can be [downloaded](https://www.dev.pascom.net/en/downloads/#clients) from the pascom Homepage.


### Installation on a Windows Computer

{{% notice note %}}
Administrative privileges are required to execute the setup on a Windows computer. From Windows Vista / 7 upwards, the system will automatically ask for the appropriate login.
{{% /notice %}}

Start the setup procedure using the file you just downloaded, accept the terms and conditions and finally all the necessary components will be installed. 

After the installation has been successfully completed, you will need to configure the connection of the TAPI to pascom

![TAPI Configuration](config_credentials.en.png?width=30%)

As stated before, the TAPI will login with the same user data just like the pascom Client

|Variable| Description |
|---------|------------|
|Username |username|
|Password |users´ password|
|mobydick Server| IP number of hostname of the pascom Server|

You can now confirm the successful installation by clicking on **Finish**.

### Installation on a Terminal Server

#### Configuration of the pascom

Should you wish to install the TAPI on a Terminal Server or on a computer that is used by more than one person, then you will need assign the users, who will connect using the TAPI, with the ***xmpp.supervisor Role***. This means that only one individual XMPP connection will be constructed from the Terminal Server, over which the total communication will be transmitted.

![Concept](terminalserver_concept.png?width=60%)


#### Installation

{{% notice note %}}
The setup requires administrative rights for the corresponding server. From Windows Server 2008 onwards, the system will automatically ask for the appropriate login, however, if you are using Windows Server 2003 you will need to login using the appropriate identifier first.{{% /notice %}}

Start the setup procedure using the file you just downloaded, accept the terms and conditions and finally all the necessary components will be installed. 

After the installation has been successfully completed, you will need to configure the connection of the TAPI to pascom:

![TAPI configuration](config_credentials.en.png?width=30%)

As stated before, the TAPI will login with the same user data just like the pascom Client.

|Variable| Description |
|---------|------------|
|Username |username|
|Password |users´ password|
|mobydick Server| IP number or hostname of the pascom Server|

Now a further dialogue  box will appear, in which you will be able to select the users, who should be available later within TAPI applications (e.g. MS Outlook). All the existing users will be displayed within the list. In order to choose a user, one can double click on the desired user or use the buttons in between the two list screens:

![Select TAPI users](config_select_users.en.png?width=50%)

You can now confirm the successful installation by clicking on **Finish**.

### Example scenario with Microsoft Outlook

Start Outlook and select the desired contact entry. Using the right mouse button, select the number to call from the drop down menu: 

![TAPI Outlook](outlook_dial_1.de.png)

Now the New Call window will appear: confirm the number by clicking **Start call**:

![TAPI Outlook](outlook_dial_2.de.png?width=40%)

 Now your telephone should make the call.
 
 {{% notice info %}}
 On terminal server installations, every user must select their "own" line within the TAPI Software (e.g. MS Outlook), before they will be able to complete a call using their phone.
 {{% /notice %}}
 
 By clicking **Dial Options** you can select line to be used:

 ![TAPI Outlook](outlook_line.de.png?width=50%)

### Unattended (Silent) Installation

It is also possible to install the TAPI without needing any GUI interaction. In order to do this, the installations programme must be called up using the following options:

    md-tapi-setup-2.00.00.R.exe /S /options=username:password:server.domain.tld

    Example:
    md-tapi-setup-2.00.00.R.exe /S /options=mmuster:123456789:pascom.example.com

If the TAPI user has the ***xmpp.supervisor*** **Role**, all available users will be automatically selected and will then be available within the TAPI application.

## TAPI Debugging

If you uncover a problem when using the TAPI Driver, you can use this manual to start a TRACE, which can then be analyzed by pascom and helping in finding a solution.

### Preparation

In order to record the TAPI debug output, you will need the DebugView tool from Microsoft/Sysinternals which can be downloaded here:
 https://technet.microsoft.com/en-us/library/bb896647.aspx
In addition, it is often also a good idea to record the call construction by using the tool "Tapi Master Line Watcher"( http://www.tapimaster.eu/de/leitungsbeobachter.htm) in parallel to the Debug tool
{{% notice warning %}}
Please note: Should programme behaviour change as a result of the Line Watch tool, then complete the debugging **without** it.
{{% /notice %}}

### Install the pascom TAPI Driver in the Debug-Version

In order to be able to record Debug Output, the debug version of the pascom driver must be installed. Whether you have the productive or debug version installed can be easily identified using the configurations dialog.

1. Go to the command panel > telephone and modem

2. Go to the "Advanced" Tab

3. Select the entry "pascom TAPI Service Provider"

![TAPI Service Provider](debug_phone_and_modem.de.png?width=50%)

4. Click Configure
5. If in the following mask, the warning "WARNING: DEBUG VERSION INSTALLED" appears, then clearly the Debug-Version is installed

![TAPI login debug](debug_credentials.en.png?width=50% )

Should you still not be certain, then please close all programmes and run the setup again. Please take note of the installation notices and during the installation select, "Debug" and confirm this by clicking next.

![TAPI Installation instructions](debug.en.png?width=60% )

This will replace any productive versions installed with the Debug version

### Preforming a Debugging

You now have all the necessary components downloaded and installed, so start the required tools

#### Open DebugView
<!--//FixME Run As Admin Image EN-->
1. Start the DebugView.exe with Administrator Privileges by right clicking and selecting `Run as Administrator`.

![Open DebugView](debug_viewadmin.de.png?width=70%)


2. Under the "Capture" menu, please check the "Capture Global Win32" option. If you did not run the programme as an administrator, a error message will appear.

![Capture Global Win32](debug_viewglobal_win32.en.png?width=70%)

**Open Line Watcher**

1. Start the programme - no special permissions required
2. In the Drop Down under the first tab, select the user´s TAPI Line causing the problems
3. Check the options box "More information"

![Open Line Watcher](debug_linewatcher.en.png?width=70%)

Next, start your TAPI software and follow those steps which lead to the problem. In the DebugView window, a whole range of tasks should be visible. As long as you start or receive a call information should also appear in Line Watcher.

![Open Line Watcher Output](debug_linewatcher_output.en.png?width=70%)

Once the test is finished, save both trace outputs from both applications (DebugView and LineWatcher).

![TAPI Debug Output View](debug_view_output.en.png?width=70% "TAPI Debug Output View")

#### Saving a DebugView Trace
1. Click on File > Save as
2. Give it an appropriate name
3. Save

#### Saving a LineWatcher Trace
1. Click on "Save Message Flow"
2. Give it an appropriate name
3. Save

You can now send both files to pascom for analysis.
