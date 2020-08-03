---
title: Endpoints
description: pascom is compatible and interoperable with a number of Desktop VoIP phones. This guide explains how you can automatically and securely on-board i.e. integrate any supported device with your pascom phone system.
icon: "fa fa-phone"
type : "pages"
weight : 6
---

{{% notice tip %}}
Use the end devices supported by pascom to use all the integrated provisioning and CTI tools!
{{% /notice %}}

## Supported Endpoints Overview

[Grandstream IP Phones](#grandstream-ip-phones "Grandstream IP-Phones")
[Mitel DECT Systems](#mitel-dect-systems "Mitel DECT-Systems")    
[Gigaset DECT Systems](#gigaset-pro-ip-dect-systems "Gigaset DECT-Systems")  
[Snom IP Phones](#snom-ip-phones "SNOM IP Phones")  
[Snom DECT Systems](#snom-dect-systems "SNOM DECT-Systems")  
[Snom Conferencing Systems](#snom-conference-phones "SNOM Conferencing Systems")      
[Yealink IP Phones](#yealink-ip-phones "Yealink IP-Phones")  
[Yealink DECT Systems](#yealink-dect-systems "Yealink DECT-Systems")    
   
## Snom IP Phones
[![Snom Setup](snom-series.png?width=70%)]({{<ref "/endpoints/snom" >}})

{{% notice warning %}}
Snom 3xx and 7xx series IP phones are currently not compatible with the pascom cloud and can only be deployed in an on-premise pascom phone system solution.
You can use the attractive SNOM Exchange program to switch to the newer SNOM series. [Further info](https://www.pascom.net/en/blog/snom-exchange-new-for-old/)
{{% /notice %}}

|Provisioning|Firmware Management|Desktop Client CTI Control|pascom Menu|
|---|---|---|---|
|yes|yes|yes|yes|

**Provisioning**: The IP phone is managed via the pascom PBX web UI.<br>
**Firmware Management**: Firmware can be managed and updated via the  pascom PBX web UI.<br>
**Desktop Client CTI Control**: The desktop UC client can remotely control the phone, i.e. to start calls.<br>
**pascom Menu**: A button on the phone will be assigned to access the pascom menu.


Nutzen Sie
das attraktive SNOM Exchange Programm um auf die neuere SNOM Serie zu wechseln. [Weitere Infos](https://www.pascom.net/de/blog/snom-exchange-programm-neu-gegen-alt/)

|Models||
|---|---|
|Snom D120|Snom D715|
|Snom D315|Snom D717|
|Snom D345|Snom D725|
|Snom D375|Snom D735|
|Snom D385|Snom D745|
|Snom D712|Snom D765|
|Snom D785|Snom D305|
|Snom D335||

<!--- |Modell|getestete Firmware-Version|
|---|---|
|Snom D120|10.1.33.33|
|Snom D315| 8.9.|
|Snom D345|8.9.3.40|
|Snom D375|8.9.3.60|
|Snom D385|10.1.33.33|
|Snom D715|8.9.3.80|
|Snom D725|8.9.3|
|Snom D735|10.1.33.33|
|Snom D745|8.9.3.80|
|Snom D765|8.9.3|

alt:
|Snom D785|10.1.20.0|
|Snom 710|8.7.3.25.5|
|Snom 720|8.7.3.25.5|
|Snom 760|8.7.3.25.5|
|Snom 821|?| --->

{{% notice note %}}
Due to vast range of firmware versions available for the different IP telephones, it is not possible for us to test each version. Therefore, it could be the case that pascom does not support some firmware versions. 
{{% /notice %}}


**[Setup Snom Endpoints, Click here!]({{<ref "/endpoints/snom" >}})**

## Snom DECT Systems

[![Snom DECT Setup](snom_m700_dect.png?width=50%)]({{<ref "/endpoints/snom-dect" >}})

|Models||
|---|---|
|Snom M700|Snom M900|

 **[Setup Snom DECT, click here!]({{<ref "/endpoints/snom-dect" >}})**


## Snom Conference Phones

[![Snom Conference Setup](snom_c520.jpg?width=50%)]({{<ref "/endpoints/snom-conference" >}})

|Models||
|---|---|
|Snom C520||

 **[Setup Snom Conference System, Click here!]({{<ref "/endpoints/snom-conference" >}})**

## Yealink IP Phones

[![Yealink Setup](yealink-t4-series1.jpg?width=50%)]({{<ref "/endpoints/yealink" >}})

|Provisioning|Firmware Management|Desktop Client CTI Control|pascom Menu|
|---|---|---|---|
|yes|yes|yes|yes|

**Provisioning**: The IP phone is managed via the pascom PBX web UI.<br>
**Firmware Management**: Firmware can be managed and updated via the pascom PBX web UI.<br>
**Desktop Client CTI Control**: The desktop UC client can remotely control the phone, i.e. to start calls.<br>
**pascom Menu**: A button on the phone will be assigned to access the pascom menu.

|Models||
|---|---|
|All T4 Series Phones |All T5 Series Phones|

{{% notice note %}}
Due to vast range of firmware versions available for the different IP telephones, it is not possible for us to test each version. Therefore, it could be the case that pascom does not support some firmware versions. 
{{% /notice %}}

 **[Setup Yealink Endpoints, Click here!]({{<ref "/endpoints/yealink" >}})**

<!--- |Modell|Firmware|
|---|---|
|T41P|36.81.0.110|
|T46G|28.81.0.110, 28.73.0.50|
|T46S|66.81.0.20, 66.81.0.110| --->

## Yealink DECT Systems

[![Yealink DECT Setup](yealink_w52p_dect.png?width=30%)]({{<ref "/endpoints/yealink-dect" >}})

|Models||
|---|---|
|Yealink W52P|Yealink W60P|

**[Setup Yealink DECT, Click here!]({{<ref "/endpoints/yealink-dect" >}})**

## Grandstream IP Phones

[![Grandstream Setup](grandstream_GXP2160.jpg?width=50%)]({{<ref "/endpoints/grandstream" >}})

|Provisioning|Firmware Management|Desktop Client CTI Control|pascom Menu|
|---|---|---|---|
|yes|yes|yes|no|

**Provisioning**: The IP phone is managed via the pascom PBX web UI.<br>
**Firmware Management**: Firmware can be managed and updated via the pascom PBX web UI.<br>
**Desktop Client CTI Control**: The desktop UC client can remotely control the phone, i.e. to start calls.<br>
**pascom Menu**: A button on the phone will be assigned to access the pascom menu.

|Models||
|---|---|
|Grandstream GXP 1610|Grandstream GXP 1630|
|Grandstream GXP 1615|Grandstream GXP 2130|
|Grandstream GXP 1620|Grandstream GXP 2135|
|Grandstream GXP 1625|Grandstream GXP 2160|
|Grandstream GXP 1628|Grandstream GXP 2170|
|Grandstream GXP 1760||
|Grandstream GXV 3240|Grandstream GXV 3275|
|Grandstream GRP 2612|Grandstream GRP 2613|
|Grandstream GRP 2614|Grandstream GRP 2615|
|Grandstream GRP 2616||

{{% notice note %}}
Due to vast range of firmware versions available for the different IP telephones, it is not possible for us to test each version. Therefore, it could be the case that pascom does not support some firmware versions. 
{{% /notice %}}

**[Setup Grandstream Endpoints, Click here!]({{<ref "/endpoints/grandstream" >}})**

<!--- |Modell|Empfohlene Firmware|
|---|---|
|GXP 1630|1.0.4.55|
|GXP 2130|1.0.7.25|
|GXP 2135|1.0.7.97|
|GXP 2160|1.0.7.97|
|GXV 3240|1.0.3.158| --->

## Mitel DECT Systems

[![Mitel DECT Setup](Aastra-Mitel-DECT-System.png?width=40%)]({{<ref "/endpoints/mitel-dect" >}})

|Models||
|---|---|
|Mitel RFP 44 indoor|Mitel RFP 45 indoor|
|Mitel RFP 47 indoor|Mitel RFP 47 DRC outdoor|

**[Setup Mitel DECT, Click here!]({{<ref "/endpoints/mitel-dect" >}})**

## Gigaset Pro IP DECT Systems

[![Gigaset DECT Setup](gigaset_n870.jpg)]({{<ref "/endpoints/gigaset-dect" >}})

|Models||
|---|---|
|Gigaset N870|

**[Setup Gigaset Pro IP DECT, click here!]({{<ref "/endpoints/gigaset-dect" >}})**