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

# Overview of supported Endpoints

[SNOM IP-Phones](#snom-ip-phones "SNOM IP-Phones")  
[SNOM DECT-Systems](#snom-dect-systems "SNOM DECT-Systems")      
[Yealink IP-Phones](#yealink-ip-phones "Yealink IP-Phones")  
[Yealink DECT-Systems](#yealink-dect-systems "Yealink DECT-Systems")  
[Grandstream IP-Phones](#grandstream-ip-phones "Grandstream IP-Phones")  
[Mitel DECT-Systems](#mitel-dect-systems "Mitel DECT-Systems")     

## SNOM IP-Phones

|Provisioning|Firmware Management|Desktop Client CTI Control|pascom Menu|
|---|---|---|---|
|yes|yes|yes|yes|

**Provisioning**: The IP phone is manageable via the PBX web UI.<br>
**Firmware Management**: Firmware can be managed and updated via the PBX web UI.<br>
**Desktop Client CTI Control**: The desktop UC client can remotely control the phone, i.e. to start calls.<br>
**pascom Menu**: A phone touch key will be assigned to access the pascom Menu.

{{% notice warning %}}
Models from the Snom 3xx series are currently not functional in a pascom cloud solution and can only be deployed in an on-premise solution.
{{% /notice %}}

|Models||
|---|---|
|Snom D120|Snom D715|
|Snom D315|Snom D717|
|Snom D345|Snom D725|
|Snom D375|Snom D735|
|Snom D385|Snom D745|
|Snom D712|Snom D765|
|Snom D785||

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
As there is a vast range of firmware versions available for the different IP telephones, it is not possible for us to test each version. That means that it could be the case that pascom does not support some firmware versions. 
{{% /notice %}}

{{% notice info %}}
Due to the current security standards, Snom 3xx IP telephones will not be supported in the upcoming pascom 19 version.
{{% /notice %}}

## SNOM DECT-Systems

|Modelle||
|---|---|
|Snom M700|Snom M900|

## Yealink IP-Phones

|Provisioning|Firmware Management|Desktop Client CTI Control|pascom Menu|
|---|---|---|---|
|yes|yes|yes|yes|

**Provisioning**: The IP phone is manageable via the PBX web UI.<br>
**Firmware Management**: Firmware can be managed and updated via the PBX web UI.<br>
**Desktop Client CTI Control**: The desktop UC client can remotely control the phone, i.e. to start calls.<br>
**pascom Menu**: A phone touch key will be assigned to access the pascom Menu.

|Models||
|---|---|
|All Models of T4-Series|All Models of T5-Series|

{{% notice note %}}
As there is a vast range of firmware versions available for the different IP telephones, it is not possible for us to test each version. That means that it could be the case that pascom does not support some firmware versions. 
{{% /notice %}}

<!--- |Modell|Firmware|
|---|---|
|T41P|36.81.0.110|
|T46G|28.81.0.110, 28.73.0.50|
|T46S|66.81.0.20, 66.81.0.110| --->

## Yealink DECT-Systems

|Modelle||
|---|---|
|Yealink W52P|Yealink W60P|

## Grandstream IP-Phones

|Provisioning|Firmware Management|Desktop Client CTI Control|pascom Menu|
|---|---|---|---|
|yes|yes|yes|no|

**Provisioning**: The IP phone is manageable via the PBX web UI.<br>
**Firmware Management**: Firmware can be managed and updated via the PBX web UI.<br>
**Desktop Client CTI Control**: The desktop UC client can remotely control the phone, i.e. to start calls.<br>
**pascom Menu**: A phone touch key will be assigned to access the pascom Menu.

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
As there is a vast range of firmware versions available for the different IP telephones, it is not possible for us to test each version. That means that it could be the case that pascom does not support some firmware versions. 
{{% /notice %}}

<!--- |Modell|Empfohlene Firmware|
|---|---|
|GXP 1630|1.0.4.55|
|GXP 2130|1.0.7.25|
|GXP 2135|1.0.7.97|
|GXP 2160|1.0.7.97|
|GXV 3240|1.0.3.158| --->

## Mitel DECT-Systems

|Models||
|---|---|
|Mitel RFP 44 indoor|Mitel RFP 45 indoor|
|Mitel RFP 47 indoor|Mitel RFP 47 DRC outdoor|