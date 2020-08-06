---
title: Easybell
description: Overview of the pascom managed Provider Template from Easybell
weight: 10
---


{{< description >}}

![Easybell Provider Logo](easybell_logo.png?width=50%)

## Overview

Information about features and tariff informations can be found here: [easybell](https://en.easybell.de/).


## Supported usage variants
Do you use the pascom telephone system in the cloud or on-site at your company? Learn more about the respective supported providers in our overview of trunk templates. 

[Overview Trunk Templates]({{< ref "trunk-templates">}})

## Setup

To set up a SIP Trunk via a pascom Provider Template, you need the SIP Account data from your provider. 

### Account Data

You will receive the account data for your SIP trunk account from your provider by mail or can be viewed online in a customer portal.

**Example**

![Easybell Account Data](easybell_sipdata.PNG?width=80%)

</br>

### Create Trunk with Provider Templates

With your account data you can create a new Trunk on the pascom telephone system. You can find detailed instructions for setting up trunks with provider templates in our trunk section. 

[To the Trunk Turtorial]({{< ref "trunks/templates">}})

## Easybell Clip no Screening

### Problem

You have successfully set up your Easybell SIP Account with the official Trunk Template in the pascom System. But the number
signaling of your Phonenumber does not yet work according to your requirements. In most cases, you still have to activate or 
configure the feature to use it with the pascom telephone system. 

### Solution

The Clip no screening feature includes a few settings that you have to make directly with Easybell. 

First, log in to the Easybell Control Center with your account data. 

1. Go to the **Change Number Display** menue.
2. Set the caller ID to **Device-dependent Caller ID**.
3. Set the **manual field selection** to **P-Asserted-Identity**
4. Finally, click on **apply**.  
<br />
![Easybell Settings](easybell_clipnoscreening.png)
