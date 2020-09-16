---
title: How to use Client Actions
weight: 19
description: In this tutorial we will show you how to use client actions and transfer call data to an 3rd party application. 
---

{{< doctype "both" >}}
 
{{< description >}}

## Trainings Video

{{< youtube pyVqJ5SKIIk >}} 


## Overview


Client actions allow you to transfer data to third-party applications for further processing (e.g. a CMS web application with customer data). Client actions can be controlled manually or work fully automated. 

## Create a new Action

The client actions can be found in the **Client Settings**.

1. Open the {{< ui-button "Client Settings">}} via the pascom Menü


![Open Client Settings](open_clientsettings.jpg)
</br>

2. Click on {{< ui-button "Client Actions">}} in the **Settings menu**


![Actions](actions.en.jpg)
</br>

3. Create a new action using {{< ui-button "Add Action">}}.


### Pass data to URL or application

At this point, you must decide whether you want to pass data to a **URL** (e.g. a web application) or to a **application** installed on your computer. 


![URL or App](actions-url-app.en.jpg)
</br>


## Edit an Action

Here you determine which data you want to pass and how your action should behave. In our example we transfer the **phone number** of the caller to a **URL**. 

![Setup Actions](actions-settings.en.jpg)
</br>

### Set a Name

Assign a unique name to the action at {{< ui-button "Name">}}, because you can create several actions and therefore you can see immediately what the action does. 

### Set the URL

At {{< ui-button "URL">}} set the address of your web application, followed by a variable and the data you want to pass.

**Example**  

|Description|Parameter|
|---|---|
|URL|www.webadress.com|
|Variable of the web application|?phone=|
|Data from the pascom client|${number}|
|Result|www.webadress.com?phone=${number}|

{{% notice info %}}
The composition of the **URL** is of course completely up to you and you can therefore transfer the data as you need it.
{{% /notice %}}

**pascom parameters that can be used**

<br />

|Parameter|Description|
|---|---|
|${name}|Contains the name of the caller, resolved from the phone book|
|${number}|Contains the phone number of the caller|
|${MDC_LABEL-X}|Contains the system variable of a label of the caller|
|${MDC_SKILL-X}|Contains the system variable of a skill|

## Run actions automatically

Actions can be started automatically in connection with the **call direction** and a **call result** for the following **call types**.

1. Internal calls from colleagues
2. External calls on the own extension
3. External calls via a team / queue

### Call direction for automatic actions

For {{< ui-button "Call direction">}}, specify whether the action should start automatically for **incoming**, **outgoing** or **both** call directions.

### Trigger event for automatic actions

In the {{< ui-button "Trigger event">}} item, set when the action should start automatically. Already during **ring**, after **accepting** the call or when **Hanging up** the call.

## Start actions manually

Actions can also be executed or started manually at any time. For actions that apply to the respective call, you will find a {{< ui-button "Action open">}} Button.

![Start actions manually](actions-manuel.en.jpg)
*Start actions manually with one click*
</br>

1. Click on the {{< ui-button "Action open">}} button for an incoming call and A popup will also show you the name of the action that will be executed.  
2. Actions can also be started directly from the **call journal**. There you will find the same {{< ui-button "Action open">}} button.

## Work with data in a third-party application

Of course, you should also process the data that you transfer to a third-party application (e.g. search for phone numbers in a CMS web application). Here you can be creative. 


![data in a third-party application](data_extern.jpg)
*Transfer data from pascom client to external application*
</br>

1. As you can see in the graphic above, the **URL** was given the **telephone number** of the customer, which can now be used **externally**. 

## Manage Actions

In the {{< ui-button "Client Settings">}} you can manage your actions. Add new actions, remove existing actions and favor actions that should be used by default.

![Manage Actions](actions_manage.en.jpg)
*Manage your actions in the pascom client*
</br>

1. {{< ui-button "Deactivate">}} actions that you temporarily do not need.
2. Click on an {{< ui-button "action">}} to **edit** it.
3. Please note that one action must always be marked as {{< ui-button "favorite">}}*. A single action is therefore always **favorite**.

<br />