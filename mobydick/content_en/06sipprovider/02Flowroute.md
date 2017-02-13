---
title: Flowroute Setup
url: /sip-provider/flowroute/
next: /sip-provider/Gradwell/
weight: 8
keywords:
description:
toc: true
lang: en
---

## Configuring Flowroute SIP Services with mobydick

Should you require voice over IP services in North America (USA & Canada), you can benefit from using mobydick's Flowroute SIP provider template. Alternatively, if you are a Flowroute customer looking to switch to the mobydick phone system - this template will ensure interoperability between Flowroute and your phone system. 

### Finding Your Flowroute Credentials

In order proceed you will require your Flowroute account credentials, the previously purchased desired DID number as well as knowing which internal extension calls should be mapped to. 
Therefore, if you do not know your Flowroute Credentials, please login to your Flowroute account via https://manage.flowroute.com/accounts/login/ and navigate to the Interconnection menu for your account username and password. For your DID and Network Prefix information, please use the DIDs menu:

![Screenshot - Flowroute SIP Provider Credentials](../../images/Flowroute_Configs.png?width=90% "Flowroute Credentials")

### Using the Flowroute Template

In order to add Flowroute SIP services to your mobydick, navigate "Add Trunk" menu via Gateways > Trunks > Add and use the filter to search for Flowroute as shown below: 

![Screenshot - Add Flowroute Trunk via SIP Provider Template](../../images/Add_Flowroute_Trunk.png?width=90% "Flowroute SIP Provider Database Template")

Press select and the following configurations mask will open which will enable you to enter your variable data and authentication credentials you found in the steps above.

![Screenshot - Flowroute Trunk Variable](../../images/Flowroute_Trunk_Variables.png?width=90% "Add Flowroute Trunk Specific Variables")


|Title|	Description|
|---|---|
|Name|Enter a suitable name for your to be added provider trunk - i.e. Flowroute or USA Trunk|
|Prefix for incoming number|This is the in-prefix, the number / star (*) code required to select the trunk when dialling externally|
|Network Prefix*|The network prefix is the equivalent of area code|
|DID*|Direct Inward Dial as purchased from Flowroute. **You will be required to enter the full number including country prefix (the leading 1) and network prefix**|
|Target Extension| Internal phone number where incoming calls should be routed to|
|Username*|	Flowroute account username - see Finding Flowroute Credentials|
|Password*|	Flowroute account password - see Finding Flowroute Credentials|

Once the template shown above has been completed with the correct information, simply press `Save` button which will then store your variable data and automatically configure your trunk along with a set of inbound and outbound rules based on the information provided. Upon saving your template, you will now be able to view and modify your trunk to match any specific requirements, otherwise you can leave the trunk template it is. It can always be modified at a later date should it be required.

The next step is to apply your new telephony configurations. Once applied, your mobydick Flowroute trunk will be registered with the provider and will be ready for making and receiving calls:

![Screenshot - PBX Apply Telephone Configurations](../../images/apply_telephony_configs.png?width=90% "Apply Telephony Configuration for Flowroute Trunk")

### Editing Flowroute Trunks

In order to edit your Flowroute trunk, navigate to the trunk editor via ***Gateways > Trunks*** and select your Flowroute account from the Trunks list and click `Edit Button
 as shown below: 
 
![Screenshot - Edit Flowroute Trunk Setup](../../images/flowroute_trunk_edit.png?width=90% "Edit Flowroute Trunk")

This will open the trunk editor in which you will be able to modify not only your basic account information (basic data & account information) but also your inbound and outbound call rules via the various menu tabs:

![Screenshot - Edit Flowroute Trunk Inbound Setup](../../images/Flowroute_inbound_edit.png?width=90% "Edit Flowroute Inbound Trunk")

### Modifying Flowroute Call Rules

Should the standard template call rules which are automatically generated upon the first template save not match your requirements, it is of course possible the modify them. To do so, simply follow the process above and select the Inbound or Outbound Calls menu tabs depending on which you wish to edit. 

#### Flowroute Inbound Call Rules
Per default, a standard inbound call rule is generated that routes all incoming calls to the extension number specified in the initial setup.

![Screenshot – Flowroute Inbound Call Rules Edit](../../images/Flowroute_inbound_edit.png?width=90% "Edit Flowroute Inbound Call Rules")

|Field Name|	Description|
|---|---|
|Title	|Name of the specific Inbound Call Rule|
|Source|	The * (star) symbol means any number|
|Destination|	The actual dialled number, in this case your flowroute DID|
|Extension|	The extension on which the call should be routed. For example, the extension number for an IVR, Queue or Agent.|
|CIDname|	Related to caller ID information|
|CIDnumber|	Relates to caller ID information|
|Language|	Sets the channel language. For example, it is possible add a new rule and adapt the source to detect incoming calls from Quebec City which can then have the channel language set to French using **best match call routing**|

However, it is possible to modify this call rule to better suit your needs for example updating the extension mapping you can do so in the above screen by double clicking the extension field and adding a new value. If for example, you would like to route the call onto an IVR menu, the IVR menu must first be configured and assigned an extension number which can be added in the Flowroute Inbound Call Rules Extension field. 

By pressing the `Add` button button, a dropdown list of additional options will appear which can be used for **best match call routing** and configuring switchboards etc. In our example, we use pattern matching to change the channel language to French for callers from Quebec City: 

![Screenshot – Flowroute Inbound Call Rules Advanced](../../images/flowroute_inbound_profile.png?width=90% "Advanced Flowroute Inbound Call Rules")

Once you have made the required changes, click `Save` and then `Apply` your new telephony settings. Once the apply process is finished your new / modified call rules will be up and running.

#### Flowroute Outbound Call Rules
In order to edit the standard Flowroute outbound call rules, simply select the Outbound Calls in the trunk editing mask and the following screen will appear: 

![Screenshot – Flowroute Outbound Call Rules](../../images/Flowroute_outbound_edit.png?width=90% "Add Flowroute Outbound Call Rules")

|Field Name|	Description|
|---|---|
|Title|	Name of the specific Outbound Call Rule - As standard it uses the DID number, but can be modified should you need to.|
|Show in Client|	As default set to "No". By selecting "Yes", mobydick desktop client users will be able to select this call rule from a dropdown list in the client when making outbound calls. Useful scenarios include using multiple numbers or Private Numbers etc|
|In-Prefix|	The prefix dialed to select this call rule e.g "0" or "9". Could also be "*1" for example|
|Source|	The * (star) symbol means any number. In this case the source is your internal user extensions|
|Destination|	The actual dialled number, in this case the number your agents are dialling|
|CIDnumber|	The number to transmitted when making outbound calls. To withhold the number, leave it blank.|
|Out-Prefix|	The prefix required to dial another system that requires a dial prefix, i.e. in the migration phase of moving to mobydick from another phone system|
|Out-Suffix|	Suffix to be attached to the end of the CIDnumber i.e. extension number|
|Deny|	As default set to "No". Set to "Yes" when you would like top deactive a particular call rule.|
|PIN|	Set a PIN for using this particular call rule - useful when adding rules to restricting calls to premium or international numbers|
|Transmission Capacity|	Supported communications media, e.g. Voice, Video etc|

By pressing the `Add`  button, a dropdown list of additional options will appear which can be used for number blocking, outbound international call barring / PIN authentication etc.

![Screenshot – Flowroute Outbound Call Rules Setup](../../images/flowroute_add_outbound_rule.png?width=90% "Add Flowroute Outbound Call Rules")

In our example, we added a new outbound rule which requires users to enter a PIN number to dial international numbers, which will appear as shown below:

![Screenshot – Flowroute Outbound International Call Rules Setup](../../images/flowroute_add_international_outbound_rule.png?width=90% "Add Flowroute International Call Rules")

As now CIDnumber has been added, international calls will be made as private numbers. The PIN number is automatically generated and can be changed by double clicking on the value within the column. 

Once you have made the required changes, click `Save` and then `Apply` your new telephony settings. Once the apply process is finished your new / modified call rules will be up and running.

### Modifying Flowroute Account Settings
Should you need to modify your Flowroute account settings for any reason, e.g. allowing SIP Reinvites or updating the authentication credentials this can be done via the ***Gateways > Trunks*** menu and selecting your Flowroute account from the Trunks list and clicking `Edit. By clicking on the **Account** menu tab which will display your Flowroute SIP account configuration options.

![Screenshot - Edit Flowroute Account](../../images/flowroute_account_edit.png?width=90% "Edit Flowroute Account Settings")

#### Changing Your Flowroute Password
If for whatever reason, you need to change your Flowroute account password, this must be done using "Reset Password" button under **Interconnection** in the Flowroute Web UI (see top of this back). Once the password has been reset, you will now need to update your account settings in mobydick. To do this go to the ***Gateways > Trunks*** menu and select your Flowroute account from the Trunks list and click `Edit` as described above.
Under the `Password` column, double click on the value (shown above as *****) and enter the new password. 
 
![Screenshot - Update Flowroute Password](../../images/flowroute_password_update.png?width=90% "Change Flowroute Account Password")
Once you have updated the password, click `Save` and then `Apply` your new telephony settings. Once the apply process is finished your account info will have been updated.
