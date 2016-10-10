---
url: /xmpp-api/configuration/
prev: /xmpp-api/
next: /xmpp-api/api-design/
weight: 301
title: XMPP Configuration
keywords: 
  - Configuring the XMPP Server
  - XMPP Service
  - configure xmpp
description: The xmpp configuration for mobydick can be setup with just a few clicks.  
toc: true
lang: en

---


## Configuring the XMPP Server

You can use the XMPP Service immediately after setting up your server.

{{% notice note%}}
Should you operate multiple networked systems, it is advisable to plan and make the necessary configurations of Domains before the roll out of the clients.
Each satellite branch must implements its own XMPP domain. You can use the corresponding hostnames, the location or the already established terms for the satellite as domain names.
{{%/notice%}}

In order to modify the following Settings, call up the System Settings  and navigate to the area of sys.xmpp.
After you have made the modifications, they will need to be applied: to do this, use the menu option `Apply > Restart XMPP Server` n Tools - manual apply.


### Change XMPP Domains 

Setting: *Setting: sys.xmpp.domain*

The Standard name of the XMPP Domain directly after the installation is mobydick.

{{% notice warning%}}
If the XMPP Service has already been put into productive operation, it can encounter registration problems as a result of retrospective alterations!
{{% /notice %}}

Should you operate multiple networked systems, it is advisable to plan and make the necessary configurations of Domains before the roll out of the clients.
Each satellite branch must implements its own XMPP domain. You can use the corresponding hostnames, the location or the already established terms for the satellite as domain names.

This is not necessary on a cloudstack installation, each mobydick instance forms a xmpp domain whereas the domain name equals to the instances name

### Name of the XMPP Administrator

Setting: *sys.xmpp.adminuser*

Some advanced configuration can be done within the xmpp servers web-ui console. 

You can reach the Web User Interface via

    http://<mobydick>:9090

By default, you may use the username 'admin' and the admin credentials to log into this console. Change the setting
sys.xmpp.adminuser to some another username if you need to split up the responsibilities.


### Java Runtime Options

Setting: *sys.xmpp.java_options*

With these options it is possible to alter the start options of the XMPP server, in particular the Maximum Heap Space Heap Space (-Xmx). 
A modification of the standard values is seldom useful (only with v. large Systems).


### External IP

Setting: *sys.xmpp.externalip*

Use this field in order to specify an external IP or hostname for the XMPP server, this setting is to be changed, if necessary, when the system is operated behind a NAT gateway.

### Further Settings

The deployed XMPP server can be modified in many further areas. Just as with mobydick there is also a [large range of internal settings](https://community.igniterealtime.org/docs/DOC-1061 "Openfire properties"). 

You can make these alterations either through using the XMPP Server Web User Interface or directly roll them out from the mobydick UI. 
All System Settings contained under sys.xmpp.properties will be automatically passed on to the XMPP server upon application (applying)

In order to define any of the settings "xmpp.server.session.timeout" you should create a system setting in mobydick 
**sys.xmpp.properties**.xmpp.server.session.timeout with the desired value.

## Administration

By default all users with a password are XMPP Protocol enabled.

### Defining of Contact lists

Using the feature of the so-called shared Roster Groups the administrator can centrally define the entries in the contact lists of the client.
In order to define a shared Roster, you only have to create a Role with the Role Type xmpp.group and assign the affected user(s). 

Any alterations to a shared Roster will be immediately distributed to all registered clients upon the applying of the telephony.

### XMPP Supervisor Authorisation

The XMPP Sub system is designed in a way that an authorised user can only subscribe to data and execute commands that will affect them or a team membership.  

Therefore, a user cannot, for example, end the call of another user etc. With System Coupling, Information Screens or Switchboards, 
this is however an often requested feature. Therefore, you can grant individual accounts high privilege levels through assigning the Role Type xmpp.supervisor.

{{%notice tip%}}
Further Information regarding Roles can found in the Howto Role Management
{{% /notice %}}

<!--FixMe-->