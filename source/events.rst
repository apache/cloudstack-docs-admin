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
   

Event Notification
==================

An event is essentially a significant or meaningful change in the state
of both virtual and physical resources associated with a cloud
environment. Events are used by monitoring systems, usage and billing
systems, or any other event-driven workflow systems to discern a pattern
and make the right business decision. In CloudStack an event could be a
state change of virtual or physical resources, an action performed by an
user (action events), or policy based events (alerts).

Event Logs
----------

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

Notification
------------

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
~~~~~~~~~

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
~~~~~~~~~~~~~

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
---------------

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
-----------------------

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
-----------------

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
----------------------------------------

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
~~~~~~~~~~~

Consider the following:

-  

   The root admin can delete or archive one or multiple alerts or
   events.

-  

   The domain admin or end user can delete or archive one or multiple
   events.

Procedure
~~~~~~~~~

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


TroubleShooting
===============

Working with Server Logs
------------------------

The CloudStack Management Server logs all web site, middle tier, and
database activities for diagnostics purposes in
`/var/log/cloudstack/management/`. The CloudStack logs a variety of error
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

The CloudStack Agent Server logs its activities in `/var/log/cloudstack/agent/`.


Data Loss on Exported Primary Storage
-------------------------------------

Symptom
~~~~~~~

Loss of existing data on primary storage which has been exposed as a
Linux NFS server export on an iSCSI volume.

Cause
~~~~~

It is possible that a client from outside the intended pool has mounted
the storage. When this occurs, the LVM is wiped and all data in the
volume is lost

Solution
~~~~~~~~

When setting up LUN exports, restrict the range of IP addresses that are
allowed access by specifying a subnet mask. For example:

.. code:: bash

    echo “/export 192.168.1.0/24(rw,async,no_root_squash,no_subtree_check)” > /etc/exports

Adjust the above command to suit your deployment needs.

More Information
~~~~~~~~~~~~~~~~

See the export procedure in the "Secondary Storage" section of the
CloudStack Installation Guide

Recovering a Lost Virtual Router
--------------------------------

Symptom
~~~~~~~

A virtual router is running, but the host is disconnected. A virtual
router no longer functions as expected.

Cause
~~~~~

The Virtual router is lost or down.

Solution
~~~~~~~~

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
`http://cloudstack.apache.org/docs/api/ <http://cloudstack.apache.org/docs/api/>`_.

Maintenance mode not working on vCenter
---------------------------------------

Symptom
~~~~~~~

Host was placed in maintenance mode, but still appears live in vCenter.

Cause
~~~~~~

The CloudStack administrator UI was used to place the host in scheduled
maintenance mode. This mode is separate from vCenter's maintenance mode.

Solution
~~~~~~~~

Use vCenter to place the host in maintenance mode.


Unable to deploy VMs from uploaded vSphere template
---------------------------------------------------

Symptom
~~~~~~~~

When attempting to create a VM, the VM will not deploy.

Cause
~~~~~

If the template was created by uploading an OVA file that was created
using vSphere Client, it is possible the OVA contained an ISO image. If
it does, the deployment of VMs from the template will fail.

Solution
~~~~~~~~

Remove the ISO and re-upload the template.

Unable to power on virtual machine on VMware
--------------------------------------------

Symptom
~~~~~~~

Virtual machine does not power on. You might see errors like:

-  

   Unable to open Swap File

-  

   Unable to access a file since it is locked

-  

   Unable to access Virtual machine configuration

Cause
~~~~~

A known issue on VMware machines. ESX hosts lock certain critical
virtual machine files and file systems to prevent concurrent changes.
Sometimes the files are not unlocked when the virtual machine is powered
off. When a virtual machine attempts to power on, it can not access
these critical files, and the virtual machine is unable to power on.

Solution
~~~~~~~~

See the following:

`VMware Knowledge Base
Article <http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=10051/>`__

Load balancer rules fail after changing network offering
--------------------------------------------------------

Symptom
~~~~~~~

After changing the network offering on a network, load balancer rules
stop working.

Cause
~~~~~

Load balancing rules were created while using a network service offering
that includes an external load balancer device such as NetScaler, and
later the network service offering changed to one that uses the
CloudStack virtual router.

Solution
~~~~~~~~

Create a firewall rule on the virtual router for each of your existing
load balancing rules so that they continue to function.


=======
   Click OK.
