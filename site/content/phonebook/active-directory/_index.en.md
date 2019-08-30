---
title: Microsoft Active Directory Telephone Book Imports
description: Snychronise your telephone book entries from Microsoft Active Directory
weight: 30
---

{{< doctype "both" >}}

{{< description >}}


## Microsoft Active Directory

In order to be able to read data from Active Directory, you require a user with the appropriate permissions. You could use the Active Directory Administrator for this purpose. However, as the pascom phone system needs to save the access credentials for the automated future imports and the the administrator as significantly more than the required permissions, it is advisable to create a user account for the pascom PBX:

If you use *mobydick* as the username, this will be automatically detected by the LDAP filter during the import process and will not be automatically added as a pascom phone system user. 

Assign a password for the pascom user and select *password never expires*. The pascom PBX can then authenticate itself by the Active Directory with every execution of the connector sync. If you wish to change this password, you must change the password in both Active Directory and within the pascom connector profile:

## "Telephone Book from AD" Connector Profile

Create a new connector profile by logging into the pascom Web UI and navigating to {{< ui-button "Advanced" >}} > {{< ui-button "Connector" >}} > {{< ui-button "Add" >}}.

Select the option *Telephone book from AD* and enter the following information:

|Field|Description|
|---|---|
|**Name**|Connector Name|
|**AD Domain**|Active Directory Domain Name|
|**AD Server**|Host server IP or DNS name|
|**Enable SSL**| **YES**: Secure SSL connection to Active Directory. **NO**: Connect to Active Directory without SSL.|
|**Username** and **Password**|The pascom user previously added to AD for authentication purposes|

After saving, the template can be modified according to requirements under the tab {{< ui-button "Basic Data" >}}.

### Basic Data

Under the basic data tab, you can configure your LDAP connection more precisely or update the previously configured settings.

|Field|Description|
|---|---|
|**Title**|Connector profile name (*automatically filled*)|
|**Mode**|**Create and update records. Remove missing records from previous imports.**: (*default setting*) Imports only new phone book entries and compares updated entries, old entries will be removed.<br/>**Create and update records**: Imports only new phone book entries and compares updated entries. No entries will be removed.|
|**URI**|URI to Active Directory (*automatically filled*)|
|**Base DN**|Base DN to AD entries (*automatically filled*)|
|**Username** and **Password**|AD authentication credentials for the added pascom user (*automatically filled*)|
|**Search Filter**|AD search filter for filtering the destination telephone book read folders (*automatically filled*)|
|**Comments**|Serves as a documentation / description for the connector|

### Pre Filter

Per default, the template will import all users from the Active Directory. Using the {{< ui-button "Pre Filter" >}} tab you can restrict the import according to certain factors e.g. *company-phonebook* is populated. Simply replace "*return array_key_exists('displayName', $row);*" with the following code: 

    # only import contacts with membership
    if (!array_key_exists("memberOf", $row)) return false;

    $groups = $row["memberOf"];
    # turn a single group membership (string) into a list of memberships (array)
    if (!is_array($groups)){
      $groups = array($row["memberOf"]);
    }

    # always search in a list of memberships
    return preg_grep('/company-phonebook/i', $groups);


### Telephone Book Fields in AD

|Active Directory|pascom|Description|
|---|---|---|
|General > Display Name|Display Name |Display names appear on phone screens and within the pascom client call logs. Compulsory field.|
|Phone number > Private|Telephone|The contact phone number.|
|General > First name|First name|Contact's forename.|
|General > Last name|Last name|Contact's surname.|
|Organisation > Company|Organisation|Contact's company.|
|Phone number > Fax|Fax|Conctact's fax number.|
|General > E-mail|Email|Contact's E-mail address.|
|Phone number > Mobile|Mobile|Contact mobile phone number.|

These fields are only suggestions for the template. You can add and remove fields as required or if necessary completely modify the structure to match your needs.

### Test and Activate the Import Process

After you have finalised your configuration, you can test the connector profile to determine which datasets will be imported using the {{< ui-button "Save and Simulate" >}} button. Once you are satisfied with the results, it is possible to either perform a one off import using the {{< ui-button "Action" >}} > {{< ui-button "Import Now" >}} option or automate the import to be performed at regular intervals by clicking the {{< ui-button "Automate" >}} button.

### Optional Settings

#### Modify Field Mappings

Under the Connector profile tabs  {{< ui-button "Variables" >}} and {{< ui-button "Structure" >}} it is possible to modify the field assignments from Active Directory > pascom phone book according to your requirements.

For example, should you wish to save the contact notes to the notes field in the pascom telephone book, simply go to the {{< ui-button "Variables" >}} tab and click {{< ui-button "Add" >}}:

|Variable|Source|
|----|----|
|notes|return $row["info"];|

Through this row, the connector saves the content of the Activity Directory "info" field (*Phone > Comment*) under the variable "notes". 
This Variable must now be assigned to the pascom telephone book notes field under the {{< ui-button "Structure" >}} tab.

To do this add the lines:

    "028pho_notes" :        "{{{notes}}}"

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
        "028pho_notes" :    "{{{notes}}}"
      }]
    }

This will result in the "notes" variable being assigned to the **Notes** field in the pascom telephone book.

#### Individualised Display Names

The pascom telephone book display name is displayed for in- and outbound calls, desktop VoIP phone displays as well as in your pascom UC client. Should you wish to customised / change display names because the stored display name in Active Directory does not match your needs or requirements of your pascom phone system, it is possible to individually populate this field. 

Where the information originates from in Active Directory can be found under the tab {{< ui-button "Variables" >}}. Per default, the display name (*displayName*) is taken directly from Active Directory.

|Variable|Source|
|----|----|
|displayname|return $row["displayName"];|

However, as the display name within your pascom phone system may not exceed 80 characters, it may be necessary to shorted the display name from Active Directory or, if desired, be read from different fields.

In the following example, the display name from Active Directory will be:

* Checked for length
* Automatically populated using the users' Surname and Forename (Givenname) should the AD display name not have been set
* Shortenedd to the maximum allowed 80 characters. 

To do this, under the {{< ui-button "Variables" >}} tab, the *displayname* **Source** will be replaced with the following content: 

    # check if displayname is empty
    if (!empty($row['DisplayName'])) {

      # check if displayname has more than 80 chars and cut it if necessary
      if (strlen($row['DisplayName']) <= 80) {
        return $row['DisplayName'];
      }
      # displayname will be cut from 0 to 80 chars
      return substr($row['DisplayName'],0,80);
    }

    # if displayname is empty use a combination of "Surname" and "Givenname" 
    # and also cut it if it's longer than 80 chars
    return substr($row['Surname'] . ', ' . $row['GivenName'],0,80);


Instead of forename and surname, it is of course also possible to read any other Active Directory field and use this as the display name source. 

#### Using Labels

pascom labels can be used to display additional information from the LDAP directory within the pascom telephone book. 

In this example, we want to save the AD contact's customer number to the label **Customernumber**. This label is then visible in the telephone book, within the call logs and various other caller information points.

##### Add Label

To add labels, navigate to {{< ui-button "ACD" >}} > {{< ui-button "Call Labels" >}} and click {{< ui-button "Add" >}}.

Select the option {{< ui-button "Generic Label" >}}, enter **Customer Number** as the label name and then click {{< ui-button "Save" >}}.

Apply all outstanding jobs in order to complete the Label addition process.

#### Modify a Connector Profile

Go to the {{< ui-button "Variables" >}} tab and via the {{< ui-button "Add" >}} button, paste the following line:

|Variable|Source|
|---|---|
|customernumber|return $row['customerNumber'];|


Through this modification, the Connector will save the content of the AD field "customerNumber" in the Variable "customernumber".

This variable must now be assigned to the label **Customernumber** pascom field via the {{< ui-button "Structure" >}} tab.

To do this simply add the following line:

    "post": {
      "phonebook.phonebooklabel": [
        {
          "050lab_bez": "Customernumber",
          "028050pholab_value": "{{{customernumber}}}"
        }
      ]
    }


to the structure:

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
              "028050pholab_value": "{{{customernumber}}}"
            }
          ]
        }
      }]
    }

This will assign all AD contacts with an entered customer number value with the Call Label **Customer Number** and corresponding value.

#### Check Results

{{% notice info%}}
Label assignments will NOT be displayed when using the "Save and Simulate" tool.
{{% /notice  %}}

To check whether the label assignment has been successful, go to the pascom PBX Web-UI menu options {{< ui-button "Users" >}} > {{< ui-button "Phonebook" >}}. Select and {{< ui-button "Edit" >}} an appropriate user and check whether the assignment was successful under the {{< ui-button "Labels" >}} tab. Alternatively, you can check your results by accessing the Company Phonebook via the pascom Desktop Client.

{{% notice info %}}
If the XMPP services need to be restarted, go to {{< ui-button "Apply">}} > {{< ui-button "Restart XMPP Server">}} in order to restart all connected pascom clients and re sync their connection within the phone system in order to correctly display all configured labels.
{{% /notice %}}
