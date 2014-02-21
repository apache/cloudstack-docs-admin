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
   

Managing Accounts, Users and Domains
====================================

Accounts, Users, and Domains
---------------------------------

Accounts
''''''''

An account typically represents a customer of the service provider or a
department in a large organization. Multiple users can exist in an
account.

Domains
'''''''

Accounts are grouped by domains. Domains usually contain multiple
accounts that have some logical relationship to each other and a set of
delegated administrators with some authority over the domain and its
subdomains. For example, a service provider with several resellers could
create a domain for each reseller.

For each account created, the Cloud installation creates three different
types of user accounts: root administrator, domain administrator, and
user.

Users
'''''

Users are like aliases in the account. Users in the same account are not
isolated from each other, but they are isolated from users in other
accounts. Most installations need not surface the notion of users; they
just have one user per account. The same user cannot belong to multiple
accounts.

Username is unique in a domain across accounts in that domain. The same
username can exist in other domains, including sub-domains. Domain name
can repeat only if the full pathname from root is unique. For example,
you can create root/d1, as well as root/foo/d1, and root/sales/d1.

Administrators are accounts with special privileges in the system. There
may be multiple administrators in the system. Administrators can create
or delete other administrators, and change the password for any user in
the system.

Domain Administrators
'''''''''''''''''''''

Domain administrators can perform administrative operations for users
who belong to that domain. Domain administrators do not have visibility
into physical servers or other domains.

Root Administrator
''''''''''''''''''

Root administrators have complete access to the system, including
managing templates, service offerings, customer care administrators, and
domains

Resource Ownership
''''''''''''''''''

Resources belong to the account, not individual users in that account.
For example, billing, resource limits, and so on are maintained by the
account, not the users. A user can operate on any resource in the
account provided the user has privileges for that operation. The
privileges are determined by the role. A root administrator can change
the ownership of any virtual machine from one account to any other
account by using the assignVirtualMachine API. A domain or sub-domain
administrator can do the same for VMs within the domain from one account
to any other account in the domain or any of its sub-domains.

Dedicating Resources to Accounts and Domains
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The root administrator can dedicate resources to a specific domain or
account that needs private infrastructure for additional security or
performance guarantees. A zone, pod, cluster, or host can be reserved by
the root administrator for a specific domain or account. Only users in
that domain or its subdomain may use the infrastructure. For example,
only users in a given domain can create guests in a zone dedicated to
that domain.

There are several types of dedication available:

-

   Explicit dedication. A zone, pod, cluster, or host is dedicated to an
   account or domain by the root administrator during initial deployment
   and configuration.

-

   Strict implicit dedication. A host will not be shared across multiple
   accounts. For example, strict implicit dedication is useful for
   deployment of certain types of applications, such as desktops, where
   no host can be shared between different accounts without violating
   the desktop software's terms of license.

-

   Preferred implicit dedication. The VM will be deployed in dedicated
   infrastructure if possible. Otherwise, the VM can be deployed in
   shared infrastructure.

How to Dedicate a Zone, Cluster, Pod, or Host to an Account or Domain
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For explicit dedication: When deploying a new zone, pod, cluster, or
host, the root administrator can click the Dedicated checkbox, then
choose a domain or account to own the resource.

To explicitly dedicate an existing zone, pod, cluster, or host: log in
as the root admin, find the resource in the UI, and click the Dedicate
button. |dedicate-resource-button.png: button to dedicate a zone, pod,
cluster, or host|

For implicit dedication: The administrator creates a compute service
offering and in the Deployment Planner field, chooses
ImplicitDedicationPlanner. Then in Planner Mode, the administrator
specifies either Strict or Preferred, depending on whether it is
permissible to allow some use of shared resources when dedicated
resources are not available. Whenever a user creates a VM based on this
service offering, it is allocated on one of the dedicated hosts.

How to Use Dedicated Hosts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To use an explicitly dedicated host, use the explicit-dedicated type of
affinity group (see `Section 10.7.1, “Affinity
Groups” <#affinity-groups>`__). For example, when creating a new VM, an
end user can choose to place it on dedicated infrastructure. This
operation will succeed only if some infrastructure has already been
assigned as dedicated to the user's account or domain.

Behavior of Dedicated Hosts, Clusters, Pods, and Zones
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The administrator can live migrate VMs away from dedicated hosts if
desired, whether the destination is a host reserved for a different
account/domain or a host that is shared (not dedicated to any particular
account or domain). CloudStack will generate an alert, but the operation
is allowed.

Dedicated hosts can be used in conjunction with host tags. If both a
host tag and dedication are requested, the VM will be placed only on a
host that meets both requirements. If there is no dedicated resource
available to that user that also has the host tag requested by the user,
then the VM will not deploy.

If you delete an account or domain, any hosts, clusters, pods, and zones
that were dedicated to it are freed up. They will now be available to be
shared by any account or domain, or the administrator may choose to
re-dedicate them to a different account or domain.

System VMs and virtual routers affect the behavior of host dedication.
System VMs and virtual routers are owned by the CloudStack system
account, and they can be deployed on any host. They do not adhere to
explicit dedication. The presence of system vms and virtual routers on a
host makes it unsuitable for strict implicit dedication. The host can
not be used for strict implicit dedication, because the host already has
VMs of a specific account (the default system account). However, a host
with system VMs or virtual routers can be used for preferred implicit
dedication.

Using an LDAP Server for User Authentication
'''''''''''''''''''''''''''''''''''''''''''''''''

You can use an external LDAP server such as Microsoft Active Directory or
OpenLDAP to authentication Cloudstack end users.

In order to do this you must:

To set up LDAP authentication in CloudStack, call the CloudStack API
command ldapConfig and provide the following:

- Set your LDAP configuration within Cloudstack
- Create Cloudstack accounts for LDAP Users

To setup LDAP authentication in Cloudstack, open the global settings page and
search for LDAP.

Set ldap.base to match your servers base directory.

Review the defaults for the following and ensure they match your schema:

 - ldap.email.attribute
 - ldap.firstname.attribute
 - ldap.lastname.attribute
 - ldap.username.attribute
 - ldap.user.object

Optionally you can set the following:

-

   If you do not want to use anonymous binding you can set ldap.bind.principle
   and ldap.bind.password as credentials for your LDAP server that will grant
   Cloudstack permission to perform a search on the LDAP server.

-

   For SSL support set ldap.truststore to a path on the file system where your
   trusted store is located. Along with this set ldap.truststore.password as
   the password that unlocks the truststore.

-

   If you wish to filter down the user set that is granted access to Cloudstack
   via the LDAP attribute memberof you can do so using
   ldap.search.group.principle

Finally, you can add your LDAP server. To do so select LDAP Configuration from
the views section within global settings. Click on "Configure LDAP" and fill
in your server's hostname and port.

Example LDAP Configuration for Active Directory
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This shows the configuration settings required for using ActiveDirectory.

- samAccountName - Logon name
- mail - Email Address
- cn - Real name

Along with this the ldap.user.object name needs to be modified, by default
ActiveDirectory uses the value "user" for this.

Map the following attributes accordingly as shown below:

.. image:: ./_static/images/add-ldap-configuration-ad.png

Example LDAP Configuration for OpenLDAP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This shows the configuration settings required for using OpenLDAP.
The default values supplied are suited for OpenLDAP.

- uid - Login Name
- mail - Email Address
- cn - Real name

Along with this the ldap.user.object name needs to be modified, by default
OpenLDAP uses the value "inetOrgPerson" for this.

Map the following attributes accordingly as shown below:

.. image:: ./_static/images/add-ldap-configuration-openldap.png