---
title: FollowMe
keywords:
description:
prev: /clients/client-user-guide/
url: /clients/followme/
next: /clients/teams-in-client/
Linkde: /clients/followme/
weight: 33
toc: true
draft: false
---


## Concept

Users and workspaces (locations) can be assigned with multiple Endpoints. The configuration setup regarding which endpoint rings, when and for how long is know as **FollowMe**.

![FollowMe](/followme_en.png)


## Configuration

A prerequisite for the configuration is that [users](../..//users/users-and-locations/) have already been added and that a minimum of one endpoint has been assigned. 

Within the Web UI, click on `User` > `Userlist` > select user > and go to the `Devices` tab. In the right hand column, you will see an overview of the directly assigned devices with the corresponding FollowMe settings. Next, click on the FollowMe setting: 

![FollowMe](/followme_webui_settings.png?width=50%)

|Setting|Description|
|---|---|
|User Configurable|**Yes/No**: Admins can define whether a user is able to change FollowMe settings on each assigned device.|
|Enabled|**Yes/No**: Whether the endpoint should ring or not for inbound calls.|
|Delay|Time in seconds before the device should start ringing for inbound calls.|
|Timeout|Time in seconds that the device should ring for.|

FollowMe settings can be configured for

* **Internal**: for internal calls, i.e. from phone system users,
* **External**: Inbound calls via a Trunk, i.e. originating outside the phone system
* **Queue**: Inbound queue calls to users logged in as a queue agent.

### FollowMe UC Client Set up

If a user is permitted to manage their FollowMe settings, this can be done via their pascom Desktop UC client (`Settings` > `FollowMe`).

![FollowMe](/followme_settings_client.png?width=100%)

Users can configure individual FollowMe settings for interna and external calls as well as calls originating via a queue / team. To do so, the user must simply toggle between the `External`, `Internal` and `Teams` tabs.

|Settings|Description|
|---|---|
|**Client controls**|Should a user be assigned with multiple devices, with this drop down menu, it is possible to set up which endpoint (device) the desktop client can control.|
|**My Devices**|List of all devices assigned to the user. Telephones which the user is not permitted to configure FollowMe settings are greyed out.<br>The user can activate / deactivate devices and define whether a phone should ring or not as well as defining a device specific **Delay** and **Timeout**.|

A graphical overview of the user defined FollowMe settings is available in the column on the left showing device specific delays and timeouts.

<!--FIXME wenn Client fertig übersetzt ist Felder nochmal prüfen -->




<!-- ### Followme über den Mobility Client steuern -->
<!--FIXME mobility client!!!  -->
