---
title: Add Teams
description: In a pascom phone system, teams are comparable to call queues. Call strategies support you control calls in a targeted manner.
weight: 30
---

{{< doctype "both" >}}

{{< description >}}

## Concept

Each [pascom VoIP phone system](https://www.pascom.net/en/mobydick-voip/ "pascom IP PBX software") user has their own extension, devices and actions that control calls made to that extension. In addition, a user can be a member of a **team**.

![Illustration Team Concept](concept.en.png?width=60%)


The **team** has its own extension and actions assigned to it. When a call is made to the team's extension, the team members' phones will ring in the order defined in the strategy and actions.

{{% notice info %}}
When a call is made to a team's number, only the actions pertaining to the team will be activated. Actions pertaining to individual users will be ignored.
{{% /notice %}}

This concept allows you to make use of the following example scenario:
Frank can still be reached at his extension **22** even **outside of business hours**; however calls to the support teams will be routed to the **mailbox** after 6:00 p.m.

### Team Types

There are two types of teams that only differ in the functionality they offer.

#### Call Groups

Call groups have **permanent members**. Only the following call strategies are used: **all** and **consecutive**. Either a ringing tone or music will be played to the caller.

#### Queues

Queues can have **fixed** and **dynamic members**, i.e. users can join a queue if needed. Queues are capable of a number of call strategies. 

Callers are added to the queue sequentially and, if desired, can be informed of their **position in the queue** and the **average waiting time**. During the wait, either hold music or a ringing tone can be played.

Queues can be assigned different weights, which allows them to be ranked according to their importance. A higher weight, represented by an arbitrary number, implies higher importance.

## Configuration

### Add a Queue

In order to add a team, within the pascom web UI, click on the menu buttons {{< ui-button "Users" >}} > {{< ui-button "Teams" >}} > {{< ui-button "Add" >}}. Select the type **Queue** and enter a team name and extension number. Finally click {{< ui-button "Next" >}}.

The following setting options are now available:

### Call Strategies

|Strategy| Description|
|---|---|
|**ring all**|Call all members simultaneously.|
|**one after another**|Members are called according to their assigned position. Please note: dynamic members change their position when joining or leaving a team.
|**longest back**|The member who has not received a call for the longest period of time will be the next in the list. Please note: entering and leaving a queue by dynamic team members will reset all counters. When entering a queue, dynamic members always are the ones that have not accepted a call for the longest time.|
|**fewest calls**|The member having accepted the fewest calls will be the next in queue. This setting does not consider the length of the call. A member having made five calls of one minute each will come after a member that made only two calls, although these may have lasted one hour each. Dynamic members entering and leaving a team will have all their counters reset and as a result, they will be the members with the fewest calls when entering the queue. |
|**randomly**|Select a random agent.|
|mem-successively|Like the "linear" strategy; however, the next caller is selected based on who has last accepted a call.|
|**randomly-ordered**|Like the "random" strategy; however, agent priorities are taken into account. Agents with higher priority are only called when all other agents of lower priority are on the phone.|

<!--FIXME prio statische dynamische mitglieder bei Strategie nacheinander  -->

#### Routing Script

At this point, a routing script can be selected. For more info, please see [Skill Based Routing]({{< ref "/acd/skill-based-routing">}})

#### Pickup Notifications

Within in a team (Queue) it is possible to set which users will receive incoming call Popup Notifications within the pascom client.

Firstly, a Pickup role must be defined, which can consist of team members as well as individual users, that do not belong to the team.

Additionally you can determine who of those within the team assigned with the Pickup role will receive notifications.

The following setups are possible:

|Parameter| Description|
|----------|----------|
|Nobody|No team members will receive a incoming call notification|
|Available team members (agents) & non-members|Agents who are currently signed into the team and agents who are not members of the team will receive a notification. Flexible agents who are not currently signed into the team and paused agents will not receive any notifications.|
|Unavailable Agents & Agents who are not logged into the team.|paused agents and non members will receive a notification.
|non-members|Agents who are fixed members and dynamic members who are currently logged in to the team will receive a notification.|
|Only non-members|Only non team members will receive a notification.|
|Complete Pickup Group|The whole pickup group will be notified.|


#### Display Text

This text will be displayed to users when calls arrive via the team. As such, the team members know that they are not being contacted directly, but rather via the team extension number.

#### Music on Hold

Options include; **Dial Tone** and **Music on Hold: "default"**. If you wish to use music on hold, please read the article concerning [Music on Hold]({{< ref "/acd/prompts-moh">}}).

#### Timeouts

|Setting|Description|
|---|---|
|**Member timeout**|Specify the time (in seconds) that a call should ring by a team member.|
|**Timeout external**|Maximum time in seconds that external calls should ring in the queue. After this time period, the action External / After will be executed.|
|**Timeout internal**|Maximum time in seconds that internal calls should ring in the queue. After this time period, the action Internal / After will be executed.|

#### Settings for Callers

|Setting|Description|
|---|---|
|**Maximum number of callers waiting**|The maximum permitted number of callers waiting in a queue. Further callers are handled using the "After" actions.|
|**Join if no egents**|Determines whether a caller should enter the queue if no agents are currently logged in.|
|**Leave if no egents**|Determines whether a caller should leave a queue should no agents be currently logged in.|

#### Voicemail Box

|Setting|Description|
|---|---|
|**Voicemail PIN**|The PIN function is used for the voice mailbox.|
|**Save Voicemails**|**YES**, voicemails will be saved on the pascom server after be sent or after being listened to. Using a cronjob, older Voicemails can be deleted.<br/>**NO**, voicemails will be deleted once they have been dispatched via e-mail. This setting is recommended as voicemails required significant storage. Should voice messages be saved to a hard disk?|
|**Voicemail Email**|Enter the E-mail address to which the voice messages for those teams should be sent to.|

#### Team Members

Under this tab, you can add members to a queue. Click on the blue arrow point right in order to assign a user. If you want to remove a user from a team, click on the arrow point left. 

As already mentioned, it is possible to add fixed or dynamic users to a queue. Per default agents are not dynamic. This can be changed by clicking the setting **Flexible** and selecting **yes**. In doing so, dynamic agents will require a login code in order to log in and out of a queue. This can be defined under the {{< ui-button "Advanced" >}} settings.

*Example:*<br>
The login code has been set to **\*90** and the agent extension number is **13**. Therefore, the agent needs to dial **\*9013** from their desktop phone in order to log in or out of a queue. To avoid the potential for human error, when logging in or out of a queue, the agent will here a message stating their current status.

{{% notice note %}}
In order to ensure that the login code is correctly recognised and processed by the pascom phone system, the phone system needs to know the number of digits used for user extensions. This is configured under the system settings. Using the search box, search for *sys.asterisk.dialplan.global.alias.digit.value*, set to *3* per default but can be modified accordingly.<br>
As such we advise against using user extensions with varying lengths.
{{% /notice %}}

{{% notice info %}}
Should the user have an IP phone, the LED extension keys (BLF keys) can be configured with this code. Please refer to your IP phone vendor specifications.
{{% /notice %}}

Alternatively, users can use the pascom client's Teams section to log in and out of a specific team using the + and - symbols.

#### Breaks and Break Reasons

Instead of focusing on logging in/out, it is also possible for a member of a Queue to use the **Pause** function. When a member uses the pause tool, they remain logged into the Queue but will not receive any calls. Go to {{< ui-button "Users" >}} >  {{< ui-button "Pause reasons" >}} to set customer pause options.

|Setting|Description|
|---|---|
|**Description**| The description will be displayed within the pascom client as the Pause Reason.|
|**Code**|With the code, one can activate/deactivate the Break via Button Shortcuts on their telephones.|

<!-- *Beispiel:*<br>
Warteschlangen-Durchwahl: 100<br>
Benutzerdurchwahl: 13<br>
Kennung: 111<br>
Somit kann die Pause aktiviert/deaktiviert werden mit: **\*99100#13#111**

Pausiert ein Mitglied in der Warteschleife kann das von den anderen Mitgliedern incl. Pausengrund im pascom Client gesehen werden:
![Screenshot - Pause aktivieren im pascom Client](../../images/team_pause.png?width=90% " Pause aktivieren im pascom Client")

Das Pausieren kann im pascom Client in der Team Anzeige durch das Pausensymbol gesteuert werden:
![Screenshot - Pausengründe im pascom Client](../../images/team_pause_detail.png?width=30% " Pausengründe im pascom Client")
-->

### Queue Weighting Options

Queues can be assigned different weights, which allows them to be ranked according to their importance. A higher weight, represented by an arbitrary number, implies higher importance.

![Queue Weighting](team_prio.en.png?width=80%)

In our example, Frank and Peter are members the Support and VIP-Support queue. Both are currently on the phone. There are two customers waiting in the Support queue and one customer in the VIP-Support queue. When either Frank or Peter end their current call, the caller waiting in the VIP-Support queue will be put through before anyone else. It does not matter if there are callers who have been waiting longer, as the VIP-Support queue has a higher weight. Callers from the queue with the higher weight will be accepted until this queue is empty.

{{% notice tip %}}
If you use weights with your queues, all queues must use weights. Not assigning a weight to a queue will result in them having a weight of 0; therefore, such queues will never be accepted.
{{% /notice %}}

Configure queue weighting under {{< ui-button "Users" >}} > {{< ui-button "Teams" >}} > select a team > and under the {{< ui-button "Advanced" >}} tab enter a value in the field **Weighting**.

#### Actions

Within a pascom phone system, actions are an important tool used to controlling call flows. Actions enable the following: 

* the playback of prompts,
* forward callers to voicemail boxes outside of business hours,
* drop calls onto other users should the originally called user be on a call,
* plus much more.

For further information, please read the [Actions Article]({{< ref "/acd/actions">}}).
