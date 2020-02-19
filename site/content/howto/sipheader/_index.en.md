---
title: Change SIP Header
description: How to adapt the SIP Header from pascom 19.03. onwards? 
---
 
{{< doctype "both" >}} 

{{< description >}}

{{% notice warning %}}
PJSIP only allows SIP headers to be manipulated in so-called predial handlers. So the dialplan apps created earlier will no longer work!
{{% /notice %}}

## Overview

Sometimes it is necessary to adapt SIP Headers. Examples: different ringtones depending on the caller, CLIP no screening settings etc.
Below you will find Examples of the types of SIP headers that can be adapted for some scenarios.

### Via the Trunk Options

The simplest method is to use the **options field** in the Trunk Account Settings. A pascom specific syntax makes it easier to set headers.
Sip Headers set in the options always automatically beat the values set by the trunk ***(e.g. CLIP=auto)***.

**Example:** Clip no screening.

```
header/P-Asserted-Identity=<sip:09916666666@provider.des.kundens>
```
As of pascom 19.03. the **options field** can be used flexibly with variables. A more complex example:

```
header/P-Asserted-Identity=<sip:{{{048pee_username}}}@{{{048pee_domain}}}>
```
<br />
Variables are evaluated very late in the dialplan. So you can also e.g. put the dialed number or values from labels in a header ($(EXTEN)etc.).

### Via a Outbound Script

Of course, as you know it so far, you can use an **outbound script** to manipulate SIP headers

**Example:** Set/overwrite a header
```
Set(HASH(__SIPHEADERS,P-mein-header)=mein-wert)
```
**Example:** Remove a header
```
Set(HASH(__SIPHEADERS,Alert-info)=remove)
```
### For Endpoints

For Endpoints you still have to use a **script** or **actions**. The syntax is identical to the **outbound script**.

**Example:** Set/overwrite a header
```
Set(HASH(__SIPHEADERS,Alert-info)=<http://www.notused.de>\;info=alert-group\;x-line-id=0)
```
**Example:** Remove a header
```
Set(HASH(__SIPHEADERS,Alert-info)=remove)
```
