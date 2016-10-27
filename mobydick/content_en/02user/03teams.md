---
title: Add and Build Teams
url: /users/add-teams/
prev: /users/users-and-locations/
next: 
weight: 23
keywords: 
    - Add Teams
    - Build teams
    - Call Queues
    - Hunt Groups
    - CallGroups
    - Roaming User
    - Hot desking
    - Call Center Teams
    - Call Routing
description: Teams in mobydick are comparable to Call Queues. Use advanced call strategies to help manage callers more effectively and professionally. 
linkde: /benutzer/teams-bilden/
toc: true
---

## Concept

Each mobydick user has their own extension, devices and actions that control calls made to that extension. In addition, a user can be a member of a **team**.
![Screenshot - Team Concept](../../images/team_basic.png?width=90% "Teams and queues in mobydick")

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

Queues can have permanent and/or **dynamic members**, i.e. users can join a queue if needed. Queues are capable of a number of call strategies. Callers are added to the queue sequentially and, if desired, can be informed of their **position in the queue** and the **average waiting time**. During the wait, either hold music or a ringing tone can be played.

### Call Strategies

|Strategy| Internal Asterisk Name| Description| Call Group|Queue|
|---------|---------------------|--------------|:--------:|:------------:|
|ring all| ringall|    Call all members simultaneously.| <i class="fa fa-check-square" aria-hidden="true"></i>  |  <i class="fa fa-check-square" aria-hidden="true"></i>| 
|one after another|    linear |Members are called according to their assigned position. Please note: dynamic members change their position when joining or leaving a team.|  <i class="fa fa-check-square" aria-hidden="true"></i>| <i class="fa fa-check-square" aria-hidden="true"></i> |
|longest back| lastrecent  |The member who has not received a call for the longest period of time will be the next in the list. Please note: entering and leaving a queue by dynamic team members will reset all counters. When entering a queue, dynamic members always are the ones that have not accepted a call for the longest time.|  |<i class="fa fa-check-square" aria-hidden="true"></i>  |
|fewest calls| fewestcalls    |The member having accepted the fewest calls will be the next in queue. This setting does not consider the length of the call. A member having made five calls of one minute each will come after a member that made only two calls, although these may have lasted one hour each. Dynamic members entering and leaving a team will have all their counters reset and as a result, they will be the members with the fewest calls when entering the queue. |  | <i class="fa fa-check-square" aria-hidden="true"></i> |
|randomly| random |Select a random agent.|  | <i class="fa fa-check-square" aria-hidden="true"></i> |
|mem-successively| rrmemory   |  Like the "linear" strategy; however, the next caller is selected based on who has last accepted a call.|  | <i class="fa fa-check-square" aria-hidden="true"></i> |
|randomly- ordered| wrandom|   Like the "random" strategy; however, agent priorities are taken into account. Agents with higher priority are only called when all other agents of lower priority are on the phone.|  | <i class="fa fa-check-square" aria-hidden="true"></i> |

### Weighting queues

Queues can be assigned different weights, which allows them to be ranked according to their importance. A higher weight, represented by an arbitrary number, implies higher importance.

![Illustration - Weighting queues](../../images/team_prio.png?width=70% "Weighting queues in mobydick")

In our example, Frank and Peter are members the Support and VIP-Support queue. Both are currently on the phone. There are two customers waiting in the Support queue and one customer in the VIP-Support queue. When either Frank or Peter end their current call, the caller waiting in the VIP-Support queue will be put through before anyone else. It does not matter if there are callers who have been waiting longer, as the VIP-Support queue has a higher weight. Callers from the queue with the higher weight will be accepted until this queue is empty.
{{% notice tip %}}
If you use weights with your queues, all queues must use weights. Not assigning a weight to a queue will result in them having a weight of 0; therefore, such queues will never be accepted.
{{% /notice %}}

## Configuration

### Managing Call Groups

In the mobydick web interface, select ***Users > Teams*** and click the `+Add` button to create a new team or click on an existing team and use the `Edit button.
Select ***call group*** from the **type** list and enter a **title** and an extension number that can be called to reach the team.


#### Basic data

!<!--//Fixme Call Group Screen Shots-->[Screenshot - manage call groups](../../images/team_queue.jpg?width=90% "manage call groups in mobydick")

|Parameter| Description|
|----------|----------|
|Title|Name of Team.|
|Extension|extension number for the team, e.g. Sales could have the ext. 200.|
|Call Strategy|Which call strategy should be used when members are called.|
|Pickup Notifications|Using this function, you can determine who can see pickup notifications for a particular call group.|
|Display Name| The text displayed on the member's telephone in addition to the caller's name and number. This allows the call attendant to see that the call is not made directly but that it was forwarded by the "SP" team.|
|Answer Channel|Usually, if hold music or an announcement is to be played, the channel is answered immediately. This field allows you to configure a delay time (in milliseconds). In some cases, immediate answering of a call can result in the first syllable of the announcement being skipped. Using a delay avoids this problem.|
|Music on Hold|Select the type of sound to be played. Select "dial tone" if you do not want the channel to be answered but want the caller to hear a ringing tone. This is necessary only if haven't already created some type of action to answer the channel, e.g. to play a greeting announcement.|

#### Advanced
<!--//Fixme Call Group Screen Shots-->![Screenshot - call group with advanced functions](../../images/team_queue_advanced.jpg?width=90% "Rufgruppe - advanced functions")


|Parameter| Description|
|----------|----------|
|Timeout external| Maximum time (in seconds) that an external caller should remain as a member of the call group. After this timeout, the call will be routed according to the actions **external / after** using the **call state** ***timeout***.|
|Timeout internal|Maximum time (in seconds) that an internal caller should remain as a member of the call group. After this timeout, the call will be routed according to the actions **internal / after using** the **call state** ***timeout***.|
|Voicemail Pin|The PIN used for the voice mailbox.|
|save Voicemails|Here you can select whether voice messages should be stored on the hard drive.|
|Voicemail Email|Enter the e-mail address to which the team voicemail messages should be sent to.|


##### Members
<!--//Fixme Call Group Screen Shots-->![Screenshot - Member of a call group](../../images/team_queue_members.jpg?width=90% "call group member")

Allows you to add members to the group. Use the up down arrows to change the order of the members as this can have an effect on some call strategies.

#### Roles
Here, you can configure which roles should apply to a particular team.

#### Actions (internal, external, before, after)

Actions allow you to manage the call flow. 

### Managing Call Queue Teams

To create a new team, use the `+Add` button in the menu **Users > Teams** of the web interface or select an existing team and press the `Edit` button to modify its settings. When adding a new team, select **Queue** as the type and enter a **title** as well as an extension number on which the team can be reached.

#### Basic data
![Screenshot - manage queues ](../../images/team_queue.jpg?width=90% "manage queue in mobydick")

|Parameter| Description|
|----------|----------|
|**Title**|Name of the team|
|Extension| Extension number of the team|
|Call Strategy|Which call strategy should be used when calling team members|
|Pickup Benachrichtigungen|Using this function, you can determine who can see pickup notifications for a particular call group.|
|Displayname|This text is displayed on the called persons' phone and shows the name and number of the caller. The called party can thus see that this is not a direct call but rather a call routed through the "SP" team.|
|Music on hold|Which playlist should be used for Music on Hold (MoH). Select - dial tone - if you do not want this channel to be answered with MoH, but want the caller to hear a dial tone. This of course makes send only if you haven't already answered the channel under the Channel Actions, e.g. playing a greeting.|
|Member timeout|Specify the time (in seconds) mobydick should try to reach a member. If, for example, "one after another" is the call strategy currently employed, the first member is selected and called. After a time out (15 seconds in our example), the phone of this member stops ringing and is put back into the queue again. The next member in queue is selected and the system tries to call the member for 15 seconds.|
|Maximum number of people waiting| Specifies the maximum number of members a queue may hold. If, from the above example, the maximum is set to 5, the **sixth** caller trying to enter the queue will not be added to the queue but is immediately handled according to the group actions set in the **after** section.|
|Send Call Completed Elsewhere| As soon as a call to the queue is answered by another team member, the other free agents will receive a notification that the call has been answered.|

#### Advanced
![Screenshot - Teams with advanced functions](../../images/team_queue_advanced.jpg?width=90% "Teams with advanced functions")

|Parameter| Description|
|----------|----------|
|Login Code|This code, followed by corresponding extension number, allows a dynamic team member to log on to the system.|
|Timeout external| Maximum time (in seconds) that an external caller should remain as a member of the call group. After this timeout, the call will be routed according to the actions **external / after** using the **call state** ***timeout***.|
Timeout internal|  Maximum time (in seconds) an internal caller should be allowed to wait in the queue. After this allotted period of time has passed, the call will be routed according to the actions **Internal / After** with the **call state** will be ***Timeout***.|
|Answer channel|   Usually, when hold music or an announcement is to be played, this channel is answered immediately. This field allows you to specify a delay (in milliseconds). In some cases, immediate answering of a call can result in the first syllable or the first second of the announcement being skipped. Using a delay avoids this problem.|
|Weight    |Queues can be assigned different weights. A higher weight, representend by an arbitrary number, gives higher priority to a queue.|
|Prompt frequency| Specify the intervals (in seconds) between the announcements informing the caller about their position and remaining time in queue. Leave this field blank if you do not wish to make such announcements.|
|Options|Here you can enter Queue Management options which can be recognized by Asterisk. You can only use one option per line. Please see this guide on options: http://www.voip-info.org/wiki/view/Asterisk+config+queues.conf|
|Join if no agents| Decides whether a caller can enter the queue although it is empty. When only dynamic members are used, there may be no members currently registered with the queue. If you select no here, those callers will be routed according to the actions **External** and forwarded using the **call state** ***Entry when empty***|
|Leave if no agents| Decides whether a caller can automatically leave the queue once it is empty. When only dynamci members are used, the last member might leave the queue while there is still a caller waiting. If you select yes here, those callers will be routed according to the actions **After** and forwarded using the **call state** ***Leave when empty***.|
|Voicemail PIN|    The PIN function is used for the voice mailbox.|
|Save Voicemails|  Should voice messages be saved to a hard disk?|
|Voicemail Email   |Enter the E-mail address to which the voice messages for those teams should be sent to.|

#### Members

![Screenshot - members in queue](../../images/team_queue_members.jpg?width=90% "queue member")

In this screen you can add members to a queue. By using the setting **Flexible** ***yes*** you will set the team member to dynamic. Members who are set as **Flexible** ***no*** will always be a member and therefore always called and cannot log themselves out of the queue. Some call strategies consider a member agent's priority. You can use the up done arrows to change the agent member order, which then impact how agents are called when using certain call strategies.

#### Roles

Here you can specify and determine Team members roles.

#### Actions (internal, external, before, after)

Actions allow you to manage the call flow. 

#### Dynamically add and remove users in a queue

In mobydick, users can dynamically enter or leave a queue if they have been assigned as a dynamic member of that queue. To configure a user as a dynamic queue member, in the **Assigned Users** column set **Flexible Users** to **Flexible Yes**. 
If a login code (**Queue -> Advanced**  tab **-> Login code**) exists, users can enter or leave the queue using this code if they have been assigned as a dynamic member of this team.
Going back to our example, if you set ***80** as the login code, the user Peter, having the extension **21**, can join or leave this team by dialling ***8021**. As an alternative, no matter whether there is a login code is entered or not, you can always use the **system extension number** of the format ***99queueextenstion#userextension** to log on or off. Peter, having the extension **21**, can use ***99800#21** to log on to a queue that has the extension number **800**.

The login code has several advantages over the system extension. You can assign the login code to the LED **extension number key** of an IP phone. This way, the LED will be on if a user is in the queue. It will go dark when the user logs off.
Alternatively, a user can log themselves into our out of a Queue through the Teams display option and using the + and - symbols:
![Screenshot - Logon and Log out](../../images/teams_logon.png?width=30% "Logon/Logout Queue")

#### Breaks and Break Reasons

Instead of focusing on logging in/out, it is now also possible for a member of a Queue to use the **Breaks** function. During the members break, they remain logged into the Queue but will not receive any calls. Moreover, one can also define Break Reasons within the mobydick Web UI under the menu option Advanced > Pause Reasons.


![Screenshot - manage break reasons](../../images/team_break.png?width=90% "manage break reasons of a queue")


|Parameter| Description|
|----------|----------|
|Title|    The description will be displayed within mobydick as the Break Reason.|
|Code| 
With the code, one can activate/deactivate the Break via Button Shortcuts on their telephones.
***99QueuesExtension#UserExtension#BreakReasonCode**. More details can be found below. |

If a member of the Queue or Team does go on a break and sets their status for a break, this will be displayed to the other members of the Team:
![Screenshot - activate Break in mobydick Client](../../images/team_break1.png?width=90% " activate break in mobydick Client")

Breaking can be controlled from with the mobydick Client under the Team tab (and team you are a member of) through using the Pause Symbol:
![Screenshot - break reasons in mobydick Client](../../images/team_break_detail.png?width=30% " break reasons in mobydick Client")

Alternatively, you can allow the users to use the Telephone Button Shortcuts.
The shortcut key is made up as follows: ***99QueueExtension#UserExtension#BreakCode**
### Pickup Notifications

Within in a team (Queue) it is possible to set which users will receive incoming call Popup Notifications within the mobydick client.
 
Firstly, a Pickup role must be defined, which can consist of team members as well as individual users, that do not belong to the team.

Additionally you can determine who of those within the team assigned with the Pickup role will receive notifications.
![Screenshot - PPickup notification](../../images/team_pickup_notification.png?width=90% " Pickup notification")

The following setups are possible:

|Parameter| Description|
|----------|----------|
|Nobody|No team members will receive a incoming call notification|
|Available team members (agents)|Agents who are currently signed into the team and agents who are not members of the team will receive a notification. 
|& non-members Flexible agents who are not currently signed into the team and paused agents will not receive any notifications.
|Unavailable Agents & Agents who are not logged into the team. paused agents and non members will receive a notification.
 non-members|Agents who are fixed members and dynamic members who are currently logged in to the team will receive a notification.|
|Only non-members|Only non team members will receive a notification.|
|Complete Pickup Group|The whole pickup group will be notified.|
