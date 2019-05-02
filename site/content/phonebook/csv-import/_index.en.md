---
title: CSV Telephone Book Import
description: Importing Telephone Book contacts from external systems
weight: 20
---

{{< doctype "both" >}}

{{< description >}}


## "Telephone Book from CSV" Connector Profile

|Variable|Description|
|---|---|
|**Name**|Profile name|
|**Type**|Select the import option for the CSV file: <br/>*Default*: Upload in Browser<br/>Fetch from url|
|**Encoding of the CSV File**|Select the CSV file format. We recommend using UTF-8.|
|**Delimiter**|Select the separating character which separates the CSV fields.|
|**Line Separator**|If the CSV file is generated under Windows opposed to Mac / Linux, the line ending will be signified differently.|
|**Field Enclosure**|We recommend enclosing individual fields inside specific characaters, e.g. "Max Muster"|

Nach dem Speichern kann die Vorlage im Reiter {{< ui-button "Basisdaten" >}} bei Bedarf angepasst werden.

After saving, the template can be modified according to requirements under the {{< ui-button "Basic Data" >}} tab.

### Basic Data

Under Basic Data, you can more exactly configure the CSV import or change your recently configured CSV import settings.

|Field|Description|
|---|---|
|**Title**|Connector profile name (*Automatically filled*)|
|**Source**|CSV (*cannot be altered*)|
|**Mode**|**Create and update records. Remove missing records from previous imports.**: (*default setting*) Imports only new phone book entries and compares updated entries, old entries will be removed.<br/>**Create and update records**: Imports only new phone book entries and compares updated entries. No entries will be removed.|
|**Type**|If you selected **Upload in Browser** when setting up your template: Upload manually<br/>If you selected **Fetch from URL** when setting up your template: Download from URL|
|**CSV File**|If you selected "Upload in Browser", the file can be directly uploaded here.|
|**CSV File URL**|If you selected "Fetch from url", the file path URL can be entered here.|
|**Delimiter**|The separating character which separates the CSV fields. (*Automatically filled*)|
|**File Format**|Specifies the CSV file format. (*Automatically filled*)|
|**Line Separator**|Specifies under which Operating System the CSV file was generated. (*Automatically filled*)|
|**Field Enclosure**|Specifies whether and which field enclosures are used in the CSV file. (*Automatically filled*|
|**Comments**|Can be used as a documentation / description box for the connector profile.|


### Pre Filter

Per default, the template will import all lines from the CSV file. Via the {{< ui-button "Pre Filter" >}} tab, it is possible to restrict the import to specific values, e.g. the column *displayname* is not empty. In the code, replace "return true" with the following code snippet:

        return array_key_exists('displayName', $row);


### Phonebook Fields from CSV

In the {{< ui-button "Variables" >}} tab, all the phone book fields which can be imported into your pascom phone system are listed. 
The field mapping from CSV > pascom can also be modified to match your needs under this tab.
Per default, the CSV column names correspond to the field names within the pascom PBX.

An example for a CSV file:

        "displayname","phone","givenname","surname","organisation","email","mobile","homephone","fax","homepage","customernumber"
        "Max Muster - pascom [30000]","+4999112345","Max","Muster","pascom","","","","+4999112399","www.pascom.net","30000"


### Test and Activate Import Process

Once you are finished with your configuration, you can test your setup using the {{< ui-button "Save and simulate" >}} button and see which data sets will be imported. Once satisfied with the test results, you can now either run the import as a one-off via {{< ui-button "Action" >}} > {{< ui-button "Import Now" >}} or as an automated regular import using the {{< ui-button "Automate" >}} button.

{{% notice info%}}
An automated import is only recommended for import types **Fetch from URL**.
{{% /notice  %}}

### Optional Settings

#### Modify Field Mappings

Within the connector profile under the tab {{< ui-button "Variables" >}} and {{< ui-button "Structure" >}}, it is possible to modify the CSV > pascom field mapping according to your needs.

As an example, let's say we want to save the contact's Homepage within the pascom phone book notes field. 
Under the {{< ui-button "Variables" >}} tab, enter the following line by pressing {{< ui-button "Add" >}}:anpassen.

|Variable|Source|
|----|----|
|Homepage|return $row["homepage"];|

This line saves the content of the CSV field "homepage" in the identically named variable "Homepage" within the connector profile.
This variable must now be mapped to the pascom phone book notes field under the {{< ui-button "Structure" >}} tab.

To do this, expand structure by adding the line:

          "028pho_notes" :        "{{{Homepage}}}"

**to the structure:**

        {
          "phonebook": [{
            "028pho_bez" : 			"{{{displayname}}}",
            "028pho_phone" : 		"{{{phone}}}",
            "028pho_firstname" : 	"{{{givenname}}}",
            "028pho_lastname" : 	"{{{surname}}}",
            "028pho_organisation" : "{{{organisation}}}",
            "028pho_email" : 		"{{{email}}}",
            "028pho_mobile" : 		"{{{mobile}}}",
            "028pho_homephone" : 	"{{{homephone}}}",
            "028pho_fax" : 			"{{{fax}}}",
            "028pho_notes" :        "{{{Homepage}}}"
          }]
        }


This will assign the variable "Homepage" to the **Notes** field of the pascom phone book.

**Liste der verfügbaren pascom Felder**

|Name|Description|
|---|---|
|028pho_bez|Display name|
|028pho_phone|Telephone|
|028pho_firstname|First name|
|028pho_lastname|Last name|
|028pho_organisation|Organisation|
|028pho_email|E-mail|
|028pho_mobile|Mobile|
|028pho_homephone|Telephone private|
|028pho_fax|Fax|
|028pho_notes|Notes|

#### Using Labels

pascom labels can be used to display additional information from the CSV file within the pascom telephone book. 

In this example, we want to save the CSV contact's customer number to the label **Customer Number**. This label is then visible in the telephone book, within the call logs and various other caller information points.

##### Add Label

To add labels, navigate to {{< ui-button "ACD" >}} > {{< ui-button "Call Labels" >}} and click {{< ui-button "Add" >}}.

Select the option {{< ui-button "Generic Label" >}}, enter **Customer Number** as the label name and then click {{< ui-button "Save" >}}.

Apply all outstanding jobs in order to complete the Label addition process.

#### Modify a Connector Profile

Go to the {{< ui-button "Variables" >}} tab and via the {{< ui-button "Add" >}} button, paste the following line:

|Variable|Source|
|---|---|
|Customernumber|return $row['customernumber'];|

{{% notice info%}}
Opposed to other connector profiles, the name of both the variable and source fields must be identical.
{{% /notice  %}}

Through this modification, the Connector will save the content of the CSV field "customernumber" in Variable "Customernumber".

This variable must now be assigned to a **Customernumber** pascom field via the {{< ui-button "Structure" >}} tab.

To do this simply add the following line:

      "post": {
                  "phonebook.phonebooklabel": [
                      {
                          "050lab_bez": "Customernumber",
                          "028050pholab_value": "{{{Customernumber}}}"
                      }
                  ]
      }

**to the structure:**

        {
          "phonebook": [{
            "028pho_bez" : 			"{{{displayname}}}",
            "028pho_phone" : 		"{{{phone}}}",
            "028pho_firstname" : 	"{{{givenname}}}",
            "028pho_lastname" : 	"{{{surname}}}",
            "028pho_organisation" : "{{{organisation}}}",
            "028pho_email" : 		"{{{email}}}",
            "028pho_mobile" : 		"{{{mobile}}}",
            "028pho_homephone" : 	"{{{homephone}}}",
            "028pho_fax" : 			"{{{fax}}}",
            "post": {
                    "phonebook.phonebooklabel": [
                        {
                            "050lab_bez": "Customernumber",
                            "028050pholab_value": "{{{Customernumber}}}"
                        }
                    ]
            }
          }]
        }

This will assign each contact with and entered customer number the label **Customernumber** and corresponding value. 

#### Check Results

{{% notice info%}}
Label assignments will NOT be displayed when using the "Save and Simulate" tool.
{{% /notice  %}}

To check whether the label assignment has been successful, go to the pascom PBX Web-UI menu options {{< ui-button "Users" >}} > {{< ui-button "Phonebook" >}}. Select and {{< ui-button "Edit" >}} an appropriate user and check whether the assignment was successful under the {{< ui-button "Labels" >}} tab. Alternatively, you can check your results by accessing the Company Phonebook via the pascom Desktop Client.

{{% notice info %}}
If the XMPP services need to be restarted, go to {{< ui-button "Apply">}} > {{< ui-button "Restart XMPP Server">}} in order to restart all connected pascom clients and re sync their connection within the phone system in order to correctly display all configured labels.
{{% /notice %}}
