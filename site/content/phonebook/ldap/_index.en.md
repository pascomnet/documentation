---
title: LDAP Telephone Book Import
description: Synchronise your LDAP Telephone Book Entries
weight: 40
---

{{< doctype "both" >}}

{{< description >}}


## "Telephone Book from LDAP" Connector Profile

Create a new connector profile by logging into the pascom Web UI and navigating to {{< ui-button "Advanced" >}} > {{< ui-button "Connector" >}} > {{< ui-button "Add" >}}.

Select the option *Telephone book from LDAP* and enter the following information:

|Field|Description|
|---|---|
|**Name**|Connector profile name|
|**LDAP URI**|URL to the LDAP directory|
|**Base DN**|BaseDN specifies the position within the LDAP directory which should be read|
|**Username**|User with LDAP directory access permissions (LDAP bindDN)|
|**Password**|Password for LDAP Authentication|
|**Search Filter**|Filter for more detailed LDAP directory searches|

After saving, the template can be modified according to requirements under the tab {{< ui-button "Basic Data" >}}.

### Basic Data

Under the basic data tab, you can configure your LDAP connection more precisely or update the previously configured settings.

|Field|Description|
|---|---|
|**Title**|Connector profile name (*is automatically filled*)|
|**Mode**|**Create and update records. Remove missing records from previous imports.**: (*default setting*) Imports only new phone book entries and compares updated entries, old entries will be removed.<br/>**Create and update records**: Imports only new phone book entries and compares updated entries. No entries will be removed.|
|**URI**|LDAP URI (*is automatically filled*)|
|**Base DN**|Base DN LDAP entries (*is automatically filled*)|
|**Username** and **Password**|LDAP authentication credentials for the added pascom user (*is automatically filled*)|
|**Search Filter**|LDAP search filter for filtering the destination telephone book read folders (*is automatically filled*)|
|**Comments**|Serves as a documentation / description for the connector|

### Pre Filter

Per default, the template will import all users from the LDAP directory. Using the {{< ui-button "Pre Filter" >}} tab you can restrict the import according to certain factors e.g. *company-phonebook* is populated. Simply replace "*return true;*" with the following code: 

    if (strpos($row['memberOf'],'company-phonebook') !== false) {
    return true;
    }
    return false;

### Telephone Book Fields in LDAP

Via the {{< ui-button "Variables" >}} tab, in the **Source** column it is possible to define from which LDAP telephone book fields the information can be read from. The **Variables** in the left column define which information sets can be imported into the pascom phone system. 

The preset fields are suggestions for the template. It is possible to add, modify and remove fields i.e. completely alter the import structure to match your requirements.

### Test and Activate the Import Process

After you have finalised your configuration, you can test the connector profile to determine which datasets will be imported using the {{< ui-button "Save and Simulate" >}} button. Once you are satisfied with the results, it is possible to either perform a one off import using the {{< ui-button "Action" >}} > {{< ui-button "Import Now" >}} option or automate the import to be performed at regular intervals by clicking the {{< ui-button "Automate" >}} button.

### Optional Settings

#### Modify Field Mappings

Under the Connector profile tabs  {{< ui-button "Variables" >}} and {{< ui-button "Structure" >}} it is possible to modify the field assignments from LDAP > pascom phone book according to your requirements.

For example, should you wish to save the contact notes to the notes field in the pascom telephone book, simply go to the {{< ui-button "Variables" >}} tab and click {{< ui-button "Add" >}}:

|Variable|Source|
|----|----|
|Notes|return $row["info"];|

Through this row, the connector saves the content of the LDAP "info" field under the variable of the same name "Notes". 
This Variable must now be assigned to the pascom telephone book notes field under the {{< ui-button "Structure" >}} tab.

To do this add the lines:

          "028pho_notes" :        "{{{Notes}}}"

**to the structure:**

        {
          "phonebook": [{
            "028pho_bez" :  "{{{DisplayName}}}",
            "028pho_phone" : "{{{BusinessPhone}}}",
            "028pho_firstname" :  "{{{GivenName}}}",
            "028pho_lastname" : "{{{Surname}}}",
            "028pho_organisation" : "{{{CompanyName}}}",
            "028pho_email" :  "{{{EmailAddress}}}",
            "028pho_mobile" : "{{{MobilePhone}}}",
            "028pho_homephone" :  "{{{HomePhone}}}",
            "028pho_fax" :  "{{{BusinessFax}}}",
            "028pho_notes" :  "{{{Notes}}}"
          }]
        }

This will result in the "notes" variable being assigned to the **notes** field in the pascom telephone book.

#### Using Labels

pascom labels can be used to display additional information from the LDAP directory within the pascom telephone book. 

In this example, we want to save the LDAP contact's customer number to the label **Customer Number**. This label is then visible in the telephone book, within the call logs and various other caller information points.

##### Add Label

To add labels, navigate to {{< ui-button "ACD" >}} > {{< ui-button "Call Labels" >}} and click {{< ui-button "Add" >}}.

Select the option {{< ui-button "Generic Label" >}}, enter **Customer Number** as the label name and then click {{< ui-button "Save" >}}.

Apply all outstanding jobs in order to complete the Label addition process.

#### Modify a Connector Profile

Go to the {{< ui-button "Variables" >}} tab and via the {{< ui-button "Add" >}} button, paste the following line:

|Variable|Source|
|---|---|
|Customernumber|return $row['Customernumber'];|

{{% notice info%}}
Opposed to other connector profiles, the name of both the variable and source fields must be identical.
{{% /notice  %}}

Through this modification, the Connector will save the content of the LDAP field "Customernumber" in the identically named Variable "Customernumber".

This variable must now be assigned to a **Customernumber** pascom field via the {{< ui-button "Structure" >}} tab.

To do this simply add the following line:

```
"post": {
            "phonebook.phonebooklabel": [
                {
                    "050lab_bez": "Customer Number",
                    "028050pholab_value": "{{{Customernumber}}}"
                }
            ]
}
```

to the structure:

```
{
  "phonebook": [{
    "028pho_bez" :          "{{{DisplayName}}}",
    "028pho_phone" :        "{{{BusinessPhone}}}",
    "028pho_firstname" :    "{{{GivenName}}}",
    "028pho_lastname" :     "{{{Surname}}}",
    "028pho_organisation" : "{{{CompanyName}}}",
    "028pho_email" :        "{{{EmailAddress1}}}",
    "028pho_mobile" :       "{{{MobilePhone}}}",
    "028pho_homephone" :    "{{{HomePhone}}}",
    "028pho_fax" :          "{{{BusinessFax}}}",
    "post": {
            "phonebook.phonebooklabel": [
                {
                    "050lab_bez": "Customer Number",
                    "028050pholab_value": "{{{Customernumber}}}"
                }
            ]
    }
  }]
}
```

This will assign all LDAP contacts with an entered customer number value with the Call Label **Customer Number** and corresponding value.

#### Check Results

{{% notice info%}}
Label assignments will NOT be displayed when using the "Save and Simulate" tool.
{{% /notice  %}}

To check whether the label assignment has been successful, go to the pascom PBX Web-UI menu options {{< ui-button "Users" >}} > {{< ui-button "Phonebook" >}}. Select and {{< ui-button "Edit" >}} an appropriate user and check whether the assignment was successful under the {{< ui-button "Labels" >}} tab. Alternatively, you can check your results by accessing the Company Phonebook via the pascom Desktop Client.

{{% notice info %}}
If the XMPP services need to be restarted, go to {{< ui-button "Apply">}} > {{< ui-button "Restart XMPP Server">}} in order to restart all connected pascom clients and re sync their connection within the phone system in order to correctly display all configured labels.
{{% /notice %}}
