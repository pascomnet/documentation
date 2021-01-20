---
title: Business Hours, Public Holiday and Calendars
description: How to setup time schedules, calendars and extension switches for managing business hours, public and company holidays.
weight: 20
---

{{< doctype "both" >}}
 
{{< description >}}

## Concept

As mentioned in the previous section on the concept of actions, your call flow can be managed in various ways depending on whether they are inbound calls for individual users or for teams. When there is an inbound call for the central office or one of [your Contact Center](https://www.pascom.net/en/business-phone-system/call-contact-center// "pascom Call Center solutions") extensions, it makes sense to check whether the call is received during your business hours or whether the call is coming in during a public or company holiday.

To manage call flows with respect to time scheduling, certain conditions should be implemented. Conditions can be applied for each defined action, allowing for flexible decisions over whether a particular action is carried out or not. There is no global system governing the availability of telephone lines, but an arbitrary number of calendars, time frames and triggers can be used with the various objects within the telephony system.

This allows you to assign a different set of business hours for your central office and the support hotline. You could also forward such calls to a mobile phone during certain hours in case of emergency.

### Maintaining Rule Sequences
If, for example, you want to check business hours, holidays and the vacation calendar for the central office, make sure to maintain the correct order when checking. You must first check the vacation calendar, then check for holidays, then check the business hours otherwise, the following can occur:

A call comes in to the central office during business hours. The IVR system is activated and plays the following message:

*"Welcome at ChaosConsulting. Your call will be transferred to the next available agent."*

If the order is incorrect, it is possible that the system will now perform the calendar checks and discover that today is actually a holiday and will therefore respond to the caller with the following message:

*"Due to the holiday, our company is closed today. Thank you for your call"*

and end the call.

This will most definitely not make a good impression on the customer - so make sure your time and calendar checks are set in the correct order.

## Configuration
### Managing your Time Checks

To use your **timeframes** as the basis of a rule set, select **"time period"** when creating an action condition.

In the pascom web interface, select {{< ui-button "ACD" >}} > {{< ui-button "Action conditions" >}} and click {{< ui-button "Add" >}} to create a new condition. You can also select an existing condition and use the {{< ui-button "Edit" >}} function.

When you create the new condition, select {{< ui-button "time period" >}} as type and enter a **title**.

![Screenshot - manage time schema](time-schema.en.png?width=90%)

The tab **Times** allows you to define your business hours. You can add any number of variations to build complex schedules. You can then use these settings with your actions as the basis for the conditions.

{{% notice tip %}}
It is not necessary to create a time schema for outside of business hours; you can simply negate the conditions used in actions. When selecting a condition, you can always choose between "name of condition" and "NOT name of condition", e.g. "Business hours" and "NOT Business hours".
{{% /notice %}}

### Managing your Calendar

**Calendar** conditions are ideal for managing **public and company holiday** calendars.

Select {{< ui-button "ACD" >}} > {{< ui-button "Action conditions" >}} in the pascom web interface and click the {{< ui-button "Add" >}} button to create a new condition. You can also select an existing condition and click the {{< ui-button "Edit" >}} button.

When adding the condition, select {{< ui-button "calendar" >}} as the type and enter a **title**.

Using the {{< ui-button "Days" >}} tab you can select public holidays, vacations etc. You can then use this calendar with your actions.

{{% notice info %}}
Unfortunately, it is not possible to transfer calendar days from one year to the next. You will need to newly define the days each year.
{{% /notice %}}

### Using Extension Switches

**Extension switches** are a useful tool if there is **no specific day or timeframe** to use with a condition.

Select {{< ui-button "ACD" >}} > {{< ui-button "Action conditions" >}} in the pascom web interface and click the {{< ui-button "Add" >}} button to create a new condition. You can also select an existing condition and click the {{< ui-button "Edit" >}} button.

When adding the condition, select extension switch as the type and enter a **title**.

Enter an extension number that should be used. The switch will be activated when a call is made to this extension. Another call will deactivate the switch again. The extension switch can be used as a condition for actions. Finally, decide which status the extension switch should have after creation. Switched on or off.

Extension switches can be used if, for example, you want to play a voice prompt such as "All staff members are currently in a meeting" as soon as there is an inbound call to the central office. Another scenario could be that you do not have regular business hours. When the last employee leaves the office, the message could be switched to indicate that the incoming call has been received "outside of business hours".

{{% notice tip %}}
You can configure your IP telephone so that it indicates an active extension switch with the LED of the key for the specified extension number. A deactivation of the switch will trigger the LED to go out.
{{% /notice %}}

#### Using the extension switch in the pascom client

If you want to provide the extension switch directly to your team as an interactive element in the contact list, you have to set roles for the extension switch.

1. more information on [roles]({{< ref "/user/role" >}}).

2. use extension switch in the pascom [client]({{< ref "/client-desktop-userguide/extension-switch" >}}).