---
url: /io-framework/
prev: /flexpanel-widgets/
weight: 50
title: IO-Framework
keywords:
  - IO-Framework
description: The IO-Framework enables mobydick to create / update arbitrary objects, like users, devices, connector profiles via a consistent and generic data structure.
toc: true
lang: en
icon: <i class="fa fa-arrows-h" aria-hidden="true"></i>


---

## Preface

All processes that import data (Connector Profiles, Excel Imports, and even creating a trunk or connector profile from a template) use the so-called IO-Framework internally. This framework enables mobydick to create / update arbitrary objects, like users, devices, connector profiles via a consistent and generic data structure.

A further use of this data structure is in the "Structure"-Tab of connector profiles. Here it defines the what objects are created in mobydick when importing a specific row from a source (e. g. CSV file).

This format is based on the JSON-Standard, but it needs to conform to a specific syntax to be understood by the IO-Framework.

## Structure of an IO-JSON-File
For further Information about JSON itself please refer to : http://json.org/

    {
        "modulname": [
            {
                "000aaa_name": "mmuster"
            },
        ],
        "modulname.ioplugin": [
            {
                "000aaa_name": "mmuster",
                "post": {
                    "modulname": [
                    //... Weitere Struktur
                    ]
                }
            },
        ]
    }

## Notes:

*   The top-level is **always** an object (defined by { })
*   Then the IO-plugin to use is defined as a string (e. g. "modulename")
*   Then **always** an array containing objects follow
*   Those objects usually have the name of a database field as key, the value is what goes in the corresponding column in the database (e. g "003use_name": "mmuster")  

## IO-Plugins

A specific  IO-Plugin is needed for every type of object that is to be imported. This is a part of the program wich converts the JSON structure from the file into the right datastructure and feeds this in the correct place within the mobydick module system, so that all necessary SQL statements to insert / update the data is generated correctly.

You can control which io plugin is used by specifying "modulname" or "modulenename.ioplugin" correctly. If you only specify "modulename", mobydick searches for a io plugin with the same name. E. G. "identity" results in the call for io_identity with the module mod_identity. If you specify "modulename.ioplugin", you can specify a different io-plugin within the specified module. E. g. "connector.fieldmap" doesn't use io_connector (which does also exist), instead it uses io_fieldmap.

## Currently available IO-Plugins

|Name|Imports Datatype|Module|Call Syntax|Acesses Tables in Database|
|----|----------------|------|-----------|--------------------------|
|io_connector|Connector-Profile|connector|connector|076import|
|io_fieldmap|	Connector-Variables|connector|	connector.fieldmap|	077fieldmap|
|io_externals|	External Phones	|externals	|externals	|010device, 074extdevice, 009extension|
|io_faxdevice|	Fax Devices|	faxdevice|	faxdevice|	020faxdevice, 010device, 009extension|
|io_inboundrules|	Inbound Rules for trunks|	inboundrules|	inboundrules|	024inbound
|io_ipphone|	Integrated SIP Devices (Snom, Aastra, Yealink)|	ipphone|	ipphone	|010device, 015ipdevice 013peer, 012location|
|io_location|	Locations	|location|	location|	012location|
|io_mdsoftphone|	mobydick Softphones	|ipphone|	ipphone.mdsoftphone	|010device, 015ipdevice 013peer, 012location|
|io_netconfig|	Network / System configuration|	netconfig|	netconfig	|026system|
|io_outboundrules|	Outbound Rules for Trunks|	outboundrules|	outboundrules	|025outbound|
|io_peer|	Peers of SIP Trunks	|trunk|	trunk.peer	|048peer|
|io_phonebook|	Phonebook Entries|	phonebook|	phonebook|	28phonebook
|io_speeddial|	Speeddial Numbers|	speeddial|	speeddial|	042speeddial, 009extension
|io_trunk|	Trunks|	trunk|	trunk|	022trunk|
|io_identity|	Users|	identity|	identity|	003user, 011account, 009extension|

"Acesses Tables in Database" means in this context, that the io-plugin in question can create data in those tables. Usually the IO-Plugins show the same behaviour as if you would create the corresponding object via the WebUI.

## post-Syntax

Sometimes, due to foreign key constraints or other dependencies, it is necessary that the data is imported in a specific order. E. g. before you can create variables within a connecto profile, you need to create the connector profile itself. This is achieved by putting the variables for the fieldmapping into the special "post" key for the connector profile.

## Testing

### Import an arbitrary JSON File

For testing and scripting purposes, you can import any JSON file (which corresponds to the syntax defined in this document) into mobydick via the mdc_import.php script. Note that for those imports, synchronisation and change-tracking is **disabled**.

    php /var/www/mobydickcmd/script/mdc_import.php /Pfad/zur/json/datei.json

## Examples for Different IO-Files
In the following section, a few different examples for creating objects in mobydick using IO-Json files are shown

**Import the user "John Doe" with a phonebook entry and a mobydick softphone**

Note: 010dev_bez Will be overwritten, because mobydick automatically manages names for mobydick Softphones (and for that matter, Snom, Aastra, Yealink and a few other devices).

    {
      "identity": [
        {
          "003use_bez": "John Doe",
          "003use_name": "jdoe",
          "016voi_email": "jdoe@example.com",
          "003use_auth_method": "mobydick",
          "003use_pw": "12345678",
          "post": {
            "phonebook": [
              {
                "028pho_bez": "Doe John",
                "028pho_firstname": "John",
                "028pho_lastname": "Doe",
                "028pho_organisation" : "ACME Corp.",
                "028pho_email": "jdoe@example.com",
                "028pho_homephone": "0049987654321",
                "028pho_mobile": "0049171555666"

              }
            ],
            "ipdevice.mdsoftphone": [
              {
                "010dev_bez": "softphone_jdoe"
              }  
            ]
          }
        }
      ]
    }

Put the JSON defined here in a file called "user.json" on your appliance into the /tmp/-folder

Then call the import script like this:

    php /var/www/mobydickcmd/script/mdc_import.php /tmp/user.json

When you access the WebUI after the script has finished, you notice that
* A user called "John Doe" is created
* He has a phonebook entry associated with more information
* He has a mobydick softphone associated
* You can also log in as jdoe and start to phone
