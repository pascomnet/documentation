---
title: mobydick Desktop Client Installation
keywords:
    - Desktop Client
    - Desktop Client Installation
    - mobydick Client User Guide
    - mobydick mobile hub
    - mobydick mobile clients
    - Installation on a desktop using admin rights
description: mobydick Desktop Client installation, deployment and login.
url: /clients/client-installation/
prev: /clients/
next: /clients/client-user-guide/
linkde: /clients/client-installieren/
weight: 31
toc: true
---

## Installation
The installation of the client does not require administrative privileges and thus can be done by the users themselves. Moreover, the client is available to download for every user from your pascom VoIP software server. For more information about [our VoIP Software solutions] (https://www.pascom.net/en/mobydick-voip/ "pascom VoIP phone systems"), please visit our website. 
![Screenshot - installation mobydick Desktop Client](../../images/client_themes.jpg?width=70% "installation mobydick Desktop Client")

Downloading the software from the pascom VoIP phone system server does not require authentication. Just select the **Service tab** on the mobydick **login screen**.
![Screenshot - Service Tab mobydick](../../images/client_download.png?width=70% "Service Tab mobydick")

### Windows
1. Firstly, download the .exe file from your mobydick server
2. Save the file
3. Next, there are various options available depending on your requirements:

#### Standard Installation
* Once the download is finished, double click the file to start the standard installation which can be completed by following the steps below:

![Screenshot - standard installation](../../images/client_install_standard.png?width=100% "standard installation")

#### Desktop Installation Using Admin Rights
* Once the download is finished, right click the .exe file and select run as Administrator.
* After accepting the licensing terms, you will be prompted as to whether the installation is intended to be done on a Terminal Server or not. **Select Standard** and then click **Next** until the installation is finished.

![Screenshot - installation using admin rights](../../images/client_install_admin_standard.png?width=100% "installation using admin rights")

#### Terminal Server Installation Using Admin Rights
It is sufficient to install the mobydick client once on a terminal server (in order to save place etc) as it can nevertheless be used by all users.

* Once the download is finished, right click the .exe file and select run as Administrator.
* After accepting the licensing terms, you will be prompted as to whether the installation is intended to be done on a Terminal Server or not. **Select Terminal Server** and then click **Next** until the installation is finished.

![Screenshot - Terminal Server Installation Using Admin Rights](../../images/client_install_terminal.png?width=100% "Terminal Server Installation Using Admin Rights")

{{% notice note %}}
To update, the client must be redownloaded and once again installed using Admin Updaten muss der Client erneut heruntergeladen und manuell wiederrum mit Adminrechten installiert werden.
{{% /notice %}}

#### Commandline Options

Example:

    MobyDickClient-setup.exe /S /ISUPDATE=1 /D=C:\client

Parameter Explanation

|Parameter|Description|
|---------|---------|
|/S|Enables an installation in to run in the background, without displaying any dialog windows.|
|/ISUPDATE=1|{{% md %}}* Skips all confirmations / accept options and immediately starts the installation
* Displays only the "Copy" window (in combination with /S, the "Copy" window will not be displayed)
* The client will be automatically opened after the installation
* The installation folder can be defined using the /D parameter{{% /md %}}|
|/D=PATH|{{% md %}}* Enables the defining of the installation folder, i.e path
* Not supported when installing on a Terminal Server
* This parameter must always be the last parameter in the command line
* Supports only absolute file paths{{% /md %}}||

### Mac
In order to download the mobydick desktop client and install it in a Mac OSx environment, please follow these steps:

1. Download the .dmg file from your the service tab on your mobydick server login screen. The URL (e.g. http://myphonesystem.firmxyz.com or http://10.1.1.0) is normally provided by your IT admin / department.
2. Save the file
3. Once downloaded, double click on the file and the installation process will start which then results in the following window
4. Drag the mobydick icon (red) on to the Applications folder
5. As soon as the copy process has been completed, you will be able to start the client

### Linux
On Linux systems, we provide a classic installer.

1. Download the tar.bz2 packet from the service tab found on your mobydick server login mask
2. Unzip and run the packet by using the following Shell command:


    tar xfvj mobydickClient-x.xx.xx.tar.bz2  
    ./md_client/bin/md_client


### Configuration

#### mobydick Client Login
After installing mobydick, the Role **All Users** contains the roll type "xmpp.group" as standard. This allows every user to log into the mobydick client using their **Username** and **Password**. Should you wish to restrict this behaviour, then you will need to remove access to the role type All Users and create a new role.

You are also able to create multiple roles, for example should you wish to create groups in which members can use the mobydick client to communicate only with one another.

Should a user be a member of multiple groups, then they will be able to toggle through each contact list within the client as shown below:

More information regarding the mobydick Desktop client can be found on mobydick Desktop Client for End Users.
