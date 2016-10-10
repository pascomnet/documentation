---
url: /xmpp-api/module-monitor/
prev: /xmpp-api/module-mobile/
next: /xmpp-api/module-phone/
weight: 317
title: Module "monitor"
keywords: 
  - Module "monitor"
  - call recordings
  - access recordings
description: Module "monitor" - Control call recording and access recordings.
toc: true
lang: en

---

## Abstract
Control call recording and access recordings.

## Commands

### monitor.Start
Start a recording of a busy channel. It will only succeed if the ruleset allows the access from the authenticated user to the given channel.

#### Example
    <iq id="bWjfh-33" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="monitor">
        <Start channel="SIP/xlite1-00000003"/>
      </cmd>
    </iq>

#### Usage
You can call monitor.Start if you received a monitor.RecordEvent informing you about the channel and your permissions. The Command is answered either by base.Success or base.Failure and followed by one or more incoming monitor.RecordEvent packages. It might happen that the channel and user combination matches multiple recording rules which will mean that you start more then one recording at the same time.

### monitor.Stop
Stop a recording. You can only stop manually started recordings owned by the authenticated user.

#### Example

    <iq id="bWjfh-34" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="monitor">
        <Stop channel="SIP/xlite1-00000003"/>
      </cmd>
    </iq>

#### Usage
You can call monitor.Stop if you have received a monitor.RecordEvent informing you about the channel, the active recording and your permissions. The Command is answered either by base.Success or base.Failure and followed by one or more incoming monitor.RecordEvent packages.

### monitor.FindRecord
Request recording related data for one specific call. You can find the necessary recordId by using a journal.JournalEntry or a previously received monitor.RecordEvent.

#### Example

    <iq id="bWjfh-37" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="monitor">
         <FindRecord recordId="1392385689-178_1392385689-187"/>
      </cmd>
    </iq>

#### Usage
You can call monitor.FindRecord at any time. Expect a monitor.RecordEntry or a base.Failure as a response.

### monitor.InitTransfer
Request a recorded audio file from the server. 

#### Example

    <iq id="zQSwg-82" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="monitor">
      <InitTransfer recordId="1392385689-178_1392385689-187" ruleId="1" file="1" format="wav" description="monitor_1392385689-178_1392385689-187_1_1_wav@player"/>
    </cmd>
    </iq>

#### Usage

Each audio file can be addressed by the following attributes:
* recordId: the unique id of the call
* ruleId: the rule which permitted/triggered the recoding
* file: section number starting with 1 for the first recording within this call. 
* format: only "wav" is possible at this time
* description: the server will use this string as the description of the incoming file transfer. You can relate the request and the asynchronously started transfer by using this attribute.

The Command is answered either by base.Success or base.Failure and followed by an incoming file transfer request.

## Responses

### monitor.RecordEntry
A monitor.RecordEntry contains all the information concerning one specific recorded phone call. It includes the whole journal.JournalEntry as well as a list of monitor.Record Elements with details about the audio files.

#### Example

    <iq id="zQSwg-111" to="tweber@mobydick/mdclient_tw-macbook.local" type="result">
      <cmd xmlns="http://www.pascom.net/mobydick" module="monitor">
      <RecordEntry id="1392385689-178_1392385689-187">
        <JournalEntry eventId="1496" eventType="create" userId="6" userName="tweber">
          <id>1496</id>
          <timestamp>1392385691386</timestamp>
          <inbound>false</inbound>
          <internal>true</internal>
          <duration>28</duration>
          <connected>26</connected>
          <deviceId>11</deviceId>
          <deviceName>Snom 0004132726ee [Thomas Weber]</deviceName>
          <locationId>9</locationId>
          <locationName>Thomas Weber</locationName>
          <name>Mathias Pasquay</name>
          <number>826</number>
          <prefix/>
          <result>hangup</result>
          <resultDetails/>
          <via/>
          <viaDetails/>
          <extension>822</extension>
          <recordId>1392385689-178_1392385689-187</recordId>
        </JournalEntry>
        <Record duration="10" ruleId="1" file="1" state="n" type="manual">
          <AudioFile format="wav" size="145004"/>
        </Record>
        <Record duration="13" ruleId="1" file="2" state="n" type="manual">
          <AudioFile format="wav" size="165004"/>
        </Record>
      </RecordEntry>
    </cmd>
    </iq>

## Events

### monitor.RecordEvent
The monitor.RecordEvent provides information both about the possibility to record and also for tracking the state of an ongoing recording.

#### Example
    <message to="tweber@mobydick/mdclient_tw-macbook.swe.local" from="pbx.mobydick">
      <cmd xmlns="http://www.pascom.net/mobydick" module="monitor">
      <RecordEvent eventType="stop" eventId="1392965320-21_1392965320-28" ruleId="1" permission="allow" identity="" file="">
        <headchannel>SIP/xlite2-00000007</headchannel>
        <tailchannel>SIP/xlite1-00000008</tailchannel>
      </RecordEvent>
    </cmd>
    </message>

#### Details
* eventType: start or stop, informs you of whether the recording is currently active
* eventId: use this as recordId to access the files later (see monitor.FindRecording)
* ruleId: the rule which permitted/triggered the recoding
* permission: auto = the system is recording automatically, you have no control over it, allow = the authenticated user can start or stop the recording,  or deny = another user has control over this recording
* identity: who owns the recording?
* file: section number starting with 1 for the first recording within this call. 
* headchannel: Channel-ID of the calling channel. Use this to relate monitor.RecordEvent with base.ChannelEvent
* tailchannel: Channel-ID of the called channel. Use this to relate monitor.RecordEvent with base.ChannelEvent