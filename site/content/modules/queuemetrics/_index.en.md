---
title: QueueMetrics Integration
description: QueueMetrics is a Call Center Queue (Teams) Analytics software.
weight: 60
---

{{< doctype "both"  >}}

{{< description >}}

## Overview

QueueMetrics is a Contact Center Queues and Agents reporting tool as is a powerful addition to pascom's [Call Center Software](https://www.pascom.net/en/call-center/ "pascom Contact Center Solutions"). QueueMetrics should be installed on a separate server to your pascom phone system. QueueMetrics stores data in a MySQL database which can be located either on the same server as QueueMetrics or on any other server. If needed, your pascom PBX can write the data required for reporting to the MySQL server.

## Configuration

### Installing the QueueMetrics and MySQL server
QueueMetrics is contact center performance analysis solution from Loway. First, you will need to download the latest version of QueueMetrics and follow the instructions to set up the server. For the setup, you will also need a MySQL server. After a default installation procedure, follow the QueueMetrics instructions to customize the database and users accordingly. It is recommended to run QueueMetrics and MySQL on the same server.

The default setting for QueueMetrics is to not read the queues from the database but to try and find it in the local file /var/log/asterisk/queues.log

This behaviour can be changed in the **QueueMetrics web interface** in the menu `Administrative tools > Edit system parameters`:

    ..
    default.queue_log_file=sql:P001
    ..

### Preparing the MySQL Server for pascom

#### Check the bindings
To enable your phone system to write queue data to the MySQL server, external access must be enabled on the MySQL server. Sometimes, MySQL binds to localhost and therefore is unreachable from other computers. To check this, see the file **/etc/mysql/my.conf** and change the binding to **0.0.0.0** (file name and path can vary depending on your system environment).

    ..
    bind-address = 0.0.0.0
    ..
    
Then, restart the MySQL server:

    /etc/init.d/mysql restart

#### Adding users

It is recommended to use a separate user for the MySQL server instead of using the QueueMetrics user. Start the MySQL console:

    mysql -u root -p

Enter the root password for the MySQL server. Usually, this password is set during the installation of MySQL Server.


With the MySQL console, create a new user for the pascom phone system:

    mysql> grant all privileges on *.* to USERNAME@'%' identified by 'PASSWORD';

Replace USERNAME and PASSWORD with their respective values. This will grant USERNAME all permissions on all databases of the server. If, as advised, MySQL for QueueMetrics is run on a dedicated server, this is acceptable. Otherwise, access should be restricted.

#### Checking connections

Log on to the PBX using SSH and test the connection to the QueueMetrics database using the following command:

    mysql -h DB_HOST -u USERNAME --password=PASSWORT DB_NAME

Replace USERNAME and PASSWORD with their current values. DB_HOST is the host of the database, DB_NAME is the name of the QueueMetrics database.

### Configuring your pascom phone system

#### Connecting the QueueMetrics database
Log on to the pascom PBX web interface and select menu {{< ui-button "Advanced" >}} > {{< ui-button "QueueMetrics" >}}:


|Parameter|Description|
|---------|---------|
|QueueMetrics enabled| Selecting YES here will cause the PBX to start the service and write the queue data to the QueueMetrics database|
|IP/Host Mysql Server| Enter the address of the host of the MySQL server|
|DB Port|  The port for the MySQL server (default is 3306)|
|Database name|    The name of the QueueMetrics database|
|DB user name| The PBX username which has been granted access to the QueueMetrics database|
|DB password|  The corresponding password|
|QueueMetrics URL| The QueueMetrics server URL|
|API User| The API user for the QueueMetrics server|
|API Password| The API user password|

Save the configuration and apply the created jobs.

#### Asterisk Manager Interface Configuration

In order to communicate with the phone system Server, you will need to allow QueueMetrics access via the Asterisk Manager Interface (AMI)
To do this, you will need to (if you have not already done so) enable the AMI to allow public access which can be done via {{< ui-button "Appliance" >}} > {{< ui-button "Services" >}} and then selecting ***public*** under ***the Allowed AMI Connections*** within the **Telephony** tab as shown below:

 Next you will need to create a manager account for QueueMetrics with the pascom Web UI using the menu {{< ui-button "Appliance" >}} > {{< ui-button "Asterisk Manager" >}} accounts:

#### Creating a manager account
The manager account that you just created within the Web UI must now be added to QueueMetrics. This can be done in the menu {{< ui-button "Administrative Tools" >}} > {{< ui-button "Edit System Parameters" >}} of the QueueMetrics web interface:  

    ..
    callfile.dir=tcp:USERNAME:PASSWORT@PASCOM_HOST
    ..

Replace USERNAME and PASSWORD with the values of the manager account. Instead of using the PASCOM_HOST, enter the IP address or the host name of your pascom PBX server.

## Troubleshooting

### Ensuring Correct Data Transmission Between pascom IP PBX and QueueMetrics

To check whether that data has been correctly transferred from your pascom PBX to the QueueMetrics database, the file qloader.log can be used:

    root@pascom:/var/log/asterisk# tail /var/log/asterisk/qloader.log
     |Tue May 14 14:52:53 2013|QueueMetrics MySQL loader - $Revision: 1.29 $
     |Tue May 14 14:52:53 2013|Partition P001 - PID 9161 - TZ offset: 0 s. - Heartbeat after 900 s.
     |Tue May 14 14:52:53 2013|Now connecting to DB queuemetrics on 10.5.6.207 as user mobydick with password queuemetrics
     |Tue May 14 14:52:53 2013|Ignoring all timestamps below 0
     
### Testing the manager connection

Log on to the QueueMetrics web interface. The menu {{< ui-button "System diagnostic tool" >}} > {{< ui-button "AMI Testet" >}} allows you to test the connection to your pascom phone system. The result should be similar to the example below:

    Status
    AMI URL: tcp:queuemetrics:queuemetrics@10.5.6.77:5038
    callfile.agentremovemember_ht is OK
    callfile.agentaddmember_ht is OK
    callfile.agentlogoff is OK
    callfile.agentlogin is OK
    Skipping check for $EM@from-internal
    callfile.monitoring is OK
    Skipping check for $EM@from-internal
    callfile.customdial is OK
    ...
    Asterisk dialog was OK
    AMI Dialog took 6289 ms

<!-- ### QueueMetrics Jobs within the Commander
Should you have entered and saved everything correctly within the pascom PBX Web UI, then you will now need to apply two jobs

If the jobs have been executed correctly, then you should receive the following message:

Upon every telephony services application, QueueMetrics will be automatically synchronized: -->
