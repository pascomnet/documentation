---
title: Call Recording System
url: /modules/call-recording/
linkde: /module/mittschnitt/
prev: /modules/fax-server/
next: /modules/conference-system/
weight: 92
toc: true
---


## Overview

{{% notice warning %}}
The recording of calls can be legally problematic, and in certain cases even a criminal offence. Depending on the scenario certain criteria must be fulfilled, such as Framework Conditions, Data Protection/Privacy Policies and Notification Obligations. In case of uncertainty and doubt, please seek legal counsel before using this service.
{{% /notice %}}

The recording system is based on one of the background rule framework from within mobydick. This framework enables mobydick to either automatically record a particular call or to allow an user to manually start a recording. Should the user be permitted by the framework to manually make recordings, then a recording symbol for starting and stopping recordings will be displayed within the mobydick Client as well as on any IP-Telephones which support this function.

//FixMe

![Illustration - mobydick callrecording System](../../images/callrecording_wiki.png?width=100% "mobydick callrecording System")


Regardless of whether the recordings are manually or automatically initiated, they will be stored on the mobydick HardDisk and be displayed to permitted users within the mobydick Client. An additional option is for the recordings to be sent via the rule framework to any number of e-mail recipients or copied via script to any destination.

## Configuration

### Rule Framework
In order to activate the recording system, you must have created at least one rule whereby either specific calls will be automatically recorded or a predetermined group of users are allowed to manually initiate call recordings. To this end, you can add a new rule under the mobydick Web UI menu tab ***Advanced > Recordings*** through using the //FixMe  button:
![Screenshot - manage recording](../../images/callrecording_wiki.png?width=100% "manage recording rules")

|Parameter|Description|
|---------|---------|
|Description|Description of the Rule|
|Rule enabled|Activate or Deactivate the Rule|
|What will be Recorded?|**mobydick automatically ensures** that all call recordings will be automatically performed for the Role Members under **"What will be Recorded?"** **Call Partners are permitted to effect recordings manually**, who are selected as Role Members under the **"What will be Recorded?"** setting. This can then be done via the mobydick Client or via the Record Button on support IP Telephones.|
|What is included?|    The recording destination is role based. Select a Role and all members assigned with this role, regardless of whether they are individual users or whole teams will be included. The role itself does not require a specific role type, rather it serves a grouping purpose. Find out more under Concept: Roles.|
|Call Direction|   Sets whether the service should be started for incoming calls only, outgoing calls only, or for both incoming and outgoing calls.|
|Origin|   Only internal, only external or both internal and external calls should be recorded.|
|Dispatch Mode|As standard, all recordings will be saved on the mobydick HardDisk and can be retrieved via the mobydick Client. Additionally, one can send the recordings to any number of e-mail addresses or setup a process via a Bash-Script whereby the recordings will be copied to an alternate desitinate, e.g. an external file server. The sending is regulated via a Cronjob, which will be executed as standard once a day at 20:00 hours. For further details, please refer to **Cronjobs for recordings** below.|

### Dispatch Mode: Bash Script
If the dispatch mode Bash script is selected, then a Bash-Editor into which one can enter the desired script will appear. The script will then be call up after every recording and the following parameters will be passed on, which can then be called up in the Variables  **$1** and **$2**:

|Variable|Content|Description|Example|
|--------|------|------------|--------|
|**$1**|   /absolute/path/to/recording.wav  | The File name incl. of path to the corresponding generate recording|   /var/spool/asterisk/monitor/na_1392064129-3_1392064129-10_29_001.wav|
|**$2**|   /absolute/path/to/journal.json|    The File name incl. of path to json file for this recording. Contained within it the recording meta information such as, Call participants, Call Length etc|   /var/spool/asterisk/monitor/n_1392064129-3_1392064129-10.json|

### Cronjob for Recording System

In order to execute the sending of recordings via e-mail or script as well as the clean up of the HardDisk (see HardDisk memory management), a Cronjob will be run at 20:00 hrs (default setting). All data relating to the sending will be saved within the system until runtime and then during the running of the Cronjob, the data will be processed using a batch mode.

This really only applies for the sending of recordings via e-mail or script. In the mobydick Desktop Client the recordings will be displayed immediately after the recording has been made.

Should you need to, you can increase the frequency of the Cronjob execution (e.g. send the recordings every 15 Minutes) this can be modified under the ***Advanced > Recordings > Action > Automate Dispatch //FixMe  or alternatively Appliance > Cron jobs > Process Recordings***. 


### HardDisk Memory Management
Every recording, regardless of whether it was automatically or manually created, will be stored centrally on the mobydick HardDisk.  A recording that took 1 minute, will require approx. 1 MB of memory. So should you for example for training purposes need to continuously record the support team, which consists of 4 people who are on the phone for ca. 3 hrs per day, the recordings will require approximately 720 MB of HardDisk space, therefore, please ensure that you have sized your HardDisk memory accordingly.

In order to prevent the overflow of the HardDisk, we have setup the system so that it removes all recordings after 90 days as standard. This setting can be modified through using the mobydick Web UI under ***Appliance > System Settings***. Within the tree structure, you will find the **expiration** parameter under **sys.monitor.configure.monitorcron**, which has been set to 90 days but can be modified to any time period

### Control Recordings via Variables
mobydick additionally, provides the option of dynamically controlling (turning on/off) the recording system via DialPlan Variables e.g. by transferring existing rules.

For example, it could be the case that you would like to offer your callers an IVR Menu in which they can decide for themselves whether or not a call should be recorded for Quality Control purposes.

To this end, the DialPlan can be influenced according to needs through using the Variable **MDC_MON_MODE**:

#### Setting MDC_MON_MODE Variable in the Call Setup
* MDC_MON_MODE not defined or Value=auto: Rule Framework accessed , (see below). **DEFAULT**
* MDC_MON_MODE=force This call will be recorded in every scenario (Skips Rule Framework )
* MDC_MON_MODE=deny This call will **not** be recorded under **any** circumstances (Skips Rule Framework )
* MDC_MON_MODE=manual Rule Framework will be skipped, manual recording will be enabled


An example script for the blocking of call recordings could appear somewhat like:

    exten => s,1,Set(__MDC_MON_MODE=deny)
    exten => s,n,Return()

This script could be then be linked into the IVR Menu and thus through being selected deactivate the Recording function.

### Configure Record Button on SNOM Telephones 
Many SNOM Telephones (3 Series) have a record button, which will be, through mobydick, automatically provided with the correct URL for controlling the Recording System. On SNOM Handsets that do not have an additional recording button, you can repurpose any button to control this function.

#### Central Distribution of Button Settings
The simplest method of doing this is through using the Provisioning System and assigning the following value to a button::

    url http://$httpip/mobydickcmd/provisioning/snom/snom-record.php?mac=$071ipp_mac&sipcallid=$call-id

#### Individual Button Settings Direct from the Telephone 
Alternatively, you can also assign the following Actions Type URL to a Telephone button, whereby you will have to replace the **MOBDICK_SERVER_IP** with the concrete **IP-Address** of the mobydick-Server:

    http://MOBDICK_SERVER_IP/provisioning/0004132cd0c5/pui/monitor/record?callid=$call-id

Example:

    http://192.168.100.1/mobydickcmd/provisioning/snom/snom-record.php?mac=$mac&sipcallid=$call-id

### Manage Recordings from the Client
Allows a user who is through a rule permitted to manually record, and during a call a red Record symbol will become visible within the Client, which will start a recording:
![Screenshot - Recording in Client](../../images/callrecording_client_manual.png?width=100% "Recording in Client")

Alternatively recordings can also be started via the Record Button on your Telephone.
Should a recording have been made, you can access it retrospectively from your Journal through the REC symbol:

Through clicking on the REC Symbol all the recordings from this Call will be then be displayed:
![Screenshot - Journal in mobydick Client](../../images/callrecording_client_journal.png?width=100% "Journal in mobydick Client")

Through clicking on the Play Symbol you can listen to the recording directly from your client as well as being able to download it via the download symbol.
![Screenshot - Recording Rules](../../images/callrecording_client_play.png?width=100% "manage recording rules")

