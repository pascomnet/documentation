---
title: tomedo® Integration setup
description: In this tutorial we show you how to set up the tomedo® integration on the pascom telephone system.
---
 
{{< doctype "both" >}} 

{{< description >}}

{{% notice warning %}}
To use the tomedo® integration you need the pascom Client from version 65.R1286.
{{% /notice %}}

## Set up tomedo® in the pascom client

The telephony behavior of the tomedo® integration is set in the pascom client. To do so, go to the {{< ui-button "Client Settings" >}} and click {{< ui-button "Client Actions" >}}.

### Set up a new Action. 

For the tomedo® integration 3 actions are required. For each **event type** one action is needed (**incoming**/**connected**/**hangup**).

1. Action | **incomming**
2. Action | **connected**
3. Action | **hangup**

<br />


![Action overview in pascom Client](actions-overview.PNG?width=60%)  

<br />

1. Click {{< ui-button "Add Action" >}} to create a new action. Choose the action type {{< ui-button "Add App Action" >}}. 

<br />

![New Action](new-action.PNG?width=80%)

<br />

#### Action for incoming calls

1. **Name:** - assign a name for the action e.g. ```incomming```.
2. **App-Path** - set the path = ```/usr/bin/curl```.
3. **App-Parameter** - set the URL for the parameters = ```http://localhost:9090/incomming/${number}```.
4. **Auomatically Perform Action** - Activate all ```Call Types```.
5. **Call Direction** - incomming and outgoing = ```Both```.
6. **Trigger Event** - ```upon ringing```.

#### Action for active / answered call

1. **Name:** - assign a name for the action e.g. ```connected```.
2. **App-Path** - set the path = ```/usr/bin/curl```.
3. **App-Parameter** - set the URL for the parameters = ```http://localhost:9090/connected/${number}```.
4. **Auomatically Perform Action** - Activate all ```Call Types```.
5. **Call Direction** - incomming and outgoing = ```Both```.
6. **Trigger Event** - ```upon accept```.


#### Action to hangup

1. **Name:** - assign a name for the action e.g. ```hangup```.
2. **App-Path** - set the path = ```/usr/bin/curl```.
3. **App-Parameter** - set the URL for the parameters = ```http://localhost:9090/hangup/${number}```.
4. **Auomatically Perform Action** - Activate all ```Call Types```.
5. **Call Direction** - incomming and outgoing = ```Both```.
6. **Trigger Event** - ```upon hangup```.


## Setup in tomedo® 

The three actions must be identical in pairs in tomedo® and pascom
can be adjusted. All three event switches (internal, external and team)
must be activated for all three actions. 
<br />

To do so, go to the {{< ui-button "Settings" >}} under {{< ui-button "Workstation" >}} and select {{< ui-button "External" >}}. There you set
the **Telephone Connection** to **AppleScript + URL pattern**.
<br />

![tomedo® Setup](tomedo-setup.png?width=100%)

<br />

**Activate** the setting **always use AppleScript for outgoing calls** and set the URL pattern which must be identical to the **pascom client actions**.

<br />

![tomedo® Setup](tomedo-url-pattern.png?width=100%)

<br />

To make a phone call tomedo® needs an Applescript, which contains a URL call
with the callto: schema, to which pascom then reacts by
outgoing Calls.

<br />

![tomedo® Setup](tomedo-applescript.png?width=100%)

<br />

**AppleScript**

```
set tel to "xxx"
set telOhneSpace to do shell script "echo " & quoted form of tel & " | sed -e 's/ //g'"
set theScript to "open tel:" & telOhneSpace
do shell script theScript  

```

<br />

How to use the tomedo® integration is described in the User Guide.