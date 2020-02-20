---
title: Generic SIP Endpoints
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

## Create a new Basic Configuration Template

The next step is to build a new basic configuration for the SIP device. To do this, go to the pascom WEB GUI on {{<ui-button "Devices">}}> {{<ui-button "Basic configuration">}}

{{% notice tip %}}
With pascom version 19.03 there is a new basic configuration **Empty Generic Profile**
{{% /notice %}}

Duplicate the basic configuration **Empty Generic Profile** and give it a name e.g. My Siemens Devices. Select the new basic configuration and click on
{{<ui-button "Edit">}}> {{<ui-button "Configuration">}}.

**Of course you can also adapt the existing code part:**
```
{{!-- This is a example template --}}

{{!-- Please clone and overwrite this Profile --}}

{{!-- use regular expression to match a request uri to a template snipped --}}
{{!-- a empty template output (i.e. no if_regex matched) will return a 404 response--}}


{{!-- this "if" block catches request directly to the provisioning url (/) --}}
{{#if_regex "/provisioning/ee[0-9a-f]+/?$" http_path}}
You requested the example generic template.

Please try two other routes:

- append /example.cfg for a example provisioning file
- append /info to the url to see a list of all variables.

{{/if_regex}}

{{!-- requests ending with .cfg (e.g. /y02384.cfg) will be handled here --}}
{{#if_regex "\.cfg$" http_path}}

sip username = {{{013pee_username}}}
sip password = {{{013pee_password}}}
sip host = {{{httpip}}}:5061;transport=tls
sip domain = {{{cs_domain}}}

{{/if_regex}}

{{!-- here, each request ending with /info will be answered --}}
{{#if_regex "/info$" http_path}}

Variables:
----------
{{#each this}}
{{@key}} => {{this}}
{{/each}}

url parameters:
----------
{{#each http_params}}
{{@key}} => {{this}}
{{/each}}

{{/if_regex}}

```
Save the basic configuration.

## Apply Jobs

After saving your changes, an entry will appear in the job box (top centre of the window). Start the job by clicking apply or the `green tick`.

## Create/Add the SIP Device

Insert under {{<ui-button "Devices">}}> {{<ui-button "Device list">}}
 a new device of type **IP-Telefon: Hersteller beliebig oder Softphone**. Now select the **new basic configuration** you created earlier (My Siemens Devices).

Under the tab {{<ui-button "Assign">}} you give the SIP device an user. Finally save!

## Provisioning on the SIP Device

Check the IP Device in the device list and go to {{<ui-button "Action">}}> {{<ui-button "Provisioning URL">}} where you can
copy the **provisioning URL** to the clipboard.

Each SIP device has its own web interface. How to get there, please refer to the instructions of the respective manufacturer.
The **Provisioning URL** usually has to be set in the **Servicing** settings of the device at the server URL. After applying the changes and
a **restart / reboot** of the device, the settings are automatically transferred to the device via the provisioning URL.

{{% notice tip %}}
Unfortunately, many vendors use different names for effectively the same settings. This means you may need to experiment a bit. The following table shows the common terms used.
{{% /notice %}}


|Setting|Example value|Description|
|---|---|---|
|Registrar, SIP-Server|**pascom**|Name of the phone system|
|Proxy, Outbound-Proxy|**pascom.cloud**|DNS name or Server IP address|
|SIP-Port| **TCP 5061** | TLS SIP Port|
|Username, Identity, Authuser|**my-telephone-name**|Device login name|
|Password|*****| Device password, not the user's password!|

### SIP TLS and SRTP

Read the SIP endpoint handbook regarding how to activate SIP TLS and SRTP. This could involve multiple setting configs. 

## Test Call

On the SIP endpoint, please dial **\*100**. This should call the pascom Voicemail box and you should here the mailbox prompts.
