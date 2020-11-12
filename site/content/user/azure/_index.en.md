---
title: Microsoft Azure Active Directory Integration (aadds)
description: Synchronize and authenticate your users against the Microsoft Azure Active Directory Service
weight: 60
---

{{< doctype "both" >}}

{{< description >}}

![Microsoft Azure](microsoft-azure-logo.png?width=70%)

## About Azure Active Directory Domain Services (aadds)

 This is a "classic" domain server as a cloud service hosted in Azure. It is "coupled" with the Azure AD and automatically synchronizes users.

This service can be used to create classic domain server implementations in Azure and can be coupled with an on-premise domain in various ways.

It is also the component required to extend an Azure AD with public LDAPS access, which is useful for connecting legacy applications to the Azure cloud.

[More Informations about Microsoft aadds](https://techcommunity.microsoft.com/t5/apps-on-azure/let-s-talk-about-azure-active-directory-and-the-microsoft/ba-p/1571939)


## Aadds Setup

The current AD connector does not work against an Azure AD, instead an Azure Active Directory Domain Services installation with activated LDAPS access is required.

For setting up Aadds, the [official documentation](https://docs.microsoft.com/en-us/azure/active-directory-domain-services/tutorial-create-instance) can be used, also for LDAPS configuration.

## Setting up authentication on the pascom

Set up the LDAP service on the pascom telephone system by selecting the
Menu item {< ui-button "Appliance" >}} > {{< ui-button "Services" >}} click {{< ui-button "Authentication" >}}

|Field|Description|
|---|---|
|LDAP-Authentication enabled|ja|
|LDAP Host|ldap://aadds.yourDomain.de|
|LDAP Search Base|DC=aadds,DC=ihreDomain,DC=de|
|LDAP Username - Field|sAMAccountName|
|LDAP Proxy-User|IhreEmail@onmicrosoft.com|
|LDAP Proxy-Password|Ihr Passwort|  

## "Users from AD" Connector Profile

Create a new connector profile by using the following steps in the pascom phone system Web UI:
Click on the menu option {{< ui-button "Advanced" >}} > {{< ui-button "Connector" >}} and then click {{< ui-button "Add" >}}.

Select the *AD User Sync* template and enter the following data:

|Field|Description|
|---|---|
|**Name**|Connector Profile Name|
|**AD Domain**|Domain Name|
|**AD Server**|Domain Name|
|**Username** and **Password**|Credentials of the previously added pascom User for authentication|
|**Configure authentication**|**NO**: Users will only be imported. Authentication will be performed by the pascom phone system. <br>**YES**: Users will be imported and the can be authenticated against the AD. In this case, the authentification will be setup and you can modify this according to your needs under {{< ui-button "Appliance" >}} > {{< ui-button "Services" >}} under the tab {{< ui-button "Authentification" >}}.|
|**Create pascom softphone**|**YES**: Creates a pascom softphone for every imported user. **NO**: No pascom softphones will be added for imported users.|
|**Create mobile phone**|**YES**: Creates a mobile phone device for every imported user. **NO**: No mobile devices will be added for imported users.|

After saving, the template can be modified according to requirements under the tab {{< ui-button "Basic Data" >}}.


### Test and Activate the Import Process

After you have finalised your configuration, you can test the connector profile to determine which data sets will be imported using the {{< ui-button "Save and Simulate" >}} button. Once you are satisfied with the results, it is possible to either perform a one off import using the {{< ui-button "Action" >}} > {{< ui-button "Import Now" >}} option or automate the import to be performed at regular intervals by clicking the {{< ui-button "Automate" >}} button.

{{% notice warning %}}
Please delete the domain name after the username. The System will do that behavior automatically after saving the connector profile.
{{% /notice %}}

![Failure](delete_mail.en.png?width=80%)

### Authentication Tests

If you have configured the template using the *Configure authentication* *YES* option, it is now possible to test the user authentication process using the following menu options {{< ui-button "Appliance" >}} > {{< ui-button "Services" >}} under the {{< ui-button "Authentification" >}} tab and finally using the {{< ui-button "Test Authentication" >}} button.

{{% notice info %}}
To authenticate the user against the Azure AD, the user must have the same name on the pascom telephone system as in the Azure AD (sAMAccountName)
{{% /notice %}}