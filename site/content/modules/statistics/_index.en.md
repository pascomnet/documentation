---
title: Call Statistics
description: Gain real-time insight statistics for evaluating Queues (Teams) and associated User performance. 
weight: 7
---

{{< doctype "both"  >}}

{{< description >}}

## Overview

From pascom phone system version 18.05 onwards, the integration of Grafana ensures that a comprehensive call analytics tool is now available. Through using this Analytics tool, it is possible to gain an instant live overview of the overall performance and status of your available agents, teams, active calls, call statistics plus information concerning call flows.

The call analytics tool can be found in the pascom web UI under {{< ui-button "Information" >}} > {{< ui-button "call statistics" >}}. 

{{% notice info %}}
The call analytics tool from Grafana offers does not offer any language selection options and is therefore only available in English.
{{% /notice %}}


## Dashboards

Per default, the call analytics tool consist of 3 evaluation views (otherwise known as dashboards or wallboards).

+ **Live**: With the live dashboard, the current status of your phone system can be viewed: active calls, callers waiting in a queue, teams and associated agents.
+ **Overview**: Using the Overview dashboard will provide you with an overview of all calls processed within a specified timeframe including a detailed evaluation.
+ **Teams**: The Teams dashboard delivers an analysis of all Queues / Teams including the average caller wait times as well as average call duration of inbound calls.

-> Hier Bild <-

### Live

The Live dashboard refreshes itself automatically and displays all phone system calls, regardless of whether these calls are currently active, on hold, connected or parked in a call queue. All queues / teams are also automatically displayed and updated, should further teams be added to the pascom phone system or the team agents be editied. 

-> Hier Bild <-



### Overview

The Overview dashboard displays an overview of all ongoing calls, statistics regarding the type of call, attached labels plus a detailed call evaluation.

-> Hier Bild <-


#### Analysis Time Frame 

Per default, the Overview dashboard the current day "*Today*" is analysed.
Should you wish to view a specific day or time frame, click on the clock symbol in the top right corner in order to enter the desired time frame.

-> Hier Bild <-


#### Using Filters

Should you want to see a more detailed view of the analysis and statistics contained in the Overview dashboard, the following filters are available for this purposes. 

|Filter|Description|Default|
|---|---|---|
|**User**|Here it is possible to restrict the display to one or more specified users.|All|
|**Label**|Here it is possible to restrict the display to one or more labels.|All|
|**From Name**|Here it is possible to filter for caller names.|*-*|
|**From Number**|Here it is possible to filter for caller phone numbers.|*-*|
|**To Name**|Here it is possible to filter by call recipient / agent names.|*-*|
|**To Number**|Here it is possible to filter by the call recipient / agent phone numbers.|*-*|

-> Hier Bild <-


#### In Depth Analysis

The detailed analysis (*Calls*) provides a comprehensive overview of all calls handled within a desired time frame. 

|Value|Description|
|---|---|
|**Time**|Time of call.|
|**From Number**|Caller phone number.|
|**From Name**|Caller name, as long as it is available (see phonebook).|
|**To Number**|Recipient phone number.|
|**To Name**|Recipient name, as long as it is available (see phonebook).|
|**Status**|Call status: <br/>+ hangup: call ended by hangup<br/>+ transfer: call was forwarded<br/>+ noanswer: call was not answered.|
|**Type**|Type of call: <br/>+ internal: internal call<br/>+ inbound: incoming call<br/>+ outbound: outgoing call|
|**Duration**|Total duration of the call.|
|**Ringing time**|Time taken to answer the call.|
|**Talk time (incl. Hold)**|Total talk time of the call (including "Hold").|
|**Hold time**|Total time, that the call was held.|
|**Chain**|Links to a more detailed overview of the call flow, similar to the call details available in the pascom client.|


**Call Details (*Chain*):**

|Value|Description|
|---|---|
|**Id**|ID the call process.|
|**Time**|Time of the call process.|
|**Parent**|ID of the parent call process.|
|**In Prefix**|Prefix code, which is attached to inbound calls.|
|**From Number**|Caller phone number.|
|**From Name**|Caller name, as long as it is available (see phonebook).|
|**Out Prefix**|Prefix code, which is attached to outbound calls.|
|**To Number**|Call recipient phone number.|
|**To Name**|Call recipient name, as long as it is available (see phonebook).|
|**Duration**|Total duration of the call process.|
|**Talk time (incl. Hold)**|Total talk time of call process (including "Hold".|
|**Hold time**|Total time that the call process was on hold.|
|**Result**|Result of the call process: <br/>+ hangup: call ended by hangup<br/>+ transfer: call was forwarded<br/>+ noanswer: call was not answered.|
|**Result details**|Details of the results: <br/>+ caller: caller<br/>+ elsewhere: a different extension picked up / answered the call<br/>+ abandon: Call was rejected / dropped<br/>+ dst: another extension was dialled<br/>+ voicemail: voicemail answering machine was called up.|
|**Via**|Origin of the call process: <br/>+ queue: Team/ Queue<br/>+ transfer: call was forwarded|
|**Via details**|Initiator of the call process: <br/>+ caller: caller<br/>+ agent: Team member / Agent<br/>+ dst: another extension<br/>+ action: action conditions|
|**Recording**|Recording of the call process.|
|**Labels**|Label(s) attached to the call process.|


### Teams

The Team dashboard provides an overview of all inbound calls to a team / queue, analysis of the average wait times and call duration as well as a number of filter options for specific queues and / or agents.

{{% notice note %}}
Within the Team dashboard, only inbound calls are displayed as a team as a whole cannot start an outbound call. In order to analyse outbound calls of individual users / agents, please use the Overview dashboard.
{{% /notice %}}

-> Hier Bild <-


#### Analysis Time Frame

Per default, the Team dashboard the current day "*Today*" is analysed.
Should you wish to view a specific day or time frame, click on the clock symbol in the top right corner in order to enter the desired time frame.

-> Hier Bild <-


#### Using Filters

Should you want to see a more detailed view of the analysis and statistics contained in the Team dashboard, the following filters are available for this purposes. 

|Filter|Description|Default|
|---|---|---|
|**Team**|Here it is possible to restrict the display to one or more specified teams / queues.|All|
|**User**|Here it is possible to restrict the display to one or more specified users.|All|
|**Label**|Here it is possible to restrict the display to one or more labels.|All|
|**From Name**|Here it is possible to filter for caller names.|*-*|
|**From Number**|Here it is possible to filter for caller phone numbers.|*-*|

-> Hier Bild <-


#### In Depth Analysis

The detailed analysis (*Calls*) provides a comprehensive overview of all inbound team calls within a desired time frame. 

|Value|Description|
|---|---|
|**Time**|Time of call.|
|**From Number**|Caller phone number.|
|**From Name**|Caller name, as long as it is available (see phonebook).|
|**Status**|Call status: <br/>+ hangup: call ended by hangup<br/>+ transfer: call was forwarded<br/>+ noanswer: call was not answered.|
|**Queue**|Called queue / team.| 
|**Agent**|User / Agent that answered the call.|
|**Duration**|Total duration of the call.|
|**Music on Hold**|The time before the call was successfully routed on to a team or queue.|
|**Agent Ringing Time**|The call signaling time length (ringing) on agent endpoints.|
|**Talk time (incl. Hold)**|Total talk time of the call (including "Hold").|
|**Hold time**|Total time, that the call was held.|
|**Chain**|Links to a more detailed overview of the call flow, similar to the call details available in the pascom client.|

**Call Details (*Chain*):**

|Value|Description|
|---|---|
|**Id**|ID the call process.|
|**Time**|Time of the call process.|
|**Parent**|ID of the parent call process.|
|**In Prefix**|Prefix code, which is attached to inbound calls.|
|**From Number**|Caller phone number.|
|**From Name**|Caller name, as long as it is available (see phonebook).|
|**Out Prefix**|Prefix code, which is attached to outbound calls.|
|**To Number**|Call recipient phone number.|
|**To Name**|Call recipient name, as long as it is available (see phonebook).|
|**Duration**|Total duration of the call process.|
|**Talk time (incl. Hold)**|Total talk time of call process (including "Hold".|
|**Hold time**|Total time that the call process was on hold.|
|**Result**|Result of the call process: <br/>+ hangup: call ended by hangup<br/>+ transfer: call was forwarded<br/>+ noanswer: call was not answered.|
|**Result details**|Details of the results: <br/>+ caller: caller<br/>+ elsewhere: a different extension picked up / answered the call<br/>+ abandon: Call was rejected / dropped<br/>+ dst: another extension was dialled<br/>+ voicemail: voicemail answering machine was called up.|
|**Via**|Origin of the call process: <br/>+ queue: Team/ Queue<br/>+ transfer: call was forwarded|
|**Via details**|Initiator of the call process: <br/>+ caller: caller<br/>+ agent: Team member / Agent<br/>+ dst: another extension<br/>+ action: action conditions|
|**Recording**|Recording of the call process.|
|**Labels**|Label(s) attached to the call process.|

## Further Functions

The Grafana call analytics tools offers a number of additional settings and analysis options.


### Create / Edit Custom Dashboards

The call analytics tool consists of 3 standard dashboards (Live, Overview, Team), which cannot be modified. However, it is possible to edit individual analyses / statistics and save them to a custom dashboard.


#### Edit Custom Dashboards

Click on the title of any Analysis / Statistic in an existing dashboard in order to open the advanced action options. Select the action {{< ui-button "Edit" >}}.

Now you can modify the analyses according to your requirements: 

+ **Filter**: Edit filters (according the previously selected standard dashboard)
+ **General**: Update name (*Title*) and description 
+ **Metrics**: Directly edit SQL queries
+ **Options**: Edit display options (Coloring, Value, Text (*Gauge*), and much more.)
+ **Value Mappings**: Edit standard values and formats
+ **Time range**: Edit time frames

As soon as you have finished with modifying the analytics settings, you can save your changes by clicking the save symbol in the top right corner.

If the dashboard you have edited is an existing standard dashboard (Live, Overview or Team), you will receive an error message as standard dashboards cannot be modified and therefore the changes could not be saved:

        Cannot save provisioned dashboard.

Instead, you can copy the displayed dashboard configurations code (*JSON*) by clicking {{< ui-button "Copy JSON to Clipboard" >}} and finally click {{< ui-button "Cancel" >}} and {{< ui-button "Back to Dashboard" >}} in order to leave the editing screen.


#### Create a New Dashboard

**Create a new dashboard using the configurations code (*JSON*), URL or ID**

Once you have edited a dashboard or an analysis and have the configurations code (*JSON*), a link or the dashboard ID to hand, then you can immediately create a fully configured dashboard.

In the lefthand menu list, click the plus symbol and select {{< ui-button "Import" >}} in order to create a new dashboard using an existing configuration.

+ If you have a link or ID, paste it into the first field {{< ui-button "Grafana.com Dashboard" >}}.
or:
+ If you have a configurations code (*JSON*), paste the code into the second field {{< ui-button "Or paste JSON" >}}. Alternatively, you can also upload the configurations code as a JSON file using the {{< ui-button "Upload .json File" >}} button.

Now it is neccessary to enter a name for the new dashboard, so that the new dashboard can be appropriately assigned.

|Setting|Description|
|---|---|
|**Name**|Appropriate dashboard name.|
|**Folder**|Dashboard storage folder.|
|**Unique identifier (uid)**|Appropriate ID for the new dashboard. *Default: auto-generated*|

Confirm the settings and click {{< ui-button "Import" >}}. Your newly created dashboard will open automatically and is now available.


**Create a New Dashboard With a New Analysis**

In the lefthand menu list, click the plus symbol and select {{< ui-button "Dashboard" >}} in order to create a new dashboard from scratch.

Under {{< ui-button "Add" >}}, select the diagram format (*Panel*) which you would like to add to your new dashboard.

+ Graph
+ Singlestat
+ Table
+ Text
+ Heatmap
+ Alert List
+ Dashboard List
+ Row
+ Pie Chart
+ Plugin List

Which diagram format (*Panel*) is most suitable and how to correctly configure them can be found in the [Grafana Documentation](http://docs.grafana.org/features/panels).

Once you have added the desired analyses to your new dashboard, click on the save symbol in the top right to save your setup. 

JNow it is neccessary to enter a name for the new dashboard, so that the new dashboard can be appropriately assigned.
 
|Setting|Description|
|---|---|
|**Name**|Appropriate dashboard name.|
|**Folder**|Dashboard storage folder.|
 
Confirm the settings and click {{< ui-button "Import" >}}. Your newly created dashboard will open automatically and is now available.

#### Exporting Dashboards And Analyses

The call analytics tool provides the option of exporting certain analyses and even complete dashboards.

**Export Dashboard**

Should you wish to export a whole dashboard as JSON, first select the desired dashboard and then click the share symbol in the lefthand menu list. 
Switch to the {{< ui-button "Export" >}} tab in order to set how the dashboard should be exported.

|Setting|Description|
|---|---|
|**Export for sharing externally**|Check this box should you want to be able to use this dashboard independantly of your pascom phone system.|

Click {{< ui-button "Save to file" >}} in order to export the dashboard as a JSON file.
Click {{< ui-button "View JSON" >}} in order to display the JSON configurations code.

**Exporting Analyses**

It is possible to export individual call analytics statistics as a CSV file. 

To do so, click on the title of any Analysis / Statistic in an existing dashboard in order to open the advanced action options. With the mouse fo the {{< ui-button "More" >}} action and select the {{< ui-button "Export CSV" >}} option. 

Finally, a details window will open in which you can define the CSV settings such as Date and Analysis Display.

Click {{< ui-button "Export" >}} and the CSV file will be generated.


#### Sharing Dashboards

If you want to share a live analysis with someone, you can do so by creating a link from your dashboard. 

{{% notice info %}}
Sharing of live links is not yet supported in pascom version 18.05 as no user management is implemented yet. The user management function will be implemented in one of the upcoming releases.
Until then, please use snapshots or login in as a user with admin privileges in order to access all dashboards containing the live data.
{{% /notice %}}


#### Sharing Snapshots

If you want to share a current analysis with someone without admin access, then you can create a snapshot. 

{{% notice note %}}
The snapshot displays only the analysis data to the point of the snapshot and will not automatically update itself, meaning with a snapshot a live viewing is not possible.
{{% /notice %}}

Select the dashboard that you wish to share and click the share symbol in the top right. 
Go to the {{< ui-button "Snapshot" >}} tab to configure how long the snapshot should be available for.

|Setting|Description|
|---|---|
|**Snapshot name**|enter a snapshot name|
|**Expire**|How long the snapshot should be available for. *Default: Never*|
|**Timeout (seconds)**|Timeout length in seconds for data reading attempts.|

Click {{< ui-button "Local Snapshot" >}} to generate a local link which can be copied using {{< ui-button "Copy Link" >}} and then shared.


## FAQ

**What happens if a user or queue / team is deleted from the phone system?**

Should a user or queue / team be deleted or agents are removed from an existing queue, the raw data will remain intact for analysis. 

That means: 

+ In the live view the no longer available users / queues / teams will no longer be displayed.
+ Deleted users / queues / teams and removed agents are no longer listed in fitlers (*can however be manually typed in*).
+ Deleted users / queues / teams remain in the existing analysis as long as they existed in the specified time frame.


**How Do I display the Real-Time Live Data on a PC / TV?**

Due to the missing user management component and that live data sharing is not yet possible, the following work around is available: 

On the required PC / TV, login to the pascom server management web UI as admin and ensure that the user sitting does not have a timeout limitation and that the admin user will not be logged out.
Open the call analytics of the required instance with the required live data e.g. the Live dashboard. 