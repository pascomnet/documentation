---
title: Support & Release Notes
description: Our Release Notes provide an excellent overview of all our asterisk based VoIP phone system release versions.
type: "pages"
icon: "fa fa-file-alt"
weight: 14
---

{{< description >}}

## Supported Server Versions

![Supported Versions](pascom_version_support.png "Supported Versions")

### What is meant by "Supported Version"?

The term supported version relates to the most recent bugfix release of a pascom phone system server version. pascom guarantees the following services for supported versions only:

- Updates, bug fixes, and security fixes
- pascom PREMIUM Support
- Compatibility of the pascom desktop and mobile clients
- Compatibility of the server licence

### Can I still use unsupported versions?

pascom does **not prevent** the use of unsupported versions **in any way**. However, through using an unsupported version the following consequences could occur:

**1) Updates, bug fixes, and security fixes**

Unsupported versions will not receive any updates, bug fixes or security fixes. In many cases, the pascom server must be connected to the internet to communicate with the pascom clients, using an unsupported version would be particularly negligent. 

**2) pascom PREMIUM Support**

Accessing our fee-based PREMIUM support services will not be possible. You will first need to update to a supported version.

**3) pascom desktop and mobile client compatibility**

Both the pascom desktop and mobile clients are centrally updated. As pascom only tests client compatibility with supported versions, it could be the case that after an update, the clients are no longer able to connect to the pascom server or some functions may not work correctly. You can disable the auto-update function for the desktop client using the **-noUpdate** command-line parameter, but this does not apply to mobile clients distributed by third-party vendors such as Apple or Google.

In addition, each user will permanently be shown a message stating that the client is connected to a non-supported server.

**4) Compatibility of the server licence**

With **pascom 17 servers or older**, the licence update is not performed automatically. Therefore, it could be the case that pascom is unable to make changes to the licence for an unsupported pascom phone system. For example, changing the number of users (= making an additional purchase) is no longer possible without updating the phone system version. 

All **pascom 18 servers and newer** automatically update the licence according to the paired subscription on a daily basis. In exceptional cases, an unsupported server version may become incompatible with this licence. As a result, after 30 days the pascom server will only be able to accept incoming calls or licence values (e.g. number of users) no longer being reflected correctly. Naturally, we try to avoid such occurrences but can only guarantee compatibility for supported server versions.

### Will I be warned before my version's support expires?

Yes, approximately three months before the End of Support (EoS) date for the particular server version you are using, all pascom clients will display a brief message after a successful login.

### What is "Extended Support"?

Due to the technological changes made between pascom 17 to 18 and the resulting potential extra workload / costs to our customers and partners, pascom have extended the support for this phone system version by an additional year and continues to guarantee the following: 

- pascom PREMIUM Support
- pascom desktop and mobile clients compatibility

## Release Notes

### pascom Client

|Version|Release Type|Published|
|-------|------------|---------------:|
|[Release 59.R726]({{< ref "/release-notes/pascomClient">}})| Bugfix Release | 26.11.2019 |
|[Release 58.R676]({{< ref "/release-notes/pascomClient#release-58.R676-07-11-2019">}})| Bugfix Release | 07.11.2019 |
|[Release 57.R661]({{< ref "/release-notes/pascomClient#release-57.R661-30-10-2019">}})| Bugfix Release | 30.10.2019 |
|[Release 56.R657]({{< ref "/release-notes/pascomClient#release-56-r659-29-10-2019">}})| Feature Release | 29.10.2019 |
|[Release 54.R534]({{< ref "/release-notes/pascomClient#release-54-r534-12-09-2019">}})| Bugfix Release | 12.09.2019 |
|[Release 53.R453]({{< ref "/release-notes/pascomClient#release-53-r453-03-07-2019">}})| Bugfix Release | 03.07.2019 |
|[Release 52.R428]({{< ref "/release-notes/pascomClient#release-52-r428-18-06-2019">}})| Bugfix Release | 18.06.2019 |
|[Release 51.R365]({{< ref "/release-notes/pascomClient#release-51-r365-27-05-2019">}})| Bugfix Release | 27.05.2019 |
|[Release 50.R318]({{< ref "/release-notes/pascomClient#release-50-r318-24-04-2019">}})| Bugfix Release | 24.04.2019 |
|[Release 49.R265]({{< ref "/release-notes/pascomClient#release-49-r265-21-03-2019">}})| Bugfix Release | 21.03.2019 |
|[Release 48.R196]({{< ref "/release-notes/pascomClient#release-48-r196-08-03-2019">}})| Bugfix Release | 08.03.2019 |
|[Release 47.R161]({{< ref "/release-notes/pascomClient#release-47-r161-11-02-2019">}})| Bugfix Release - Desktop only | 11.02.2019 |
|[Release 46.R152]({{< ref "/release-notes/pascomClient#release-46-r152-06-02-2019">}})| Bugfix Release | 06.02.2019 |
|[Release 45.R93]({{< ref "/release-notes/pascomClient#release-45-r93-17-12-2018">}})| Bugfix Release | 17.12.2018 |
|[Release 44.R66]({{< ref "/release-notes/pascomClient#release-44-r66-27-11-2018">}})| Bugfix Release | 27.11.2018 |
|[Release 42.R34]({{< ref "/release-notes/pascomClient#release-42-r34-17-10-2018">}})| Feature Release | 17.10.2018 |

### pascom Server 19

|Version|Release Type|Published|
|-------|------------|---------------:|
|[Release 19.02]({{< ref "/release-notes/pascom19" >}})| Bugfix Release | 22.11.2019|
|[Release 19.01]({{< ref "/release-notes/pascom19#release-19-01-21-11-2019" >}})| Bugfix Release | 21.11.2019|
|[Release 19.00]({{< ref "/release-notes/pascom19#release-19-00-04-11-2019" >}})| Feature Release | 04.11.2019|

### pascom Server 18

|Version|Release Type|Published|
|-------|------------|---------------:|
|[Release 18.11]({{< ref "/release-notes/pascom18" >}})| Bugfix Release | 17.10.2019 |
|[Release 18.10]({{< ref "/release-notes/pascom18#release-18-10-05-08-2019" >}})| Bugfix Release | 05.08.2019 |
|[Release 18.09]({{< ref "/release-notes/pascom18#release-18-09-28-06-2019" >}})| Bugfix Release | 28.06.2019 |
|[Release 18.08]({{< ref "/release-notes/pascom18#release-18-08-13-06-2019" >}})| Bugfix Release | 13.06.2019 |
|[Release 18.07]({{< ref "/release-notes/pascom18#release-18-07-10-04-2019" >}})| Bugfix Release | 10.04.2019 |
|[Release 18.06]({{< ref "/release-notes/pascom18#release-18-06-07-03-2019" >}})| Bugfix Release | 07.03.2019 |
|[Release 18.05]({{< ref "/release-notes/pascom18#release-18-05-26-02-2019" >}})| Bugfix Release | 26.02.2019 |
|[Release 18.04]({{< ref "/release-notes/pascom18#release-18-04-16-01-2019" >}})| Bugfix Release | 16.01.2019 |
|[Release 18.03]({{< ref "/release-notes/pascom18#release-18-03-17-12-2018" >}})| Bugfix Release | 17.12.2018 |
|[Release 18.02]({{< ref "/release-notes/pascom18#release-18-02-07-11-2018" >}})| Bugfix Release | 07.11.2018 |
|[Release 18.01]({{< ref "/release-notes/pascom18#release-18-01-09-10-2018" >}})| Bugfix Release | 09.10.2018 |
|[Release 18.00]({{< ref "/release-notes/pascom18#release-18-00-20-09-2018" >}})| Feature Release | 20.09.2018 |


## pascom Server 17

|Version|Release Type|Published|
|-------|------------|---------------:|
|[Release 17.12]({{< ref "/release-notes/pascom17" >}})| Bugfix Release | 22.11.2018 |
|[Release 17.11]({{< ref "/release-notes/pascom17#release-17-11-25-09-2018" >}})| Bugfix Release | 25.09.2018 |
|[Release 17.10]({{< ref "/release-notes/pascom17#release-17-10-19-06-2018" >}})| Bugfix Release | 19.06.2018 |
|[Release 17.09]({{< ref "/release-notes/pascom17#release-17-09-24-05-2018" >}})| Bugfix Release | 24.05.2018 |
|[Release 17.08]({{< ref "/release-notes/pascom17#release-17-08-23-04-2018" >}})| Bugfix Release | 23.04.2018 |
|[Release 17.07]({{< ref "/release-notes/pascom17#release-17-07-05-04-2018" >}})| Bugfix Release | 05.04.2018 |
|[Release 17.06]({{< ref "/release-notes/pascom17#release-17-06-03-04-2018" >}})| Bugfix Release | 03.04.2018 |
|[Release 17.05]({{< ref "/release-notes/pascom17#release-17-05-12-03-2018" >}})| Bugfix Release | 12.03.2018 |
|[Release 17.04]({{< ref "/release-notes/pascom17#release-17-04-26-02-2018" >}})| Bugfix Release | 26.02.2018 |
|[Release 17.03]({{< ref "/release-notes/pascom17#release-17-03-12-02-2018" >}})| Bugfix Release | 12.02.2018 |
|[Release 17.02]({{< ref "/release-notes/pascom17#release-17-02-22-01-2018" >}})| Bugfix Release | 22.01.2018 |
|[Release 17.01]({{< ref "/release-notes/pascom17#release-17-01-08-01-2018" >}})| Bugfix Release | 08.01.2018 |
|[Release 17.00]({{< ref "/release-notes/pascom17#release-17-00-14-12-2017" >}})| Feature Release | 14.12.2017 |


## pascom TAPI client

|Version|Release Type|Published|
|-------|------------|---------------:|
|[Release 4.R56]({{< ref "/release-notes/pascomTapi">}})| Bugfix Release | 08.03.2019 |
|[Release 3.R42]({{< ref "/release-notes/pascomTapi#release-3-r42-09-10-2018">}})| Feature Release | 09.10.2018 |
