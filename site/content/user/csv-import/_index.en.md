---
title: User Import from CSV 
description: Import your users from external systems via CSV
weight: 50
---

{{< doctype "both" >}}

{{< description >}}


## Connector Profile "Users from CSV"

|Variable|Description|
|---|---|
|**Name**|Profile name|
|**Type**|Select the import option for the CSV file: <br/>*Default*: Upload in Browser<br/>Fetch from url|
|**Encoding of the CSV File**|Select the CSV file format. We recommend using UTF-8.|
|**Delimiter**|Select the separating character which separates the CSV fields.|
|**Line Separator**|If the CSV file is generated under Windows opposed to Mac / Linux, the line ending will be signified differently.|
|**Field Enclosure**|We recommend enclosing individual fields inside specific characaters, e.g. "Max Muster"|

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


### User Fields from CSV

In the {{< ui-button "Variables" >}} tab, all the fields which can be imported into your pascom phone system are listed. 
The field mapping from CSV > pascom can also be modified to match your needs under this tab.
Per default, the CSV column names correspond to the field names within the pascom PBX.

An example for a CSV file:

        "displayname","username","password","pin","phone","givenname","surname","email","mobile","homephone","job"
        "Max Muster","mmuster","12ab34cd56","1234","345","Max","Muster","","","","Sales Director"


### Test and Activate Import Process

Once you are finished with your configuration, you can test your setup using the {{< ui-button "Save and simulate" >}} button and see which data sets will be imported. Once satisfied with the test results, you can now either run the import as a one-off via {{< ui-button "Action" >}} > {{< ui-button "Import Now" >}} or as an automated regular import using the {{< ui-button "Automate" >}} button.

{{% notice info%}}
An automated import is only recommended for import types **Fetch from URL**.
{{% /notice  %}}


### Optional Settings

#### Modify Field Mappings

Within the connector profile under the tab {{< ui-button "Variables" >}} and {{< ui-button "Structure" >}}, it is possible to modify the CSV > pascom field mapping according to your needs.

As an example, let's say we want to save the users Job title within the pascom phone book notes field. 
Under the {{< ui-button "Variables" >}} tab, enter the following line by pressing {{< ui-button "Add" >}}:

|Variable|Source|
|----|----|
|job|return $row["job"];|

This line saves the content of the CSV field "job" in the identically named variable "job" within the connector profile.
This variable must now be mapped to the pascom phone book notes field under the {{< ui-button "Structure" >}} tab.

To do this, expand structure by adding the line:

          "028pho_notes" :        "{{{job}}}"

**to the structure:**

        {
          "identity": [{

            "003use_bez": "{{{displayname}}}",
            "003use_name": "{{{username}}}",
            "003use_pw": "{{{password}}}",
            "011acc_pin": "{{{pin}}}",
            "009ext_extension": "{{{phone}}}",
            "016voi_email": "{{{email}}}"          
            ,"post": {
              "phonebook": [{
                "028pho_bez" :  "{{{displayName}}}",
                "028pho_firstname" :  "{{{givenName}}}",
                "028pho_lastname" : "{{{surname}}}",
                "028pho_email" :  "{{{email}}}",
                "028pho_notes" :  "{{{job}}}"
              }]
            }
          }]
        }


This will assign the variable "job" to the **Notes** field of the pascom phone book.


#### Assign IP-Telephones 

It is possible to directly assign IP telephones to users via the CSV import.

If you wish to assign the user a pascom softphone, then no further variables need to be added to the pascom Connector.

**Assign IP telephone via MAC address:**

In your CSV file, add the columns "phonemac" and "phoneip", in which you can then enter the MAC and IP addresses of the desired IP telephones.

This will automatically assign the imported users with the corresponding IP telephones.

