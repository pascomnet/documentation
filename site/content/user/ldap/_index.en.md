---
title: Import Users from LDAP Sources
description: Synchronise and Authenticate your Users against LDAP
weight: 70
---

{{< doctype "both" >}}

{{< description >}}

## LDAP

The "Lightweight Directory Access Protocol" (LDAP) is a network protocol for processing of queries and alterations in a shared directory service. LDAP itself is not a directory, but rather the protocol, via which one can use a specific syntax to query information from a LDAP directory. 

In order to be allowed to read data from LDAP, a user with the appropriate permissions is required. Enter this user a password and check the *password never expires* option. 
pascom phone system authenticates itself against LDAP for each connector run. If you wish to change the password, you must change it in both LDAP and within the pascom Connector profile:

## "Users from LDAP" Connector Profile

Create a new connector profile by navigating to the following options within the pascom admin Web UI: {{< ui-button "Advanced" >}} > {{< ui-button "Connector" >}} and click {{< ui-button "Add" >}}.

Select the template *Users from LDAP* and enter the following information:

|Field|Description|
|---|---|
|**Title**|Connector profile name|
|**LDAP URI**|URL to the LDAP directory|
|**Base DN**|BaseDN specifies the position within the LDAP directory which should be read|
|**Username**|User with LDAP directory access permissions (LDAP bindDN)|
|**Password**|Password for LDAP Authentication|
|**Search Filter**|Filter for more detailed LDAP directory searches|
|**Enable User Authentication**|**NO**: Users will be imported and the authenticated against the pascom server.<br>**YES**: Users will be imported and can be authenticated against LDAP. In this case, the authentication will be setup and you can modify it to your requirements under {{< ui-button "Appliance" >}} > {{< ui-button "Services" >}} im Reiter {{< ui-button "Authentication" >}}.|
|**Username field**|(optional) You can enter the field name from which the to be imported users' username should be read. *Default: samAccountName*|
|**Create pascom Softphone**|**YES**: Automatically adds a pascom softphone for every imported user. **NO**: No pascom softphones will be added for imported users.|
|**Create mobile phone**|**YES**: Creates a mobile phone device for every imported user. **NO**: No mobile devices will be added for imported users.|

After saving, the template can be modified according to requirements under the tab {{< ui-button "Basic Data" >}}.

### Pre Filter

Per default, the template will import all users from the LDAP directory. Using the {{< ui-button "Pre Filter" >}} tab you can restrict the import according to certain factors e.g. *displayName* is populated. Simply replace "*return true;*" with the following code: 


    return array_key_exists('displayName', $row);


### User Fields in LDAP

Via the {{< ui-button "Variables" >}} tab, in the **Source** column it is possible to define from which LDAP user fields the information can be read from. The **Variables** in the left column define which information sets can be imported into the pascom phone system. 

The preset fields are suggestions for the template. It is possible to add, modify and remove fields i.e. completely alter the import structure to match your requirements.

### Test and Activate the Import Process

After you have finalised your configuration, you can test the connector profile to determine which datasets will be imported using the {{< ui-button "Save and Simulate" >}} button. Once you are satisfied with the results, it is possible to either perform a one off import using the {{< ui-button "Action" >}} > {{< ui-button "Import Now" >}} option or automate the import to be performed at regular intervals by clicking the {{< ui-button "Automate" >}} button.

### Authentication Tests

If you have configured the template using the *Configure authentication* *YES* option, it is now possible to test the user authentication process using the following menu options {{< ui-button "Appliance" >}} > {{< ui-button "Services" >}} under the {{< ui-button "Authentification" >}} tab and finally using the {{< ui-button "Test Authentication" >}} button.

### Optional Settings

#### Modify Field Mappings

Under the Connector profile tabs  {{< ui-button "Variables" >}} and {{< ui-button "Structure" >}} it is possible to modify the field assignments from LDAP > pascom according to your requirements.

For example, should you wish to save the Job Title of a user in the pascom telephone book notes field, simply go to the {{< ui-button "Variables" >}} tab and click {{< ui-button "Add" >}}:

|Variable|Source|
|----|----|
|Job|return $row["Job"];|

Through this row, the connector saves the content of the LDAP "Job" field under the variable of the same name "Job". 
This Variable must now be assigned to the pascom telephone book notes field under the {{< ui-button "Structure" >}} tab.

To do this add the lines:

          "028pho_notes" :        "{{{Job}}}"

**to the structure:**

    {
      "identity": [{

        "003use_bez": "{{{displayname}}}",
        "003use_name": "{{{username}}}",
        "003use_auth_method": "EXTERN",
        "011acc_pin": "{{{pin}}}",
        "009ext_extension": "{{{phone}}}",
        "016voi_email": "{{{email}}}",

        "post": {
          "phonebook": [{
            "028pho_bez":       "{{{displayname}}}",
            "028pho_firstname": "{{{givenname}}}",
            "028pho_lastname":  "{{{surname}}}",
            "028pho_email":     "{{{email}}}",
            "028pho_notes" :  "{{{Job}}}"
          }]
        }
      }]
    }


This will result in the "job" variable being assigned to the **notes** field in the pascom telephone book.

#### Role Assignment

In order to be able to automatically assign users with roles whilst importing, the structure will need to be expanded to accommodate role assignments. The corresponding user roles can be read from the LDAP **memberOf** user field. 

Under the {{< ui-button "Variables" >}} tab, add the following line by clicking {{< ui-button "Add" >}}:

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

The field "roles" relates to a list of roles with which the user user should be assigned.
Via the "memberOf" user field, you can define the roles within pascom.
With this code, the connector can read the membership assignments via LDAP and assign them to the user roles pascom field.

{{% notice note%}}
In the PHP-Variable `rolesToFilter`, enter the {{< ui-button "source" >}} field code and role name for which the connector should search for. All other member assignments will be ignored.   
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
        "003use_auth_method": "EXTERN",
        "011acc_pin": "{{{pin}}}",
        "009ext_extension": "{{{phone}}}",
        "016voi_email": "{{{email}}}",
      {{#if rollen}}
        ,"user_roles": [
          {{#each rollen}}
          "{{this}}",
          {{/each}}
          "default"
        ],
      {{/if}}
        "post": {
          "phonebook": [{
            "028pho_bez":       "{{{displayname}}}",
            "028pho_firstname": "{{{givenname}}}",
            "028pho_lastname":  "{{{surname}}}",
            "028pho_email":     "{{{email}}}"
          }]
        }
      }]
    }


{{% notice note%}}
The role "default" relates to the system role "All" which is assigned to all users.
{{% /notice%}}

#### Assign a Softphone, Mobile Phone or IP Telephone

From within LDAP, it is possible to directly assign a user with a Softphone or IP telephone. 

**Assign IP Telephones via MAC Address:**

Within the User from LDAP import, all required Variables and Structure for adding an IP telephony are already available.

Make sure, that values in your LDAP directory user fields are populated in accordance to how they are found in the pascom Web UI under the {{< ui-button "Variables" >}} tab:

|Variable|Source|Description|
|----|----|----|
|phonemac|return $row["phonemac"];|IP Telephone MAC Address|
|phoneip|return $row["phoneip"];|IP Telephone IP Address|
|phoneuser|return $row["phoneuser"];|Username for authenticating on the IP telephone|
|phonepass|return $row["phonepass"];|Password for authenticating on the IP telephone|

Optionally, the IP telephone FollowMe settings can also be set:

|Variable|Source|Description|
|----|----|----|
|inttimeout|return $row["inttimeout"];|Internal calls: timeout in seconds|
|intdelay|return $row["intdelay"];|Internal calls: delay in seconds|
|exttimeout|return $row["exttimeout"];|External calls: timeout in seconds|
|extdelay|return $row["extdelay"];|Team calls: delay in seconds|
|quetimeout|return $row["quetimeout"];|Team calls: timeout in seconds|
|quedelay|return $row["quedelay"];|Team calls: delay in seconds|

Through these lines, the connector will save the content of the LDAP user fields to the corresponding pascom variable.

**Softphone Assignment:**

If you want to assign users with a pascom softphone, it is not necessary to add an additional variable.

Under {{< ui-button "Variables" >}} it is sufficient to set the entry **createSoftphone** to "return true;".

**Mobile Phone Assignment:**

If you want to assign users with a mobile phone, it is not necessary to add an additional variable. The mobile phone number will be automatically read from the LDAP user field "mobile".

Under {{< ui-button "Variables" >}} it is sufficient to set the entry **createMobile** to "return true;".
