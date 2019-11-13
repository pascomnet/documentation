---
title: Show call participants in contact list 
description: Have the phone numbers of your team's contacts displayed directly in the client contact list
weight: 65
---

{{< doctype "both" >}} 
 
{{< description >}}

## Concept

Should it makes sense for your team to be able check with whom a colleague or co-worker is currently talking to, you can add an additional system variable to show this information within the [pascom Desktop Client]({{< relref "/clients/desktop-userguide">}}) and [pascom Mobile Client]({{< relref "/clients/mobile-userguide">}}).
Doing so will enable each pascom client user to see the number and telephone book entry name (if stored) of the contact within the contact list. 

{{% notice info %}}
The display of the caller information with the pascom client contact list applies globally for every desktop and mobile client user and is not dependant on any assigned roles and user permissions.
{{% /notice %}}


## Set System Variables

In your pascom PBX WebUI, select {{< ui-button "Appliance">}} > {{< ui-button "System settings">}} and {{< ui-button "Add">}}.
Create a variable with the parameter **sys.xmpp.properties.roster.shownumbers** and set the value of the newly created variable to **true**.           
If the variable has already been created, you can find the variable in the tree structure on the left under {{< ui-button "sys">}} > {{< ui-button "xmpp">}} > {{< ui-button "properties">}} > {{< ui-button "roster">}} and there you can adjust the value of the parameter **shownumbers**.             
Now save your changes.

To apply the customisation, it is necessary to reboot the XMPP server using {{< ui-button "apply">}} > {{< ui-button "Restart XMPP Server">}}.

{{% notice warning %}}
Upon restarting the XMPP Server service, all desktop clients will restart. Active pascom softphone calls will be terminated.
{{% /notice %}}

 
## Example

The following example shows the effect of this system setting.
            
![without defined system variable or value set to "false"](shownumbers-false.en.png?width=550px)
*Systemvariable* ***sys.xmpp.properties.roster.shownumbers*** *not set, or value* '***false***'           


![defined system variable with value set to "true"](shownumbers-true.de.png?width=550px)
*Systemvariable* ***sys.xmpp.properties.roster.shownumbers*** *set with value* '***true***'
