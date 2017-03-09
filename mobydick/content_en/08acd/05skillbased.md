---
title: Skills Based Routing
url: /call-distribution/skills-based-routing/
linkde: /anrufverteilung/skill-based-routing/
prev: /call-distribution/ivr-menus/
prev: /call-distribution/
description: Skills Based Routing is an advanced routing strategy that routes calls to contact center agents who are best qualified (skilled) to fulfill the incoming callers requirements. Skills Based Routing also has the additional benefit of significantly simplifying Queue Management and Analysis in larger contact center Environments.
keywords: 
    - Skills Based Routing
    - Agent Skills
    - Call Labels
    - Advanced Call Center ACD
    - CallCenter Solutions
    - ContactCenter IP telephony
weight: 75
toc: true
---


## Concept
Automated Call Distribution strategy to route inbound callers to the agent(s) who are best qualified (skilled) to fulfill the callers requirements.

Functions:

* Skills of agents within a team
* Queues which support Skills Based Routing
* Inline Scripts (Single lined scripts which can be added and respectively integrated into an action before/after)
* Generic Labels (Labels which can be set for a caller, e.g. as information for the agents, prioritising a caller, VIP customer etc...)
* Call Router (checked whether a condition triggers any actions)

## Example 1

### Overview

The caller selects their preferred language using an IVR menu and will then be forwarded onto the support team. With skill based routing, only phones belonging to support agents with the associated language skill will ring.
![Illustration - Skill Based Routing](../../images/skill_based_routing_example1.png "Skill Based Routing example 1")

### Configuration

1. The first step is to define the required skills, which in the example above is languages. To do this, select ***ACD (Automatic Call Distribution)- > Call Labels -> Add*** -> Skill.
![Screenshot - Skill Based Routing Labels](../../images/skill_based_routing_call_labels.png "Skill Based Routing Labels")

2. Next the skills must be assigned to your users which can be done by following: ***Users - > User List ->*** Select required user(s) ***-> Edit -> Skills Tab***. 
![Screenshot - editing skills](../../images/skill_based_routing_user_skills.png "editing skills")

3. In order to ensure that skills are taken in account when distributing calls within a team, the team must be configured to use the script "Skill Based Routing", which can be done using the following menus: Users -> Teams -> selected desired Team / Queue -> Edit -> Basic Data Tab, and then selecting **skill based routing** from the drop down menu under Script.

{{% notice note%}}
Using skills has numerous benefits such as only needing one queue, even though your callers require different skills for example different languages. Through using skill based routing only the phones of those agents that fulfil the required skills will ring, ensuring improved customer care etc.
{{% /notice%}}

4. In order to be able to select the callers required language, we need to set up an IVR menu which can be done via ***ACD -> IVR - > Add***
  Once the ***IVR*** menu has been added, you will now need to add the required option entries. To do this select the IVR you just created and then click on the ***Entries*** button.
  
![Screenshot - Skill Based Routing IVR menu](../../images/skill_based_routing_ivr_languages.png "Skill Based Routing IVR menu")

Now the actions for your IVR options (entries) need to be configured, such as our example below, which outlines how the entry "english" could be configured by selecting the required entry and clicking on edit which will allow you to configure the call flow for internal and external calls. In our case we are demonstrating the call flow for external calls.

![Screenshot - configuring IVR actions entries](../../images/skill_based_routing_ivr_english.png "configuring IVR actions entries")

Firstly, we need to set a label using Add -> Set Label - > select "english" as the skill under the Name column -> under expression add the required minimum skill proficiency level that a user / agent must have to fulfil this skill.
You can also set the channel language here, meaning your callers will only hear prompts / announcements in the language they have selected. 
The last step in this example scenario is to define where the call will be distributed to, which in this case is onto the support queue which is defined by using the ***"Add Dropping"*** button and select ***on queue*** and double clicking on the field in the **Name** column and selecting the desired queue.

{{% notice note%}}
Should a label be set for a caller, this label applies until the call is ended.
{{% /notice%}}
{{% notice note%}}
The labels will then be displayed within the queue agent's mobydick client as additional caller information. Any number of labels can be set per caller.
{{% /notice%}}


## Example 2

### Overview

This example scenario expands on the example above. After the language IVR, the customer number will also be requested which will be used to distinguish between VIP and non VIP customers. VIP customers will be connected directly to the support team, while calls from non VIP customers must be checked to see whether they are calling inside of normal business hours before being connected to the support team. 
 ![Illustration - Skill Based Routing](../../images/skill_based_routing2.png "Skill Based Routing example 2")

### Configuration

1. After selecting their language, a caller must be prompted to enter their customer number. This is achieved by using a **Generic Label** which can be configured under ***ACD - > Call Labels -> Add -> Generic Label***.
![Screenshot - Generic Label](../../images/skill_based_routing_call_labels_generic.png "Generic Label")
The generic label has a **Channel Variable** (in this case MDC_LABEL-9) which we need to make note off for further configurations. The variable name can be found by selecting the label in the overview and clicking on Edit: 
![Screenshot - variable names](../../images/skill_based_routing_call_label_condition.png "variable names")


2. To differentiate between VIP and non VIP customers, we need to use a **Generic Label with Action Conditions**: ***ACD -> Call Labels -> Add -> Generic Label*** and set the ***Create Action Condition*** to **yes**. 
![Screenshot - action condition](../../images/skill_based_routing_call_label_VIP.png "action condition")


3. Now the IVR options will no longer distribute calls directly to the Support queue, as we want to also ask for the customer number. This functionality is performed by using a Call Router:
![Screenshot - IVR with Skill based Routing](../../images/skill_based_routing_IVR_Edit.png "IVR")


4. In general, the **Call Router** is used in order to determine whether conditions and actions have been fulfilled. 
The first step is to use an **Inline Script** in which the customer number can be requested. An Inline Script allows a single line Asterisk script to be simultaneously integrated into actions. 
With help from, for example a script, it is possible to verify the entered customer number in order to apply either the VIP or non VIP customer label to the call. A caller which has the VIP call label ( and associated action conditions) attached, will then be connected directly to the support team, while calls which have the non VIP customer label attached will then be submitted to out of business hours time checks before being connected / not connected to the support team.
![Screenshot - action condition](../../images/skill_based_routing_call_router_Customer_Number.png "action condition")
The checking of business hours will also be performed using a Call Router as shown below: 
![Screenshot - business hours check](../../images/skill_based_routing_call_router_business_hours.png "check business hours")
