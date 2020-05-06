---
title: Roles
description: Roles allow you to assign Users, Teams, Devices and Workstation (locations) diverse permissions and functions.
weight: 40
---

{{< doctype "both" >}}

{{< description >}}

## Training Video

{{< youtube WVQuH8x7CXc  >}}

## Concept

Users, devices, teams and even locations can be assigned one or more roles. Roles themselves can be assigned with functions and permissions, which can be used to control telephony relevant tools such as, for example, whether or not a user is permitted to pickup calls from other users.

Roles are set up under {{< ui-button "Users" >}} > {{< ui-button "Roles" >}}.

A special **All Users** role is available which is assigned to all users, devices, teams and locations per default.

A common use case (and our recommendation) is to create a role per department or team. 
*For example, it is often wished that a user can only pickup and see calls in the pascom client that are from within their own department. To do this, simply remove the xmpp.group property from the All Users role and assign it to a new role e.g. Support and make all support employees members of the role group.*

## The Role "All"

By default, every pascom telephone instance has a permanently implemented role called "All". This role cannot be removed. However, you can adjust them that they no longer contain permissions or assignments.

*The role "All" should make it easier for beginners to deal with user roles and, by default, enables the visibility of users and teams in the pascom clients*

## Creating Roles

Roles can be found under {{< ui-button "Users" >}} > {{< ui-button "Roles" >}}.

To create a role, click the {{< ui-button "Add" >}}.

Provide the role with a name which corresponds to the intended role assignment or function / permission.
Optionally, under the Description field you can also enter additional relevant information which provide insight into the purpose of the role.

### Activate automatic assignment

In the base settings of each role, you have the option of having assignments carried out automatically. This is a great feature to significantly reduce maintenance.

A role can automatically assign users, teams, locations and devices.

![Role Basesettings](role_basedata.en.PNG?width=45%)

**How does it work exactly?**

If you activate a setting for automatic assignment, the corresponding tab disappears from the tab bar and the assignment is made automatically.

*example:*  
If you activate the automatic assignment of users, **all** existing users on the pascom telephone system, are assigned to this role .

If you deactivate a setting for the automatic assignment, the corresponding tab appears again in the tab bar and you can manually assign the corresponding elements to the role. 

{{% notice tip%}}
If automatic assignment is activated, newly created elements such as e.g. Users and teams, will be automatically assigned.
{{% /notice  %}}


### The Role Types explained

Roles can have one or more role types, also known as permissions, added to them. Each role type offers differing functionality.

|Role Type|Description|Impact|
|---|---|---|
|xmpp.supervisor|Users with this role can manage all user calls. This is important when using the TAPI.|Users|
|location.group|This role determines which users can log into which locations. If this role is not configured, every user will be able to log into every work location. Once such a role has been added, users who are not members of a location.group role will no longer be able to login to locations.|Users, Locations|
|pickup.group|All members of this role group are permitted to pickup incoming calls to other group members. This can be done by either using /*8 on a desktop phone or by using the pascom client.|Users, Call Groups and Queues|
|redirect.choice|An identity with this role type will never be redirected by a server based call forwarding, but rather always calls the destination directly. |Users|
|xmpp.group|All identities assigned with the role type xmpp.group will be amalgamated into a XMPP shared group. Therefore, within pascom client contact list, these persons no longer need to add one and another but are rather immediately visible to each other. Should you assign the xmpp.group role type to the *All Users* role, then all users will always be able to see each other. |Users|
|redirect.group|All users with this role are permitted to set call forwarding for other users (via [Function Codes]({{<ref "/howto/featurecodes">}}))|Users|

Now you can assigned users, teams, devices and / or locations to your newly created role - depending of course what the defined role type affects.

## Example Usage

### Visibility in the Client

Should you wish to make teams visible in the [Desktop and Mobile Client]({{<ref "/clients">}}), a role with the role type **xmpp.group** is required.

Example:           
Under {{< ui-button "Users" >}} > {{< ui-button "Roles" >}} > {{< ui-button "Add" >}} add a new role with the name "Support-Team".              
Under the {{< ui-button "Role types" >}} tab, add the ***xmpp.group*** role type to the role.          
Under the {{< ui-button "Users" >}} tab, add all "Support" users.         
Under the {{< ui-button "Teams" >}} tab, add the "Support" team.   
Click {{< ui-button "Save" >}} and apply the changes. 
*Now all support users will see their own "Support Team" contact list within the pascom client and under the contacts filter drop down "Teams", the "Support" queue will also be visible.*

Should you wish to see who is calling with whom within the client, then you will need to the set the ***sys.xmpp.properties.roster.shownumbers*** property setting to "true" within the pascom phone system web UI. *(Available since pascom 17.08)*

### Pickup

In principle, every user can use the /*8  code to pick up calls from any other user at least until a role with the role type "pcikup.group" has been added. From this point, the pickup permissions must be explicitly defined. 

Within a team, it is possible to determine which employees receive inbound call pascom client pickup notifications.

If the [Team]({{<ref "/teams/configuration#pickup-notifications">}}) pickup configuration options are not able to include all to be permitted users, you will need to create a pickup group. 

With a pickup role with the type **pickup.group** it is also possible to configure users to be able to pickup incoming external and internal calls from one another.

Example:       
Under {{< ui-button "Users" >}} > {{< ui-button "Roles" >}} > {{< ui-button "Add" >}} add a new role with the title "Pickup Group".      
Under the {{< ui-button "Role Type" >}} tab, add the type ***pickup.group*** to the role.  
Under the {{< ui-button "Teams" >}} tab, assign the desired team.   
Under the {{< ui-button "Users" >}} tab, assign the desired users.       
Click {{< ui-button "Save" >}} and apply the changes.

*Finally, you can specify in the [Team]({{<ref "/teams/configuration#pickup-notifications">}}) to which the pickup role belongs, that the pickup group should be used as the control option.*

### Penetrate Call Forwards

If user 'A', despite a call forwarding being activated wishes to directly reach internal user 'B' without the call forwarding coming into affect, a role with the role type **redirect.choice** is required. Each user with this role breaks through (penetrates) the call forwarding rule and will be put directly through to the selected extension.

Example:           
Under {{< ui-button "Users" >}} > {{< ui-button "Roles" >}} > {{< ui-button "Add" >}} add a new role with the title "Boss Redirect".               
Under the {{< ui-button "Role types" >}} tab, add the role type ***redirect.choice*** to the role.            
Under the {{< ui-button "Users" >}} tab, add the user "Boss".          
Click {{< ui-button "Save" >}} and apply the changes.       
Now the user "Boss" can always directly reach any user despite any active call forwards.


### TAPI

Should you wish to use the [pascom TAPI]({{<ref "/clients/tapi-installation">}}) under your windows environment, then a separate role is required. 

For this purpose, create a role with the role type **xmpp.supervisor** and in the case of a Terminal Server scenario, assign a user via which telephony should be managed.

Example:           
Under {{< ui-button "Users" >}} > {{< ui-button "Roles" >}} > {{< ui-button "Add" >}} add a new role with the title "TAPI-User".            
Under the {{< ui-button "Role types" >}} tab, add the role type ***xmpp.supervisor*** to the role.  
Under the {{< ui-button "Users" >}} tab, add the user "Superuser".            
Click {{< ui-button "Save" >}} and apply the changes.         


### Flexible Workstations / Locations

Should your employees not have fixed permanent workstations within your company or certain employees regularly change their [work locations]({{<ref "/concept/user">}}) (e.g. branch locations or HomeOffice) it is advisable to not assign the corresponding pascom phone system devices directly to the users but rather to a [Location]({{<ref "/user/user#using-locations">}}).

Per default, each pascom phone system user can log into any location.
Should you wish to prevent this and only allow users to certain locations, a role with the role type **location.group** is required.

This configuration is necessary for each user wishing to flexibly user different locations.

Example:       
Under* {{< ui-button "Users" >}} > {{< ui-button "Roles" >}} > {{< ui-button "Add" >}} add a new role with the title "Location Office Internship".               
Under the {{< ui-button "Role types" >}} tab, add the role type ***location.group*** to the role.            
Under the {{< ui-button "Users" >}} tab, add the user "Office Intern".           
Under the {{< ui-button "Locations" >}} tab, add the available / permitted locations.               
Click {{< ui-button "Save" >}} and apply the changes.         
*Now the user "Office Intern" can only log into the assigned locations.*


### Setting Call Forwards

If a user should have the permission to set call forwards for other users using [Function Codes]({{<ref "/howto/featurecodes">}}), a role with the role type **redirect.group** is required.

Example:       
Under {{< ui-button "Users" >}} > {{< ui-button "Roles" >}} > {{< ui-button "Add" >}} add a new role with the title "Call Forwarding".               
Under the {{< ui-button "Role Types" >}} tab, add the type ***redirect.group*** to the role.
Under the {{< ui-button "Users" >}} tab, add the user "Secretary".         
Click {{< ui-button "Save" >}} and apply the changes.         

*Now the user "Secretary" will have the ability to use the function codes to set up call forwarding for other users. For example, should it be necessary, to set up a forwarding to the central switchboard (ext. 100) for the user with the extension 15 they can use the function code \*7415#100.*

