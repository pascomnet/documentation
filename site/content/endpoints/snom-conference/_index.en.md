---
title: Snom Conferencing System
description: Integrate your Snom Conference System with your pascom IP PBX solution.
weight: 20
---


{{< doctype "both"  >}}

{{< description >}}

![Snom C520](snom_c520.jpg?width=60%)

## Supported Endpoints

**[List of supported Endpoints, Click here!]({{<ref "/endpoints#snom-conferencing-systems" >}})**

## Preparation

A functioning DHCP server is mandatory. Connect the conference system to your network. Make a note of 
the ** IP address ** that the conference system received from the DHCP server.

## Create a new Basic Configuration Template

The next step is to build a new basic configuration for the conference system. To do this, go to the pascom WEB GUI on {{<ui-button "Devices">}}> {{<ui-button "Basic configuration">}}

{{% notice tip %}}
With pascom version 19.03 there is a new basic configuration **Empty Generic Profile**
{{% /notice %}}

Duplicate the basic configuration **Empty Generic Profile** and give it a name e.g. SNOM C520 conference. Select the new basic configuration and click on
{{<ui-button "Edit">}}> {{<ui-button "Configuration">}}.

**Now replace the existing code with the following code snipped:**
```
<?xml version="1.0"?>
<settings>
	<time_date>
		<date_format>DD/MM/YY</date_format>
		<hr24_clock>1</hr24_clock>
		<ntp_dhcp_option>0</ntp_dhcp_option>
		<ntp_server>1</ntp_server>
		<ntp_server_addr>pool.ntp.org</ntp_server_addr>
		<ntp_server_update_interval>1000</ntp_server_update_interval>
		<timezone_dhcp_option>0</timezone_dhcp_option>
		<selected_timezone>Europe/Berlin</selected_timezone>
	</time_date>
	<profile>
		<admin>
			<access_password>{{{admin_password}}}</access_password>
		</admin>
	</profile>
	<remoteDir>
{{!-- LDAP settings --}}
{{#if_eq ldap_proxy 'off'}}

		
		<ldap_directory_name></ldap_directory_name>
		<ldap_number_filter></ldap_number_filter>
		<ldap_firstname_filter></ldap_firstname_filter>
		<ldap_lastname_filter></ldap_lastname_filter>
		<ldap_server_address></ldap_server_address>
		<ldap_port>389</ldap_port>
		<ldap_authentication_type>simple</ldap_authentication_type>
		<ldap_base></ldap_base>
		<ldap_user_name></ldap_user_name>
		<ldap_access_password></ldap_access_password>
		<ldap_max_hits>200</ldap_max_hits>
		<ldap_work_number_attributes></ldap_work_number_attributes>
		<ldap_mobile_number_attributes></ldap_mobile_number_attributes>
		<ldap_other_number_attributes></ldap_other_number_attributes>
		<ldap_protocol_version>version_3</ldap_protocol_version>
		<ldap_search_delay>0</ldap_search_delay>
		<ldap_incall_lookup_enable>0</ldap_incall_lookup_enable>
		<ldap_outcall_lookup_enable>0</ldap_outcall_lookup_enable>
		<ldap_enable>0</ldap_enable>
		<ldap_firstname_attribute></ldap_firstname_attribute>
		<ldap_lastname_attribute></ldap_lastname_attribute>
		<ldap_check_certificate>0</ldap_check_certificate>
		<broadsoft_enable>0</broadsoft_enable>
{{else}}

		
		<ldap_directory_name>pascom LDAP</ldap_directory_name>
		<ldap_server_address>{{{httpip}}}</ldap_server_address>
		<ldap_number_filter>(&amp;(telephoneNumber=%)(cn=*))</ldap_number_filter>
		<ldap_base>dc=phonebook,{{{ldap_suffix}}}</ldap_base>
		<ldap_access_password>{{{ldap_password}}}</ldap_access_password>
		<ldap_max_hits>200</ldap_max_hits>
		<ldap_work_number_attributes>telephoneNumber</ldap_work_number_attributes>
		<ldap_mobile_number_attributes>mobile</ldap_mobile_number_attributes>
		<ldap_other_number_attributes>telephoneNumber</ldap_other_number_attributes>
		<ldap_protocol_version>version_3</ldap_protocol_version>
		<ldap_search_delay>0</ldap_search_delay>
		<ldap_incall_lookup_enable>1</ldap_incall_lookup_enable>
		<ldap_outcall_lookup_enable>1</ldap_outcall_lookup_enable>
		<ldap_enable>1</ldap_enable>
		<ldap_firstname_attribute>cn</ldap_firstname_attribute>
		<ldap_lastname_attribute></ldap_lastname_attribute>
		<ldap_check_certificate>0</ldap_check_certificate>
		<broadsoft_enable>0</broadsoft_enable>
{{#if vpnconnection}}

		
		<ldap_port>389</ldap_port>
		<ldap_authentication_type>simple</ldap_authentication_type>
{{else}}

		
		<ldap_port>636</ldap_port>
		<ldap_authentication_type>ssl</ldap_authentication_type>
{{/if}}

		
		<ldap_firstname_filter>(|(cn=%)(sn=%))</ldap_firstname_filter>
		<ldap_lastname_filter>(|(cn=%)(sn=%))</ldap_lastname_filter>
		<ldap_user_name>cn={{{ldap_username}}},dc=devices,{{{ldap_suffix}}}</ldap_user_name>
{{/if_eq}}

	
	</remoteDir>
{{!-- SIP settings --}}

	
	<sip_account>
		<idx id="1">
			<sip_account_enable>1</sip_account_enable>
			<label>{{{displayname}}}</label>
			<display_name>{{{displayname}}}</display_name>
			<primary_outbound_proxy_server_address>{{{httpip}}}</primary_outbound_proxy_server_address>
			<user_id>{{{013pee_username}}}</user_id>
			<authentication_name>{{{013pee_username}}}</authentication_name>
			<authentication_access_password>{{{013pee_password}}}</authentication_access_password>
			<voice_encryption_enable>1</voice_encryption_enable>
			<primary_sip_server_address>{{{cs_domain}}}</primary_sip_server_address>
			<primary_registration_server_address>{{{cs_domain}}}</primary_registration_server_address>
			<unregister_after_reboot_enable>0</unregister_after_reboot_enable>
			<registration_retry_time>10</registration_retry_time>
			<mwi_subscription_expires>3600</mwi_subscription_expires>
			<primary_registration_expires>3600</primary_registration_expires>
			<access_code_retrieve_voicemail>{{{setting sys.asterisk.dialplan.global.voicebox.watched.value }}}</access_code_retrieve_voicemail>
{{#if_eq voip_sip 'tls'}}
            
			<primary_outbound_proxy_server_port>5061</primary_outbound_proxy_server_port>
			<transport_mode>tls</transport_mode>
			<primary_sip_server_port>5061</primary_sip_server_port>
			<primary_registration_server_port>5061</primary_registration_server_port>
			<local_sip_port>5061</local_sip_port>
{{else}}
    {{#if_eq voip_sip 'udp'}}
            
			<primary_outbound_proxy_server_port>5060</primary_outbound_proxy_server_port>
			<transport_mode>udp</transport_mode>
			<primary_sip_server_port>5060</primary_sip_server_port>
			<primary_registration_server_port>5060</primary_registration_server_port>
			<local_sip_port>5060</local_sip_port>
    {{else}}
             
			<primary_outbound_proxy_server_port>5060</primary_outbound_proxy_server_port>
			<transport_mode>tcp</transport_mode>
			<primary_sip_server_port>5060</primary_sip_server_port>
			<primary_registration_server_port>5060</primary_registration_server_port>
			<local_sip_port>5060</local_sip_port>
    {{/if_eq}}
{{/if_eq}}
			
			<codec_priority>
				<idx id="1">g711u</idx>
				<idx id="2">g711a</idx>
				<idx id="3">g729</idx>
				<idx id="4">g726</idx>
				<idx id="5">g722</idx>
			</codec_priority>
		</idx>
	</sip_account>
{{!-- Language --}}

	
	<user_pref>
		<language>de</language>
		<web_language>en</web_language>
	</user_pref>
</settings>
```

Save the basic configuration.

## Create/Add the Conference System

Insert under {{<ui-button "Devices">}}> {{<ui-button "Device list">}}
 a new device of type **IP-Telefon: Hersteller beliebig oder Softphone**. Now select the **new basic configuration** you created earlier (SNOM C520 conference).

Under the tab {{<ui-button "Assign">}} you give the conference device an user. Finally save!

## Provisioning the Conference System

Check the conference system in the device list and go to {{<ui-button "Action">}}> {{<ui-button "Provisioning URL">}} where you can
copy the **provisioning URL** to the clipboard.

With the IP address noted at the beginning, go to the web interface of your SNOM conference system. Under {{<ui-button "Servicing">}}> {{<ui-button "Provisioning">}}
you will find the **Server URL** field in which the **Provisioning URL** must be stored. Click on {{<ui-button "Save">}} and restart the conference system by clicking on {{<ui-button "Reboot">}}.
<br />
<br />
![Snom C520](SNOM_GUI.PNG?width=80%)