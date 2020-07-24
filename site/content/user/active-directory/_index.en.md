---
title: Microsoft Active Directory Integration
description: User Synchronisation and Authentication with Microsoft Active Directory
weight: 60
---

{{< doctype "both" >}}

{{< description >}}

![microsoft active directory](connector_microsoft_ad.png?width=50%)

## Microsoft Active Directory

In order to be able to read data from Active Directory, you require a user with the appropriate permissions. You could use the Active Directory Administrator for this purpose. However, as the pascom phone system needs to save the access credentials for the automated future imports and the the administrator as significantly more than the required permissions, it is advisable to create a user account for the pascom PBX:

If you use *mobydick* as the username, this will be automatically detected by the LDAP filter during the import process and will not be automatically added as a pascom phone system user. 

Assign a password for the pascom user and select *password never expires*. The pascom PBX can then authenticate itself by the Active Directory with every execution of the connector sync. If you wish to change this password, you must change the password in both Active Directory and within the pascom connector profile:

## "Users from AD" Connector Profile

Create a new connector profile by using the following steps in the pascom phone system Web UI:
Click on the menu option {{< ui-button "Advanced" >}} > {{< ui-button "Connector" >}} and then click {{< ui-button "Add" >}}.

Select the *AD User Sync* template and enter the following data:

|Field|Description|
|---|---|
|**Name**|Connector Profile Name|
|**AD Domain**|Active Directory Domain Name|
|**AD Server**|Server IP or Host DNS Name|
|**Username** and **Password**|Credentials of the previously added pascom User for authentication|
|**Configure authentication**|**NO**: Users will only be imported. Authentication will be performed by the pascom phone system. <br>**YES**: Users will be imported and the can be authenticated against the AD. In this case, the authentification will be setup and you can modify this according to your needs under {{< ui-button "Appliance" >}} > {{< ui-button "Services" >}} under the tab {{< ui-button "Authentification" >}}.|
|**Create pascom softphone**|**YES**: Creates a pascom softphone for every imported user. **NO**: No pascom softphones will be added for imported users.|
|**Create mobile phone**|**YES**: Creates a mobile phone device for every imported user. **NO**: No mobile devices will be added for imported users.|

After saving, the template can be modified according to requirements under the tab {{< ui-button "Basic Data" >}}.

### Pre Filter

Per default, the template will import all users from the AD except for the user *mobydick*. Using the {{< ui-button "Pre Filter" >}} tab you can restrict the import to groups of users e.g. *pascom-user*. Simply enter the following code: 

    # only import users with membership
    if (!array_key_exists("memberOf", $row)) return false;

    $groups = $row["memberOf"];
    # turn a single group membership (string) into a list of memberships (array)
    if (!is_array($groups)){
      $groups = array($row["memberOf"]);
    }

    # always search in a list of memberships
    return preg_grep('/pascom-user/i', $groups);

### User Fields in AD

|Active Directory|pascom|Description|
|---|---|---|
|Account > sAMAccountName|username|The login name is used for all logins and can only contain lowercase letters. Required field.|
|General > displayName |displayname |The display name is displayed on telephone displays and within the pascom desktop and mobile clients. Required field.|
|General > givenName|givenname|First name of the user used for the pascom telephone book entry.|
|General > sn|surname|Last name of the user used for the pascom telephone book entry.|
|General > telephoneNumber|phone|The user's internal extension number. If this is not managed in AD, pascom will automatically assign the next available extension from the number pool.|
|General > mail|email|User's e-mail address. Used for sending voicemails and faxes.|
|Organisation > company|organisation|Company to be entered in the user's pascom telephone book entry.|
|Phone numbers > homePhone|homephone|User's private / home telephone number for the pascom telephone book entry.|
|Phone numbers > mobile|mobile|The user's mobile phone number to be added to the pascom telephone book entry and with which a mobile phone device should be automatically created.|
|Phone numbers > facsimileTelephoneNumber|Fax|Internal fax number assigned to the user. Automatically also adds a virtual pascom fax machine assigned to the user. A pre-requirement here is that the pascom fax server is already configured.|

These fields are just template suggestions. You can add and remove fields or even modify the complete structure to match your requirements.

### Test and Activate the Import Process

After you have finalised your configuration, you can test the connector profile to determine which data sets will be imported using the {{< ui-button "Save and Simulate" >}} button. Once you are satisfied with the results, it is possible to either perform a one off import using the {{< ui-button "Action" >}} > {{< ui-button "Import Now" >}} option or automate the import to be performed at regular intervals by clicking the {{< ui-button "Automate" >}} button.

### Authentication Tests

If you have configured the template using the *Configure authentication* *YES* option, it is now possible to test the user authentication process using the following menu options {{< ui-button "Appliance" >}} > {{< ui-button "Services" >}} under the {{< ui-button "Authentification" >}} tab and finally using the {{< ui-button "Test Authentication" >}} button.


### Optional Settings

#### Modify Field Mappings

Within the Connector Profile under the tabs  {{< ui-button "Variables" >}} and {{< ui-button "Structure" >}} it is possible to modify the field assignments from Active Directory > pascom according to your requirements.

For example, should you wish to save the Job Title of a user in the pascom telephone book notes field, simply go to the {{< ui-button "Variables" >}} tab and click {{< ui-button "Add" >}}:

|Variable|Source|
|----|----|
|job|return $row["job"];|

Through this row, the connector saves the content of the Active Directory "job" field under the variable of the same name "job". 
This Variable must now be assigned to the pascom telephone book notes field under the {{< ui-button "Structure" >}} tab.

To do this add the lines:

    "028pho_notes" :        "{{{job}}}"

**to the structure as follows:**

    {
      "identity": [{

        "003use_bez": "{{{displayname}}}",
        "003use_name": "{{{username}}}",
        "009ext_extension": "{{{phone}}}",
        "016voi_email": "{{{email}}}",
        "003use_auth_method": "EXTERN"          
        ,"post": {
          "phonebook": [{
            "028pho_bez" :  "{{{displayname}}}",
            "028pho_firstname" :  "{{{givenname}}}",
            "028pho_lastname" : "{{{surname}}}",
            "028pho_organisation" : "{{{organisation}}}",
            "028pho_email" :  "{{{email}}}",
            "028pho_mobile" : "{{{mobile}}}",
            "028pho_homephone" :  "{{{homephone}}}",
            "028pho_fax" :  "{{{fax}}}",
            "028pho_notes" :  "{{{job}}}"
          }]
        }
      }]
    }


This will result in the "job" variable being assigned to the **notes** field in the pascom telephone book.


#### Role Assignment

In order to assign roles to users directly upon importing, the structure must be expanded to include role assignments.

Under the {{< ui-button "Variables" >}} tab add the following lines by clicking {{< ui-button "Add" >}}:

**Variable:** roles

**Source:**

    //Fill in the roles you want to filter (rolesToFilter) like this:
    //array('Role1', 'Role2');          

    $rolesToFilter=array();          
    $output=array();

    if(empty($rolesToFilter))
        return $output;

    $src = $row['memberOf'];

    if(!is_array($src)) {
      $src = array($src);
    }

    foreach($src as $group) {
      $list = explode(',', str_replace(array('[', ']', 'CN=', 'DC=', '"'), '', $group));
      foreach($list as $elem) {
        if(in_array($elem, $rolesToFilter)) {
          $output[]=$elem;
        }
      }
    }

    return $output;

The field "roles" corresponds to a list of roles which should be assigned to the user. 
You can use the member assignment in Active Directory to determine the pascom phone system roles. 
By using this coding, the Connector can read the Active Directory member assignments and assign them to the pascom field User Roles.

{{% notice note%}}
In the PHP-Variable `rolesToFilter`, enter the {{< ui-button "source" >}} field code and role name for which the connector should search for in the Active Directory. All other Active Directory member assignments will be ignored.   
Example: **array('Role1', 'Role2');**
{{% /notice%}}

To do this, expand the following lines so: 

    {{#if rollen}}
      ,"user_roles": [
        {{#each rollen}}
        "{{this}}",
        {{/each}}
        "All"
      ],
    {{/if}}

**to the structure as follows:**

    {
      "identity": [{

        "003use_bez": "{{{displayname}}}",
        "003use_name": "{{{username}}}",
        "009ext_extension": "{{{phone}}}",
        "016voi_email": "{{{email}}}",
        "003use_auth_method": "EXTERN"
        {{#if rollen}}
          ,"user_roles": [
            {{#each rollen}}
            "{{this}}",
            {{/each}}
            "All"
          ],
        {{/if}}
        ,"post": {
          "phonebook": [{
            "028pho_bez":       "{{{displayname}}}",
            "028pho_firstname": "{{{givenname}}}",
            "028pho_lastname":  "{{{surname}}}",
            "028pho_email":     "{{{email}}}"
            }]
          }
      }]
    }


#### Assign a Softphone, Mobile Phone or IP Telephone

From within the Active Directory, it is possible to directly assign a user with a Softphone or IP telephone. 

**Assign IP Telephones via MAC Address:**

Under the {{< ui-button "Variables" >}} tab add the following lines by clicking {{< ui-button "Add" >}}:

|Variable|Source|
|----|----|
|mac|return $row["ipPhone"];|

This line instructs the Connector to save the content of the Active Directory field "ipPhone" to the variable "mac".
"mac" corresponds to the MAC Address of the IP phone which should be assigned to the user.
This variable now be assigned to the pascom field IP Telephone within the {{< ui-button "Structure" >}}.

To do this, expand the following lines so: 

    ,"ipphone": [{
      "010dev_bez": "{{username}}_sipdevice",
      "071ipp_mac": "{{{mac}}}"
    }],

**Softphone Assignment:**

If you want to assign users with a pascom softphone, it is not necessary to add an additional variable.

Under {{< ui-button "Variables" >}} it is sufficient to set the entry **createSoftphone** to "return true;".

**Mobile Phone Assignment:**

If you want to assign users with a mobile phone, it is not necessary to add an additional variable. The mobile phone number will be automatically read from the field "Phone numbers" > "mobile".

Under {{< ui-button "Variables" >}} it is sufficient to set the entry **createMobile** to "return true;".

