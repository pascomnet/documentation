---
title: Other SIP Endpoints
description: How to integrate SIP devices from non-officially supported manufactures into your pascom phone system
weight: 100
---

{{< doctype "both"  >}}

{{< description >}}

{{% notice warning %}}
Please note, the pascom support team is not able to provide support services for integrating non-supported endpoints. Please use our [forum](https://www.pascom.net/forum) should you require assistance with such an integration. 
{{% /notice %}}

## Restrictions

Non supported phones can not be automatically configured nor be configured with the pascom menu on the endpoint.

Remote CTI control via the pascom client is only possible in a restricted form.

## Endpoint Requirements

In order for a SIP device to operate with the pascom server, the following functions are necessary:

* **SIP via TCP/TLS** (encrypted signaling)
* **SRTP** (encrypted voice data)
* **Outbound Proxy** (send data via the Session Border Controller)

## Configuration

### Add Endpoint

Log into the phone system web UI and under `Devices > Device list`, click “Add” and select a new device type: IP telephone: any manufacturer or softphone
   
Next, setup and take a not of the **Device Login** and **Password** for the device or use the automatically generated credentials. 

### Add / Assign Users

Under `Users > User list`, either add a new user or assign an existing user to the phone.
 
### Apply Jobs

After saving your changes, an entry will appear in the job box (top centre of the window). Start the job by clicking apply or the `green tick`.


### On the SIP Device

{{% notice tip %}}
Unfortunately, many vendors use different names for effectively the same settings. This means you may need to experiment a bit. The following table shows the common terms used.
{{% /notice %}}

You will need to configure the following settings on the SIP endpoint:

|Setting|Example value|Description|
|---|---|---|
|Registrar, SIP-Server|**pascom**|Name of the phone system|
|Proxy, Outbound-Proxy|**pascom.cloud**|DNS name or Server IP address|
|SIP-Port| **TCP 5061** | TLS SIP Port|
|Username, Identity, Authuser|**my-telephone-name**|Device login name|
|Password|*****| Device password, not the user's password!|

#### SIP TLS and SRTP

Read the SIP endpoint handbook regarding how to activate SIP TLS and SRTP. This could involve multiple setting configs. 


## Test Call

On the SIP endpoint, please dial **\*100**. This should call the pascom Voicemail box and you should here the mailbox prompts.
