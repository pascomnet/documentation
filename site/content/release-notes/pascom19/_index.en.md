---
title: pascom Server 19 BETA
description: With the new pascom version 19 Release, numerous new and improved functions are now available
weight: 995
---
![Highlights](pascom19_highlights.jpg)

{{% notice tip %}}
Please use our check list in our detailed [Upgrade Guide]({{ ref "/server/upgrade" }}).{{%/notice%}}

{{% notice warning %}}  
**Important Notice to this Update:**     
1. Trunk Failover deleted without substitution. No migration and no direct workaround. Support can help with a outbound script, if needed.   
2. IAX trunks deleted without substitution.   
3. Beronet is not yet supported in pascom 19 "BETA", will follow in next bugfix version.  
4. swap is now disabled by default. This can break virtualized setups with memory lower then 1 GB, please configure more memory in this case.  
5. callgroups are automatically converted to teams. The callgroup feature is removed and customers should configure teams instead.  
6. intercom feature is not working.  
7. Portforwarding for udp 3478 is mandatory, otherwise video will not work.
{{% /notice %}}


## Highlights

### pascom Video Conferencing 

55 % of communication is visual so add the personal, visual element to your face-to-face video meetings. With pascom’s native video conferencing suite, starting a video conference from your desktop, mobile device or in a huddle room is as simple as clicking a button and there’s no need for any additional software and avoids any browser compatibility issues.

![Video Conferences](pascom-19-video-desktop-conference.png)

### Screensharing

A picture says a thousand words and with pascom 19, adding yet more visual aids to your team collaboration and meetings is just a click away. The new screen sharing functionality is available on all devices and platforms to ensure that even remote workers are able to view shared presentations and share their own screens.

![Screensharing](pascom-screen-sharing.png)

### pascom Groups with Audio, Video and Chat

Further enhance team collaboration with team messaging / team chat. Building on our “on the fly” group chat, with pascom 19 it is now possible to add “always-on” team messaging channels. Break down information silos by grouping users into departments, teams or projects and enable them to brainstorm ideas, share files and dynamically start audio / video conferences and desktop sharing sessions.

![pasocm Gruppen](pascom-team-chat.png)

## Release 19.00 (04.11.2019)

**Overview**

- Reworked Contacts / Contactlist
- New Searchfunction and Smartfilters
- Interactive Callobjects during a call
- Video and Screensharing functions
- pascom Groups. Permanent Audio, Video and Chat Groups
- Asterisk Update to Version 16 LTS
- Access to RTP Statistics
- Converted all trunk templates to pjsip syntax