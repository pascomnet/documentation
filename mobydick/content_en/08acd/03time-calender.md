---
title: Business Opening Hours
url: /call-distribution/business-hours/
prev: /call-distribution/ivr-menus/
next: /call-distribution/prompts-and-music-on-hold/
weight: 73
toc: true
---

## Concept

As mentioned in the chapter on the concept of actions, the call flow can be managed in various ways depending on whether they are inbound calls for individual users or for teams. When there is an inbound call for the central office or one of the extensions, it makes sense to check whether the call is received during business hours or whether it is a public holiday or whether the business is currently closed.

To manage call flows with respect to time scheduling, certain conditions should be implemented. Conditions can be applied for each defined action, allowing for flexible decisions over whether a particular action is carried out or not. There is no global system governing the availability of telephone lines, but an arbitrary number of calendars, time frames and triggers can be used with the various objects within the telephony system.

This allows you to assign a different set of business hours for your central office and the support hotline. You could also forward such calls to a mobile phone during certain hours in case of emergency.

### Maintaining Rule Sequences
If, for example, you want to check business hours, holidays and the vacation calendar for the central office, make sure to maintain the correct order when checking. You must first check the vacation calendar, then check for holidays, then check the business hours otherwise, the following can occur:

A call comes in to the central office during business hours. The IVR system is activated and plays the following message: 

*"Welcome at ChaosConsulting. Your call will be transferred to the next available agent."* 

If the order is incorrect, it is possible that the system will nnow perform the calendar checks and discover that today is actually a holiday and will therefore respond to the caller with the following message: 

*"Due to the holiday, our company is closed today. Thank you for your call"* 
 
and end the call.
 
This will most definitely not make a good impression on the customer - so make sure your time and calendar checks are set in the correct order.

## Configuration
### Managing your Time Checks

To use your **timeframes** as the basis of a rule set, select **"time period"** when creating an action condition.

In the mobydick web interface, select **Advanced > Action conditions** and click `Add` to create a new condition. You can also select an existing condition and use the `Edit` function.

When you ceate the new condition, select ***time period*** as type and enter a **title**. 
![Screenshot - manage timeframes](../../images/condition_time.png?width=90% "manage timeframes")

The tab **Times** allows you to define your business hours. You can add any number of variations to build complex schedules. You can then use these settings with your actions as the basis for the conditions.

{{% notice tip %}}
It is not necessary to create a timeframe to handle times outside of business hours; you can simply negate the conditions used in actions. When selecting a condition, you can always choose between "name of condition" and "NOT name of condition", e.g. "Business hours" and "NOT Business hours".
{{% /notice %}}

### Managing your Calendar

Conditions of the type **calendar** can be used to manage **Public Holiday Calendars** as well as employee or Business Holidays.

Select **Advanced > Action conditions** in the mobydick web interface and click the `Add` button to create a new condition. You can also select an existing condition and click the `Edit` button.

When adding the condition, select ***calendar*** as the type and enter a **title**.
![Screenshot - manage calendar](../../images/condition_calendar.png?width=90% "manage calendar")

Using the Days tab you can select public holidays, vacations etc. You can then use this calendar with your actions.

### Using Extension Switches

**Extension switches** are a useful tool if there is **no specific day or timeframe** to use with a condition.

Select **Advanced > Action conditions** in the mobydick web interface and click the `Add` button to create a new condition. You can also select an existing condition and click the `Edit` button.

When adding the condition, select extension switch as the type and enter a **title**.
![Screenshot - manage extension switches](../../images/condition_switch.png?width=90% "manage extension switches")

Enter an extension number that should be used. The switch will be activated when a call is made to this extension. Another call will deactivate the switch again. The extension switch can be used as a condition for actions.

Extension switches can be used if, for example, you want to play a voice prompt such as "All staff members are currently in a meeting" as soon as there is an inbound call to the central office. Another scenario could be that you do not have regular business hours. When the last employee leaves the office, the message could be switched to indicate that the incoming call has been received "outside of business hours".

{{% notice tip %}}
You can configure your IP telephone so that it indicates an active extension switch with the LED of the key for the specified extension number. A deactivation of the switch will trigger the LED to go out.
{{% /notice %}}


