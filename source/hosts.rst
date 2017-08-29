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
   

Working with Hosts
==================

Adding Hosts
------------

Additional hosts can be added at any time to provide more capacity for
guest VMs. For requirements and instructions, see 
`“Adding a Host” <http://docs.cloudstack.apache.org/projects/cloudstack-installation/en/latest/configuration.html#adding-a-host>`_.


Scheduled Maintenance and Maintenance Mode for Hosts
----------------------------------------------------

You can place a host into maintenance mode. When maintenance mode is
activated, the host becomes unavailable to receive new guest VMs, and
the guest VMs already running on the host are seamlessly migrated to
another host not in maintenance mode. This migration uses live migration
technology and does not interrupt the execution of the guest.


vCenter and Maintenance Mode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To enter maintenance mode on a vCenter host, both vCenter and CloudStack
must be used in concert. CloudStack and vCenter have separate
maintenance modes that work closely together.

#. Place the host into CloudStack's "scheduled maintenance" mode. This
   does not invoke the vCenter maintenance mode, but only causes VMs to
   be migrated off the host

   When the CloudStack maintenance mode is requested, the host first
   moves into the Prepare for Maintenance state. In this state it cannot
   be the target of new guest VM starts. Then all VMs will be migrated
   off the server. Live migration will be used to move VMs off the host.
   This allows the guests to be migrated to other hosts with no
   disruption to the guests. After this migration is completed, the host
   will enter the Ready for Maintenance mode.

#. Wait for the "Ready for Maintenance" indicator to appear in the UI.

#. Now use vCenter to perform whatever actions are necessary to maintain
   the host. During this time, the host cannot be the target of new VM
   allocations.

#. When the maintenance tasks are complete, take the host out of
   maintenance mode as follows:

   #. First use vCenter to exit the vCenter maintenance mode.

      This makes the host ready for CloudStack to reactivate it.

   #. Then use CloudStack's administrator UI to cancel the CloudStack
      maintenance mode

      When the host comes back online, the VMs that were migrated off of
      it may be migrated back to it manually and new VMs can be added.


XenServer and Maintenance Mode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For XenServer, you can take a server offline temporarily by using the
Maintenance Mode feature in XenCenter. When you place a server into
Maintenance Mode, all running VMs are automatically migrated from it to
another host in the same pool. If the server is the pool master, a new
master will also be selected for the pool. While a server is Maintenance
Mode, you cannot create or start any VMs on it.

**To place a server in Maintenance Mode:**

#. In the Resources pane, select the server, then do one of the
   following:

   -  Right-click, then click Enter Maintenance Mode on the shortcut
      menu.

   -  On the Server menu, click Enter Maintenance Mode.

#. Click Enter Maintenance Mode.

The server's status in the Resources pane shows when all running VMs
have been successfully migrated off the server.

**To take a server out of Maintenance Mode:**

#. In the Resources pane, select the server, then do one of the
   following:

   -  Right-click, then click Exit Maintenance Mode on the shortcut
      menu.

   -  On the Server menu, click Exit Maintenance Mode.

#. Click Exit Maintenance Mode.


Disabling and Enabling Zones, Pods, and Clusters
------------------------------------------------

You can enable or disable a zone, pod, or cluster without permanently
removing it from the cloud. This is useful for maintenance or when there
are problems that make a portion of the cloud infrastructure unreliable.
No new allocations will be made to a disabled zone, pod, or cluster
until its state is returned to Enabled. When a zone, pod, or cluster is
first added to the cloud, it is Disabled by default.

To disable and enable a zone, pod, or cluster:

#. Log in to the CloudStack UI as administrator

#. In the left navigation bar, click Infrastructure.

#. In Zones, click View More.

#. If you are disabling or enabling a zone, find the name of the zone in
   the list, and click the Enable/Disable button. |enable-disable.png|

#. If you are disabling or enabling a pod or cluster, click the name of
   the zone that contains the pod or cluster.

#. Click the Compute tab.

#. In the Pods or Clusters node of the diagram, click View All.

#. Click the pod or cluster name in the list.

#. Click the Enable/Disable button. |enable-disable.png|


Removing Hosts
--------------

Hosts can be removed from the cloud as needed. The procedure to remove a
host depends on the hypervisor type.


Removing XenServer and KVM Hosts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A node cannot be removed from a cluster until it has been placed in
maintenance mode. This will ensure that all of the VMs on it have been
migrated to other Hosts. To remove a Host from the cloud:

#. Place the node in maintenance mode.

   See `“Scheduled Maintenance and Maintenance Mode for
   Hosts” <#scheduled-maintenance-and-maintenance-mode-for-hosts>`_.

#. For KVM, stop the cloud-agent service.

#. Use the UI option to remove the node.

   Then you may power down the Host, re-use its IP address, re-install
   it, etc


Removing vSphere Hosts
~~~~~~~~~~~~~~~~~~~~~~

To remove this type of host, first place it in maintenance mode, as
described in `“Scheduled Maintenance and Maintenance Mode
for Hosts” <#scheduled-maintenance-and-maintenance-mode-for-hosts>`_. Then use
CloudStack to remove the host. CloudStack will not direct commands to a
host that has been removed using CloudStack. However, the host may still
exist in the vCenter cluster.


Re-Installing Hosts
-------------------

You can re-install a host after placing it in maintenance mode and then
removing it. If a host is down and cannot be placed in maintenance mode,
it should still be removed before the re-install.


Maintaining Hypervisors on Hosts
--------------------------------

When running hypervisor software on hosts, be sure all the hotfixes
provided by the hypervisor vendor are applied. Track the release of
hypervisor patches through your hypervisor vendor’s support channel, and
apply patches as soon as possible after they are released. CloudStack
will not track or notify you of required hypervisor patches. It is
essential that your hosts are completely up to date with the provided
hypervisor patches. The hypervisor vendor is likely to refuse to support
any system that is not up to date with patches.

.. note:: 
   The lack of up-do-date hotfixes can lead to data corruption and lost VMs.

(XenServer) For more information, see 
`Highly Recommended Hotfixes for XenServer in the CloudStack Knowledge Base 
<http://docs.cloudstack.org/Knowledge_Base/Possible_VM_corruption_if_XenServer_Hotfix_is_not_Applied/Highly_Recommended_Hotfixes_for_XenServer_5.6_SP2>`_.


Changing Host Password
----------------------

The password for a XenServer Node, KVM Node, or vSphere Node may be
changed in the database. Note that all Nodes in a Cluster must have the
same password.

To change a Node's password:

#. Identify all hosts in the cluster.

#. Change the password on all hosts in the cluster. Now the password for
   the host and the password known to CloudStack will not match.
   Operations on the cluster will fail until the two passwords match.

#. if the password in the database is encrypted, it is (likely) necessary to
   encrypt the new password using the database key before adding it to the database.

   .. code:: bash

      java -classpath /usr/share/cloudstack-common/lib/jasypt-1.9.0.jar \
      org.jasypt.intf.cli.JasyptPBEStringEncryptionCLI \
      encrypt.sh input="newrootpassword" \
      password="databasekey" \
      verbose=false

#. Get the list of host IDs for the host in the cluster where you are
   changing the password. You will need to access the database to
   determine these host IDs. For each hostname "h" (or vSphere cluster)
   that you are changing the password for, execute:

   .. code:: bash

      mysql> SELECT id FROM cloud.host WHERE name like '%h%';

#. This should return a single ID. Record the set of such IDs for these
   hosts. Now retrieve the host_details row id for the host

   .. code:: bash

      mysql> SELECT * FROM cloud.host_details WHERE name='password' AND host_id={previous step ID}; 

#. Update the passwords for the host in the database. In this example,
   we change the passwords for hosts with host IDs 5 and 12 and host_details IDs 8 and 22 to
   "password".

   .. code:: bash

      mysql> UPDATE cloud.host_details SET value='password' WHERE id=8 OR id=22;


Over-Provisioning and Service Offering Limits
---------------------------------------------

(Supported for XenServer, KVM, and VMware)

CPU and memory (RAM) over-provisioning factors can be set for each
cluster to change the number of VMs that can run on each host in the
cluster. This helps optimize the use of resources. By increasing the
over-provisioning ratio, more resource capacity will be used. If the
ratio is set to 1, no over-provisioning is done.

The administrator can also set global default over-provisioning ratios
in the cpu.overprovisioning.factor and mem.overprovisioning.factor
global configuration variables. The default value of these variables is
1: over-provisioning is turned off by default.

Over-provisioning ratios are dynamically substituted in CloudStack's
capacity calculations. For example:

Capacity = 2 GB
Over-provisioning factor = 2
Capacity after over-provisioning = 4 GB

With this configuration, suppose you deploy 3 VMs of 1 GB each:

Used = 3 GB
Free = 1 GB

The administrator can specify a memory over-provisioning ratio, and can
specify both CPU and memory over-provisioning ratios on a per-cluster
basis.

In any given cloud, the optimum number of VMs for each host is affected
by such things as the hypervisor, storage, and hardware configuration.
These may be different for each cluster in the same cloud. A single
global over-provisioning setting can not provide the best utilization
for all the different clusters in the cloud. It has to be set for the
lowest common denominator. The per-cluster setting provides a finer
granularity for better utilization of resources, no matter where the
CloudStack placement algorithm decides to place a VM.

The overprovisioning settings can be used along with dedicated resources
(assigning a specific cluster to an account) to effectively offer
different levels of service to different accounts. For example, an
account paying for a more expensive level of service could be assigned
to a dedicated cluster with an over-provisioning ratio of 1, and a
lower-paying account to a cluster with a ratio of 2.

When a new host is added to a cluster, CloudStack will assume the host
has the capability to perform the CPU and RAM over-provisioning which is
configured for that cluster. It is up to the administrator to be sure
the host is actually suitable for the level of over-provisioning which
has been set.


Limitations on Over-Provisioning in XenServer and KVM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  In XenServer, due to a constraint of this hypervisor, you can not use
   an over-provisioning factor greater than 4.

-  The KVM hypervisor can not manage memory allocation to VMs
   dynamically. CloudStack sets the minimum and maximum amount of memory
   that a VM can use. The hypervisor adjusts the memory within the set
   limits based on the memory contention.


Requirements for Over-Provisioning
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Several prerequisites are required in order for over-provisioning to
function properly. The feature is dependent on the OS type, hypervisor
capabilities, and certain scripts. It is the administrator's
responsibility to ensure that these requirements are met.


Balloon Driver
^^^^^^^^^^^^^^

All VMs should have a balloon driver installed in them. The hypervisor
communicates with the balloon driver to free up and make the memory
available to a VM.


XenServer
'''''''''

The balloon driver can be found as a part of xen pv or PVHVM drivers.
The xen pvhvm drivers are included in upstream linux kernels 2.6.36+.


VMware
''''''

The balloon driver can be found as a part of the VMware tools. All the
VMs that are deployed in a over-provisioned cluster should have the
VMware tools installed.


KVM
'''

All VMs are required to support the virtio drivers. These drivers are
installed in all Linux kernel versions 2.6.25 and greater. The
administrator must set CONFIG\_VIRTIO\_BALLOON=y in the virtio
configuration.


Hypervisor capabilities
^^^^^^^^^^^^^^^^^^^^^^^

The hypervisor must be capable of using the memory ballooning.


XenServer
'''''''''

The DMC (Dynamic Memory Control) capability of the hypervisor should be
enabled. Only XenServer Advanced and above versions have this feature.


VMware, KVM
'''''''''''

Memory ballooning is supported by default.


Setting Over-Provisioning Ratios
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are two ways the root admin can set CPU and RAM over-provisioning
ratios. First, the global configuration settings
cpu.overprovisioning.factor and mem.overprovisioning.factor will be
applied when a new cluster is created. Later, the ratios can be modified
for an existing cluster.

Only VMs deployed after the change are affected by the new setting. If
you want VMs deployed before the change to adopt the new
over-provisioning ratio, you must stop and restart the VMs. When this is
done, CloudStack recalculates or scales the used and reserved capacities
based on the new over-provisioning ratios, to ensure that CloudStack is
correctly tracking the amount of free capacity.

.. note:: 
   It is safer not to deploy additional new VMs while the capacity 
   recalculation is underway, in case the new values for available 
   capacity are not high enough to accommodate the new VMs. Just wait 
   for the new used/available values to become available, to be sure 
   there is room for all the new VMs you want.

To change the over-provisioning ratios for an existing cluster:

#. Log in as administrator to the CloudStack UI.

#. In the left navigation bar, click Infrastructure.

#. Under Clusters, click View All.

#. Select the cluster you want to work with, and click the Edit button.

#. Fill in your desired over-provisioning multipliers in the fields CPU
   overcommit ratio and RAM overcommit ratio. The value which is
   intially shown in these fields is the default value inherited from
   the global configuration settings.

   .. note:: 
      In XenServer, due to a constraint of this hypervisor, you can not 
      use an over-provisioning factor greater than 4.


Service Offering Limits and Over-Provisioning
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Service offering limits (e.g. 1 GHz, 1 core) are strictly enforced for
core count. For example, a guest with a service offering of one core
will have only one core available to it regardless of other activity on
the Host.

Service offering limits for gigahertz are enforced only in the presence
of contention for CPU resources. For example, suppose that a guest was
created with a service offering of 1 GHz on a Host that has 2 GHz cores,
and that guest is the only guest running on the Host. The guest will
have the full 2 GHz available to it. When multiple guests are attempting
to use the CPU a weighting factor is used to schedule CPU resources. The
weight is based on the clock speed in the service offering. Guests
receive a CPU allocation that is proportionate to the GHz in the service
offering. For example, a guest created from a 2 GHz service offering
will receive twice the CPU allocation as a guest created from a 1 GHz
service offering. CloudStack does not perform memory over-provisioning.


VLAN Provisioning
-----------------

CloudStack automatically creates and destroys interfaces bridged to
VLANs on the hosts. In general the administrator does not need to manage
this process.

CloudStack manages VLANs differently based on hypervisor type. For
XenServer or KVM, the VLANs are created on only the hosts where they
will be used and then they are destroyed when all guests that require
them have been terminated or moved to another host.

For vSphere the VLANs are provisioned on all hosts in the cluster even
if there is no guest running on a particular Host that requires the
VLAN. This allows the administrator to perform live migration and other
functions in vCenter without having to create the VLAN on the
destination Host. Additionally, the VLANs are not removed from the Hosts
when they are no longer needed.

You can use the same VLANs on different physical networks provided that
each physical network has its own underlying layer-2 infrastructure,
such as switches. For example, you can specify VLAN range 500 to 1000
while deploying physical networks A and B in an Advanced zone setup.
This capability allows you to set up an additional layer-2 physical
infrastructure on a different physical NIC and use the same set of VLANs
if you run out of VLANs. Another advantage is that you can use the same
set of IPs for different customers, each one with their own routers and
the guest networks on different physical NICs.


VLAN Allocation Example
~~~~~~~~~~~~~~~~~~~~~~~

VLANs are required for public and guest traffic. The following is an
example of a VLAN allocation scheme:

.. cssclass:: table-striped table-bordered table-hover

=================   =============================   ====================================================================================================
VLAN IDs            Traffic type                    Scope
=================   =============================   ====================================================================================================
less than 500       Management traffic.             Reserved for administrative purposes.  CloudStack software can access this, hypervisors, system VMs.
500-599             VLAN carrying public traffic.   CloudStack accounts.
600-799             VLANs carrying guest traffic.   CloudStack accounts. Account-specific VLAN is chosen from this pool.
800-899             VLANs carrying guest traffic.   CloudStack accounts. Account-specific VLAN chosen by CloudStack admin to assign to that account.
900-999             VLAN carrying guest traffic     CloudStack accounts. Can be scoped by project, domain, or all accounts.
greater than 1000   Reserved for future use
=================   =============================   ====================================================================================================


Adding Non Contiguous VLAN Ranges
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

CloudStack provides you with the flexibility to add non contiguous VLAN
ranges to your network. The administrator can either update an existing
VLAN range or add multiple non contiguous VLAN ranges while creating a
zone. You can also use the UpdatephysicalNetwork API to extend the VLAN
range.

#. Log in to the CloudStack UI as an administrator or end user.

#. Ensure that the VLAN range does not already exist.

#. In the left navigation, choose Infrastructure.

#. On Zones, click View More, then click the zone to which you want to
   work with.

#. Click Physical Network.

#. In the Guest node of the diagram, click Configure.

#. Click Edit |edit-icon.png|.

   The VLAN Ranges field now is editable.

#. Specify the start and end of the VLAN range in comma-separated list.

   Specify all the VLANs you want to use, VLANs not specified will be
   removed if you are adding new ranges to the existing list.

#. Click Apply.


Assigning VLANs to Isolated Networks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

CloudStack provides you the ability to control VLAN assignment to
Isolated networks. As a Root admin, you can assign a VLAN ID when a
network is created, just the way it's done for Shared networks.

The former behaviour also is supported — VLAN is randomly allocated to a
network from the VNET range of the physical network when the network
turns to Implemented state. The VLAN is released back to the VNET pool
when the network shuts down as a part of the Network Garbage Collection.
The VLAN can be re-used either by the same network when it is
implemented again, or by any other network. On each subsequent
implementation of a network, a new VLAN can be assigned.

Only the Root admin can assign VLANs because the regular users or domain
admin are not aware of the physical network topology. They cannot even
view what VLAN is assigned to a network.

To enable you to assign VLANs to Isolated networks,

#. Create a network offering by specifying the following:

   -  **Guest Type**: Select Isolated.

   -  **Specify VLAN**: Select the option.

   For more information, see the CloudStack Installation Guide.

#. Using this network offering, create a network.

   You can create a VPC tier or an Isolated network.

#. Specify the VLAN when you create the network.

   When VLAN is specified, a CIDR and gateway are assigned to this
   network and the state is changed to Setup. In this state, the network
   will not be garbage collected.

.. note:: 
   You cannot change a VLAN once it's assigned to the network. The VLAN 
   remains with the network for its entire life cycle.


.. |enable-disable.png| image:: _static/images/enable-disable.png
   :alt: button to enable or disable zone, pod, or cluster.
.. |edit-icon.png| image:: _static/images/edit-icon.png
   :alt: button to edit the VLAN range.


Out-of-band Management
----------------------

CloudStack provides Root admins the ability to configure and use supported
out-of-band management interface (e.g. IPMI, iLO, DRAC, etc.) on a physical
host to manage host power operations such as on, off, reset etc. By default,
IPMI 2.0 baseboard controller are supported out of the box with `IPMITOOL`
out-of-band management driver in CloudStack that uses `ipmitool` for performing
IPMI 2.0 management operations.

Following are some global settings that control various aspects of this feature.

.. cssclass:: table-striped table-bordered table-hover

=======================================   =============================   ====================================================================================================
Global setting                            Default values                  Description
=======================================   =============================   ====================================================================================================
outofbandmanagement.action.timeout        60                              The out of band management action timeout in seconds, configurable per cluster
outofbandmanagement.ipmitool.interface    lanplus                         The out of band management IpmiTool driver interface to use. Valid values are: lan, lanplus etc
outofbandmanagement.ipmitool.path         /usr/bin/ipmitool               The out of band management ipmitool path used by the IpmiTool driver
outofbandmanagement.ipmitool.retries      1                               The out of band management IpmiTool driver retries option -R
outofbandmanagement.sync.poolsize         50                              The out of band management background sync thread pool size 50
=======================================   =============================   ====================================================================================================

A change in `outofbandmanagement.sync.poolsize` settings requires restarting of
management server(s) as the thread pool and a background (power state) sync
thread are configured during load time when CloudStack management server starts.
Rest of the global settings can be changed without requiring restarting of
management server(s).

The `outofbandmanagement.sync.poolsize` is the maximum number of ipmitool
background power state scanners that can run at a time. Based on the maximum
number of hosts you've, you can increase/decrease the value depending on how much
stress your management server host can endure. It will take atmost number of
total out-of-band-management enabled hosts in a round *
`outofbandmanagement.action.timeout` / `outofbandmanagement.sync.poolsize` seconds
to complete a background power-state sync scan in a single round.

In order to use this feature, the Root admin needs to first configure
out-of-band management for a host using either the UI or the
`configureOutOfBandManagement` API. Next, the Root admin needs to enable it.
The feature can be enabled or disabled across a zone or a cluster or a host,

Once out-of-band management is configured and enabled for a host (and provided
not disabled at zone or cluster level), Root admins would be able to issue
power management actions such as on, off, reset, cycle, soft and status.

If a host is in maintenance mode, Root admins are still allowed to perform
power management actions but in the UI a warning is displayed.
