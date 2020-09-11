---
title: Web Client Configuration
description: In this tutorial we explain how to configure the dial-in number of the Web Client.
weight: 60
---

{{< doctype "both" >}}

{{< description >}}


## pascom Training Video

{{< youtube QxdSqWK9dt8 >}} 



## Setup Dial In Number

In order for your participants to be able to attend a conference using the dial-in number, you must configure an **external group number** in the admin web UI. To do this, go to ({{< ui-button "Appliance" >}} > {{< ui-button "Services" >}} > {{< ui-button "Telephony" >}}).

![Setup Dial-in Number](set_number.en.PNG?width=60%)

As with classic conference rooms, reserve an available telephone number from your SIP trunk number block / DIDs (Direct Inward Dials) and configure it as the external group number. All groups will now use the same dial-in number for external dial-in.

{{% notice tip %}}
Wondering how one dial-in number should work for all groups? The pascom system generates a unique PIN for each group. This way, the telephone system knows which group / conference an external participant wants to access.
{{% /notice %}}

If the **external group number** has not been configured, the feature enabling conference participation via dial-in will be missing.

![No dial-in number](no_number.en.PNG?width=80%)



