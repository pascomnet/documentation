---
title: Users and Locations
description: What is an user and what is a location in pascom phone systems and how can you add and manage them quickly and efficiently?
weight: 22
---

{{< doctype "both" >}}

{{< description >}}

## Users

pascom user accounts represent **real people** and not devices. An extension is assigned to the user, not the telephone. Each user has 2 **presence statuses**:

* **Telephone status**: displays the user's telephone status, whether it is available, ringing or in call..
* **Online / client status**: displays a user's online status i.e. whether they are available, away or in DND.  Also indicate in which location a user is logged in and whether they are on a PC or mobile device

If multiple devices are assigned to a user or they are using multiple PCs or smartphones at the same time, their presence states are aggregated.
<!--Image update-->
![Illustration - Concept pascom User](user_overview.en.png?width=90% "pascom User Concept")


## Directly Assigning Telephones to Users

In the simplest scenario, telephones are directly assigned to users. All assigned devices can then be reached by dialing the user's extension. The order in which and for how long assigned user devices should ring is defined using the [FollowMe]({{< relref "#follow-me">}}) settings.
<!--Image update-->
![Illustration - User with devices](user_desktop_personal.en.png?width=50% "User with devices")

This is the recommended option should users not switch workplaces in the office, as only the administrator can change telephone assignments and not the users themselves.

## Using Locations

However, should you have users who regularly switch workplaces (hotdesking) or work from home office, it is best to assign telephones to **locations** instead of users. Phones can not only be assigned to a user, but also to a virtual location. Users can then use the pascom Client, pascom Mobility Client or the menus on their desktop IP phone to select the location they want to work from. As soon as a user has signed in to a location, all telephones assigned to that location will become reachable under the user's extension. The order in which & for how long the devices ring can be configured for the individual work location.

A user can only be logged into to a single location at any given time. In the default setting, every user can sign in to every location. If you do not want your users to sign in to arbitrary locations, you need to create restrictions using **roles**.

In the example below, we created two locations for the Manager, one location in their office, the other in their home office.

<!--Image update-->
![Illustration - User and locations](user_desktop_public.en.png?width=50% "User and locations")

## Combining the "directly assigned" and the "location" concepts

It is possible for a user to use simultaneously use a work location and directly assigned telephone, i.e. a mobile phone / device.

If users switches their location, the directly assigned user device is not affected and continues to be reachable.

<!--Image update-->
![Illustration - User mixed](user_desktop_mixed.en.png?width=50% "User mixed")