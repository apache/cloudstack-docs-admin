��    x      �              �  o   �  ?     �   M  �  �  �  �
    W  T   e  G   �  �    m   �  A   �  4   ;  >   p    �  W  �  �    �   �  )  �  �  �  >  ?  ?   ~  z  �  %   9  ?   _  �  �    /  �   =      �   p   �   �   b!  W   �!  �   ="     �"     �"  
   �"  �   #  �   �#     ?$     _$     d$     h$     {$  
   �$     �$  
   �$     �$     �$  ^   �$  a   %%  f   �%  �   �%  �   }&  P   '  Z   U'  n   �'  ^   (  3   ~(  �   �(  n   4)     �)     �)  �   �)  U  �*  q  ,  �   y-  �   .  �   �.  �   3/  ,   �/  *   �/  4   0     Q0     Z0     l0     x0     �0  2   �0     �0     �0     �0      1     1  +   1  �   =1     +2  q   ;2  E   �2     �2  F   3  /   L3     |3  !   �3  �   �3     34     S4  n   Z4     �4  0   �4  5   
5  2   @5  
   s5  	  ~5  
   �6     �6  	   �6     �6  t  �6  S   ;9  4   �9  �   �9     �:  	   �:     �:     �:  �   �:  [  I;  x  �<     >  r   ">  �  �>  o   ]@  ?   �@  �   A  �  �A  �  �C    E  T   %F  G   zF  �  �F  m   KH  A   �H  4   �H  >   0I    oI  W  |J  �  �L  �   WN  )  KO  �  uP  >  �Q  ?   >T  z  ~T  ,   �U  ?   &V  �  fV    �W  �   Y     �Y  p   �Y  �   1Z  W   �Z  �   [     �[  )   �[     �[  �   �[  �   �\  ,   &]     S]     X]     \]     z]  
   �]     �]  
   �]     �]     �]  ^   �]  a   $^  f   �^  �   �^  �   |_  P   `  Z   T`  n   �`  ^   a  3   }a  �   �a  n   3b      �b     �b  �   �b  U  �c  q  e  �   �f  �   g  �   �g  �   :h  ,   �h  6   �h  4   /i     di     ki     |i     �i     �i  H   �i     �i     j     j     :j     >j  +   Lj  �   xj     fk  q   vk  E   �k     .l  F   Al  /   �l     �l  !   �l  �   �l  +   um     �m  n   �m     n  0   ,n  5   ]n  2   �n  
   �n  	  �n  
   �o      �o  	   p     p  t  %p  S   �r  4   �r  �   #s  "   �s     t     t     t  �   ,t  [  �t  x  v     �w  r   �w   (Optional) Name one of several available providers to use for a given service, such as Juniper for the firewall (Optional) Network tag to specify which physical network to use **Associate Public IP**: Select this option if you want to assign a public IP address to the VMs deployed in the guest network. This option is available only if **Conserve mode**: Indicate whether to use conserve mode. In this mode, network resources are allocated only when the first virtual machine starts in the network. When conservative mode is off, the public IP can only be used for a single service. For example, a public IP used for a port forwarding rule cannot be used for defining other services, such as StaticNAT or load balancing. When the conserve mode is on, you can define more than one service on the same public IP. **Dedicated**: If you select dedicated LB isolation, a dedicated load balancer device is assigned for the network from the pool of dedicated load balancer devices provisioned in the zone. If no sufficient dedicated load balancer devices are available in the zone, network creation fails. Dedicated device is a good choice for the high-traffic networks that make full use of the device's resources. **Default egress policy**: Configure the default policy for firewall egress rules. Options are Allow and Deny. Default is Allow if no egress policy is specified, which indicates that all the egress traffic is accepted when a guest network is created from this offering. **Description**. A short description of the offering that can be displayed to users. **Guest Type**. Choose whether the guest network is isolated or shared. **Inline mode**: Supported only for Juniper SRX firewall and BigF5 load balancer devices. In inline mode, a firewall device is placed in front of a load balancing device. The firewall acts as the gateway for all the incoming traffic, then redirect the load balancing traffic to the load balancer behind it. The load balancer in this case will not have the direct access to the public network. **LB Isolation**: Specify what type of load balancer isolation you want for the network: Shared or Dedicated. **Mode**: You can select either Inline mode or Side by Side mode: **Name**. Any desired name for the network offering. **Network Rate**. Allowed data transfer rate in MB per second. **Persistent**. Indicate whether the guest network is persistent or not. The network that you can provision without having to deploy a VM on it is termed persistent network. For more information, see `“Persistent Networks” <networking2.html#persistent-networks>`_. **Redundant router capability**: Available only when Virtual Router is selected as the Source NAT provider. Select this option if you want to use two virtual routers in the network for uninterrupted connection: one operating as the master virtual router and the other as the backup. The master virtual router receives requests from and sends responses to the user’s VM. The backup virtual router is activated only when the master is down. After the failover, the backup becomes the master virtual router. CloudStack deploys the routers on different hosts to ensure reliability if one host is down. **Shared**: If you select shared LB isolation, a shared load balancer device is assigned for the network from the pool of shared load balancer devices provisioned in the zone. While provisioning CloudStack picks the shared load balancer device that is used by the least number of accounts. Once the device reaches its maximum capacity, the device will not be allocated to a new account. **Side by Side**: In side by side mode, a firewall device is deployed in parallel with the load balancer device. So the traffic to the load balancer public IP is not routed through the firewall, and therefore, is exposed to the public network. **Specify VLAN**. (Isolated guest networks only) Indicate whether a VLAN could be specified when this offering is used. If you select this option and later use this network offering while creating a VPC tier or an isolated network, you will be able to specify a VLAN ID for the network you create. **Supported Services**. Select one or more of the possible network services. For some services, you must also choose the service provider; for example, if you select Load Balancer, you can choose the CloudStack virtual router or any other load balancers that have been configured in the cloud. Depending on which services you choose, additional fields may appear in the rest of the dialog box. **System Offering**. If the service provider for any of the services selected in Supported Services is a virtual router, the System Offering field appears. Choose the system service offering that you want virtual routers to use in this network. For example, if you selected Load Balancer in Supported Services and selected a virtual router to provide load balancing, the System Offering field appears so you can choose between the CloudStack default system service offering and any custom system service offerings that have been defined by the CloudStack root administrator. **Tags**: Network tag to specify which physical network to use. **VPC**. This option indicate whether the guest network is Virtual Private Cloud-enabled. A Virtual Private Cloud (VPC) is a private, isolated part of CloudStack. A VPC can have its own virtual network topology that resembles a traditional physical network. For more information on VPCs, see `“About Virtual Private Clouds” <networking2.html#about-virtual-private-clouds>`_. *Supported Network Service Providers* A network offering is a named set of network services, such as: A service provider (also called a network element) is hardware or virtual appliance that makes a network service possible; for example, a firewall appliance can be installed in the cloud to provide firewall service. On a single network, multiple providers can provide the same network service. For example, a firewall service may be provided by Cisco or Juniper devices in the same physical network. A shared network can be accessed by virtual machines that belong to many different accounts. Network Isolation on shared networks is accomplished by using techniques such as security groups, which is supported only in Basic zones in CloudStack 3.0.3 and later versions. A virtual network is a logical construct that enables multi-tenancy on a single physical network. In CloudStack a virtual network can be shared or isolated. About Virtual Networks Add new network offerings as time goes on so end users can upgrade to a better class of service on their network An isolated network can be accessed only by virtual machines of a single account. Isolated networks have the following properties. Based on the guest network type selected, you can see the following supported services: Bundle different types of network services into network offerings, so users can choose the desired network services for any given virtual machine Citrix NetScaler Click Add Network Offering. Click Add. CloudStack also has internal network offerings for use by CloudStack system VMs. These network offerings are not visible to users but can be modified by administrators. CloudStack ships with an internal list of the supported service providers, and you can choose from this list when creating a network offering. Creating a New Network Offering DHCP DNS DNS/DHCP/User Data Description Elastic IP Elastic IP is enabled. Elastic LB F5 BigIP Firewall For a description of this term, see `“About Virtual Networks” <#about-virtual-networks>`_. For information on Elastic IP, see `“About Elastic IP” <networking2.html#about-elastic-ip>`_. For more information, see `“Adding a Security Group” <networking2.html#adding-a-security-group>`_. For more information, see `“Configure Guest Traffic in an Advanced Zone” <networking2.html#configure-guest-traffic-in-an-advanced-zone>`_. For more information, see `“Configuring Network Access Control List” <networking2.html#configuring-network-access-control-list>`_. For more information, see `“DNS and DHCP” <networking2.html#dns-and-dhcp>`_. For more information, see `“Remote Access VPN” <networking2.html#remote-access-vpn>`_. For more information, see `“System Service Offerings” <service_offerings.html#system-service-offerings>`_. For more information, see `“User Data and Meta Data” <api.html#user-data-and-meta-data>`_. For more information, see the Administration Guide. For the most up-to-date list of supported network service providers, see the CloudStack UI or call `listNetworkServiceProviders`. For the most up-to-date list of supported network services, see the CloudStack UI or call listNetworkServices. Guest network is shared. Host based (KVM/Xen) If StaticNAT is enabled, irrespective of the status of the conserve mode, no port forwarding or load balancing rule can be created for the IP. However, you can add the firewall rules by using the createFirewallRule command. If different providers are set up to provide the same service on the network, the administrator can create network offerings so users can specify which network service provider they prefer (along with the other choices offered in network offerings). Otherwise, CloudStack will choose which provider to use whenever the service is called for. If you create load balancing rules while using a network service offering that includes an external load balancer device such as NetScaler, and later change the network service offering to one that uses the CloudStack virtual router, you must create a firewall rule on the virtual router for each of your existing load balancing rules so that they continue to function. If you select Load Balancer, you can choose the CloudStack virtual router or any other load balancers that have been configured in the cloud. If you select Port Forwarding, you can choose the CloudStack virtual router or any other Port Forwarding providers that have been configured in the cloud. If you select Source NAT, you can choose the CloudStack virtual router or any other Source NAT providers that have been configured in the cloud. If you select Static NAT, you can choose the CloudStack virtual router or any other Static NAT providers that have been configured in the cloud. In Select Offering, choose Network Offering. In the dialog, make the following choices: In the left navigation bar, click Service Offerings. Isolated Isolated Networks Juniper SRX Load Balancer Load Balancing Log in with admin privileges to the CloudStack UI. Network ACL Network Offerings Network Service Providers No Not Supported Overview of Setting Up Networking for Users People using cloud infrastructure have a variety of needs and preferences when it comes to the networking services provided by the cloud. As a CloudStack administrator, you can do the following things to set up networking for your users: Port Forwarding Provide more ways for a network to be accessed by a user, such as through a project of which the user is a member Public Network is a shared network that is not shown to the end users Remote Access VPN Resources such as VLAN are allocated and garbage collected dynamically Runtime Allocation of Virtual Network Resources Security Groups Set up physical networks in zones Set up several different providers for the same service on a single physical network (for example, both Cisco and Juniper firewalls) Setting Up Networking for Users Shared Shared Network resources such as VLAN and physical network that it maps to are designated by the administrator Shared Networks Shared Networks are created by the administrator Shared Networks can be designated to a certain domain Shared Networks can be isolated by security groups Source NAT Source NAT per zone is not supported in Shared Network when the service provider is virtual router. However, Source NAT per account is supported. For information, see `“Configuring a Shared Guest Network” <networking2.html#configuring-a-shared-guest-network>`_. Static NAT StaticNAT is enabled. Supported Supported Services The CloudStack administrator can create any number of custom network offerings, in addition to the default network offerings provided by CloudStack. By creating multiple custom network offerings, you can set up your cloud to offer different classes of service on a single multi-tenant physical network. For example, while the underlying physical wiring may be the same for two tenants, tenant A may only need simple firewall protection for their website, while tenant B may be running a web server farm and require a scalable firewall solution, load balancing solution, and alternate networks for accessing the database backend. The network offering can be upgraded or downgraded but it is for the entire network There is one network offering for the entire network To block the egress traffic for a guest network, select Deny. In this case, when you configure an egress rules for an isolated guest network, rules are added to allow the specified traffic. To create a network offering: User Data VPN Virtual Router When creating a new VM, the user chooses one of the available network offerings, and that determines which network services the VM can use. When creating a new virtual network, the CloudStack administrator chooses which network offering to enable for that network. Each virtual network is associated with one network offering. A virtual network can be upgraded or downgraded by changing its associated network offering. If you do this, be sure to reprogram the physical network to match. When you define a new virtual network, all your settings for that network are stored in CloudStack. The actual network resources are activated only when the first virtual machine starts in the network. When all virtual machines have left the virtual network, the network resources are garbage collected so they can be allocated again. This helps to conserve network resources. Yes You can have multiple instances of the same service provider in a network (say, more than one Juniper SRX device). Project-Id-Version: Apache CloudStack Administration RTD
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-06-30 12:52+0200
PO-Revision-Date: 2016-08-19 18:07+0200
Last-Translator: 
Language: fr
Language-Team: French (http://www.transifex.com/ke4qqq/apache-cloudstack-administration-rtd/language/fr/)
Plural-Forms: nplurals=2; plural=(n > 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.3.4
 (Optional) Name one of several available providers to use for a given service, such as Juniper for the firewall (Optional) Network tag to specify which physical network to use **Associate Public IP**: Select this option if you want to assign a public IP address to the VMs deployed in the guest network. This option is available only if **Conserve mode**: Indicate whether to use conserve mode. In this mode, network resources are allocated only when the first virtual machine starts in the network. When conservative mode is off, the public IP can only be used for a single service. For example, a public IP used for a port forwarding rule cannot be used for defining other services, such as StaticNAT or load balancing. When the conserve mode is on, you can define more than one service on the same public IP. **Dedicated**: If you select dedicated LB isolation, a dedicated load balancer device is assigned for the network from the pool of dedicated load balancer devices provisioned in the zone. If no sufficient dedicated load balancer devices are available in the zone, network creation fails. Dedicated device is a good choice for the high-traffic networks that make full use of the device's resources. **Default egress policy**: Configure the default policy for firewall egress rules. Options are Allow and Deny. Default is Allow if no egress policy is specified, which indicates that all the egress traffic is accepted when a guest network is created from this offering. **Description**. A short description of the offering that can be displayed to users. **Guest Type**. Choose whether the guest network is isolated or shared. **Inline mode**: Supported only for Juniper SRX firewall and BigF5 load balancer devices. In inline mode, a firewall device is placed in front of a load balancing device. The firewall acts as the gateway for all the incoming traffic, then redirect the load balancing traffic to the load balancer behind it. The load balancer in this case will not have the direct access to the public network. **LB Isolation**: Specify what type of load balancer isolation you want for the network: Shared or Dedicated. **Mode**: You can select either Inline mode or Side by Side mode: **Name**. Any desired name for the network offering. **Network Rate**. Allowed data transfer rate in MB per second. **Persistent**. Indicate whether the guest network is persistent or not. The network that you can provision without having to deploy a VM on it is termed persistent network. For more information, see `“Persistent Networks” <networking2.html#persistent-networks>`_. **Redundant router capability**: Available only when Virtual Router is selected as the Source NAT provider. Select this option if you want to use two virtual routers in the network for uninterrupted connection: one operating as the master virtual router and the other as the backup. The master virtual router receives requests from and sends responses to the user’s VM. The backup virtual router is activated only when the master is down. After the failover, the backup becomes the master virtual router. CloudStack deploys the routers on different hosts to ensure reliability if one host is down. **Shared**: If you select shared LB isolation, a shared load balancer device is assigned for the network from the pool of shared load balancer devices provisioned in the zone. While provisioning CloudStack picks the shared load balancer device that is used by the least number of accounts. Once the device reaches its maximum capacity, the device will not be allocated to a new account. **Side by Side**: In side by side mode, a firewall device is deployed in parallel with the load balancer device. So the traffic to the load balancer public IP is not routed through the firewall, and therefore, is exposed to the public network. **Specify VLAN**. (Isolated guest networks only) Indicate whether a VLAN could be specified when this offering is used. If you select this option and later use this network offering while creating a VPC tier or an isolated network, you will be able to specify a VLAN ID for the network you create. **Supported Services**. Select one or more of the possible network services. For some services, you must also choose the service provider; for example, if you select Load Balancer, you can choose the CloudStack virtual router or any other load balancers that have been configured in the cloud. Depending on which services you choose, additional fields may appear in the rest of the dialog box. **System Offering**. If the service provider for any of the services selected in Supported Services is a virtual router, the System Offering field appears. Choose the system service offering that you want virtual routers to use in this network. For example, if you selected Load Balancer in Supported Services and selected a virtual router to provide load balancing, the System Offering field appears so you can choose between the CloudStack default system service offering and any custom system service offerings that have been defined by the CloudStack root administrator. **Tags**: Network tag to specify which physical network to use. **VPC**. This option indicate whether the guest network is Virtual Private Cloud-enabled. A Virtual Private Cloud (VPC) is a private, isolated part of CloudStack. A VPC can have its own virtual network topology that resembles a traditional physical network. For more information on VPCs, see `“About Virtual Private Clouds” <networking2.html#about-virtual-private-clouds>`_. *Fournisseurs de service réseau supportés* A network offering is a named set of network services, such as: A service provider (also called a network element) is hardware or virtual appliance that makes a network service possible; for example, a firewall appliance can be installed in the cloud to provide firewall service. On a single network, multiple providers can provide the same network service. For example, a firewall service may be provided by Cisco or Juniper devices in the same physical network. A shared network can be accessed by virtual machines that belong to many different accounts. Network Isolation on shared networks is accomplished by using techniques such as security groups, which is supported only in Basic zones in CloudStack 3.0.3 and later versions. A virtual network is a logical construct that enables multi-tenancy on a single physical network. In CloudStack a virtual network can be shared or isolated. A propos des réseaux virtuels Add new network offerings as time goes on so end users can upgrade to a better class of service on their network An isolated network can be accessed only by virtual machines of a single account. Isolated networks have the following properties. Based on the guest network type selected, you can see the following supported services: Bundle different types of network services into network offerings, so users can choose the desired network services for any given virtual machine Citrix NetScaler Cliquer sur Ajouter une offre de réseau. Cliquer sur Ajouter. CloudStack also has internal network offerings for use by CloudStack system VMs. These network offerings are not visible to users but can be modified by administrators. CloudStack ships with an internal list of the supported service providers, and you can choose from this list when creating a network offering. Créer une nouvelle offre de service Réseau DHCP DNS DNS/DHCP/Données utilisateur Description Elastic IP Elastic IP is enabled. Elastic LB F5 BigIP Pare-feu For a description of this term, see `“About Virtual Networks” <#about-virtual-networks>`_. For information on Elastic IP, see `“About Elastic IP” <networking2.html#about-elastic-ip>`_. For more information, see `“Adding a Security Group” <networking2.html#adding-a-security-group>`_. For more information, see `“Configure Guest Traffic in an Advanced Zone” <networking2.html#configure-guest-traffic-in-an-advanced-zone>`_. For more information, see `“Configuring Network Access Control List” <networking2.html#configuring-network-access-control-list>`_. For more information, see `“DNS and DHCP” <networking2.html#dns-and-dhcp>`_. For more information, see `“Remote Access VPN” <networking2.html#remote-access-vpn>`_. For more information, see `“System Service Offerings” <service_offerings.html#system-service-offerings>`_. For more information, see `“User Data and Meta Data” <api.html#user-data-and-meta-data>`_. For more information, see the Administration Guide. For the most up-to-date list of supported network service providers, see the CloudStack UI or call `listNetworkServiceProviders`. For the most up-to-date list of supported network services, see the CloudStack UI or call listNetworkServices. Le réseau invité est partagé. Host based (KVM/Xen) If StaticNAT is enabled, irrespective of the status of the conserve mode, no port forwarding or load balancing rule can be created for the IP. However, you can add the firewall rules by using the createFirewallRule command. If different providers are set up to provide the same service on the network, the administrator can create network offerings so users can specify which network service provider they prefer (along with the other choices offered in network offerings). Otherwise, CloudStack will choose which provider to use whenever the service is called for. If you create load balancing rules while using a network service offering that includes an external load balancer device such as NetScaler, and later change the network service offering to one that uses the CloudStack virtual router, you must create a firewall rule on the virtual router for each of your existing load balancing rules so that they continue to function. If you select Load Balancer, you can choose the CloudStack virtual router or any other load balancers that have been configured in the cloud. If you select Port Forwarding, you can choose the CloudStack virtual router or any other Port Forwarding providers that have been configured in the cloud. If you select Source NAT, you can choose the CloudStack virtual router or any other Source NAT providers that have been configured in the cloud. If you select Static NAT, you can choose the CloudStack virtual router or any other Static NAT providers that have been configured in the cloud. In Select Offering, choose Network Offering. Dans la boîte de dialogue, faire les choix suivants : In the left navigation bar, click Service Offerings. Isolé Réseaux isolés Juniper SRX Répartition de charge Répartition de charge Se connecter avec les droits d'administrateur à l'interface CloudStack. ACL réseau Offres réseau Fournisseurs de service réseau Non Non supporté Overview of Setting Up Networking for Users People using cloud infrastructure have a variety of needs and preferences when it comes to the networking services provided by the cloud. As a CloudStack administrator, you can do the following things to set up networking for your users: Port Forwarding Provide more ways for a network to be accessed by a user, such as through a project of which the user is a member Public Network is a shared network that is not shown to the end users Accès distant VPN Resources such as VLAN are allocated and garbage collected dynamically Runtime Allocation of Virtual Network Resources Groupes de sécurité Set up physical networks in zones Set up several different providers for the same service on a single physical network (for example, both Cisco and Juniper firewalls) Configurer le réseau pour les utilisateurs Partagé Shared Network resources such as VLAN and physical network that it maps to are designated by the administrator Réseaux partagés Shared Networks are created by the administrator Shared Networks can be designated to a certain domain Shared Networks can be isolated by security groups Source NAT Source NAT per zone is not supported in Shared Network when the service provider is virtual router. However, Source NAT per account is supported. For information, see `“Configuring a Shared Guest Network” <networking2.html#configuring-a-shared-guest-network>`_. Static NAT Le NAT-age statique est activé. Supporté Services supportés The CloudStack administrator can create any number of custom network offerings, in addition to the default network offerings provided by CloudStack. By creating multiple custom network offerings, you can set up your cloud to offer different classes of service on a single multi-tenant physical network. For example, while the underlying physical wiring may be the same for two tenants, tenant A may only need simple firewall protection for their website, while tenant B may be running a web server farm and require a scalable firewall solution, load balancing solution, and alternate networks for accessing the database backend. The network offering can be upgraded or downgraded but it is for the entire network There is one network offering for the entire network To block the egress traffic for a guest network, select Deny. In this case, when you configure an egress rules for an isolated guest network, rules are added to allow the specified traffic. Pour créer une offre de réseau : Donnée utilisateur VPN Routeur virtuel When creating a new VM, the user chooses one of the available network offerings, and that determines which network services the VM can use. When creating a new virtual network, the CloudStack administrator chooses which network offering to enable for that network. Each virtual network is associated with one network offering. A virtual network can be upgraded or downgraded by changing its associated network offering. If you do this, be sure to reprogram the physical network to match. When you define a new virtual network, all your settings for that network are stored in CloudStack. The actual network resources are activated only when the first virtual machine starts in the network. When all virtual machines have left the virtual network, the network resources are garbage collected so they can be allocated again. This helps to conserve network resources. Oui You can have multiple instances of the same service provider in a network (say, more than one Juniper SRX device). 