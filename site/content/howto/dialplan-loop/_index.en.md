---
title: Remove Dialplan Loops
description: How to identify, avoid and fix Dialplan Loops
weight: 121
---

{{< doctype "both"  >}}

{{< description >}}

## Overview

A dialplan loop exits when during a call, an extension is traversed 30 times.

<!--FIXME wann kann das passieren
abwurf von einer team a nach team b
rufumleitung im kreis -> testen -->

## Warning Notification

In the job box, a warning notification will appear as below:

    CRITICAL: A dialplan loop was detected, see /tmp/.dialplan-loop-detected

Under */tmp/.dialplan-loop-detected* a file will have been written that contains details on which extension the Dialplan Loop was caused.

## Recommended Steps

In order to avoid Dialplan loops occuring more often, you will find further information in the file regarding the affected extensions and you can then edit your call flow accordingly.

<!--FIXME beispiel-->

The notification will only disappear once the file *.dialplan-loop-detected* has been removed (either deleted or moved). To do this log into the pascom phone system via SSH.
