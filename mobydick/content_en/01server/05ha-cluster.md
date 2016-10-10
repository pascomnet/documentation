---
title: HA Cluster Setup
url: /server/cluster-setup/
prev:  /server/network-configuration/
next: /server/backup/
weight: 15
toc: true
keywords:
    - High Availability Cluster
    - HA Clusters
    - Telephone System Redundancies
description: The mobydick HA Cluster ensures continuity of telephony services
lang: en
linkde: /server/cluster-einrichten/
---




## Overview

![Overview Cluster](../../images/cluster_overview.png?width=90% "Cluster - Overview")

Currently, a mobydick Cluster may consist of **two nodes** in a failover configuration. This is different from a load balancing configuration, which is currently not supported. In a failover configuration, all mobydick services run on the current master node and are migrated to the slave node, should the master node fail.
Migration only takes **a few seconds**, however, all active calls will be interrupted.

### Equal Nodes
Both nodes can assume the same duties. If there is a need for a failover to occur, the current slave node assumes responsibility of the master node and takes over all services.  Therefore, switching nodes back to the original configuration after fixing a failed node is not necessary, as it would only result in the disruption of telephony services.

### Stickiness
After a failover, mobydick services remain with the new master node. When the failed node is put back into service, it is integrated as a slave and will not automatically take over responsibility of all mobydick services, again ensuring smooth continuation of telephony services in case of failover.

### Planning the network
To operate a mobydick cluster, each node needs to be equipped with two network interfaces. One interface is connected to the **telephony network**, the other to the **internal cluster network**.

![Illustration - Cluster Network](../../images/cluster_network.png?width=90% "mobydick Cluster Network")


#### Telephony network

Both nodes have a dedicated network card connecting to the telephony network. Each node needs **one IP address for the node** and **another IP address for the cluster**. The latter address always is assigned to the current master. Telephones and gateways in the telephony network exclusively register with the cluster IP address. The mobydick web interface can only be reached at the cluster IP address.

#### Internal cluster network
{{% notice note %}}
To minimise potential component failure, it is recommended to directly connect both nodes using the second network interface without a switch. A simple patch cable is sufficient (not crossover cable).
{{% /notice %}}

Any private IPv4 network range that is currently not used within the company can be used for the internal cluster network. One example of such a private network is *172.16.1.0/24*. To keep things simple, it is recommended to use a 24-bit Subnet address (255.255.255.0). In theory, a network range of 4 addresses (network address, IP address of node 1, IP address of node 2, broadcast address) would be enough.


## Configuration

### Installing mobydick on both nodes (optional)
All mobydick systems provided by pascom are delivered with a pre-installed version of mobydick. If you happen to use such a system, this step can be skipped.

If you do not have a pre-installed mobydick system, configure two identical machines as described in Installing mobydick. 

{{% notice note %}}
The cluster module is an additional add on licence. For further information, please contact our sales team on +49 991 29691-200
{{% /notice %}}

### Preparing the network settings on both nodes
Following the above instructions, you can configure network cards, one each for the **telephony** and the **internal cluster network** on **both** cluster nodes.

Log on to the mobydick web interface on both nodes and select **Appliance > Network interfaces**.

In our example, **eth0** will be configured for the **telephony network** and **eth1** will be configured for use with the **internal cluster network**.

This is the example configuration for the first node:

![Illustration - Network Node 1](../../images/cluster_net_node1.png?width=90% "Network Node 1")

Die Beispiel-Konfiguration auf der zweiten Node:

![Illustration - Netwerk Node 2](../../images/cluster_netzwerk_node2.png?width=90% "Netzwerk der Node 1")

For more details, please see Configuring the Network

### Configuring the host name on both nodes

{{% notice warning %}}
The host names of the nodes must not be identical!
{{% /notice %}}

Access the mobydick web interface on both nodes, and select **Appliance > Services** and enter the machines' host names in the corresponding field, e.g. use **node1** for the hostname of the first node and **node2** for the second node.


### Configuring the services of the master node
Decide which node should initially be used as the master node and log on to this node's web interface and select the menu ***Appliance > Services***.

Make sure the following services are configured and working on the master node:

* DNS server
* DHCP server (optional)
* NTP server
* E-Mail server
* Fax server (a basic configuration is required, even if the fax server is not going to be used)

For more details, please see Configuring the Network and Virtual Fax Server.

The services only need to be configured on the master node; the configuration is synchronised between the master and the node.

{{% notice note %}}
Do not forget to apply the changes.
{{% /notice %}}

{{% notice warning %}}
The services and network configurations cannot easily be changed after the cluster is activated.
{{% /notice %}}

### Activating the master node

Log on to the master node's mobydick web interface, select ***Appliance > Cluster Management*** and click on the ***Configure master*** button:


![Screenshot - Configuring Master](../../images/cluster_master_config.png?width=90% "activate Master Node 1")

|Parameter|Description|
|---------|----------|
|Current host name|The current host name of the node|
| Shared Cluster IP|The IP address of the cluster. It is automatically assigned to the current master node. Telephones and gateways in the telephony network only register with the cluster IP address. The mobydick web interface is only available at the cluster IP address.|
| Telephony network|Select the network interface you prepared for use with the telephony network.|
| Internal Cluster network |Select the network interface you prepared for use with the cluster network|
| E-mail for notification |Information regarding the cluster is sent to this address. Information is included on failover events or the failure and migration of services.|

When you have entered the required information, press the ***Configure*** button::
![Screenshot - Configuring Cluster Master](../../images/cluster_master_config.wait.png "Configuring Master")

If the configuration was successful, the mobydick server will reboot and display the following information:
![Screenshot - Cluster Master reboot ](../../images/cluster_master_config_reboot.png?width=90% "reboot master cluster")


When the node is available again, log on to the mobydick web interface at the cluster IP and select the menu Appliance > Cluster Administration. The status displayed should be similar to the example below:

![Screenshot - Cluster Master ready](../../images/cluster_master_ready.png?width=90% "mobydick Master ready")

### Preparing the slave node

{{% notice note %}}

Before logging on to the slave node, copy the SSH key of the master node to your computer's clipboard.
{{% /notice %}}

Log on the IP of the node which you have **initially** set to operate in slave mode. In the mobydick web interface, select the menu ***Appliance > Cluster Administration*** and click the ***Prepare slave*** button:

![Screenshot - Cluster preparing](../../images/cluster_slave_prepare.png?width=90% "prepare mobydick master cluster")

Insert the public SSH key you just copied from the master and press "Save".
This can take a short amount of time, so please wait while the slave is being configured:

![Screenshot - Cluster integration](../../images/cluster_slave_add_wait.png "mobydick Cluster integration")

After a successful configuration, the status of the slave should be shown as illustrated below:

![Screenshot - Cluster Slave ready](../../images/cluster_slave_ready.png?width=90% "mobydick Cluster ready")


### Adding a slave node
Log on to the **cluster IP of the current master node**. In the mobydick web interface, select the menu ***Appliance > Cluster Administration*** and click the ***Add slave*** button:

![Screenshot - add slave cluster](../../images/cluster_slave_add.png?width=90% "add mobydick cluster")

|Parameter|Description|
|---------|----------|
|Hostname |Host name of the slave node|
|Telephone Network IP of the slave node| IP address of the slave node in the telephony network|
|Sync IP des Slaves| IP address of the slave node in the internal cluster network |
|SSH key of the Master| The master SSH keys is only displayed for reference / info purposes only
                            Master node SSH key|


Enter the data and click the "apply" button:

![illustration- add slave Cluster Slave](../../images/cluster_slave_add_wait.png?width=90% "mobydick Cluster hinzufügen")

The slave is now part of the cluster and initial data synchronisation will be performed.

{{% notice note %}}
This process may take several minutes
{{% /notice %}}

Wait for the slave node to reboot. During the boot process, the slave node will register with the cluster. When the boot process is finished, the cluster should display the following status message:
![Illustration - Cluster integrated](../../images/cluster_finished.png?width=90% "adding mobydick Cluster finished")


## mobydick Cluster Update

### Overview

While the mobydick Cluster is running, the update mechanism cannot be used.

Updating the cluster requires the following steps:

* the slave node must be removed from the cluster and may be used as a backup
* the master node can now be updated by using the mobydick Updater
* when the update process for the master node was successful, the slave node can be re-integrated
* the master node will now update the slave node, including its firmware

### Configuration

#### Removing the Slave Node from the Cluster

Log onto the cluster IP. In the mobydick web interface, select the menu ***Appliance > Cluster Management***.

By clicking the ***Remove*** button, the slave node is removed from the cluster:

![Screenshot - remove Cluster slave Node](../../images/cluster_finished.png?width=90% "remove slave node")

{{% notice note %}}
This will remove the slave node from the cluster, but other than that it will not affect the cluster in any way. Active telephone calls are not interrupted by this process.
{{% /notice %}}

#### Updating the Master Node

Now, the master node can be updated by using the mobydick update mechanism.
Depending on the type of update, it may be necessary for the master node to perform a reboot.

#### Checking the Functionality of the Master Node

Perform the necessary checks to make sure the master node is still working correctly. Only re-integrate the slave node when the master node is working correctly again. This way, the state before the update is preserved on the slave node, which allows one to use it as a backup in case of failure.

#### Re-integrating the Slave Node

{{% notice warning %}}
When updating from an older version on mobydick to a mobydick 7.07.00 or newer, the slave node will appear within in the mobydick Commander UI as "Existing but not currently reachable". Please click Remove first, apply all suggested jobs and then please click again on Add Slave. The IP addresses and Hostname will be pre-entered and you will be able to continue adding the slave as normal.
{{% /notice %}}

Log onto the cluster IP. In the mobydick web interface, select the menu ***Appliance > Cluster Management***.
By clicking the ***Add Again button***, the slave node will be re-integrated into the cluster:

![Screenshot - Cluster Update Slave](../../images/cluster_failover_add_slave.png?width=90% "Slave Cluster Update")


mobydick caches the data of the slave node that was last used and will automatically suggest to use the cached data. Click the ***apply*** button:
![Screenshot - Cluster Update Slave](../../images/cluster_slave_add.png?width=50% "Slave in Detail")
The slave node will perform a reboot on successful re-integration. After the reboot, the cluster will be fully functional again.
 
## Failover und Monitoring

### Overview
mobydick Cluster uses the Icinga monitoring system to check cluster health.
Monitoring provides two different types of service checks:

* Failover checks
* Notify checks

#### Failover Checks

If a faulty system component triggers a "failover check" to go wrong, all services are migrated to the slave node. The slave node then becomes the new master node. The following table gives a list of checks that trigger a failover:

|                   |       |   Runs on master      | runs on slave|
|-------------------|-------|:-----------------------:|:----------------:|
|Master Node Alive  | Is the master node unreachable on both network interfaces? |  | <i class="fa fa-check-square" aria-hidden="true"></i> |
|Cluster Status     |  Does the cluster management report an error for the current master node? | <i class="fa fa-check-square" aria-hidden="true"></i> | | 
|3ware RAID (optional)|    Does the system have a RAID controller that reports a serious error?| <i class="fa fa-check-square" aria-hidden="true"></i> |  |    
|Network Failover  |Is the telephony network unreachable from the master node, but reachable from the slave node? |  | <i class="fa fa-check-square" aria-hidden="true"></i> |

#### Notify Checks
If a "notify check" fails, the system administrator is informed, however, no automatic failover is triggered. The system administrator can then decide whether to initiate a manual failsafe or not. A notify event is triggered by the following checks:


|                  |                                                                   |Läuft auf Master|Läuft auf Slave|
|-------------------|-------------------------------------------------------------------|:----:|:----:|
|Asterisk AMI       |Is the management interface of the Asterisk server still reachable?   |<i class="fa fa-check-square" aria-hidden="true"></i> |   | 
|Asterisk SIP      |Does the SIP stack still respond correctly?                               |<i class="fa fa-check-square" aria-hidden="true"></i> |   | 
|Database Query        |Can an SQL query be executed to conduct a sync test??         |<i class="fa fa-check-square" aria-hidden="true"></i> |   |
|Default Services  |Are all services running that are required by mobydick??                      |<i class="fa fa-check-square" aria-hidden="true"></i> |   |
|Disk Usage         |Is there enough free space on the hard disk??                     |<i class="fa fa-check-square" aria-hidden="true"></i> |<i class="fa fa-check-square" aria-hidden="true"></i> |
|Filesystem Sync    |Are the file systems of both nodes synchronised?                      |<i class="fa fa-check-square" aria-hidden="true"></i> |<i class="fa fa-check-square" aria-hidden="true"></i> |
|Time              |Is the system time correct?                                       |<i class="fa fa-check-square" aria-hidden="true"></i> |<i class="fa fa-check-square" aria-hidden="true"></i> |
|Rsync Server      |Does the rsync server correctly synchronize the file systems?            |    |<i class="fa fa-check-square" aria-hidden="true"></i> |
|Database Sync     |s the database synchronized with the database on the master?                          |  |<i class="fa fa-check-square" aria-hidden="true"></i> |

### Configuration

#### Querying the Service State
Log on to the cluster IP, access the mobydick web interface and select the ***Information > Service Status menu***:
![Screenshot - Cluster Monitoring](../../images/cluster_monitor.png?width=90% "Monitoring of the Cluster in mobydick")

You can also simply click on the green status indicator of this screen's job log display:
![Screenshot - status lamp](../../images/cluster_jobbox.png "Jobbox and status lamp in mobydick")

The job log display will change its colour from green to **yellow** to **red** when there are **warnings** or messages concerning **critical events**.


#### Re-integrating a Node after Failover

After a manual or automatic failover, the failed node is set to standby and needs to be integrated into the cluster again. For more information, please see the chapter mobydick High Availability Cluster Configuration.
Log on to the cluster IP and access the mobydick web interface. In the menu ***Appliance > Cluster Management***, re-integrate the slave node by clicking ***Add Again***.

![Screenshot - Cluster Update Slave](../../images/cluster_failover_add_slave.png?width=90% "Slave bei Cluster Update")

mobydick caches the data of the slave node that was last used and will automatically suggest to use the cached data. If the node was **replaced**, the data for the new node can be entered instead. In this case, it is however necessary to first copy the SSH key to the new node. For more information, please see mobydick High Availability Cluster Configuration. When you are finished with the configuration, click the ***Apply*** button to continue:

![Screenshot - Cluster Update Slave](../../images/cluster_slave-add.png?width=50% "Slave in detail")

//FixMe

Upon successful re-integration, the slave node will reboot. After the reboot, the cluster is fully restored again.
