---
title: Snom VoIP Phones
keywords: 
    - Snom 715, 720 and 760 Telephones
    - Snom D705, D715, D725 and D765 Telephones
    - Snom 300
description: All Snom models are supported by mobydick and here is how to integrate your Snom VoIP Desktop Phone.
url:  /endpoints/snom-ip-telephones/
prev: /endpoints/
next: /endpoints/generic-ip-endpoints/
weight: 41
toc: true
---


{{% notice warning%}}
Necessary Requirements  
In order to automatically deploy (AutoProvision) telephones from Snom, Yealink, Aastra, Yealink and OpenStage, a functioning DHCP server is required.
{{% /notice %}}

## Configuration

### AutoProvisioning Snom IP Telephones

{{% notice tip%}}
By new installations, you should first test the provisionings process with a telephone. Should this be successful then you will be able to deploy further telephones.
{{% /notice %}}

mobydick currently supports Snom, Yealink, Auerswald, Aastra and OpenStage telephones enabling you to automatically configure these devices centrally. This process is know as `Provisioning`. For each supported endpoint vendor, the mobydick phone system includes a Default Configuration (`Devices > Basic Configuration`). For most deployment scenarios, these standard settings are sufficiently pre parametered. However, in some cases, the settings may need to be modified.

{{% notice tip%}}
When modifiying Default Settings, ensure you make a copy of the original and edit only the copy. 
{{% /notice %}}

Connect the IP phone the your network and, should you not be using Power over Ethernet (PoE), connect the power supply to the phone. The phone will now boot and acquires an IP address and the corresponding Basic Configurations via **DHCP**. After this process is completed, mobydick will **automatically** add the device to the device list as well as adding the appropriate SIP peer:

![Screenshot - mobydick Device List with Snom](../../images/Snom_devicelist.png?width=90% "mobydick Device List with Snom")
As mentioned above, for every device mobydick will also automatically add a SIP peer. In addition, the device username and password will also be automatically generated. The username consists of a randomly generated string followed by the last six digits of the device's MAC address (15 digits in total). As the IP phones are automatically provisioned, you will not be required to enter this data manually and it is not possible to modifiy the user data. This is designed to considerably increase security against SIP Brute Force attacks. 

![Screenshot - Snom Endpoint Configuration](../../images/Snom_endpoint_details.png?width=90% "Snom Endpoint Configuration in mobydick")

The telephone type followed by the MAC address willl be automatically used as the Device Name. On most IP phones, the MAC address is noted on the device housing, allowing phones to be more simply deployed on site in the correct locations. Should you wish you to, you can modify the device name at this point so that the name also reflects a room number or specific user etc.:
![Screenshot - Snom MAC-Address](../../images/Snom_endpoint_label.png?width=90% "Snom MAC-Address in mobydick")

After a successful provisioning, the IP phone display should show to correct language, time as well as the text `Emergency Only` as until now the phone does not have an user assigned and therefore is in `Emergency Mode` allowing you dial emergency numbers. Assignikng a user directly on the phone can be done using the `*88UserExtensionNumber`, e.g. *88123

A few examples:
Snom 3xx Series
	
Snom 7xx Series
	
Snom 8xx Series
		

After the IP phone has been provisioned, mobydick will reset the phone's admin user, which will now have the username: Admin and password: 0000.

The next step here is to continue with adding users and locations.

### Quick Device Commissioning

A quick device commissioning can be done using the system variable ***88**. This option delivers significant time savings
when commissioning (putting into operation) numerous devices. As soon as the IP phone appears in the device list, use the telephone keypad and enter ***88** followed by the extension
number of the phone's new user intended (e.g. `*88123 if the user has the extension 123). In doing so, the phone will
be reserved for the user with the entered extension number, saving you time in entering MAC addresses etc.

Refresh the device list and the info symbol next to the device will change to `lila`. After repeating the above steps for all the
devices to be commissioned, simply select all the devices that are highlighted in lila and click on Action -> Quick Device Commissioning`

Lastly, you can also gain an overview of all IP phones that have been commissioned using the *88 function. Click on `Save. After the devices restart, the intended users (i.e. extensions) will be assigned to the phones.

## Troubleshooting

### Manual IP Phone Registration Checks

Log on to your mobydick using SSH. Open the Asterisk CLI and enter the command sip show peers:

	

    admin@mobydick:~$ su
    Passwort: 
    root@mobydick:/etc/admin# asterisk -r
    Asterisk 1.8.11.1-1digium1~squeeze, Copyright (C) 1999 - 2012 Digium, Inc. and others.
    Created by Mark Spencer <markster@digium.com>
    Asterisk comes with ABSOLUTELY NO WARRANTY; type 'core show warranty' for details.
    This is free software, with components licensed under the GNU General Public
    License version 2 and other licenses; you are welcome to redistribute it under
    
    certain conditions. Type 'core show license' for details.
    =========================================================================
    Connected to Asterisk 1.8.11.1-1digium1~squeeze currently running on mobydick (pid = 3794)
    Verbosity is at least 3
    mobydick*CLI> sip show peers 
    Name/username              Host                Dyn Forcerport ACL Port   Status     
    k6B4Ugpmn453fbf/k6B4Ugpmn  192.168.1.102       D   N             5060    OK (9 ms)  
    kXIOVKh1c260a1b/kXIOVKh1c  192.168.1.101       D   N             1024    OK (23 ms) 
    max_softphone/max_softpho  192.168.1.200       D   N             35958   OK (7 ms)  
    3 sip peers [Monitored: 3 online, 0 offline Unmonitored: 0 online, 0 offline]
    mobydick*CLI> 
    Disconnected from Asterisk server
    root@mobydick:/etc/admin#

If the device was registered properly, the status message **OK** is displayed. The brackets contain the time in milliseconds that the device takes to answer a SIP packet.

You can also use the Asterisk CLI to monitor a phone register with the PBX. In the example below, **max_softphone** is trying to register with the wrong password:

~~~~	
mobydick*CLI> 
[Nov 26 11:21:28] NOTICE[3821]: chan_sip.c:24937 handle_request_register: Registration from '"Max"<sip:max_softphone@192.168.1.1>' failed for '192.168.1.200:23062' - Wrong password
mobydick*CLI>
~~~~
If you are having trouble registering a device and there is no obvious reason, you can use the SIP debug mode. As the IP address use the IP address of the device you would like to investigate: 
~~~~
mobydick*CLI> sip set debug ip 192.168.1.200
~~~~
You can now see the detailed SIP messages when the IP Telephone tries to register with the system. Do not forget to turn off debug mode afterwards:

~~~~
mobydick*CLI> sip set debug off
~~~~