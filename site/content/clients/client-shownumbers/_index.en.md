---
title: Show call participants in contact list 
description: Have the phone numbers of your team's contacts displayed directly in the client contact list
weight: 65
---

{{< doctype "both" >}} 
 
{{< description >}}

## Concept

If it makes sense for your team to check with which participant a colleague or co-worker is talking right now, you can add an additional system variable to show in your [pascom Desktop Client]({{< relref "/clients/desktop-userguide">}}) and [pascom Mobile Client]({{< relref "/clients/mobile-userguide">}}).
So it is for each user of the pascom client directly noticable in the contact list.

{{% notice info %}}

The appearance of the caller / participant in the contact list of the pascom client applies globally to each user of the desktop and mobile client, regardless of assigned roles and user rights.
{{% /notice %}}


## Set Systemvariables

In the WebUI of your pascom PBX, select {{< ui-button "Appliance">}} > {{< ui-button "System settings">}} and {{< ui-button "Add">}}.
Create a variable with the parameter **sys.xmpp.properties.roster.shownumbers** and set the value of the newly created variable to **true**.           
If the variable has already been created, you can find the variable in the tree structure on the left under {{< ui-button "sys">}} > {{< ui-button "xmpp">}} > {{< ui-button "properties">}} > {{< ui-button "roster">}} and there you can adjust the value of the parameter **shownumbers**.             
Then save the changes.

To apply the customization, it is necessary to reboot the XMPP server using {{< ui-button "apply">}} > {{< ui-button "Restart XMPP Server">}}.

{{% notice warning %}}
When you apply the XMPP Server service, all desktop clients invariably restart. Active calls via softphone are interrupted.
{{% /notice %}}

 
## Example

The following example shows the effect of this system setting.
            
![without defined system variable or value set to "false"](shownumbers-false.en.png?width=550px)
*Systemvariable* ***sys.xmpp.properties.roster.shownumbers*** *not set, or value* '***false***'           


![defined system variable with value set to "true"](shownumbers-true.de.png?width=550px)
*Systemvariable* ***sys.xmpp.properties.roster.shownumbers*** *set with value* '***true***'
