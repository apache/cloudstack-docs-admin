��    /      �                ~     h   �  U   �  K   K    �  4   �  9   �  G     n   T  �   �  C   �  <   �  D   7  B   |  �   �  �   ]	  �   �	  ~   j
  F   �
  '   0  B   X  ,   �     �     �  	   �             1   7  8   i  +   �  ,   �  "   �  M     w   l  .   �  �     -   �     �  2   �  "        4  *   K  *   v  h   �  �   
     �  �  �  ~   �  h   )  U   �  K   �    4  4   :  9   o  G   �  n   �  �   `  C   S  <   �  D   �  B     �   \  �   �  �   �  ~     F   �  '   �  B   �  ,   8     e     ~     �     �     �  1   �  8     +   E  ,   q  "   �  M   �  w     B   �  �   �  -   L  "   z  2   �  "   �  '   �  *     *   F  h   q  �   �     �    **Account**: The account for which the guest network is being created for. You must specify the domain the account belongs to. **All**: The guest network is available for all the domains, account, projects within the selected zone. **Description**: The short description of the network that can be displayed to users. **Display Text**: The description of the network. This will be user-visible **Domain**: Selecting Domain limits the scope of this guest network to the domain you specify. The network will not be available for other domains. If you select Subdomain Access, the guest network is available to all the sub domains within the selected domain. **Gateway**: The gateway that the guests should use. **Guest Gateway**: The gateway that the guests should use **Guest Netmask**: The netmask in use on the subnet the guests will use **IP Range**: A range of IP addresses that are accessible from the Internet and are assigned to the guest VMs. **IPv6 CIDR**: The network prefix that defines the guest network subnet. This is the CIDR that describes the IPv6 addresses in use in the guest networks in this zone. To allot IP addresses from within a particular address block, enter a CIDR. **Isolated VLAN ID**: The unique ID of the Secondary Isolated VLAN. **Name**: The name of the network. This will be user-visible **Name**: The name of the network. This will be visible to the user. **Netmask**: The netmask in use on the subnet the guests will use. **Network Domain**: A custom DNS suffix at the level of a network. If you want to assign a special domain name to the guest VM network, specify a DNS suffix. **Network Offering**: If the administrator has configured multiple network offerings, select the one you want to use for this network. **Network offering**: If the administrator has configured multiple network offerings, select the one you want to use for this network **Project**: The project for which the guest network is being created for. You must specify the domain the project belongs to. **Scope**: The available scopes are Domain, Account, Project, and All. **VLAN ID**: The unique ID of the VLAN. **Zone**: The zone in which you are configuring the guest network. Advanced Zone Physical Network Configuration Click Add guest network. Click OK to confirm. Click OK. Click the Network tab. Click the Physical Network tab. Click the physical network you want to work with. Click the zone to which you want to add a guest network. Configure Guest Traffic in an Advanced Zone Configure Public Traffic in an Advanced Zone Configuring a Shared Guest Network If one NIC is used, these IPs should be in the same CIDR in the case of IPv6. In a zone that uses advanced networking, you need to configure at least one range of IP addresses for Internet traffic. In the left navigation, choose Infrastructure. In the left navigation, choose Infrastructure. On Zones, click View More, then click the zone to which you want to add a network. Log in to the CloudStack UI as administrator. On Zones, click View More. On the Guest node of the diagram, click Configure. Provide the following information: Specify the following: The Add guest network window is displayed. The Add guest network window is displayed: These steps assume you have already logged in to the CloudStack UI. To configure the base guest network: Within a zone that uses advanced networking, you need to tell the Management Server how the physical network is set up to carry different kinds of traffic in isolation. |addguestnetwork.png| Project-Id-Version: Apache CloudStack Administration RTD
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-06-30 12:52+0200
PO-Revision-Date: 2014-06-30 12:05+0000
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: fr
Language-Team: French (http://www.transifex.com/ke4qqq/apache-cloudstack-administration-rtd/language/fr/)
Plural-Forms: nplurals=2; plural=(n > 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.3.4
 **Account**: The account for which the guest network is being created for. You must specify the domain the account belongs to. **All**: The guest network is available for all the domains, account, projects within the selected zone. **Description**: The short description of the network that can be displayed to users. **Display Text**: The description of the network. This will be user-visible **Domain**: Selecting Domain limits the scope of this guest network to the domain you specify. The network will not be available for other domains. If you select Subdomain Access, the guest network is available to all the sub domains within the selected domain. **Gateway**: The gateway that the guests should use. **Guest Gateway**: The gateway that the guests should use **Guest Netmask**: The netmask in use on the subnet the guests will use **IP Range**: A range of IP addresses that are accessible from the Internet and are assigned to the guest VMs. **IPv6 CIDR**: The network prefix that defines the guest network subnet. This is the CIDR that describes the IPv6 addresses in use in the guest networks in this zone. To allot IP addresses from within a particular address block, enter a CIDR. **Isolated VLAN ID**: The unique ID of the Secondary Isolated VLAN. **Name**: The name of the network. This will be user-visible **Name**: The name of the network. This will be visible to the user. **Netmask**: The netmask in use on the subnet the guests will use. **Network Domain**: A custom DNS suffix at the level of a network. If you want to assign a special domain name to the guest VM network, specify a DNS suffix. **Network Offering**: If the administrator has configured multiple network offerings, select the one you want to use for this network. **Network offering**: If the administrator has configured multiple network offerings, select the one you want to use for this network **Project**: The project for which the guest network is being created for. You must specify the domain the project belongs to. **Scope**: The available scopes are Domain, Account, Project, and All. **VLAN ID**: The unique ID of the VLAN. **Zone**: The zone in which you are configuring the guest network. Advanced Zone Physical Network Configuration Click Add guest network. Click OK to confirm. Cliquez sur OK. Click the Network tab. Click the Physical Network tab. Click the physical network you want to work with. Click the zone to which you want to add a guest network. Configure Guest Traffic in an Advanced Zone Configure Public Traffic in an Advanced Zone Configuring a Shared Guest Network If one NIC is used, these IPs should be in the same CIDR in the case of IPv6. In a zone that uses advanced networking, you need to configure at least one range of IP addresses for Internet traffic. Choisissez Infrastructure dans le panneau de navigation à gauche. In the left navigation, choose Infrastructure. On Zones, click View More, then click the zone to which you want to add a network. Log in to the CloudStack UI as administrator. Dans zones, cliquez sur Voir tout. On the Guest node of the diagram, click Configure. Provide the following information: Spécifier les informations suivantes : The Add guest network window is displayed. The Add guest network window is displayed: These steps assume you have already logged in to the CloudStack UI. To configure the base guest network: Within a zone that uses advanced networking, you need to tell the Management Server how the physical network is set up to carry different kinds of traffic in isolation. |addguestnetwork.png| 