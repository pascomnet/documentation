---
url: /xmpp-api/module-xmppuser/
prev: /xmpp-api/module-redirect/
next: /flexpanel-widgets/
weight: 322
title: Module "xmppuser"
keywords: 
  - Module "xmppuser"
  - Session Management
  - Customisation
description: Module "xmppuser" - Access and control your users' mobydick Clients
toc: true
lang: en

---

## Abstract

Session Management, Customisation.

Most likely you'll need various data about the currently logged in Users to effectively integrate your application with mobydick.

Our xmppserver expects to receive a *xmppuser.ClientInfo* Package directly after logging in your user. It will be answered by a *xmppuser.UserInfo* which contains a vast set of information.

## Commands

### xmppuser.ClientInfo

You can send various environment data within the ClientInfo. However, only the user element is currently used. It allows the facsimile subsystem to map between incoming print requests from a certain operating system specific username in combination with a machine name or ip to a established xmpp session in order to forward any facsimile requests.
You can also send a list of subscription filters from within the ClientInfo if you want to receive events.

#### Example

    <iq id="9WTfy-9" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="xmppuser">
          <ClientInfo>
            <os>Mac OS X 10.9</os>
            <osUser>tweber</osUser>
            <clientVersion/>
            <user/>
            <jid/>
            <clientIp/>
            <AddSubscription>
              <Subscription module="event" type="*" scope="user"/>
              <Subscription module="base" type="*" scope="user"/>
              <Subscription module="journal" type="*" scope="user"/>
            </AddSubscription>
          </ClientInfo>
      </cmd>
    </iq>

### xmppuser.FindCustomData

Sometimes customers ask us for very specific requirements and as a result a customisation project is begun. In the majority of cases, we bundle some functionality for the web-UI, the phone system as well as the client into a so called "custom package" which is to be installed on a number of mobydick appliances.

The commands to pass data between the various layers are standardized and therefore documented here. 

FindCustomData is a empty Package which works as a trigger to ask the system for any project specific data. It will be answered by a xmppuser.CustomData response.

### xmppuser.InvokeCustomAction

This is yet another generic command for client customisations. It's purpose is to trigger remote actions within the custom package's backend code. 

#### Example

    <iq id="9WTfy-9" type="get">
        <cmd xmlns="http://www.pascom.net/mobydick" module="xmppuser">
          <InvokeCustomAction action="project-specific-action-ids"/>
        </cmd>
    </iq>
 
## Responses

### xmppuser.UserInfo

The _UserInfo_ contains the complete state of the authenticated xmpp user. Some of the data structures are dynamically created and you will need to subscribe to certain events in order to keep your client's data model in sync with the server.

Some of the building blocks of the _UserInfo_ Package include:

*   Identity: a list of fields from the web-UIs "Configure User" section.
    *   db_003use_name: contains the user's _mobydick-Username_. It can differ from the xmpp username because the xmpp protocol is not case sensitive!
    *   db_003use_bez: The user's full name.
    *   db_009ext_extension: Internal phone number.
    *   faxextension: It contains the user's virtual facsimile number (if configured).
*   RoleList: the full set of roles including role types to check permissions, switch feature sets. Your client could enable more features if the user has the _xmpp.supervisor_ role type, for example.
*   LocationList: contains up to two device sets for statically and dynamically assigned devices
    *   Location: name of the location. If _isstatic_ is _false:_ it tells you about the current roaming location.
        *   DeviceEntry: current follow-me timings for a given device
            *   Phonedevice: a configured hard- or softphone. The _capabilities_ set contains all the supported features for the given device.
*   Voicemailbox: current Voicemail box state including waiting messages counter.
*   RedirectEntry: current call deflection state. See [Module "redirect"](https://wiki.pascom.net/confluence/pages/viewpage.action?pageId=16253315)
*   QueueMemberStates: a complete set of the queue memberships and states for this user. You can find more information in the queue module section.
*   SubscriptionList: a list of subscription filters which are currently set for this user.

#### Example

        <iq id="9WTfy-9" to="tweber@mobydick/mdfxclient_tw-macbook.in.pascom.net" type="result">
          <cmd xmlns="http://www.pascom.net/mobydick" module="xmppuser">
          <UserInfo name="tweber">
            <Identity>
              <db_011acc_id>5</db_011acc_id>
              <db_009ext_id>9</db_009ext_id>
              <db_003use_id>6</db_003use_id>
              <faxextension/>
              <db_016voi_mailbox>340</db_016voi_mailbox>
              <db_003use_lastlogin/>
              <db_028pho_id/>
              <db_020fax_id/>
              <db_016voi_id>5</db_016voi_id>
              <db_003use_name>tweber</db_003use_name>
              <db_009ext_tmstmp>2013-12-03 14:58:29.705785</db_009ext_tmstmp>
              <db_011acc_tmstmp>2013-12-03 14:58:29.705785</db_011acc_tmstmp>
              <db_011acc_voiidwatch>5</db_011acc_voiidwatch>
              <db_003use_doc/>
              <db_003use_bez>Thomas Weber</db_003use_bez>
              <db_009ext_extension>340</db_009ext_extension>
              <db_003use_enabled>true</db_003use_enabled>
              <db_011acc_calleridnum/>
              <db_003use_tmstmp>2013-12-03 14:58:29.705785</db_003use_tmstmp>
            </Identity>
            <RoleList>
              <Role name="All Users">
                <RoletypeList>
                  <Roletype name="xmpp.connect"/>
                  <Roletype name="xmpp.group"/>
                </RoletypeList>
              </Role>
            </RoleList>
            <LocationList>
              <Location name="Thomas Weber" isstatic="true" username=""/>
              <Location name="Entwicklung2" isstatic="false" username="">
                <DeviceEntry delayinternal="0" timeoutinternal="20" delayexternal="0" timeoutexternal="20">
                  <Phonedevice name="SIP xlite2 [Entwicklung2]" type="Generic SIP Phone">
                    <capabilities>
                      <dial/>
                    </capabilities>
                  </Phonedevice>
                </DeviceEntry>
                <DeviceEntry delayinternal="0" timeoutinternal="20" delayexternal="0" timeoutexternal="20">
                  <Phonedevice name="Snom 000413411c47 [Entwicklung2]" type="Snom Phone">
                    <capabilities>
                      <conference/>
                      <dial/>
                      <factory_reset/>
                      <firmware_update/>
                      <hangup/>
                      <hold/>
                      <transfer/>
                      <offhook/>
                      <reboot/>
                    </capabilities>
                  </Phonedevice>
                </DeviceEntry>
              </Location>
            </LocationList>
            <Voicemailbox>
              <db_016voi_name>Thomas Weber</db_016voi_name>
              <inboxMessages>0</inboxMessages>
              <db_016voi_mailbox>340</db_016voi_mailbox>
              <db_016voi_tmstmp>2013-12-03 14:58:29.705785</db_016voi_tmstmp>
            </Voicemailbox>
            <RedirectEntry eventType="update" eventId="">
              <source>340</source>
              <target>333</target>
              <old>333</old>
            </RedirectEntry>
            <QueueMemberStates eventType="" eventId=""/>
            <SubscriptionList>
              <Subscription module="event" type="*" scope="user"/>
              <Subscription module="base" type="*" scope="user"/>
              <Subscription module="journal" type="*" scope="user"/>
            </SubscriptionList>
          </UserInfo>
        </cmd>
        </iq>

### xmppuser.FindUserInfo

Requests the *xmppuser.UserInfo* Structure. A supervisor may use this command to load the details about other Users in
the system. Non supervisor Users can only re-request their own data.

* if jid is empty - sender full jid will be used
* if jid contains only the username or a bare jid (without ressource string) - subscription will be omitted
* if jid contains a full jid (including ressource string):  includes subscriptions for this specific session

#### Example

    <iq id="3dieE-3" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="xmppuser">
        <FindUserInfo jid="tweber"/>
      </cmd>
    </iq>


### xmppuser.CustomData

Contains arbitrary data for a specific customisation project. We use it as a generic container for project specific client add-ons or payed 3rd party integrations.

## Events

This Module does not send any events.