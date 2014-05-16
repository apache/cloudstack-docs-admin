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
   

Remote Access VPN
-----------------

CloudStack account owners can create virtual private networks (VPN) to
access their virtual machines. If the guest network is instantiated from
a network offering that offers the Remote Access VPN service, the
virtual router (based on the System VM) is used to provide the service.
CloudStack provides a L2TP-over-IPsec-based remote access VPN service to
guest virtual networks. Since each network gets its own virtual router,
VPNs are not shared across the networks. VPN clients native to Windows,
Mac OS X and iOS can be used to connect to the guest networks. The
account owner can create and manage users for their VPN. CloudStack does
not use its account database for this purpose but uses a separate table.
The VPN user database is shared across all the VPNs created by the
account owner. All VPN users get access to all VPNs created by the
account owner.

.. note:: 
   Make sure that not all traffic goes through the VPN. That is, the route
   installed by the VPN should be only for the guest network and not for
   all traffic.

-  **Road Warrior / Remote Access**. Users want to be able to connect
   securely from a home or office to a private network in the cloud.
   Typically, the IP address of the connecting client is dynamic and
   cannot be preconfigured on the VPN server.

-  **Site to Site**. In this scenario, two private subnets are connected
   over the public Internet with a secure VPN tunnel. The cloud user's
   subnet (for example, an office network) is connected through a
   gateway to the network in the cloud. The address of the user's
   gateway must be preconfigured on the VPN server in the cloud. Note
   that although L2TP-over-IPsec can be used to set up Site-to-Site
   VPNs, this is not the primary intent of this feature. For more
   information, see ":ref:`setting-s2s-vpn-conn`".


Configuring Remote Access VPN
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To set up VPN for the cloud:

#. Log in to the CloudStack UI as an administrator or end user.

#. In the left navigation, click Global Settings.

#. Set the following global configuration parameters.

   -  remote.access.vpn.client.ip.range - The range of IP addresses to
      be allocated to remote access VPN clients. The first IP in the
      range is used by the VPN server.

   -  remote.access.vpn.psk.length - Length of the IPSec key.

   -  remote.access.vpn.user.limit - Maximum number of VPN users per
      account.

To enable VPN for a particular network:

#. Log in as a user or administrator to the CloudStack UI.

#. In the left navigation, click Network.

#. Click the name of the network you want to work with.

#. Click View IP Addresses.

#. Click one of the displayed IP address names.

#. Click the Enable VPN button. |vpn-icon.png|

   The IPsec key is displayed in a popup window.


Configuring Remote Access VPN in VPC
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

On enabling Remote Access VPN on a VPC, any VPN client present outside
the VPC can access VMs present in the VPC by using the Remote VPN
connection. The VPN client can be present anywhere except inside the VPC
on which the user enabled the Remote Access VPN service.

To enable VPN for a VPC:

#. Log in as a user or administrator to the CloudStack UI.

#. In the left navigation, click Network.

#. In the Select view, select VPC.

   All the VPCs that you have created for the account is listed in the
   page.

#. Click the Configure button of the VPC.

   For each tier, the following options are displayed:

   -  Internal LB

   -  Public LB IP

   -  Static NAT

   -  Virtual Machines

   -  CIDR

   The following router information is displayed:

   -  Private Gateways

   -  Public IP Addresses

   -  Site-to-Site VPNs

   -  Network ACL Lists

#. In the Router node, select Public IP Addresses.

   The IP Addresses page is displayed.

#. Click Source NAT IP address.

#. Click the Enable VPN button. |vpn-icon.png|

   Click OK to confirm. The IPsec key is displayed in a pop-up window.

Now, you need to add the VPN users.

#. Click the Source NAT IP.

#. Select the VPN tab.

#. Add the username and the corresponding password of the user you
   wanted to add.

#. Click Add.

#. Repeat the same steps to add the VPN users.


Using Remote Access VPN with Windows
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The procedure to use VPN varies by Windows version. Generally, the user
must edit the VPN properties and make sure that the default route is not
the VPN. The following steps are for Windows L2TP clients on Windows
Vista. The commands should be similar for other Windows versions.

#. Log in to the CloudStack UI and click on the source NAT IP for the
   account. The VPN tab should display the IPsec preshared key. Make a
   note of this and the source NAT IP. The UI also lists one or more
   users and their passwords. Choose one of these users, or, if none
   exists, add a user and password.

#. On the Windows box, go to Control Panel, then select Network and
   Sharing center. Click Setup a connection or network.

#. In the next dialog, select No, create a new connection.

#. In the next dialog, select Use my Internet Connection (VPN).

#. In the next dialog, enter the source NAT IP from step
   #1 and give the connection a name. Check Don't
   connect now.

#. In the next dialog, enter the user name and password selected in step
   #1.

#. Click Create.

#. Go back to the Control Panel and click Network Connections to see the
   new connection. The connection is not active yet.

#. Right-click the new connection and select Properties. In the
   Properties dialog, select the Networking tab.

#.

   In Type of VPN, choose L2TP IPsec VPN, then click IPsec settings.
   Select Use preshared key. Enter the preshared key from step #1.

#. The connection is ready for activation. Go back to Control Panel ->
   Network Connections and double-click the created connection.

#. Enter the user name and password from step #1.


Using Remote Access VPN with Mac OS X
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First, be sure you've configured the VPN settings in your CloudStack
install. This section is only concerned with connecting via Mac OS X to
your VPN.

Note, these instructions were written on Mac OS X 10.7.5. They may
differ slightly in older or newer releases of Mac OS X.

#. On your Mac, open System Preferences and click Network.

#. Make sure Send all traffic over VPN connection is not checked.

#. If your preferences are locked, you'll need to click the lock in the
   bottom left-hand corner to make any changes and provide your
   administrator credentials.

#. You will need to create a new network entry. Click the plus icon on
   the bottom left-hand side and you'll see a dialog that says "Select
   the interface and enter a name for the new service." Select VPN from
   the Interface drop-down menu, and "L2TP over IPSec" for the VPN Type.
   Enter whatever you like within the "Service Name" field.

#. You'll now have a new network interface with the name of whatever you
   put in the "Service Name" field. For the purposes of this example,
   we'll assume you've named it "CloudStack." Click on that interface
   and provide the IP address of the interface for your VPN under the
   Server Address field, and the user name for your VPN under Account
   Name.

#. Click Authentication Settings, and add the user's password under User
   Authentication and enter the pre-shared IPSec key in the Shared
   Secret field under Machine Authentication. Click OK.

#. You may also want to click the "Show VPN status in menu bar" but
   that's entirely optional.

#. Now click "Connect" and you will be connected to the CloudStack VPN.


.. _setting-s2s-vpn-conn:

Setting Up a Site-to-Site VPN Connection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A Site-to-Site VPN connection helps you establish a secure connection
from an enterprise datacenter to the cloud infrastructure. This allows
users to access the guest VMs by establishing a VPN connection to the
virtual router of the account from a device in the datacenter of the
enterprise. You can also establish a secure connection between two VPC
setups or high availability zones in your environment. Having this
facility eliminates the need to establish VPN connections to individual
VMs.

The difference from Remote VPN is that Site-to-site VPNs connects entire
networks to each other, for example, connecting a branch office network
to a company headquarters network. In a site-to-site VPN, hosts do not
have VPN client software; they send and receive normal TCP/IP traffic
through a VPN gateway.

The supported endpoints on the remote datacenters are:

-  Cisco ISR with IOS 12.4 or later

-  Juniper J-Series routers with JunOS 9.5 or later

-  CloudStack virtual routers

.. note:: 
   In addition to the specific Cisco and Juniper devices listed above, the
   expectation is that any Cisco or Juniper device running on the supported
   operating systems are able to establish VPN connections.

To set up a Site-to-Site VPN connection, perform the following:

#. Create a Virtual Private Cloud (VPC).

   See ":ref:`configuring-vpc`".

#. Create a VPN Customer Gateway.

#. Create a VPN gateway for the VPC that you created.

#. Create VPN connection from the VPC VPN gateway to the customer VPN
   gateway.


Creating and Updating a VPN Customer Gateway
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note:: 
   A VPN customer gateway can be connected to only one VPN gateway at a time.

To add a VPN Customer Gateway:

#. Log in to the CloudStack UI as an administrator or end user.

#. In the left navigation, choose Network.

#. In the Select view, select VPN Customer Gateway.

#. Click Add VPN Customer Gateway.

   |addvpncustomergateway.png|

   Provide the following information:

   -  **Name**: A unique name for the VPN customer gateway you create.

   -  **Gateway**: The IP address for the remote gateway.

   -  **CIDR list**: The guest CIDR list of the remote subnets. Enter a
      CIDR or a comma-separated list of CIDRs. Ensure that a guest CIDR
      list is not overlapped with the VPC's CIDR, or another guest CIDR.
      The CIDR must be RFC1918-compliant.

   -  **IPsec Preshared Key**: Preshared keying is a method where the
      endpoints of the VPN share a secret key. This key value is used to
      authenticate the customer gateway and the VPC VPN gateway to each
      other.

      .. note:: 
         The IKE peers (VPN end points) authenticate each other by
         computing and sending a keyed hash of data that includes the
         Preshared key. If the receiving peer is able to create the same
         hash independently by using its Preshared key, it knows that both
         peers must share the same secret, thus authenticating the customer
         gateway.

   -  **IKE Encryption**: The Internet Key Exchange (IKE) policy for
      phase-1. The supported encryption algorithms are AES128, AES192,
      AES256, and 3DES. Authentication is accomplished through the
      Preshared Keys.

      .. note:: 
         The phase-1 is the first phase in the IKE process. In this initial
         negotiation phase, the two VPN endpoints agree on the methods to
         be used to provide security for the underlying IP traffic. The
         phase-1 authenticates the two VPN gateways to each other, by
         confirming that the remote gateway has a matching Preshared Key.

   -  **IKE Hash**: The IKE hash for phase-1. The supported hash
      algorithms are SHA1 and MD5.

   -  **IKE DH**: A public-key cryptography protocol which allows two
      parties to establish a shared secret over an insecure
      communications channel. The 1536-bit Diffie-Hellman group is used
      within IKE to establish session keys. The supported options are
      None, Group-5 (1536-bit) and Group-2 (1024-bit).

   -  **ESP Encryption**: Encapsulating Security Payload (ESP) algorithm
      within phase-2. The supported encryption algorithms are AES128,
      AES192, AES256, and 3DES.

      .. note:: 
         The phase-2 is the second phase in the IKE process. The purpose of
         IKE phase-2 is to negotiate IPSec security associations (SA) to
         set up the IPSec tunnel. In phase-2, new keying material is
         extracted from the Diffie-Hellman key exchange in phase-1, to
         provide session keys to use in protecting the VPN data flow.

   -  **ESP Hash**: Encapsulating Security Payload (ESP) hash for
      phase-2. Supported hash algorithms are SHA1 and MD5.

   -  **Perfect Forward Secrecy**: Perfect Forward Secrecy (or PFS) is
      the property that ensures that a session key derived from a set of
      long-term public and private keys will not be compromised. This
      property enforces a new Diffie-Hellman key exchange. It provides
      the keying material that has greater key material life and thereby
      greater resistance to cryptographic attacks. The available options
      are None, Group-5 (1536-bit) and Group-2 (1024-bit). The security
      of the key exchanges increase as the DH groups grow larger, as
      does the time of the exchanges.

      .. note:: 
         When PFS is turned on, for every negotiation of a new phase-2 SA
         the two gateways must generate a new set of phase-1 keys. This
         adds an extra layer of protection that PFS adds, which ensures if
         the phase-2 SA's have expired, the keys used for new phase-2 SA's
         have not been generated from the current phase-1 keying material.

   -  **IKE Lifetime (seconds)**: The phase-1 lifetime of the security
      association in seconds. Default is 86400 seconds (1 day). Whenever
      the time expires, a new phase-1 exchange is performed.

   -  **ESP Lifetime (seconds)**: The phase-2 lifetime of the security
      association in seconds. Default is 3600 seconds (1 hour). Whenever
      the value is exceeded, a re-key is initiated to provide a new
      IPsec encryption and authentication session keys.

   -  **Dead Peer Detection**: A method to detect an unavailable
      Internet Key Exchange (IKE) peer. Select this option if you want
      the virtual router to query the liveliness of its IKE peer at
      regular intervals. It's recommended to have the same configuration
      of DPD on both side of VPN connection.

#. Click OK.


Updating and Removing a VPN Customer Gateway
''''''''''''''''''''''''''''''''''''''''''''

You can update a customer gateway either with no VPN connection, or
related VPN connection is in error state.

#. Log in to the CloudStack UI as an administrator or end user.

#. In the left navigation, choose Network.

#. In the Select view, select VPN Customer Gateway.

#. Select the VPN customer gateway you want to work with.

#. To modify the required parameters, click the Edit VPN Customer
   Gateway button |vpn-edit-icon.png|

#. To remove the VPN customer gateway, click the Delete VPN Customer
   Gateway button |delete.png|

#. Click OK.


Creating a VPN gateway for the VPC
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Log in to the CloudStack UI as an administrator or end user.

#. In the left navigation, choose Network.

#. In the Select view, select VPC.

   All the VPCs that you have created for the account is listed in the
   page.

#. Click the Configure button of the VPC to which you want to deploy the
   VMs.

   The VPC page is displayed where all the tiers you created are listed
   in a diagram.

   For each tier, the following options are displayed:

   -  Internal LB

   -  Public LB IP

   -  Static NAT

   -  Virtual Machines

   -  CIDR

   The following router information is displayed:

   -  Private Gateways

   -  Public IP Addresses

   -  Site-to-Site VPNs

   -  Network ACL Lists

#. Select Site-to-Site VPN.

   If you are creating the VPN gateway for the first time, selecting
   Site-to-Site VPN prompts you to create a VPN gateway.

#. In the confirmation dialog, click Yes to confirm.

   Within a few moments, the VPN gateway is created. You will be
   prompted to view the details of the VPN gateway you have created.
   Click Yes to confirm.

   The following details are displayed in the VPN Gateway page:

   -  IP Address

   -  Account

   -  Domain


Creating a VPN Connection
^^^^^^^^^^^^^^^^^^^^^^^^^

.. note:: CloudStack supports creating up to 8 VPN connections.

#. Log in to the CloudStack UI as an administrator or end user.

#. In the left navigation, choose Network.

#. In the Select view, select VPC.

   All the VPCs that you create for the account are listed in the page.

#. Click the Configure button of the VPC to which you want to deploy the
   VMs.

   The VPC page is displayed where all the tiers you created are listed
   in a diagram.

#. Click the Settings icon.

   For each tier, the following options are displayed:

   -  Internal LB

   -  Public LB IP

   -  Static NAT

   -  Virtual Machines

   -  CIDR

   The following router information is displayed:

   -  Private Gateways

   -  Public IP Addresses

   -  Site-to-Site VPNs

   -  Network ACL Lists

#. Select Site-to-Site VPN.

   The Site-to-Site VPN page is displayed.

#. From the Select View drop-down, ensure that VPN Connection is
   selected.

#. Click Create VPN Connection.

   The Create VPN Connection dialog is displayed:

   |createvpnconnection.png|

#. Select the desired customer gateway.

#. Select Passive if you want to establish a connection between two VPC
   virtual routers.

   If you want to establish a connection between two VPC virtual
   routers, select Passive only on one of the VPC virtual routers, which
   waits for the other VPC virtual router to initiate the connection. Do
   not select Passive on the VPC virtual router that initiates the
   connection.

#. Click OK to confirm.

   Within a few moments, the VPN Connection is displayed.

   The following information on the VPN connection is displayed:

   -  IP Address

   -  Gateway

   -  State

   -  IPSec Preshared Key

   -  IKE Policy

   -  ESP Policy


Site-to-Site VPN Connection Between VPC Networks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

CloudStack provides you with the ability to establish a site-to-site VPN
connection between CloudStack virtual routers. To achieve that, add a
passive mode Site-to-Site VPN. With this functionality, users can deploy
applications in multiple Availability Zones or VPCs, which can
communicate with each other by using a secure Site-to-Site VPN Tunnel.

This feature is supported on all the hypervisors.

#. Create two VPCs. For example, VPC A and VPC B.

   For more information, see ":ref:`configuring-vpc`".

#. Create VPN gateways on both the VPCs you created.

   For more information, see `"Creating a VPN gateway
   for the VPC" <#creating-a-vpn-gateway-for-the-vpc>`_.

#. Create VPN customer gateway for both the VPCs.

   For more information, see `"Creating and Updating
   a VPN Customer Gateway" <#creating-and-updating-a-vpn-customer-gateway>`_.

#. Enable a VPN connection on VPC A in passive mode.

   For more information, see `"Creating a VPN
   Connection" <#creating-a-vpn-connection>`_.

   Ensure that the customer gateway is pointed to VPC B. The VPN
   connection is shown in the Disconnected state.

#. Enable a VPN connection on VPC B.

   Ensure that the customer gateway is pointed to VPC A. Because virtual
   router of VPC A, in this case, is in passive mode and is waiting for
   the virtual router of VPC B to initiate the connection, VPC B virtual
   router should not be in passive mode.

   The VPN connection is shown in the Disconnected state.

   Creating VPN connection on both the VPCs initiates a VPN connection.
   Wait for few seconds. The default is 30 seconds for both the VPN
   connections to show the Connected state.


Restarting and Removing a VPN Connection
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Log in to the CloudStack UI as an administrator or end user.

#. In the left navigation, choose Network.

#. In the Select view, select VPC.

   All the VPCs that you have created for the account is listed in the
   page.

#. Click the Configure button of the VPC to which you want to deploy the
   VMs.

   The VPC page is displayed where all the tiers you created are listed
   in a diagram.

#. Click the Settings icon.

   For each tier, the following options are displayed:

   -  Internal LB

   -  Public LB IP

   -  Static NAT

   -  Virtual Machines

   -  CIDR

   The following router information is displayed:

   -  Private Gateways

   -  Public IP Addresses

   -  Site-to-Site VPNs

   -  Network ACL Lists

#. Select Site-to-Site VPN.

   The Site-to-Site VPN page is displayed.

#. From the Select View drop-down, ensure that VPN Connection is
   selected.

   All the VPN connections you created are displayed.

#. Select the VPN connection you want to work with.

   The Details tab is displayed.

#. To remove a VPN connection, click the Delete VPN connection button
   |remove-vpn.png|

   To restart a VPN connection, click the Reset VPN connection button
   present in the Details tab. |reset-vpn.png|


.. |vpn-icon.png| image:: /_static/images/vpn-icon.png
   :alt: button to enable VPN.
.. |addvpncustomergateway.png| image:: /_static/images/add-vpn-customer-gateway.png
   :alt: adding a customer gateway.
.. |createvpnconnection.png| image:: /_static/images/create-vpn-connection.png
   :alt: creating a VPN connection to the customer gateway.
.. |remove-vpn.png| image:: /_static/images/remove-vpn.png
   :alt: button to remove a VPN connection
.. |reset-vpn.png| image:: /_static/images/reset-vpn.png
   :alt: button to reset a VPN connection
.. |delete.png| image:: /_static/images/delete-button.png
   :alt: button to remove a VPN customer gateway.
.. |vpn-edit-icon.png| image:: /_static/images/edit-icon.png
   :alt: button to edit.
