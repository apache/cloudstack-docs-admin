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
----------------------------

Accounts
~~~~~~~~

An account typically represents a customer of the service provider or a
department in a large organization. Multiple users can exist in an
account.

Domains
~~~~~~~

Accounts are grouped by domains. Domains usually contain multiple
accounts that have some logical relationship to each other and a set of
delegated administrators with some authority over the domain and its
subdomains. For example, a service provider with several resellers could
create a domain for each reseller.

For each account created, the Cloud installation creates three different
types of user accounts: root administrator, domain administrator, and
user.

Users
~~~~~

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
~~~~~~~~~~~~~~~~~~~~~

Domain administrators can perform administrative operations for users
who belong to that domain. Domain administrators do not have visibility
into physical servers or other domains.

Root Administrator
~~~~~~~~~~~~~~~~~~

Root administrators have complete access to the system, including
managing templates, service offerings, customer care administrators, and
domains

Resource Ownership
~~~~~~~~~~~~~~~~~~

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
--------------------------------------------

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
----------------------------------------------------------------------

For explicit dedication: When deploying a new zone, pod, cluster, or
host, the root administrator can click the Dedicated checkbox, then
choose a domain or account to own the resource.

To explicitly dedicate an existing zone, pod, cluster, or host: log in
as the root admin, find the resource in the UI, and click the Dedicate
button. |button to dedicate a zone, pod,cluster, or host|

For implicit dedication: The administrator creates a compute service
offering and in the Deployment Planner field, chooses
ImplicitDedicationPlanner. Then in Planner Mode, the administrator
specifies either Strict or Preferred, depending on whether it is
permissible to allow some use of shared resources when dedicated
resources are not available. Whenever a user creates a VM based on this
service offering, it is allocated on one of the dedicated hosts.

How to Use Dedicated Hosts
~~~~~~~~~~~~~~~~~~~~~~~~~~~

To use an explicitly dedicated host, use the explicit-dedicated type of
affinity group (see `“Affinity
Groups” <virtual_machines.html#affinity-groups>`_). For example, when creating a new VM, an
end user can choose to place it on dedicated infrastructure. This
operation will succeed only if some infrastructure has already been
assigned as dedicated to the user's account or domain.

Behavior of Dedicated Hosts, Clusters, Pods, and Zones
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
--------------------------------------------

You can use an external LDAP server such as Microsoft Active Directory
or ApacheDS to authenticate CloudStack end-users. Just map CloudStack
accounts to the corresponding LDAP accounts using a query filter. The
query filter is written using the query syntax of the particular LDAP
server, and can include special wildcard characters provided by
CloudStack for matching common values such as the user’s email address
and name. CloudStack will search the external LDAP directory tree
starting at a specified base directory and return the distinguished name
(DN) and password of the matching user. This information along with the
given password is used to authenticate the user..

To set up LDAP authentication in CloudStack, call the CloudStack API
command ldapConfig and provide the following:

-  

   Hostname or IP address and listening port of the LDAP server

-  

   Base directory and query filter

-  

   Search user DN credentials, which give CloudStack permission to
   search on the LDAP server

-  

   SSL keystore and password, if SSL is used

Example LDAP Configuration Commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To understand the examples in this section, you need to know the basic
concepts behind calling the CloudStack API, which are explained in the
Developer’s Guide.

The following shows an example invocation of ldapConfig with an ApacheDS
LDAP server

.. code:: bash

    http://127.0.0.1:8080/client/api?command=ldapConfig&hostname=127.0.0.1&searchbase=ou%3Dtesting%2Co%3Dproject&queryfilter=%28%26%28uid%3D%25u%29%29&binddn=cn%3DJohn+Singh%2Cou%3Dtesting%2Co%project&bindpass=secret&port=10389&ssl=true&truststore=C%3A%2Fcompany%2Finfo%2Ftrusted.ks&truststorepass=secret&response=json&apiKey=YourAPIKey&signature=YourSignatureHash

The command must be URL-encoded. Here is the same example without the
URL encoding:

.. code:: bash

    http://127.0.0.1:8080/client/api?command=ldapConfig
    &hostname=127.0.0.1
    &searchbase=ou=testing,o=project
    &queryfilter=(&(%uid=%u))
    &binddn=cn=John+Singh,ou=testing,o=project
    &bindpass=secret
    &port=10389
    &ssl=true
    &truststore=C:/company/info/trusted.ks
    &truststorepass=secret
    &response=json
    &apiKey=YourAPIKey&signature=YourSignatureHash

The following shows a similar command for Active Directory. Here, the
search base is the testing group within a company, and the users are
matched up based on email address.

.. code:: bash

    http://10.147.29.101:8080/client/api?command=ldapConfig&hostname=10.147.28.250&searchbase=OU%3Dtesting%2CDC%3Dcompany&queryfilter=%28%26%28mail%3D%25e%29%29 &binddn=CN%3DAdministrator%2COU%3Dtesting%2CDC%3Dcompany&bindpass=1111_aaaa&port=389&response=json&apiKey=YourAPIKey&signature=YourSignatureHash

The next few sections explain some of the concepts you will need to know
when filling out the ldapConfig parameters.

Search Base
~~~~~~~~~~~

An LDAP query is relative to a given node of the LDAP directory tree,
called the search base. The search base is the distinguished name (DN)
of a level of the directory tree below which all users can be found. The
users can be in the immediate base directory or in some subdirectory.
The search base may be equivalent to the organization, group, or domain
name. The syntax for writing a DN varies depending on which LDAP server
you are using. A full discussion of distinguished names is outside the
scope of our documentation. The following table shows some examples of
search bases to find users in the testing department..

================  =======================
LDAP Server       Example Search Base DN
================  =======================
ApacheDS          OU=testing, O=project
Active Directory  OU=testing, DC=company
================  =======================

Query Filter
~~~~~~~~~~~~

The query filter is used to find a mapped user in the external LDAP
server. The query filter should uniquely map the CloudStack user to LDAP
user for a meaningful authentication. For more information about query
filter syntax, consult the documentation for your LDAP server.

The CloudStack query filter wildcards are:

=====================  ====================
Query Filter Wildcard  Description
=====================  ====================
%u                     User name
%e                     Email address
%n                     First and last name
=====================  ====================

The following examples assume you are using Active Directory, and refer
to user attributes from the Active Directory schema.

If the CloudStack user name is the same as the LDAP user ID:

.. code:: bash

    (uid=%u)

If the CloudStack user name is the LDAP display name:

.. code:: bash

    (displayName=%u)

To find a user by email address:

.. code:: bash

    (mail=%e)

Search User Bind DN
~~~~~~~~~~~~~~~~~~~

The bind DN is the user on the external LDAP server permitted to search
the LDAP directory within the defined search base. When the DN is
returned, the DN and passed password are used to authenticate the
CloudStack user with an LDAP bind. A full discussion of bind DNs is
outside the scope of our documentation. The following table shows some
examples of bind DNs.

================  =================================================
LDAP Server       Example Bind DN
================  =================================================
ApacheDS          CN=Administrator,DC=testing,OU=project,OU=org
Active Directory  CN=Administrator, OU=testing, DC=company, DC=com
================  =================================================


SSL Keystore Path and Password
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If the LDAP server requires SSL, you need to enable it in the ldapConfig
command by setting the parameters ssl, truststore, and truststorepass.
Before enabling SSL for ldapConfig, you need to get the certificate
which the LDAP server is using and add it to a trusted keystore. You
will need to know the path to the keystore and the password.


.. |button to dedicate a zone, pod,cluster, or host| image:: _static/images/dedicate-resource-button.png
