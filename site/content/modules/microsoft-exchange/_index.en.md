---
title: Microsoft Exchange Integration
description: Integrate your Microsoft Exchange / Office365 in to your pascom VoIP phone system
weight: 40
---

{{< doctype "both"  >}}

{{< description >}}


![microsoft exchange](microsoft_exchange.png?width=50%)

## Concept

The pascom Microsoft Exchange Connector provides you with the option for synchronizing public, personal and shared Exchange Address Books with your pascom PBX server based telephone books.

Microsoft Exchange is also supported when using a hosted Office 365.

### Public Address Books

pascom phone systems connect to the Exchange Server via a pascom Exchange User specially created for this purpose.
The Connector recursively searches through all public folders for address books, which it then automatically synchronizes with the pascom PBX company phone book.  

Should you wish to not sync specific address books, simply revoke the pascom Exchange user's read permissions for these address books.

### Shared Address Books

Similar to public address books, the pascom Exchange Connector can also synchronize all phone books, which an Exchange user has shared with the pascom Exchange User.

### Personal Address Books

The connector also searches for personal address books belonging to an Exchange user and synchronizes these with the corresponding pascom phone system user's personal address book.

This function has two prerequisites:

* Usernames must be identical in the pascom PBX and the Exchange service.
* The pascom Exchange User must be assigned with the *Impersonation* permission.

### Standard Field Mapping

The field mapping can be completely modified / adapted as required. As standard, field mapping is preset as follows:

|pascom|Exchange|
|---|---|
|Display Name|Name |
|Telephone |Business telephone number |
|Forename |First name |
|Surname |Last name |
|Organisation |Company Name |
|Fax |Fax telephone number > business |
|E-mail |E-mail |
|Mobile |Mobile telephone number |
|Telephone private |Private telephone number |

## Configuration

### Microsoft Exchange

As stated above, the pascom Connector requires its own Exchange User. To do this, simply add a new user with the name (for example) **pascom**.

Next, ensure that the pascom user has read permissions for all relevant public folders.

Should you wish to synchronize personal address books, then also assign the pascom user with the role *Impersonation*. Further instructions on how to do this can be found [here](https://www.codetwo.com/kb/how-to-set-impersonation-rights-manually/).


### Create Connector Profile

To create a new connect profile, open the pascom PBX web UI and navigate to {{< ui-button "Advanced" >}} > {{< ui-button "Connector" >}} > {{< ui-button "Add" >}}.

Search for the template {{< ui-button "Exchange Contacts" >}} and click {{< ui-button "Select" >}} . The following data will then be requested:

|Field|Description|
|---|---|
| **Name*** | Connector profile name|
| **E-mail*** | E-mail address belonging to the previously added pascom Exchange User e.g. pascom@mycompany.com|
| **Password*** | pascom Exchange User password|

The pascom PBX will then try to automatically establish the Exchange User's domain and URL using the entered e-mail address. This will only function when the DNS server and domain structure (e.g. by Office365) are correctly setup.

Should the process fail, you can add the Domain and URL manually:

|Field|Description|
|---|---|
| **Domain** | Active Directory Domain Name |
| **URL** | The EWS interface URL e.g. https://exchange.mycompany.com/ews/exchange.asmx |

### Import Simulation & Automation

Clicking {{< ui-button "Save and Simulate" >}} will start a test import and will display the first 500 data sets. Should the last column {{< ui-button "local_id" >}} have a value entered, then this data set will be assigned to a personal address book. All other data sets will be synchronized with the pascom company phonebook.

Once you are happy with the results, click the {{< ui-button "Automate" >}} button to add an automatic regular sync job. The default configuration is set to *Daily at 12:00 noon*.

### Adapt Field Mapping (Optional)

Within the Connector profile, you can modify the pascom > Exchange field mapping via the {{< ui-button "Variables" >}} and {{< ui-button "Structure" >}} tabs.

For example, should you want to save the contact's website address within the notes field of the pascom Telephone Book, this can be done as follows:

Go to the {{< ui-button "Variables" >}} tab and via the {{< ui-button "Add" >}} button, paste the following line:


|Variable|Source|
|---|---|
|BusinessHomePage|return $row["BusinessHomePage"];|

{{% notice info%}}
As opposed to other Connector profiles, the variable name and the source field name (here "BusinessHomePage") must be identical.
{{% /notice  %}}

Through this modification, the Connector will save the content of the Exchange field "BusinessHomePage" in the identically named Variable "BusinessHomePage".

This variable muss now be assigned to a pascom field via the {{< ui-button "Structure" >}} tab.

To do this simply add the following line

      "028pho_notes" :        "{{{BusinessHomePage}}}",


to the structure:

      {
        "phonebook": [{
          "028pho_bez" :            "{{{DisplayName}}}",
          "028pho_phone" :          "{{{PhoneNumbers_BusinessPhone}}}",
          "028pho_firstname" :      "{{{GivenName}}}",
          "028pho_lastname" :       "{{{Surname}}}",
          "028pho_organisation" :   "{{{CompanyName}}}",
          "028pho_email" :          "{{{EmailAddresses_EmailAddress1}}}",
          "028pho_mobile" :         "{{{PhoneNumbers_MobilePhone}}}",
          "028pho_homephone" :      "{{{PhoneNumbers_HomePhone}}}",
          "028pho_fax" :            "{{{PhoneNumbers_BusinessFax}}}",
          "028pho_notes" :          "{{{BusinessHomePage}}}",
          "011acc_id":              "{{{local_id}}}"
        }]
      }

This will assign the variable **BusinessHomePage** to the pascom Telephone Book **028pho_notes** field.

#### Available Exchange Fields

+ DisplayName
+ Initials
+ GivenName
+ Surname
+ MiddleName
+ NickName
+ CompleteName
+ Birthday
+ Generation
+ CompanyName
+ JobTitle
+ Department
+ OfficeLocation
+ BusinessHomePage
+ PostalAddressIndex
+ SpouseName
+ WeddingAnniversary
+ FileAs
+ FileAsMapping
+ PhoneNumbers_AssistantPhone
+ PhoneNumbers_BusinessFax
+ PhoneNumbers_BusinessPhone
+ PhoneNumbers_BusinessPhone2
+ PhoneNumbers_CompanyMainPhone
+ PhoneNumbers_HomeFax
+ PhoneNumbers_HomePhone
+ PhoneNumbers_HomePhone2
+ PhoneNumbers_MobilePhone
+ PhoneNumbers_OtherFax
+ PhoneNumbers_OtherTelephone
+ PhoneNumbers_Pager
+ PhoneNumbers_RadioPhone
+ EmailAddresses_EmailAddress1
+ EmailAddresses_EmailAddress2
+ EmailAddresses_EmailAddress3
+ PhysicalAddresses_Home
+ PhysicalAddresses_Business
+ PhysicalAddresses_Other
+ ImAddresses_ImAddress1
+ ImAddresses_ImAddress2
+ ImAddresses_ImAddress3

<!--
|Available Exchange Fields||
|---|---|
|DisplayName|PhoneNumbers_BusinessPhone|
|Initials|PhoneNumbers_BusinessPhone2|
|GivenName|PhoneNumbers_CompanyMainPhone|
|Surname|PhoneNumbers_HomeFax|
|MiddleName|PhoneNumbers_HomePhone|
|NickName|PhoneNumbers_HomePhone2|
|CompleteName|PhoneNumbers_MobilePhone|
|Birthday|PhoneNumbers_OtherFax|
|Generation|PhoneNumbers_OtherTelephone|
|CompanyName|PhoneNumbers_Pager|
|JobTitle|PhoneNumbers_RadioPhone|
|Department|EmailAddresses_EmailAddress1|
|OfficeLocation|EmailAddresses_EmailAddress2|
|BusinessHomePage|EmailAddresses_EmailAddress3|
|PostalAddressIndex|PhysicalAddresses_Home|
|SpouseName|PhysicalAddresses_Business|
|WeddingAnniversary|PhysicalAddresses_Other|
|FileAs|ImAddresses_ImAddress1|
|FileAsMapping|ImAddresses_ImAddress2|
|PhoneNumbers_AssistantPhone|ImAddresses_ImAddress3|
|PhoneNumbers_BusinessFax||
 -->

#### Available pascom Fields

|Name|Description|
|---|---|
|028pho_bez|Display Name|
|028pho_phone|Telephone|
|028pho_firstname|Forename|
|028pho_lastname|Surname|
|028pho_organisation|Organisation|
|028pho_email|E-mail|
|028pho_mobile|Mobile|
|028pho_homephone|Telephone private|
|028pho_fax|Fax|
|028pho_notes|Notes|

### Using Labels (Optional)

pascom Labels can be used to display additional information from the Exchange within the pascom Company Phonebook.

In this example, we will save Exchange contact's work department using the label **Department**. This label will then not only be visible in the telephone book, but also in the call history logs as well as various additional caller information masks.

#### Add Labels

To add a label, navigate to {{< ui-button "ACD" >}} > {{< ui-button "Call Labels" >}} and click on the {{< ui-button "Add" >}} button.

Select the option {{< ui-button "Generic Label" >}}, enter **Department** as the label name and then click {{< ui-button "Save" >}}.

Apply all outstanding jobs in order to complete the Label addition process.

#### Modify a Connector Profile

Go to the {{< ui-button "Variables" >}} tab and via the {{< ui-button "Add" >}} button, paste the following line:

|Variable|Source|
|---|---|
|Department|return $row["Department"];|

{{% notice info%}}
As opposed to other Connector profiles, the variable name and the source field name (here "Department") must be identical.
{{% /notice  %}}

Through this modification, the Connector will save the content of the Exchange field "Department" in the identically named Variable "Department".

This variable muss now be assigned to a pascom field via the {{< ui-button "Structure" >}} tab.

To do this simply add the following line:

      "post": {
                  "phonebook.phonebooklabel": [
                      {
                          "050lab_bez": "Department",
                          "028050pholab_value": "{{{Department}}}"
                      }
                  ]
      }

to the Structure:

      {
        "phonebook": [{
          "028pho_bez" :          "{{{DisplayName}}}",
          "028pho_phone" :        "{{{PhoneNumbers_BusinessPhone}}}",
          "028pho_firstname" :    "{{{GivenName}}}",
          "028pho_lastname" :     "{{{Surname}}}",
          "028pho_organisation" : "{{{CompanyName}}}",
          "028pho_email" :        "{{{EmailAddresses_EmailAddress1}}}",
          "028pho_mobile" :       "{{{PhoneNumbers_MobilePhone}}}",
          "028pho_homephone" :    "{{{PhoneNumbers_HomePhone}}}",
          "028pho_fax" :          "{{{PhoneNumbers_BusinessFax}}}",
          "028pho_notes" :        "{{{BusinessHomePage}}}",
          "011acc_id":            "{{{local_id}}}",
          "post": {
                  "phonebook.phonebooklabel": [
                      {
                          "050lab_bez": "Department",
                          "028050pholab_value": "{{{Department}}}"
                      }
                  ]
          }

        }]
      }

This will assign all Exchange contacts with an entered department value with the Call Label **Department** and corresponding value.

#### Check Results

{{% notice info%}}
Label assignments will NOT be displayed when using the "Save and Simulate" tool.
{{% /notice  %}}

To check whether the label assignment has been successful, go to the pascom PBX Web-UI menu options {{< ui-button "Users" >}} > {{< ui-button "Phonebook" >}}. Select and {{< ui-button "Edit" >}} an appropriate user and check whether the assignment was successful under the {{< ui-button "Labels" >}} tab. Alternatively, you can check your results by accessing the Company Phonebook via the pascom Desktop Client.
