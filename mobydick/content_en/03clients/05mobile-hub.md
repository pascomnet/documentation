---
title: Mobile Hub Setup
keywords:
    - Mobile Hub for Mobility Clients setup
    - Mobile Hub Configuration
    - Add mobile devices for Mobile Hub 
    - Handy in mobydick integrieren
description: The mobile hub allows you to seamlessly integrate mobile devices in mobydick. 
url: /clients/mobile-hub-setup/
linkde: /clients/mobile-hub-einrichten/
prev: /clients/tapi-interface/
next: /clients/create-flexpanels/
weight: 35
toc: true
---


## Overview

If a number is dialled in the Mobility Client either manually or from the phone book, the software is able to make the call using the mobydick Server. This way, the call recipient will see the users business phone number instead of their mobile phone number. The Mobile Hub option can also be useful to minimise phone bills, for example, if a call needs to be made to an international number.

//FixMe
![Illustration - Mobile Hub Konzept](../../images/mobile_hub_konzept.png?width=70% "Mobile Hub Konzept in der mobydick")


## Configuration

### Setting up the Mobile Hub for the Mobility Client
To configure the mobydick Mobile Hub, select **Appliance > Services > Mobile Hub**:
![Screenshot - set up Mobile Hub](../../images/client_mobile_hub.png?width=90% "set up Mobile Hub for Mobility Client")

In the **Number** field, enter the telephone number where mobydick **Mobile Hub** can be reached. Enter the number together with an extension. In our example, the extension number is **99**. The smartphone will then use this number to call the Mobile Hub. Make sure you use the **international numbering plan** so the mobile hub can also be accessible from abroad.

To automatically create the corresponding **rule**, enter the **destination** number. Please be aware that the required format here can vary depending on the provider. For more details, please see //FixMe Configuring Trunks and Call Rules.

### Adding mobile devices for Mobile Hub
After the Mobile Hub has been configured, the smartphones which are to utilise it need to be added and assigned to the corresponding users.

![Screenshot - add mobile devices for Mobile Hub](../../images/client_mobile_hub_add.png?width=70% "add mobile devices for Mobile Hub")
In the mobydick web interface, select Devices > Device list and press the "Add" //FixMe  button.

From the list, select ***Via Mobile hub: Integrated mobile phone***:

Enter a **name** and the corresponding mobile phone number using the **national format (0172123123)**. Only this destination number is authorized to use Mobile Hub, which is why providing the correct format is very important.
![Screenshot - add mobile device for Mobile Hub](../../images/client_mobile_hub_add_detail.png?width=90% "add mobile device for Mobile Hub")

In the menu ***Users > User list***, select the corresponding user and assign the mobile phone entry you just created. If you prefer that the mobile phone does not ring when there are incoming calls, set all values to 0 for the assigned mobile phone.

![Screenshot - set up FollowMe](../../images/client_mobile_hub_followme.png?width=90% "FollowMe Settings for mobile devices")


### Allowing mobydick Client usage over the Internet

mobydick Desktop Client and mobydick Mobility Client both use the **TCP port 5222** to communicate with mobydick Server. If you want to use your mobile devices with this service over the Internet, have TCP port 5222 forwarded to mobydick Server. You might also need to adjust you firewall rules if you are running mobydick Server in you DMZ.

The default setting for port 5222 is to **only accept SSL connections**.

