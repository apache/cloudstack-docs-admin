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
   

About Multiple IP Ranges
------------------------

.. note:: The feature can only be implemented on IPv4 addresses.

CloudStack provides you with the flexibility to add guest IP ranges from
different subnets in Basic zones and security groups-enabled Advanced
zones. For security groups-enabled Advanced zones, it implies multiple
subnets can be added to the same VLAN. With the addition of this
feature, you will be able to add IP address ranges from the same subnet
or from a different one when IP address are exhausted. This would in
turn allows you to employ higher number of subnets and thus reduce the
address management overhead. To support this feature, the capability of
``createVlanIpRange`` API is extended to add IP ranges also from a
different subnet.

Ensure that you manually configure the gateway of the new subnet before
adding the IP range. Note that CloudStack supports only one gateway for
a subnet; overlapping subnets are not currently supported.

Use the ``deleteVlanRange`` API to delete IP ranges. This operation
fails if an IP from the remove range is in use. If the remove range
contains the IP address on which the DHCP server is running, CloudStack
acquires a new IP from the same subnet. If no IP is available in the
subnet, the remove operation fails.

This feature is supported on KVM, xenServer, and VMware hypervisors.