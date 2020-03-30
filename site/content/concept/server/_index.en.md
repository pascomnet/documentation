---
title: pascom Server Structure
description: Overview of the pascom system server structure
weight: 10
---
 
 
{{< description >}}
 
## System Structure

![pascom Server Access](server-access.png)

### Interface

The interface is the pascom server network interface. Should multiple physical or virtual ethernet interfaces be found on the server, they will be created accordingly.

### Management

The pascom Server Management is connected directly to the interface via **Port 8443**. Should you have several interfaces, you can choose on which interface the server management should be available. Management tasks include: 

* Interface Management
* Creating the pascom phone system
* Updating the entire system 
* Backup/Restore operations
* Monitoring and analysis of the entire system

### Session Border Controller

Access to the pascom phone system can only be made via the Session Border Controller (SBC). The SBC secures the system and per default only allows enrypted connections. The following phone system services are available on the interface via the Session Border Controller: 

#### Activated (Standard)
| Port | Description |
| ---- | ------------ |
| TCP **443** | phone system web UI|
| TCP **636** | LDAPS for phone hook access via LDAP |
| UDP **3478** | Access for Video-Functionality |
| TCP **5061** | SIP TLS - secure SIP communication |
| TCP **5222** | pascom Desktop and Mobile client access |
| TCP **8884**  | Provisioning of IP desktop phones |
| UDP **30000 - 35000** | SRTP - encrypted Voice data |
| UDP + TCP **19302** | WebRTC | Access for Web Client |

#### Deactivated (Standard)
| Port | Description |
| ---- | ------------ |
| TCP **5060** | SIP - SIP communication |
| TCP **8885**  | VPN Tunnel direct to the phone system |

### SSH

The SSH server is available via **Port 22** directly on the interface. Just like with the pascom web UI, it is possible to log in via SSH using the admin login credentials and manage the pascom IP PBX. Access via SSH is only recommended for users with Linux experience. 

### Phone System

The phone system itself. For security reasonse, the pascom phone systems can only be accessed via the Session Border Controller. It is also possible to operate several pascom phone systems simultaneously on the pascom server. However, this functionality is reserved for our pascom Cloud Service Provider (CSP) partners.

In order to ensure that access to the phone system does not always have to be obtained via the pascom Management UI, it is also possible to access the phone system web UI using the following URL structure: 

```
https://pascom-server/my-company
```

