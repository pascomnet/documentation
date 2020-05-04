---
title: Remove Dialplan Loops
description: How to identify, avoid and fix Dialplan Loops
weight: 122
---

{{< doctype "both"  >}}

{{< description >}}

## Overview

A dialplan loop exits when during a call, an extension is traversed 30 times. This happens e.g. through call diversions and drops that are set incorrectly and thus end in a loop.

{{% tabs %}}
{{% tab "Onsite - all Versions" %}}

## Warning Notification

In the job box, a warning notification will appear as below:

    CRITICAL: A dialplan loop was detected, see /tmp/.dialplan-loop-detected

Under */tmp/.dialplan-loop-detected* a file will have been written that contains details on which extension the Dialplan Loop was caused.

## Recommended Steps

In order to avoid Dialplan loops occuring more often, you will find further information in the file regarding the affected extensions and you can then edit your call flow accordingly.

The notification will only disappear once the file *.dialplan-loop-detected* has been removed (either deleted or moved). To do this log into the pascom phone system via SSH. 
Change to the / tmp folder and delete the file: *.dialplan-loop-detected*.
{{% /tab %}}

{{% tab "Cloud - pascom 19" %}}
## Warning Notification

In the job box, a warning notification will appear as below:

    CRITICAL: A dialplan loop was detected

## Remove Warning Notification

The pascom cloud system automatically clears this warning message the next time you save changes via **"Apply telephony configuration"**.

## Avoid Dialplan Loop

If this warning message occurs, check your call diversions and drops within your call flow. At some point, a loop will form here. Modify your call flow so that loops are avoided.

{{% /tab %}}
{{% /tabs %}}


