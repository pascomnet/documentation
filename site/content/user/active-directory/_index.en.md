---
title: Microsoft Active Directory Integration
description: User Synchronisation and Authentication with Microsoft Active Directory
weight: 30
---

{{< doctype "both" >}}

{{< description >}}

![microsoft active directory](connector_microsoft_ad.png?width=50%)

## Microsoft Active Directory

In order to be able to read data from Active Directoy, you require a user with the appropriate permissions. You could use the Active Directory Administrator for this purpose. However, as the pascom phone system needs to save the access credentials for the automated future imports and the the administrator as significantly more than the required permissions, it is advisable to create a user account for the pascom PBX:

If yous use *mobydick* as the username, this will be automatically detected by the LDAP filter during the import process and will not be automatically added as a pascom phone system user. 

Assign a password for the pascom user and select *password never expires*. The pascom PBX can then authenticate itself by the Active Directory with every execution of the connector sync. If you wish to change this password, you must change the password in both Active Directory and within the pascom connector profile:

## "Users from AD" Connector Profile

Create a new connector profile by using the following steps in the pascom phone system Web UI:
Click on the menu option `Advanced` > `Connector` and then click `Add`.

Within the template, select *AD User Sync** and enter the following data:

|Field|Description|
|---|---|
|**Name**|Connector Profile Name|
|**AD Domain**|Active Directory Domain Name|
|**AD Server**|Server IP or Host DNS Name|
|**Username** and **Password**|Credentials of the previously added pascom User for authentication|
|**Configure authentication**|**NO**: Users will only be imported. Authentication will be performed by the pascom phone system. <br>**YES**: Users will be imported and the can be authenticated against the AD. In this case, the authentification will be setup and you can modify this according to your needs under `Appliance` > `Services` under the tab `Authentification`.|

After saving, the template can be modified according to requirements under the tab `Basic Data`.

### Pre Filter

Per default, the template will import all users from the AD except for the user *mobydick*. Using the `Pre Filter` tab you can restrict the import to groups of users e.g. *pascom-user*. Simply enter the following code: 

    if (strpos($row['memberOf'],'pascom-user') !== false) {
    return true;
    }
    return false;

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
|Phone numbers > mobile|mobile|User's mobile phone number to be added to the pascom telephone book entry.|
|Phone numbers > facsimileTelephoneNumber|Fax|Internal fax number assigned to the user. Automatically also adds a virtual pascom fax machine assigned to the user. A pre-requirement here is that the pascom fax server is already configured.|

These fields are just template suggestions. You can add and remove fields or even modify the complete structure to match your requirements.

### Test and Activate the Import Process

After you have finalised your configuration, you can test the connector profile to determine which datasets will be imported using the `Save and Simulate` button. Once you are satisfied with the results, it is possible to either perform a one off import using the `Action` > `Import Now` option or automate the import to be performed at regular intervals by clicking the `Automate` button.

### Authentication Tests

If you have configured the template using the *Configure authentication* *YES* option, it is now possible to test the user authentication process using the following menu options `Appliance` > `Services`
under the `Authentification` tab and finally using the `Test Authentication` button.


## Optional Settings

### Modify Field Assignments

Within the Connector Profile under the tabs Variables and Structure it is possible to modify the field assignments from Active Directory > pascom according to your requirements.

For example, should you wish to save the Job Title of a user in the pascom telephone book notes field, simply go to the `Variables` tab and click `Add`:

|Variable|Source|
|----|----|
|Job|return $row["Job"];|

Through this row, the connector saves the content of the Active Directory "Job" field under the variable of the same name "Job". 
This Variable must now be assigned to the pascom telephone book notes field under the `Structure` tab.

To do this add the lines:

          "028pho_notes" :        "{{{Job}}}"

**to the structure as follows:**

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
                "028pho_bez" :  "{{{DisplayName}}}",
                "028pho_phone" : "{{{BusinessPhone}}}",
                "028pho_firstname" :  "{{{GivenName}}}",
                "028pho_lastname" : "{{{Surname}}}",
                "028pho_organisation" : "{{{CompanyName}}}",
                "028pho_email" :  "{{{EmailAddress}}}",
                "028pho_mobile" : "{{{MobilePhone}}}",
                "028pho_homephone" :  "{{{HomePhone}}}",
                "028pho_fax" :  "{{{BusinessFax}}}",
                "028pho_notes" :  "{{{Job}}}"
              }]
            }
          }]
        }


This will result in the Job variable being assigned to the notes field in the pascom telephone book.


### Role Assignment

In order to assign roles to users directly upon importing, the structure must be expanded to include role assignments.

Under the `Variables` tab add the following lines by clicking `Add`:

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
In the PHP-Variable `rolesToFilter`, enter the `source` field code and role name for which the connector should search for in the Active Directory. All other Active Directory member assignments will be ignored. 

Example: **array('Role1', 'Role2');**
{{% /notice%}}

To do this, expand the following lines so: 

        {{#if rollen}}
          ,"user_roles": [
            {{#each rollen}}
            "{{this}}",
            {{/each}}
            "All Users"
          ],
        {{/if}}

**to the structure as follows:**

          {
            "identity": [{

              "003use_bez": "{{{displayname}}}",
              "003use_name": "{{{username}}}",
              "003use_pw": "{{{password}}}",
              "011acc_pin": "{{{pin}}}",
              "009ext_extension": "{{{phone}}}",
              "016voi_email": "{{{email}}}"
              {{#if rollen}}
                ,"user_roles": [
                  {{#each rollen}}
                  "{{this}}",
                  {{/each}}
                  "All Users"
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


### Assign a Softphone or IP Telephone

From within the Active Directory, it is possible to directly assign a user with a Softphone or IP telephone. 

**Assign IP Telephones via MAC Address:**

Under the `Variables` tab add the following lines by clicking `Add`:

|Variable|Source|
|----|----|
|mac|return $row["ipphone"];|

This line instructs the Connector to save the content of the Active Directory field "ipphone" to the variable "mac".
"mac" corresponds to the MAC Address of the IP phone which should be assigned to the user.
This variable now be assigned to the pascom field IP Telephone within the `Structure`.

To do this, expand the following lines so: 

      ,"ipphone“: [{
            "010dev_bez": "{{username}}_sipdevice“,
            „071ipp_mac“: „{{{mac}}}“
        }],

**Softphone Assignment:**

If you want to assign users with a pascom softphone, it is not necessary to add an additional varialble.

Expanding the `Structure` coding with the following is sufficient:

      "ipdevice.mdsoftphone": [{
            "010dev_bez": "{{{username}}}_sipdevice"
        }]


**to the structure as follows:**

          {
            "identity": [{
           
              "003use_bez": "{{{displayname}}}",
              "003use_name": "{{{username}}}",
              "003use_pw": "{{{password}}}",
              "011acc_pin": "{{{pin}}}",
              "009ext_extension": "{{{phone}}}",
              "016voi_email": "{{{email}}}",
           
              "post": {
                "phonebook": [{
                  "028pho_bez":       "{{{displayname}}}",
                  "028pho_firstname": "{{{givenname}}}",
                  "028pho_lastname":  "{{{surname}}}",
                  "028pho_email":     "{{{email}}}"
                  }],
                "ipphone“: [{
                      "010dev_bez": "{{username}}_sipdevice“,
                      „071ipp_mac“: „{{{mac}}}“
                  }],
                "ipdevice.mdsoftphone": [{
                      "010dev_bez": "{{{username}}}_sipdevice"
                  }]
               }
            }]
          }
