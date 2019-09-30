---
title: Call Distribution using Actions
description: Configure pascom VoIP phone system Call Distribution actions for professional call routing
weight: 71
---

{{< doctype "both" >}}
 
{{< description >}}


## Concept

Actions are an important and useful pascom phone system tool for SMBs, Contact Centre and larger [Call Centers](https://www.pascom.net/en/call-center "pascom CallCenter solutions"). Through using actions, the process of each individual call flow can be controlled.

Actions are available with the following objects:

+ **Users**
+ **Teams**
+ **IVRs**
+ **Call Routers**

### Internal / External Actions

With the exception of Call Routers, Actions distinguish the caller origin. This allows actions to be set up for calls depending on where the call originates as follows:

+ **External**, so over a trunk,
+ or **Internal**, so originating from an internal source within the pascom phone system.


### Before/After Actions

Before the call setup, each call is processed according the **Actions Before**. To fulfill certain conditions or requirements, it is also possible to configure and **Actions After**. This can be used for example to send the caller to a feedback IVR for your [Contact Centre Team](/en/call-center/ "pascom Contact Centre solutions").

### Example Scenario

An user extension is called - the caller will then go through the following sequence:

![pascom IP PBX ACD Actions](actions_example_en.png "pascom phone system call actions example call flow")

To determine which action set is appropriate, the call origin will be checked for internal vs external origination and will then go through the **Actions Before** before the call is setup. At this point the call is constructed (setup) and directed to the correct user extension. Should the call not be answered, the call flow is then processed according the **Actions After**. At this point the call origin will be checked once again to ensure the correct action set is processed.

## Configuration

{{% notice info%}}
Per default, we do add any actions for newly added objects.
{{% /notice %}}

Actions are directly configured within the objects to which they belong.

### Example Scenario: User Actions

Select the required user via the menu {{< ui-button "Users" >}} > {{< ui-button "User list" >}} and press {{< ui-button "Edit" >}}. Within the corresponding menu taps, you will be able to configure the actions

+ **Internal/Before**
+ **Internal/After**
+ **External/Before**
+ **External/After**

|Action Types|Description|
|---|---|
|**Prompt**|(For versions before & including 7.13.04 - announcement) Plays a prompt which can be added under {{< ui-button "Advanced" >}} > {{< ui-button "Prompts" >}}.|
|**Voicemailbox**|Connects the call to a voicemail box. The VM box can be for the user themselves, that of another user or a team. In addition, it is possible to set *Hint* (user not available or busy) as well as a *Handling* (Prompt that the caller can leave a message).|
|**Hang up**|Hangs up the call. This action is recommended for example when the caller is only play a prompt.|
|**Script**|Executes a script which has been created under the {{< ui-button "Advanced" >}} > {{< ui-button "Scripts" >}} menu.|
|**Inline-Script**|Single line script which can be entered here.|
|**Set Label**|Labels are configured under {{< ui-button "ACD" >}} > {{< ui-button "Call Labels" >}} and can be added as an action. Labels are displayed to desktop clients users as additional information regarding the caller and it is possible to set as many labels per caller as you wish. Please note a call label must be configured before you can add them as actions.|

Additional Actions:

+ Drop on to a team (Queue or Call Group)
+ Drop on to an IVR menu
+ Drop on to a Call Router
+ Add manual dropping (i.e. on to an different extension or on to an external number)


### Action Sequencing and Actions Conditions

Should you added multiple actions under either the {{< ui-button "Internal Before" >}} or {{< ui-button "External Before" >}} action tabs, then these will be processed in order from top to bottom. The sequence can be altered using the blue arrow keys to push an action either a position upwards or downwards.

{{% notice tip%}}
Consideration should be paid to a sensible sequencing of conditions, e.g. should the national holiday calendar be checked first before checking business hours as if it is a national holiday, the business hours may not actually need to be checked.
{{% /notice %}}

In order to perform an action, the condition will be checked. Action lines with **-no-** condition set will be automatically performed by every call setup. Action lines with a condition set will only be performed should the condition be is met. It is also possible to use the same action condition in multiple lines. In this scenario, the actions are performed sequentially.

Conditions can be added under {{< ui-button "ACD" >}} > {{< ui-button "Action Conditions" >}}.

### Call Status

pascom phone systems are able to identify when a caller has not be able to reach their desired contact / team or destination in the call flow and in such scenarios can perform additional actions - known as {{< ui-button "Actions After" >}}. Therefore, in addition to conditions, it is also possible to add a {{< ui-button "Call Status" >}} (dial status) to **Actions After**, meaning the state of the call (unavailable or busy) can be checked and different actions can be performed according to the call state.


|Call Status|Description|Applies to Users|Applies to Queues|
|---|---|---|---|
|**-not set-**|Call status will not be checked.|*yes*|*yes*|
|**Not available**|No assigned endpoint is available.|*yes*||
|**No answer**|Timeout period is exceeded.|*yes*|*yes*|
|**Busy**|User is busy.|*yes*||
|**Queue full**|Maximum waiting callers in the queue has been reached.||*yes*|
|**Entered empty**|Performed when the caller enters a queue even though no agents are currently logged in.||*yes*|
|**Exit empty**|Performed before the caller leaves a queue with no agents logged in.||*yes*|

<!-- |**Entry not possible**|||*yes*|
|**Exit not possible**|||*yes*| -->


## Action Templates

In scenarios when a selection of actions could be applied to multiple objects, it is possible to create an action template and apply this template to all objects where it applies.

Top add an action template, navigate to {{< ui-button "ACD" >}} > {{< ui-button "Action templates" >}} > {{< ui-button "Add" >}}.

|Setting|Description|
|---|---|
|**Template**|Enter a template name|
|**Object type**|User, Team or IVR menu|
|**Call position**|Action Before or Action After|

After clicking {{< ui-button "Save" >}} it will then be possible to select the template under the corresponding object and call position via the {{< ui-button "Templates" >}} button.

In order to distribute actions to the corresponding objects, go back to the {{< ui-button "ACD" >}} > {{< ui-button "Action templates" >}} overview and select (via checkbox) the desired template and click the {{< ui-button "Roll out template" >}} button.

Under {{< ui-button "Options" >}} you can configure the template roll out setup:

|Setting|Description|
|---|---|
|**Mode**|Determines how to deal with existing actions.|
|**Repeated assign**|Determines what happens when should actions contained within the template already exist by an object.|
|**Call origin**|Actions apply for Internal or External Calls.|
|**Call Status**|See [Call Status]({{< relref "#call-status">}})|
|**Use condition**|See [Action Conditions]({{< relref "#action-sequencing-and-actions-conditions">}})|