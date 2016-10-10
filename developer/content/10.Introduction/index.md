---
url: /introduction/
next: /rest-api/
weight: 101
title: Introduction
keywords:
  - developer handbook
  - developer documentation
  - developer tips and tricks
  - introduction to mobydick integration
  - integrate mobydick
description: In order to be able to better integrate mobydick into the your IT Environments, you can open the mobydick system via a vast range of interfaces.
toc: true
lang: en
icon: <i class="fa fa-info-circle" aria-hidden="true"></i>
---

## Abstract

In order to be able to better integrate our system into the our customers IT Environments, we can open the mobydick system via a vast range of interfaces.

## System Architecture
In order to be able to choose the most appropriate integrations method, you must first have knowledge of complete mobydick architecture:

![Illustration - mobydick System Architecture](../../images/mobydick_system_architecture.png "mobydick system architecture in details")

## Available Interfaces
One can see from the diagram above that there are currently 5 possible interfaces for mobydick. Depending on the application, you should choose the best option for your project. The following table helps you to differentiate between the possibilities:

|Interface|Explanation|Focus|Benefits|Negatives|
|---------|-----------|-----|--------|---------|
|SSH	|Access via putty/ssh/scp/Batchscripts |Automation on Operating System level. Start/Ending of Services low level File operations etc.| | 	Direct access to all Operating system functions and services|
|[AMI](http://www.voip-info.org/wiki/view/Asterisk+manager+API "Asterisk Manager Interface eplained")|	Asterisk Manager Interface	|Direct Control of Asterisk Functions without additional abstraction layers	|Simpler entry, Clear Text Protocol on the TCP socket	|Depending on requirements, steep learning and cost curves.
|HTTP-UI	|Remote control of UI/Browser	|Simple Operations Management.|Very easy to use	|We cannot guarantee compatibility between versions, scripts on this level are fragile. Generally, as a result you should refrain from using this interface.|
|[REST]({{< relref "20.rest api/index.md" >}})	|HTTP access to many high level system aspects|Master Data and Live State read outs. Options for; User login/out, Roaming, Queue Agents Operations, Coupling on system to system level.|Simple entry thanks to interactive documentation	|One-Way Protocol, no event control possible.
|[XMPP]({{< relref "30.xmpp-api/index.md" >}})	|Real time access in the Telephony System	|Complete actions for individual users, react to telephony events. Enables coupling on system to system or user to user levels.	|Highest Abstraction level. All Data and events are based on mobydick objects. Fully Documented.|	Entry is only possible with a suitable Framework in the preferred programming language. Steep learning curve and lengthy and wordy protocols.
