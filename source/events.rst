.. Licensed to the Apache Software Foundation (ASF) under one
   or more contributor license agreements.  See the NOTICE file
   distributed with this work for additional information#
   regarding copyright ownership.  The ASF licenses this file
   to you under the Apache License, Version 2.0 (the
   "License"); you may not use this file except in compliance
   with the License.  You may obtain a copy of the License at
   http://www.apache.org/licenses/LICENSE-2.0
   Unless required by applicable law or agreed to in writing,
   software distributed under the License is distributed on an
   "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
   KIND, either express or implied.  See the License for the
   specific language governing permissions and limitations
   under the License.
   

Events
======

Events
------------

An event is essentially a significant or meaningful change in the state
of both virtual and physical resources associated with a cloud
environment. Events are used by monitoring systems, usage and billing
systems, or any other event-driven workflow systems to discern a pattern
and make the right business decision. In CloudStack an event could be a
state change of virtual or physical resources, an action performed by an
user (action events), or policy based events (alerts).

Event Logs
~~~~~~~~~~~~~~~~~~

There are two types of events logged in the CloudStack Event Log.
Standard events log the success or failure of an event and can be used
to identify jobs or processes that have failed. There are also long
running job events. Events for asynchronous jobs log when a job is
scheduled, when it starts, and when it completes. Other long running
synchronous jobs log when a job starts, and when it completes. Long
running synchronous and asynchronous event logs can be used to gain more
information on the status of a pending job or can be used to identify a
job that is hanging or has not started. The following sections provide
more information on these events..

Event Notification
~~~~~~~~~~~~~~~~~~~~~~~~~~

Event notification framework provides a means for the Management Server
components to publish and subscribe to CloudStack events. Event
notification is achieved by implementing the concept of event bus
abstraction in the Management Server. An event bus is introduced in the
Management Server that allows the CloudStack components and extension
plug-ins to subscribe to the events by using the Advanced Message
Queuing Protocol (AMQP) client. In CloudStack, a default implementation
of event bus is provided as a plug-in that uses the RabbitMQ AMQP
client. The AMQP client pushes the published events to a compatible AMQP
server. Therefore all the CloudStack events are published to an exchange
in the AMQP server.

A new event for state change, resource state change, is introduced as
part of Event notification framework. Every resource, such as user VM,
volume, NIC, network, public IP, snapshot, and template, is associated
with a state machine and generates events as part of the state change.
That implies that a change in the state of a resource results in a state
change event, and the event is published in the corresponding state
machine on the event bus. All the CloudStack events (alerts, action
events, usage events) and the additional category of resource state
change events, are published on to the events bus.

Use Cases
'''''''''

The following are some of the use cases:

-  

   Usage or Billing Engines: A third-party cloud usage solution can
   implement a plug-in that can connects to CloudStack to subscribe to
   CloudStack events and generate usage data. The usage data is consumed
   by their usage software.

-  

   AMQP plug-in can place all the events on the a message queue, then a
   AMQP message broker can provide topic-based notification to the
   subscribers.

-  

   Publish and Subscribe notification service can be implemented as a
   pluggable service in CloudStack that can provide rich set of APIs for
   event notification, such as topics-based subscription and
   notification. Additionally, the pluggable service can deal with
   multi-tenancy, authentication, and authorization issues.

Configuration
'''''''''''''

As a CloudStack administrator, perform the following one-time
configuration to enable event notification framework. At run time no
changes can control the behaviour.

#. 

   Open ``'componentContext.xml``.

#. 

   Define a bean named ``eventNotificationBus`` as follows:

   -  

      name : Specify a name for the bean.

   -  

      server : The name or the IP address of the RabbitMQ AMQP server.

   -  

      port : The port on which RabbitMQ server is running.

   -  

      username : The username associated with the account to access the
      RabbitMQ server.

   -  

      password : The password associated with the username of the
      account to access the RabbitMQ server.

   -  

      exchange : The exchange name on the RabbitMQ server where
      CloudStack events are published.

      A sample bean is given below:

      .. code:: bash

          <bean id="eventNotificationBus" class="org.apache.cloudstack.mom.rabbitmq.RabbitMQEventBus">
              <property name="name" value="eventNotificationBus"/>
              <property name="server" value="127.0.0.1"/>
              <property name="port" value="5672"/>
              <property name="username" value="guest"/>
              <property name="password" value="guest"/>
             <property name="exchange" value="cloudstack-events"/>
             </bean>

      The ``eventNotificationBus`` bean represents the
      ``org.apache.cloudstack.mom.rabbitmq.RabbitMQEventBus`` class.

#. 

   Restart the Management Server.

Standard Events
~~~~~~~~~~~~~~~~~~~~~~~

The events log records three types of standard events.

-  

   INFO. This event is generated when an operation has been successfully
   performed.

-  

   WARN. This event is generated in the following circumstances.

   -  

      When a network is disconnected while monitoring a template
      download.

   -  

      When a template download is abandoned.

   -  

      When an issue on the storage server causes the volumes to fail
      over to the mirror storage server.

-  

   ERROR. This event is generated when an operation has not been
   successfully performed

Long Running Job Events
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The events log records three types of standard events.

-  

   INFO. This event is generated when an operation has been successfully
   performed.

-  

   WARN. This event is generated in the following circumstances.

   -  

      When a network is disconnected while monitoring a template
      download.

   -  

      When a template download is abandoned.

   -  

      When an issue on the storage server causes the volumes to fail
      over to the mirror storage server.

-  

   ERROR. This event is generated when an operation has not been
   successfully performed

Event Log Queries
~~~~~~~~~~~~~~~~~~~~~~~~~

Database logs can be queried from the user interface. The list of events
captured by the system includes:

-  

   Virtual machine creation, deletion, and on-going management
   operations

-  

   Virtual router creation, deletion, and on-going management operations

-  

   Template creation and deletion

-  

   Network/load balancer rules creation and deletion

-  

   Storage volume creation and deletion

-  

   User login and logout

Deleting and Archiving Events and Alerts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

CloudStack provides you the ability to delete or archive the existing
alerts and events that you no longer want to implement. You can
regularly delete or archive any alerts or events that you cannot, or do
not want to resolve from the database.

You can delete or archive individual alerts or events either directly by
using the Quickview or by using the Details page. If you want to delete
multiple alerts or events at the same time, you can use the respective
context menu. You can delete alerts or events by category for a time
period. For example, you can select categories such as **USER.LOGOUT**,
**VM.DESTROY**, **VM.AG.UPDATE**, **CONFIGURATION.VALUE.EDI**, and so
on. You can also view the number of events or alerts archived or
deleted.

In order to support the delete or archive alerts, the following global
parameters have been added:

-  

   **alert.purge.delay**: The alerts older than specified number of days
   are purged. Set the value to 0 to never purge alerts automatically.

-  

   **alert.purge.interval**: The interval in seconds to wait before
   running the alert purge thread. The default is 86400 seconds (one
   day).

.. note:: Archived alerts or events cannot be viewed in the UI or by using the
API. They are maintained in the database for auditing or compliance
purposes.

Permissions
^^^^^^^^^^^^^^^^^^^^^

Consider the following:

-  

   The root admin can delete or archive one or multiple alerts or
   events.

-  

   The domain admin or end user can delete or archive one or multiple
   events.

Procedure
^^^^^^^^^^^^^^^^^^^

#. 

   Log in as administrator to the CloudStack UI.

#. 

   In the left navigation, click Events.

#. 

   Perform either of the following:

   -  

      To archive events, click Archive Events, and specify event type
      and date.

   -  

      To archive events, click Delete Events, and specify event type and
      date.

#. 

   Click OK.

Working with Server Logs
------------------------------

The CloudStack Management Server logs all web site, middle tier, and
database activities for diagnostics purposes in
/var/log/cloudstack/management/. The CloudStack logs a variety of error
messages. We recommend this command to find the problematic output in
the Management Server log:.

.. note:: When copying and pasting a command, be sure the command has pasted as a
single line before executing. Some document viewers may introduce
unwanted line breaks in copied text.

.. code:: bash

            grep -i -E 'exception|unable|fail|invalid|leak|warn|error' /var/log/cloudstack/management/management-server.log

The CloudStack processes requests with a Job ID. If you find an error in
the logs and you are interested in debugging the issue you can grep for
this job ID in the management server log. For example, suppose that you
find the following ERROR message:

.. code:: bash

            2010-10-04 13:49:32,595 ERROR [cloud.vm.UserVmManagerImpl] (Job-Executor-11:job-1076) Unable to find any host for [User|i-8-42-VM-untagged]

Note that the job ID is 1076. You can track back the events relating to
job 1076 with the following grep:

.. code:: bash

            grep "job-1076)" management-server.log

The CloudStack Agent Server logs its activities in
/var/log/cloudstack/agent/.

Data Loss on Exported Primary Storage
-------------------------------------------

Symptom
'''''''

Loss of existing data on primary storage which has been exposed as a
Linux NFS server export on an iSCSI volume.

Cause
'''''

It is possible that a client from outside the intended pool has mounted
the storage. When this occurs, the LVM is wiped and all data in the
volume is lost

Solution
''''''''

When setting up LUN exports, restrict the range of IP addresses that are
allowed access by specifying a subnet mask. For example:

.. code:: bash

    echo “/export 192.168.1.0/24(rw,async,no_root_squash,no_subtree_check)” > /etc/exports

Adjust the above command to suit your deployment needs.

More Information
''''''''''''''''

See the export procedure in the "Secondary Storage" section of the
CloudStack Installation Guide

Recovering a Lost Virtual Router
--------------------------------------

Symptom
'''''''

A virtual router is running, but the host is disconnected. A virtual
router no longer functions as expected.

Cause
'''''

The Virtual router is lost or down.

Solution
''''''''

If you are sure that a virtual router is down forever, or no longer
functions as expected, destroy it. You must create one afresh while
keeping the backup router up and running (it is assumed this is in a
redundant router setup):

-  

   Force stop the router. Use the stopRouter API with forced=true
   parameter to do so.

-  

   Before you continue with destroying this router, ensure that the
   backup router is running. Otherwise the network connection will be
   lost.

-  

   Destroy the router by using the destroyRouter API.

Recreate the missing router by using the restartNetwork API with
cleanup=false parameter. For more information about redundant router
setup, see Creating a New Network Offering.

For more information about the API syntax, see the API Reference at
`http://docs.cloudstack.org/CloudStack\_Documentation/API\_Reference%3A\_CloudStack <http://docs.cloudstack.org/CloudStack_Documentation/API_Reference%3A_CloudStack>`__\ API
Reference.

Maintenance mode not working on vCenter
---------------------------------------------

Symptom
'''''''

Host was placed in maintenance mode, but still appears live in vCenter.

Cause
'''''

The CloudStack administrator UI was used to place the host in scheduled
maintenance mode. This mode is separate from vCenter's maintenance mode.

Solution
''''''''

Use vCenter to place the host in maintenance mode.

More Information
''''''''''''''''

See `Section 11.2, “Scheduled Maintenance and Maintenance Mode for
Hosts” <#scheduled-maintenance-maintenance-mode-hosts>`__

Unable to deploy VMs from uploaded vSphere template
---------------------------------------------------------

Symptom
'''''''

When attempting to create a VM, the VM will not deploy.

Cause
'''''

If the template was created by uploading an OVA file that was created
using vSphere Client, it is possible the OVA contained an ISO image. If
it does, the deployment of VMs from the template will fail.

Solution
''''''''

Remove the ISO and re-upload the template.

Unable to power on virtual machine on VMware
--------------------------------------------------

Symptom
'''''''

Virtual machine does not power on. You might see errors like:

-  

   Unable to open Swap File

-  

   Unable to access a file since it is locked

-  

   Unable to access Virtual machine configuration

Cause
'''''

A known issue on VMware machines. ESX hosts lock certain critical
virtual machine files and file systems to prevent concurrent changes.
Sometimes the files are not unlocked when the virtual machine is powered
off. When a virtual machine attempts to power on, it can not access
these critical files, and the virtual machine is unable to power on.

Solution
''''''''

See the following:

`VMware Knowledge Base
Article <http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=10051/>`__

Load balancer rules fail after changing network offering
--------------------------------------------------------------

Symptom
'''''''

After changing the network offering on a network, load balancer rules
stop working.

Cause
'''''

Load balancing rules were created while using a network service offering
that includes an external load balancer device such as NetScaler, and
later the network service offering changed to one that uses the
CloudStack virtual router.

Solution
''''''''

Create a firewall rule on the virtual router for each of your existing
load balancing rules so that they continue to function.

The following time zone identifiers are accepted by CloudStack. There
are several places that have a time zone as a required or optional
parameter. These include scheduling recurring snapshots, creating a
user, and specifying the usage time zone in the Configuration table.

Etc/GMT+12

Etc/GMT+11

Pacific/Samoa

Pacific/Honolulu

US/Alaska

America/Los\_Angeles

Mexico/BajaNorte

US/Arizona

US/Mountain

America/Chihuahua

America/Chicago

America/Costa\_Rica

America/Mexico\_City

Canada/Saskatchewan

America/Bogota

America/New\_York

America/Caracas

America/Asuncion

America/Cuiaba

America/Halifax

America/La\_Paz

America/Santiago

America/St\_Johns

America/Araguaina

America/Argentina/Buenos\_Aires

America/Cayenne

America/Godthab

America/Montevideo

Etc/GMT+2

Atlantic/Azores

Atlantic/Cape\_Verde

Africa/Casablanca

Etc/UTC

Atlantic/Reykjavik

Europe/London

CET

Europe/Bucharest

Africa/Johannesburg

Asia/Beirut

Africa/Cairo

Asia/Jerusalem

Europe/Minsk

Europe/Moscow

Africa/Nairobi

Asia/Karachi

Asia/Kolkata

Asia/Bangkok

Asia/Shanghai

Asia/Kuala\_Lumpur

Australia/Perth

Asia/Taipei

Asia/Tokyo

Asia/Seoul

Australia/Adelaide

Australia/Darwin

Australia/Brisbane

Australia/Canberra

Pacific/Guam

Pacific/Auckland

Types

Events

VM

VM.CREATE

VM.DESTROY

VM.START

VM.STOP

VM.REBOOT

VM.UPDATE

VM.UPGRADE

VM.DYNAMIC.SCALE

VM.RESETPASSWORD

VM.RESETSSHKEY

VM.MIGRATE

VM.MOVE

VM.RESTORE

Domain Router

ROUTER.CREATE

ROUTER.DESTROY

ROUTER.START

ROUTER.STOP

ROUTER.REBOOT

ROUTER.HA

ROUTER.UPGRADE

Console proxy

PROXY.CREATE

PROXY.DESTROY

PROXY.START

PROXY.STOP

PROXY.REBOOT

PROXY.HA

VNC Console Events

VNC.CONNECT

VNC.DISCONNECT

Network Events

NET.IPASSIGN

NET.IPRELEASE

PORTABLE.IPASSIGN

PORTABLE.IPRELEASE

NET.RULEADD

NET.RULEDELETE

NET.RULEMODIFY

NETWORK.CREATE

NETWORK.DELETE

NETWORK.UPDATE

FIREWALL.OPEN

FIREWALL.CLOSE

NIC Events

NIC.CREATE

NIC.DELETE

NIC.UPDATE

NIC.DETAIL.ADD

NIC.DETAIL.UPDATE

NIC.DETAIL.REMOVE

Load Balancers

LB.ASSIGN.TO.RULE

LB.REMOVE.FROM.RULE

LB.CREATE

LB.DELETE

LB.STICKINESSPOLICY.CREATE

LB.STICKINESSPOLICY.DELETE

LB.HEALTHCHECKPOLICY.CREATE

LB.HEALTHCHECKPOLICY.DELETE

LB.UPDATE

Global Load Balancer rules

GLOBAL.LB.ASSIGN

GLOBAL.LB.REMOVE

GLOBAL.LB.CREATE

GLOBAL.LB.DELETE

GLOBAL.LB.UPDATE

Account events

ACCOUNT.ENABLE

ACCOUNT.DISABLE

ACCOUNT.CREATE

ACCOUNT.DELETE

ACCOUNT.UPDATE

ACCOUNT.MARK.DEFAULT.ZONE

UserVO Events

USER.LOGIN

USER.LOGOUT

USER.CREATE

USER.DELETE

USER.DISABLE

USER.UPDATE

USER.ENABLE

USER.LOCK

Registering SSH keypair events

REGISTER.SSH.KEYPAIR

Register for user API and secret keys

REGISTER.USER.KEY

Template Events

TEMPLATE.CREATE

TEMPLATE.DELETE

TEMPLATE.UPDATE

TEMPLATE.DOWNLOAD.START

TEMPLATE.DOWNLOAD.SUCCESS

TEMPLATE.DOWNLOAD.FAILED

TEMPLATE.COPY

TEMPLATE.EXTRACT

TEMPLATE.UPLOAD

TEMPLATE.CLEANUP

Volume Events

VOLUME.CREATE

VOLUME.DELETE

VOLUME.ATTACH

VOLUME.DETACH

VOLUME.EXTRACT

VOLUME.UPLOAD

VOLUME.MIGRATE

VOLUME.RESIZE

VOLUME.DETAIL.UPDATE

VOLUME.DETAIL.ADD

VOLUME.DETAIL.REMOVE

Domains

DOMAIN.CREATE

DOMAIN.DELETE

DOMAIN.UPDATE

Snapshots

SNAPSHOT.CREATE

SNAPSHOT.DELETE

SNAPSHOTPOLICY.CREATE

SNAPSHOTPOLICY.UPDATE

SNAPSHOTPOLICY.DELETE

ISO

ISO.CREATE

ISO.DELETE

ISO.COPY

ISO.ATTACH

ISO.DETACH

ISO.EXTRACT

ISO.UPLOAD

SSVM

SSVM.CREATE

SSVM.DESTROY

SSVM.START

SSVM.STOP

SSVM.REBOOT

SSVM.HA

Service Offerings

SERVICE.OFFERING.CREATE

SERVICE.OFFERING.EDIT

SERVICE.OFFERING.DELETE

Disk Offerings

DISK.OFFERING.CREATE

DISK.OFFERING.EDIT

DISK.OFFERING.DELETE

Network offerings

NETWORK.OFFERING.CREATE

NETWORK.OFFERING.ASSIGN

NETWORK.OFFERING.EDIT

NETWORK.OFFERING.REMOVE

NETWORK.OFFERING.DELETE

Pods

POD.CREATE

POD.EDIT

POD.DELETE

Zones

ZONE.CREATE

ZONE.EDIT

ZONE.DELETE

VLANs/IP ranges

VLAN.IP.RANGE.CREATE

VLAN.IP.RANGE.DELETE

VLAN.IP.RANGE.DEDICATE

VLAN.IP.RANGE.RELEASE

STORAGE.IP.RANGE.CREATE

STORAGE.IP.RANGE.DELETE

STORAGE.IP.RANGE.UPDATE

Configuration Table

CONFIGURATION.VALUE.EDIT

Security Groups

SG.AUTH.INGRESS

SG.REVOKE.INGRESS

SG.AUTH.EGRESS

SG.REVOKE.EGRESS

SG.CREATE

SG.DELETE

SG.ASSIGN

SG.REMOVE

Host

HOST.RECONNECT

Maintenance

MAINT.CANCEL

MAINT.CANCEL.PS

MAINT.PREPARE

MAINT.PREPARE.PS

VPN

VPN.REMOTE.ACCESS.CREATE

VPN.REMOTE.ACCESS.DESTROY

VPN.USER.ADD

VPN.USER.REMOVE

VPN.S2S.VPN.GATEWAY.CREATE

VPN.S2S.VPN.GATEWAY.DELETE

VPN.S2S.CUSTOMER.GATEWAY.CREATE

VPN.S2S.CUSTOMER.GATEWAY.DELETE

VPN.S2S.CUSTOMER.GATEWAY.UPDATE

VPN.S2S.CONNECTION.CREATE

VPN.S2S.CONNECTION.DELETE

VPN.S2S.CONNECTION.RESET

Network

NETWORK.RESTART

Custom certificates

UPLOAD.CUSTOM.CERTIFICATE

OneToOnenat

STATICNAT.ENABLE

STATICNAT.DISABLE

ZONE.VLAN.ASSIGN

ZONE.VLAN.RELEASE

Projects

PROJECT.CREATE

PROJECT.UPDATE

PROJECT.DELETE

PROJECT.ACTIVATE

PROJECT.SUSPEND

PROJECT.ACCOUNT.ADD

PROJECT.INVITATION.UPDATE

PROJECT.INVITATION.REMOVE

PROJECT.ACCOUNT.REMOVE

Network as a Service

NETWORK.ELEMENT.CONFIGURE

Physical Network Events

PHYSICAL.NETWORK.CREATE

PHYSICAL.NETWORK.DELETE

PHYSICAL.NETWORK.UPDATE

Physical Network Service Provider Events

SERVICE.PROVIDER.CREATE

SERVICE.PROVIDER.DELETE

SERVICE.PROVIDER.UPDATE

Physical Network Traffic Type Events

TRAFFIC.TYPE.CREATE

TRAFFIC.TYPE.DELETE

TRAFFIC.TYPE.UPDATE

External network device events

PHYSICAL.LOADBALANCER.ADD

PHYSICAL.LOADBALANCER.DELETE

PHYSICAL.LOADBALANCER.CONFIGURE

External switch management device events

For example: Cisco Nexus 1000v Virtual Supervisor Module.

SWITCH.MGMT.ADD

SWITCH.MGMT.DELETE

SWITCH.MGMT.CONFIGURE

SWITCH.MGMT.ENABLE

SWITCH.MGMT.DISABLE

PHYSICAL.FIREWALL.ADD

PHYSICAL.FIREWALL.DELETE

PHYSICAL.FIREWALL.CONFIGURE

VPC

VPC.CREATE

VPC.UPDATE

VPC.DELETE

VPC.RESTART

Network ACL

NETWORK.ACL.CREATE

NETWORK.ACL.DELETE

NETWORK.ACL.REPLACE

NETWORK.ACL.ITEM.CREATE

NETWORK.ACL.ITEM.UPDATE

NETWORK.ACL.ITEM.DELETE

VPC offerings

VPC.OFFERING.CREATE

VPC.OFFERING.UPDATE

VPC.OFFERING.DELETE

Private gateway

PRIVATE.GATEWAY.CREATE

PRIVATE.GATEWAY.DELETE

Static routes

STATIC.ROUTE.CREATE

STATIC.ROUTE.DELETE

Tag-related events

CREATE\_TAGS

DELETE\_TAGS

Meta data-related events

CREATE\_RESOURCE\_DETAILS

DELETE\_RESOURCE\_DETAILS

VM snapshot events

VMSNAPSHOT.CREATE

VMSNAPSHOT.DELETE

VMSNAPSHOT.REVERTTO

External network device events

PHYSICAL.NVPCONTROLLER.ADD

PHYSICAL.NVPCONTROLLER.DELETE

PHYSICAL.NVPCONTROLLER.CONFIGURE

AutoScale

COUNTER.CREATE

COUNTER.DELETE

CONDITION.CREATE

CONDITION.DELETE

AUTOSCALEPOLICY.CREATE

AUTOSCALEPOLICY.UPDATE

AUTOSCALEPOLICY.DELETE

AUTOSCALEVMPROFILE.CREATE

AUTOSCALEVMPROFILE.DELETE

AUTOSCALEVMPROFILE.UPDATE

AUTOSCALEVMGROUP.CREATE

AUTOSCALEVMGROUP.DELETE

AUTOSCALEVMGROUP.UPDATE

AUTOSCALEVMGROUP.ENABLE

AUTOSCALEVMGROUP.DISABLE

PHYSICAL.DHCP.ADD

PHYSICAL.DHCP.DELETE

PHYSICAL.PXE.ADD

PHYSICAL.PXE.DELETE

AG.CREATE

AG.DELETE

AG.ASSIGN

AG.REMOVE

VM.AG.UPDATE

INTERNALLBVM.START

INTERNALLBVM.STOP

HOST.RESERVATION.RELEASE

Dedicated guest vlan range

GUESTVLANRANGE.DEDICATE

GUESTVLANRANGE.RELEASE

PORTABLE.IP.RANGE.CREATE

PORTABLE.IP.RANGE.DELETE

PORTABLE.IP.TRANSFER

Dedicated Resources

DEDICATE.RESOURCE

DEDICATE.RESOURCE.RELEASE

VM.RESERVATION.CLEANUP

UCS.ASSOCIATEPROFILE

UCS.DISASSOCIATEPROFILE

The following is the list of alert type numbers. The current alerts can
be found by calling listAlerts.

.. code:: bash

    MEMORY = 0 // Available Memory below configured threshold

.. code:: bash

    CPU = 1 // Unallocated CPU below configured threshold

.. code:: bash

    STORAGE =2 // Available Storage below configured threshold

.. code:: bash

    STORAGE_ALLOCATED = 3 // Remaining unallocated Storage is below configured threshold

.. code:: bash

    PUBLIC_IP = 4 // Number of unallocated virtual network public IPs is below configured threshold

.. code:: bash

    PRIVATE_IP = 5 // Number of unallocated private IPs is below configured threshold

.. code:: bash

    SECONDARY_STORAGE = 6 //  Available Secondary Storage in availability zone is below configured threshold

.. code:: bash

    HOST = 7 // Host related alerts like host disconnected

.. code:: bash

    USERVM = 8 // User VM stopped unexpectedly

.. code:: bash

    DOMAIN_ROUTER = 9 // Domain Router VM stopped unexpectedly

.. code:: bash

    CONSOLE_PROXY = 10 // Console Proxy VM stopped unexpectedly

.. code:: bash

    ROUTING = 11 // Lost connection to default route (to the gateway)

.. code:: bash

    STORAGE_MISC = 12 // Storage issue in system VMs

.. code:: bash

    USAGE_SERVER = 13 // No usage server process running

.. code:: bash

    MANAGMENT_NODE = 14 // Management network CIDR is not configured originally

.. code:: bash

    DOMAIN_ROUTER_MIGRATE = 15 // Domain Router VM Migration was unsuccessful

.. code:: bash

    CONSOLE_PROXY_MIGRATE = 16 // Console Proxy VM Migration was unsuccessful

.. code:: bash

    USERVM_MIGRATE = 17 // User VM Migration was unsuccessful

.. code:: bash

    VLAN = 18 // Number of unallocated VLANs is below configured threshold in availability zone

.. code:: bash

    SSVM = 19 // SSVM stopped unexpectedly

.. code:: bash

    USAGE_SERVER_RESULT = 20 // Usage job failed

.. code:: bash

    STORAGE_DELETE = 21 // Failed to delete storage pool

.. code:: bash

    UPDATE_RESOURCE_COUNT = 22 // Failed to update the resource count

.. code:: bash

    USAGE_SANITY_RESULT = 23 // Usage Sanity Check failed

.. code:: bash

    DIRECT_ATTACHED_PUBLIC_IP = 24 // Number of unallocated shared network IPs is low in availability zone

.. code:: bash

    LOCAL_STORAGE = 25 // Remaining unallocated Local Storage is below configured threshold

.. code:: bash

    RESOURCE_LIMIT_EXCEEDED = 26 //Generated when the resource limit exceeds the limit. Currently used for recurring snapshots only

.. |1000-foot-view.png: Overview of CloudStack| image:: ./_static/images/1000-foot-view.png
.. |basic-deployment.png: Basic two-machine deployment| image:: ./_static/images/basic-deployment.png
.. |infrastructure\_overview.png: Nested organization of a zone| image:: ./_static/images/infrastructure-overview.png
.. |region-overview.png: Nested structure of a region.| image:: ./_static/images/region-overview.png
.. |zone-overview.png: Nested structure of a simple zone.| image:: ./_static/images/zone-overview.png
.. |pod-overview.png: Nested structure of a simple pod| image:: ./_static/images/pod-overview.png
.. |cluster-overview.png: Structure of a simple cluster| image:: ./_static/images/cluster-overview.png
.. |dedicate-resource-button.png: button to dedicate a zone, pod, cluster, or host| image:: ./_static/images/dedicate-resource-button.png
.. |change-password.png: button to change a user's password| image:: ./_static/images/change-password.png
.. |searchbutton.png: Searches projects| image:: ./_static/images/search-button.png
.. |editbutton.png: Edits parameters| image:: ./_static/images/edit-icon.png
.. |deletebutton.png: Removes a project| image:: ./_static/images/delete-button.png
.. |deletebutton.png: suspends a project| image:: ./_static/images/suspend-icon.png
.. |provisioning-overview.png: Conceptual overview of a basic deployment| image:: ./_static/images/provisioning-overview.png
.. |vsphereclient.png: vSphere client| image:: ./_static/images/vsphere-client.png
.. |addcluster.png: add a cluster| image:: ./_static/images/add-cluster.png
.. |ConsoleButton.png: button to launch a console| image:: ./_static/images/console-icon.png
.. |basic-deployment.png: Basic two-machine CloudStack deployment| image:: ./_static/images/vm-lifecycle.png
.. |image20| image:: ./_static/images/view-console-button.png
.. |change-affinity-button.png: button to assign an affinity group to a virtual machine| image:: ./_static/images/change-affinity-button.png
.. |image22| image:: ./_static/images/SnapshotButton.png
.. |image23| image:: ./_static/images/delete-button.png
.. |image24| image:: ./_static/images/revert-vm.png
.. |StopButton.png: button to stop a VM| image:: ./_static/images/stop-instance-icon.png
.. |EditButton.png: button to edit the properties of a VM| image:: ./_static/images/edit-icon.png
.. |ChangeServiceButton.png: button to change the service of a VM| image:: ./_static/images/change-service-icon.png
.. |Migrateinstance.png: button to migrate an instance| image:: ./_static/images/migrate-instance.png
.. |Destroyinstance.png: button to destroy an instance| image:: ./_static/images/destroy-instance.png
.. |iso.png: depicts adding an iso image| image:: ./_static/images/iso-icon.png
.. |enable-disable.png: button to enable or disable zone, pod, or cluster.| image:: ./_static/images/enable-disable.png
.. |image32| image:: ./_static/images/enable-disable.png
.. |edit-icon.png: button to edit the VLAN range.| image:: ./_static/images/edit-icon.png
.. |sysmanager.png: System Image Manager| image:: ./_static/images/sysmanager.png
.. |software-license.png: Depicts hiding the EULA page.| image:: ./_static/images/software-license.png
.. |change-admin-password.png: Depicts changing the administrator password| image:: ./_static/images/change-admin-password.png
.. |AttachDiskButton.png: button to attach a volume| image:: ./_static/images/attach-disk-icon.png
.. |DetachDiskButton.png: button to detach a volume| image:: ./_static/images/detach-disk-icon.png
.. |Migrateinstance.png: button to migrate a volume| image:: ./_static/images/migrate-instance.png
.. |Migrateinstance.png: button to migrate a VM or volume| image:: ./_static/images/migrate-instance.png
.. |resize-volume-icon.png: button to display the resize volume option.| image:: ./_static/images/resize-volume-icon.png
.. |resize-volume.png: option to resize a volume.| image:: ./_static/images/resize-volume.png
.. |image43| image:: ./_static/images/SnapshotButton.png
.. |editbutton.png: edits the settings.| image:: ./_static/images/edit-icon.png
.. |editbutton.png: edits the settings| image:: ./_static/images/edit-icon.png
.. |guest-traffic-setup.png: Depicts a guest traffic setup| image:: ./_static/images/guest-traffic-setup.png
.. |networksinglepod.png: diagram showing logical view of network in a pod| image:: ./_static/images/network-singlepod.png
.. |networksetupzone.png: Depicts network setup in a single zone| image:: ./_static/images/network-setup-zone.png
.. |addguestnetwork.png: Add Guest network setup in a single zone| image:: ./_static/images/add-guest-network.png
.. |remove-nic.png: button to remove a NIC| image:: ./_static/images/remove-nic.png
.. |set-default-nic.png: button to set a NIC as default one.| image:: ./_static/images/set-default-nic.png
.. |EditButton.png: button to edit a network| image:: ./_static/images/edit-icon.png
.. |edit-icon.png: button to edit a network| image:: ./_static/images/edit-icon.png
.. |addAccount-icon.png: button to assign an IP range to an account.| image:: ./_static/images/addAccount-icon.png
.. |eip-ns-basiczone.png: Elastic IP in a NetScaler-enabled Basic Zone.| image:: ./_static/images/eip-ns-basiczone.png
.. |add-ip-range.png: adding an IP range to a network.| image:: ./_static/images/add-ip-range.png
.. |httpaccess.png: allows inbound HTTP access from anywhere| image:: ./_static/images/http-access.png
.. |autoscaleateconfig.png: Configuring AutoScale| image:: ./_static/images/autoscale-config.png
.. |EnableDisable.png: button to enable or disable AutoScale.| image:: ./_static/images/enable-disable-autoscale.png
.. |gslb.png: GSLB architecture| image:: ./_static/images/gslb.png
.. |gslb-add.png: adding a gslb rule| image:: ./_static/images/add-gslb.png
.. |ReleaseIPButton.png: button to release an IP| image:: ./_static/images/release-ip-icon.png
.. |enabledisablenat.png: button to enable/disable NAT| image:: ./_static/images/enable-disable.png
.. |egress-firewall-rule.png: adding an egress firewall rule| image:: ./_static/images/egress-firewall-rule.png
.. |EnableVPNButton.png: button to enable a VPN| image:: ./_static/images/vpn-icon.png
.. |vpn-icon.png: button to enable VPN| image:: ./_static/images/vpn-icon.png
.. |addvpncustomergateway.png: adding a customer gateway.| image:: ./_static/images/add-vpn-customer-gateway.png
.. |edit.png: button to edit a VPN customer gateway| image:: ./_static/images/edit-icon.png
.. |delete.png: button to remove a VPN customer gateway| image:: ./_static/images/delete-button.png
.. |createvpnconnection.png: creating a VPN connection to the customer gateway.| image:: ./_static/images/create-vpn-connection.png
.. |remove-vpn.png: button to remove a VPN connection| image:: ./_static/images/remove-vpn.png
.. |reset-vpn.png: button to reset a VPN connection| image:: ./_static/images/reset-vpn.png
.. |mutltier.png: a multi-tier setup.| image:: ./_static/images/multi-tier-app.png
.. |add-vpc.png: adding a vpc.| image:: ./_static/images/add-vpc.png
.. |add-tier.png: adding a tier to a vpc.| image:: ./_static/images/add-tier.png
.. |replace-acl-icon.png: button to replace an ACL list| image:: ./_static/images/replace-acl-icon.png
.. |add-new-gateway-vpc.png: adding a private gateway for the VPC.| image:: ./_static/images/add-new-gateway-vpc.png
.. |replace-acl-icon.png: button to replace the default ACL behaviour.| image:: ./_static/images/replace-acl-icon.png
.. |add-vm-vpc.png: adding a VM to a vpc.| image:: ./_static/images/add-vm-vpc.png
.. |addvm-tier-sharednw.png: adding a VM to a VPC tier and shared network.| image:: ./_static/images/addvm-tier-sharednw.png
.. |release-ip-icon.png: button to release an IP.| image:: ./_static/images/release-ip-icon.png
.. |enable-disable.png: button to enable Static NAT.| image:: ./_static/images/enable-disable.png
.. |select-vmstatic-nat.png: selecting a tier to apply staticNAT.| image:: ./_static/images/select-vm-staticnat-vpc.png
.. |vpc-lb.png: Configuring internal LB for VPC| image:: ./_static/images/vpc-lb.png
.. |del-tier.png: button to remove a tier| image:: ./_static/images/del-tier.png
.. |remove-vpc.png: button to remove a VPC| image:: ./_static/images/remove-vpc.png
.. |edit-icon.png: button to edit a VPC| image:: ./_static/images/edit-icon.png
.. |restart-vpc.png: button to restart a VPC| image:: ./_static/images/restart-vpc.png
.. |vr-upgrade.png: Button to upgrade VR to use the new template.| image:: ./_static/images/vr-upgrade.png


