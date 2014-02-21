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
   

Setting Configuration Parameters
================================

19.1. About Configuration Parameters
------------------------------------

CloudStack provides a variety of settings you can use to set limits,
configure features, and enable or disable features in the cloud. Once
your Management Server is running, you might need to set some of these
configuration parameters, depending on what optional features you are
setting up. You can set default values at the global level, which will
be in effect throughout the cloud unless you override them at a lower
level. You can make local settings, which will override the global
configuration parameter values, at the level of an account, zone,
cluster, or primary storage.

The documentation for each CloudStack feature should direct you to the
names of the applicable parameters. The following table shows a few of
the more useful parameters.

Field

Value

management.network.cidr

A CIDR that describes the network that the management CIDRs reside on.
This variable must be set for deployments that use vSphere. It is
recommended to be set for other deployments as well. Example:
192.168.3.0/24.

xen.setup.multipath

For XenServer nodes, this is a true/false variable that instructs
CloudStack to enable iSCSI multipath on the XenServer Hosts when they
are added. This defaults to false. Set it to true if you would like
CloudStack to enable multipath.

If this is true for a NFS-based deployment multipath will still be
enabled on the XenServer host. However, this does not impact NFS
operation and is harmless.

secstorage.allowed.internal.sites

This is used to protect your internal network from rogue attempts to
download arbitrary files using the template download feature. This is a
comma-separated list of CIDRs. If a requested URL matches any of these
CIDRs the Secondary Storage VM will use the private network interface to
fetch the URL. Other URLs will go through the public interface. We
suggest you set this to 1 or 2 hardened internal machines where you keep
your templates. For example, set it to 192.168.1.66/32.

use.local.storage

Determines whether CloudStack will use storage that is local to the Host
for data disks, templates, and snapshots. By default CloudStack will not
use this storage. You should change this to true if you want to use
local storage and you understand the reliability and feature drawbacks
to choosing local storage.

host

This is the IP address of the Management Server. If you are using
multiple Management Servers you should enter a load balanced IP address
that is reachable via the private network.

default.page.size

Maximum number of items per page that can be returned by a CloudStack
API command. The limit applies at the cloud level and can vary from
cloud to cloud. You can override this with a lower value on a particular
API call by using the page and pagesize API command parameters. For more
information, see the Developer's Guide. Default: 500.

ha.tag

The label you want to use throughout the cloud to designate certain
hosts as dedicated HA hosts. These hosts will be used only for
HA-enabled VMs that are restarting due to the failure of another host.
For example, you could set this to ha\_host. Specify the ha.tag value as
a host tag when you add a new host to the cloud.

vmware.vcenter.session.timeout

Determines the vCenter session timeout value by using this parameter.
The default value is 20 minutes. Increase the timeout value to avoid
timeout errors in VMware deployments because certain VMware operations
take more than 20 minutes.

Setting Global Configuration Parameters
---------------------------------------------

Use the following steps to set global configuration parameters. These
values will be the defaults in effect throughout your CloudStack
deployment.

#. 

   Log in to the UI as administrator.

#. 

   In the left navigation bar, click Global Settings.

#. 

   In Select View, choose one of the following:

   -  

      Global Settings. This displays a list of the parameters with brief
      descriptions and current values.

   -  

      Hypervisor Capabilities. This displays a list of hypervisor
      versions with the maximum number of guests supported for each.

#. 

   Use the search box to narrow down the list to those you are
   interested in.

#. 

   In the Actions column, click the Edit icon to modify a value. If you
   are viewing Hypervisor Capabilities, you must click the name of the
   hypervisor first to display the editing screen.

Setting Local Configuration Parameters
--------------------------------------------

Use the following steps to set local configuration parameters for an
account, zone, cluster, or primary storage. These values will override
the global configuration settings.

#. 

   Log in to the UI as administrator.

#. 

   In the left navigation bar, click Infrastructure or Accounts,
   depending on where you want to set a value.

#. 

   Find the name of the particular resource that you want to work with.
   For example, if you are in Infrastructure, click View All on the
   Zones, Clusters, or Primary Storage area.

#. 

   Click the name of the resource where you want to set a limit.

#. 

   Click the Settings tab.

#. 

   Use the search box to narrow down the list to those you are
   interested in.

#. 

   In the Actions column, click the Edit icon to modify a value.

Granular Global Configuration Parameters
----------------------------------------------

The following global configuration parameters have been made more
granular. The parameters are listed under three different scopes:
account, cluster, and zone.

Field

Field

Value

account

remote.access.vpn.client.iprange

The range of IPs to be allocated to remotely access the VPN clients. The
first IP in the range is used by the VPN server.

account

allow.public.user.templates

If false, users will not be able to create public templates.

account

use.system.public.ips

If true and if an account has one or more dedicated public IP ranges,
IPs are acquired from the system pool after all the IPs dedicated to the
account have been consumed.

account

use.system.guest.vlans

If true and if an account has one or more dedicated guest VLAN ranges,
VLANs are allocated from the system pool after all the VLANs dedicated
to the account have been consumed.

cluster

cluster.storage.allocated.capacity.notificationthreshold

The percentage, as a value between 0 and 1, of allocated storage
utilization above which alerts are sent that the storage is below the
threshold.

cluster

cluster.storage.capacity.notificationthreshold

The percentage, as a value between 0 and 1, of storage utilization above
which alerts are sent that the available storage is below the threshold.

cluster

cluster.cpu.allocated.capacity.notificationthreshold

The percentage, as a value between 0 and 1, of cpu utilization above
which alerts are sent that the available CPU is below the threshold.

cluster

cluster.memory.allocated.capacity.notificationthreshold

The percentage, as a value between 0 and 1, of memory utilization above
which alerts are sent that the available memory is below the threshold.

cluster

cluster.cpu.allocated.capacity.disablethreshold

The percentage, as a value between 0 and 1, of CPU utilization above
which allocators will disable that cluster from further usage. Keep the
corresponding notification threshold lower than this value to be
notified beforehand.

cluster

cluster.memory.allocated.capacity.disablethreshold

The percentage, as a value between 0 and 1, of memory utilization above
which allocators will disable that cluster from further usage. Keep the
corresponding notification threshold lower than this value to be
notified beforehand.

cluster

cpu.overprovisioning.factor

Used for CPU over-provisioning calculation; the available CPU will be
the mathematical product of actualCpuCapacity and
cpu.overprovisioning.factor.

cluster

mem.overprovisioning.factor

Used for memory over-provisioning calculation.

cluster

vmware.reserve.cpu

Specify whether or not to reserve CPU when not over-provisioning; In
case of CPU over-provisioning, CPU is always reserved.

cluster

vmware.reserve.mem

Specify whether or not to reserve memory when not over-provisioning; In
case of memory over-provisioning memory is always reserved.

zone

pool.storage.allocated.capacity.disablethreshold

The percentage, as a value between 0 and 1, of allocated storage
utilization above which allocators will disable that pool because the
available allocated storage is below the threshold.

zone

pool.storage.capacity.disablethreshold

The percentage, as a value between 0 and 1, of storage utilization above
which allocators will disable the pool because the available storage
capacity is below the threshold.

zone

storage.overprovisioning.factor

Used for storage over-provisioning calculation; available storage will
be the mathematical product of actualStorageSize and
storage.overprovisioning.factor.

zone

network.throttling.rate

Default data transfer rate in megabits per second allowed in a network.

zone

guest.domain.suffix

Default domain name for VMs inside a virtual networks with a router.

zone

router.template.xen

Name of the default router template on Xenserver.

zone

router.template.kvm

Name of the default router template on KVM.

zone

router.template.vmware

Name of the default router template on VMware.

zone

enable.dynamic.scale.vm

Enable or diable dynamically scaling of a VM.

zone

use.external.dns

Bypass internal DNS, and use the external DNS1 and DNS2

zone

blacklisted.routes

Routes that are blacklisted cannot be used for creating static routes
for a VPC Private Gateway.


