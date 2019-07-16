---
title: Subscription Downgrades
description: In order to downgrade a subscription, the following steps are necessary
weight: 70
---

{{< doctype "both" >}}

{{< description >}}

## General Information

It is possible to downgrade your subscription at anytime.

As pascom annual subscriptions are invoiced yearly as advanced payments and pascom does not issue a credit note for the remaining term, it is recommended to perform the downgrade **at the end of the subscription year**.

pascom has waived the minimum cancellation period. Therefore, it is possible to perform a downgrade even on a day **shortly before the end of the current annual subscription period**.

## Cloud Subscription Downgrades

{{< num 1 "Create Backup" >}}

Log into your phone system and create a backup under {{< ui-button "Appliance" >}} > {{< ui-button "Database backup" >}}.

After a successfully performed dbackup, a download link will appear in the database backup screen.

**Now download the backup to your computer**.

{{< notice warning >}}
**Under no circumstances should you proceed WITHOUT A BACKUP**. Your data will be permanently deleted after cancelling the subscription!
{{< /notice >}}

{{< num 2 "Cancel Current Subscription" >}}

Log in to https://my.pascom.net and open the corresponding subscription under {{< ui-button "Subscriptions" >}} and click the {{< ui-button "Details" >}} button.

**Take note of your instance name! (Name after the number in square brackets)**

Within the details area, click {{< ui-button "Cancel" >}}.

Select the option Sie die Option {{< ui-button "Cancel Now" >}}. Only by following this process can you immediately re-use the name of your instance for a new subscription.

{{< num 3 "Create New Subscription" >}}

Within https://my.pascom.net, now create a new cloud description of your choice and enter the previously noted instance name.

{{< num 4 "Restore Backup" >}}

Follow the **Setup Assistant** until you see the **Perform Setup Using a Backup** option. Select Yes and restore the backup you created in step 1. 

{{< num 5 "(Optional) Restart Endpoints" >}}

After a few minutes, your endpoints (e.g. desktop VoIP phones) will automatically register on your instance. In order to **speed up** this process, you can also restart all endpoints by **disconnecting and reconnecting them to their power supply**.

## On-premise Subscription Downgrades

{{< num 1 "Cancel Current Subscription" >}}

Log in to https://my.pascom.net and open the corresponding subscription under {{< ui-button "Subscriptions" >}} and click the {{< ui-button "Details" >}} button.

**Take note of your instance name! (Name after the number in square brackets)**

Within the details area, click {{< ui-button "Cancel" >}}.

Select the option Sie die Option {{< ui-button "Cancel Now" >}}.

{{< num 2 "Create New Subscription" >}}

Within https://my.pascom.net, now create a new Onsite description of your choice and enter the previously noted instance name.

{{< num 3 "Pair System with New Subscription" >}}

Log in to your pascom server Management UI (e.g. https://192.168.0.1:8443) and pair the new subscription with the server under {{< ui-button "System" >}} > {{< ui-button "Subscription Details" >}}.
