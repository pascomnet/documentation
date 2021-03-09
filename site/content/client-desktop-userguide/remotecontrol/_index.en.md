---
title: Remote Control of Mobile Devices BETA
weight: 16
description: In this section you will learn how the pascom Desktop Client can control the pascom Mobile App.
---

{{< doctype "both" >}}
 
{{< description >}}

## Control the mobile client with the desktop client

The pascom Client offers the possibility to transfer calls that you start on the Desktop Client to your mobile device. This is done via a so-called **push call**, which is sent to your mobile device.

</br>
![Overview Push Call](overview-remotecontrol.png)
</br>

### Requirements - mobile device for outgoing calls.

For this feature to work, a mobile device must be set as **preferred device** in the **device control** settings. 

You can find more information about the device settings [here]({{< ref "/client-desktop-userguide/mydevices" >}}).

### Start and transfer call

If you now make an outgoing call via the **pascom Desktop Client**, it will be transferred to your mobile phone.

1. **Android:** On mobile devices with Android OS, the **pascom app** is automatically woken/started by the **push call** and the call is transferred.

2. **Apple iOS:** On Apple mobile devices with the iOS operating system, the **Push Call** first initiates a call, which you must accept. After that, the outgoing call to the desired subscriber is continued. 
(*Due to the Apple Callkit, push calls cannot wake up/start the application if it is not in focus*).

### Mobile Device in Dockingstation

![Dockingstation](dockingstation.jpg?width=60%)
</br>

If you use your mobile device in a **docking station**, the call can be seamlessly transferred from the **pascom Desktop Client** to the mobile phone, as the mobile device is in charging mode and the display is usually switched on. This works for both **Android** and **iOS** devices.

</br>