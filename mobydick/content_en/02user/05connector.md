---
title: Connector
keywords:
    - pascom Connector
    - Address book connector
    - phonebook synchronisation
    - CSV phonebooks
    - CSV import
    - Univention Corporate Server
    - Active Directory
    - User Import
    - User Authentication
description:
url: /users/connector/
prev: /users/phonebooks/
weight: 25
toc: true
---
## Concept

The pascom connector synchronises external data sources with the pascom phone system. pascom phone systems can import and automatically sync numerous objects such as phonebooks, users, speed dials etc. These objects can be imported from CSV text files, LDAP sources or another pascom PBX server.

{{% notice info %}}
We recommend using the connector to regularly import and automatically synchronise data. If you only need to perform an **One-Off** data import, this is more simply achieved via the *Data import per xlsx file*.
{{% /notice %}}

## Configuration

To use the connector, navigate to `Advanced` > `Connector`. Add a new Connector Profile by clicking on the `Add` button.

This will provide an overview of all available Connector Templates:

* **USC User Sync**
* **AD User Sync**
* **LDAP User Sync**
* **CSV User Sync**
* **AD Phonebook Sync**
* **CSV Phonebook Sync**
* **LDAP Phonebook Sync**
* **AD Speeddial Sync**
* **CSV Speeddial Sync**
* **LDAP Speeddial Sync**
* **mobydick Phonebook**

In the following below, the main Connector Profiles are explained in more detail. To get started, please use a suitable Connector Template.

### CSV

|Variables|Description|
|---|---|
|**Name**|Profile name|
|**Path to CSV File**|The file to be imported. This refers to the mobydick file system and NOT to your local file system.|
|**CSV File Encoding**|File format of the CSV file. We recommend using UTF8.|
|**Delimiter**|The separating symbol with which the fields are separated.|
|**Line Separator**|Depending on the OS (Windows or Mac/Linux) under which the CSV file was created, the line endings will differ.|
|**Field Enclosure**|We recommend single fields enclosed by characters e.g. "Max Muster"|

Load CSV Sources from a Share:

|Variables|Description|
|---|---|
|**Path to CSV File**|The file to be imported. This refers to the share.<br>*Example*: If the share is located on \\192.168.100.10\mobydick in the subfolder **test** with the file **address.csv** enter test\address.csv.|
|**Use CIFS/SMB share**|Select **Yes** in order to load a CSV source file from within a share|
|**CIFS/SMB Share**|UNC path to the Share in the formate **\\<servername** oder **ip>\<share>**<br>*example*: \\192.168.100.10\mobydick|
|**CIFS/SMB Username**|User assigned with read permissions for accessing the share.|
|**CIFS/SMB Password**|Corresponding password.|

After saving, the import mode can be set. Setting the mode defines how the connector handles existing data as follows:

* Create and update records.
* Create and update records. Remove missing data from previous imports

Under the `Variables` tab, the fields which can be imported are listed, such as this example CSV file import: 

    "displayname","phone","givenname","surname","organisation","email","mobile","homephone","fax"
    "Max Muster - pascom [30000]","+4999112345","Max","Muster","pascom","","","","+4999112399"

<!--  
###  AD

|Variable|Description|
|---|---|
|**Name**|Profile name|
|**AD Domain**|The Active Directory Domain Name|
|**AD Server**|The Active Directory Server Address|
|**Username**|-|
|**Password**|-|
|**Configure Authentication**|see [Authentication](../connector#authentication)|

After saving, you will directed a settings overview.

|Variable|Description|
|---|---|
|**Mode**|The mode defines how the connector handles existing data.|
|**URI**|The LDAP URI under which the LDAP server is reachable. Normally **ldap://SERVER:389**, for SSL connections please use **ldaps://SERVER:636**|
|**Basis DN**|Defines LDAP Tree search start point, i.e. the point from which searches should begin|
|****||
|****||

-->
<!--  
###  UCS
-->


## Authentication Against External Systems

pascom phone systems make it possible to authenticate users against external LDAP server. Users enter their username and password within the pascom client login screens. Within the user database, the phone system will now check whether the user exists and then forwarf the request to the LDAP-Server which will then authenticate whether the entered password is the correct password for this user. If so, then the client can be connected.

### User Data

Importing user data and the user authentication process can be combined with one another but it is not necessary to configure both simultaneously. For example, you can manually add a user and then later set the authentication to an external system. However, the external authentication process will fail if the user does not exist within the phone system user Database - meaning users must be added to the phone system first. Obviously, this makes the configuration more straight forward when the authentication and automatic user import are combined together.

### Configuration

**Authentication Setup**

The LDAP authentication can be configured under `Appliance` > `Services` > `Authentication`.

|Setting|Description|
|---|---|
|**LDAP Host**|Enter the LDAP URL<br>e.g. ldap://192.168.100.10 or ldaps://192.168.100.10 for LDAPs connections|
|**LDAP Bind User**|As the Bind-User enter the user's *Distinguished Name* (DN). Replace the username with a % character and the phone system will replace the % character with the username who is trying to authenticate on the system.|

Authentication protocols can be decided on a per user basis, in that a mix operation is possible whereby some users are authenticated against the LDAP and others against the internal pascom Authentication tools.

{{% notice info %}}
For **UCS** and **Active Directory** setups, you can use the corresponding connector templates. These can be configured to set up the authentication protocoll automatically. 
{{% /notice %}}

**Authentication Tests**

Via the `Test Authentication` button you are able to test whether your authentication configuration has been set up correctly.

**Authentication per User Setup**

Navigate to `User` > `User list` > `Edit` and under the `Basic Data` tab set the `Authentication` field to the desired Authentication protocoll.
