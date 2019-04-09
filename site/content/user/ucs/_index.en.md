---
title: Univention (UCS) Integration
description: Synchronisieren und Authentifizieren Sie Ihre Benutzer gegen den Univention Server
weight: 80
toc: true
---

{{< doctype "both"  >}}

{{< description >}}


![Univention Server](ucs.png?width=10%)

## Concept

The Univention Corporate Server (UCS) is a Debian based server with an integrated management system designed for the central and cross platform management of servers, services, desktops and users. Further information can be found [here](https://www.univention.com/).

By using the pascom UCS Connector, it is possible to import and sync users. In addition, the connector enables the authentication of pascom phone system users to be performed by your UCS solution.

## Configuration

### Preparation

#### Install the pascom App on your UCS


Before users can be exported from UCS and imported into your pascom phone system, you will need to install the pascom app from the UCS app center and configure a few settings. Top download the app, log into your UCS server web UI and go to the menu option {{< ui-button "Software" >}} > {{< ui-button "App Center" >}}.

Using the search function, search for the app called *mobydick* which you can download and install.


#### Add a UCS Computer for pascom

Once the app has been installed, the pascom server must be added as a computer within UCS which can be done via {{< ui-button "Devices" >}} > {{< ui-button "Computers" >}}.
A pop-up window will now appear. Under the point *Computers: Windows Workstation/Server* select the type *Computer:Linux* and click on next. In the next window, you will need to enter a computer name (e.g. pascom) which will also then be used later in order to authenticate itself with UCS. The other fields are optional.

Select your newly added server from the Computer list and under  {{< ui-button " Advanced Settings" >}} you need only to add a password and confirm it by repeating it. This password will also be used later for the pascom UCS authentication process.

#### Enable UCS user for pascom

Users already added within UCS will not be automatically imported into your pascom solution. Within the user settings field under Advanced Settings each individual user will need to be added by checking the box *enabling access to mobydick / pascom*.


### Add Connector Profile for UCS

To create a new connector profile, log into the pascom phone system Web UI and via {{< ui-button "Advanced" >}} > {{< ui-button "Connector" >}} click on {{< ui-button "Add" >}}.

Select the *UCS User Sync* template and enter the following data:

|Field|Description|
|---|---|
|**Name**|Connector profile name|
|**AD Domain**|UCS Domain e.g. mydomain.intranet|
|**AD Server**|Host Server IP or DNS-Name|
|**Username** and **Password**|Username and password for the previously added pascom Computer|
|**Authentication**|**NO**: Users will be imported and authenticated by the pascom PBX<br>**YES**: Users will be imported and can be authenticated against the UCS server. In this case, the authentication will be setup and you can adjust it according to requirements under {{< ui-button "Appliance" >}} > {{< ui-button "Services" >}} under the tab `{{< ui-button "Authentication" >}}.|

After saving the template can be modified to requirements under the tab {{< ui-button "Base Data" >}}.

#### User Fields in UCS

|UCS|pascom|Description|
|---|---|---|
|General > user login name|Login Name|The login name is used to all logins and may only contain non-capitals. Mandatory field.|
|General > Display Name|Display Name|The display name appears in all telephone displays and in the pascom client. Mandatory field|
|General > Forename|Forename|User's forename for the pascom telephone book entry.|
|General > Surname|Surname|User's surname for the pascom telephone book.|
|General > Primary e-mail address|E-mail|User e-mail address. Required for sending Voicemails and faxes.|
|Contact > Phone number|Extension|Internal user extension. If this is not managed in UCS / AD, pascom phone systems will automatically assign the next available extension from the extension pool.|
|Contact > Telephone number home|Private home telephone|User's home telephone number for the pascom Telephone book entry.|
|Contact > Telephone number mobile|Mobile|User's mobile phone number for the pascom telephone book entry.|

In reality the fields are just suggestions within the template. It is possible to add and remove fields or complete modify the import structure according to your needs.

#### Test and Activate Imports

Once you are finished with the configurations, you will be able to test which data sets will be imported by using the {{< ui-button "Save and Simulate" >}} button. If you are satisfied with the results, then can either run the import once as a one-off e {{< ui-button "Action" >}} > {{< ui-button "Carry out Import Now" >}} or via using the automate button you will be able to configure a regular automated import.

#### Test Authentication

Should you have selected YES under the Configure Authentication within the template, you can test the authentication process by navigating to {{< ui-button "Appliance" >}} > {{< ui-button "Services" >}} and using the {{< ui-button "Test Authentication" >}} button under the menu tab {{< ui-button "Authentication" >}} which will then test your user authentication functions correctly.
