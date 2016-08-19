��    /      �  C           ~     h   �  U     K   W    �  4   �  9   �  G     n   `  �   �  C   �  <   	  D   C	  B   �	  �   �	  �   i
  �   �
  ~   v  F   �  '   <  B   d  ,   �     �     �  	             #  1   C  8   u  +   �  ,   �  "     M   *  w   x  .   �  �     -   �     �  2   �  "        @  *   W  *   �  h   �  �        �  �  �     �  x     \   �  R   �  /  H  C   x  L   �  {   	  x   �    �  >     @   E  @   �  e   �  �   -  �   �  �   q       J   �  "   �  V   �  5   F  '   |     �     �     �  &   �  C     G   X  3   �  2   �  &     ^   .  ~   �  B      �   O   ?   �   "   '!  :   J!  $   �!  '   �!  5   �!  6   "  |   ?"  �   �"     ~#                    .   	       )      "                (   '          $       -         ,                         &                          +                     /         *                        #         %                
       !       **Account**: The account for which the guest network is being created for. You must specify the domain the account belongs to. **All**: The guest network is available for all the domains, account, projects within the selected zone. **Description**: The short description of the network that can be displayed to users. **Display Text**: The description of the network. This will be user-visible **Domain**: Selecting Domain limits the scope of this guest network to the domain you specify. The network will not be available for other domains. If you select Subdomain Access, the guest network is available to all the sub domains within the selected domain. **Gateway**: The gateway that the guests should use. **Guest Gateway**: The gateway that the guests should use **Guest Netmask**: The netmask in use on the subnet the guests will use **IP Range**: A range of IP addresses that are accessible from the Internet and are assigned to the guest VMs. **IPv6 CIDR**: The network prefix that defines the guest network subnet. This is the CIDR that describes the IPv6 addresses in use in the guest networks in this zone. To allot IP addresses from within a particular address block, enter a CIDR. **Isolated VLAN ID**: The unique ID of the Secondary Isolated VLAN. **Name**: The name of the network. This will be user-visible **Name**: The name of the network. This will be visible to the user. **Netmask**: The netmask in use on the subnet the guests will use. **Network Domain**: A custom DNS suffix at the level of a network. If you want to assign a special domain name to the guest VM network, specify a DNS suffix. **Network Offering**: If the administrator has configured multiple network offerings, select the one you want to use for this network. **Network offering**: If the administrator has configured multiple network offerings, select the one you want to use for this network **Project**: The project for which the guest network is being created for. You must specify the domain the project belongs to. **Scope**: The available scopes are Domain, Account, Project, and All. **VLAN ID**: The unique ID of the VLAN. **Zone**: The zone in which you are configuring the guest network. Advanced Zone Physical Network Configuration Click Add guest network. Click OK to confirm. Click OK. Click the Network tab. Click the Physical Network tab. Click the physical network you want to work with. Click the zone to which you want to add a guest network. Configure Guest Traffic in an Advanced Zone Configure Public Traffic in an Advanced Zone Configuring a Shared Guest Network If one NIC is used, these IPs should be in the same CIDR in the case of IPv6. In a zone that uses advanced networking, you need to configure at least one range of IP addresses for Internet traffic. In the left navigation, choose Infrastructure. In the left navigation, choose Infrastructure. On Zones, click View More, then click the zone to which you want to add a network. Log in to the CloudStack UI as administrator. On Zones, click View More. On the Guest node of the diagram, click Configure. Provide the following information: Specify the following: The Add guest network window is displayed. The Add guest network window is displayed: These steps assume you have already logged in to the CloudStack UI. To configure the base guest network: Within a zone that uses advanced networking, you need to tell the Management Server how the physical network is set up to carry different kinds of traffic in isolation. |addguestnetwork.png| Project-Id-Version: Apache CloudStack Administration RTD
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-06-30 12:52+0200
PO-Revision-Date: 2016-11-19 12:05+0100
Language-Team: French (http://www.transifex.com/ke4qqq/apache-cloudstack-administration-rtd/language/fr/)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Language: fr
Plural-Forms: nplurals=2; plural=(n > 1);
Last-Translator: 
X-Generator: Poedit 1.8.11
 **Compte** : Le compte pour lequel le réseau invité est créé. Vous devez spécifier le domaine auquel appartient le compte. **Tous** : Le réseau invité est disponible pour tous les domaines, comptes, projets au sein de la zone sélectionnée. **Description** : La description courte du réseau qui peut être affichée aux utilisateurs **Texte affiché**: La description du réseau. Cela sera visible de l'utilisateur. **Domaine** : Sélectionner Domaine limite la portée de ce réseau invité au domaine que vous spécifiez. Le réseau ne sera pas disponible pour les autres domaines.Si vous sélectionnez Accès Sous Domaine, le réseau invité est disponible à tous les sous domaines au sein du domaine sélectionné. **Passerelle** : La passerelle que les invités devraient utiliser. **Passerelle invitée** : La passerelle que les invités devraient utiliser. **Masque de sous réseau invité** : Le masque de sous réseau utilisé sur le sous réseau que les invités vont utiliser. **Plage IP** : Une plage d'adresses IP qui sont accessibles depuis l'Internet est qui sont assignées aux VMs invitées. **IPv6 CIRD** : Le préfixe réseau qui défini le sous réseau du réseau invité. C'est le CIDR qui décrit les adresses IPv6 en usage dans les réseaux invités de cette zone. Pour autoriser les adresses IP depuis un bloc d'adresse particulier, entrer un CIDR. **ID du VLAN isolé** : L'ID unique du VLAN secondaire isolé. **Nom** : Le nom du réseau. Cela sera visible de l'utilisateur. **Nom** : Le nom du réseau. Cela sera visible de l'utilisateur. **Masque de sous réseau** : Le masque de sous réseau du réseau que les utilisateurs vont utiliser. **Domaine Réseau** : Un suffixe DNS personnalisé au niveau du réseau. Si vous voulez assigner un nom de domaine spécial au réseau des VM invitées, spécifier un suffixe DNS. **Offre réseau** : Si l'administrateur a configuré plusieurs offres de réseau, sélectionner celui que vous voulez utiliser pour ce réseau. **Offre réseau** : Si l'administrateur a configuré plusieurs offres de réseau, sélectionner celui que vous voulez utiliser pour ce réseau. **Projet** : Le projet pour lequel le réseau invité est créé. Vous devez spécifier le domaine auquel le projet appartient. **Portée** : Les portées possibles sont Domaine, Compte, Projet et Tous. **ID VLAN** : L'ID unique du VLAN. **Zone** : La zone pour laquelle vous êtes en train de configurer le réseau invité. Configuration du réseau physique d'une zone avancée Cliquer sur Ajouter un réseau invité. Cliquer OK pour confirmer. Cliquez sur OK. Cliquer sur l'onglet Réseau. Cliquer sur l'onglet Réseau Physique. Cliquer sur le réseau physique avec lequel vous voulez travailler. Cliquer sur la zone à laquelle vous voulez ajouter un réseau invité. Configurer le trafic invité dans une Zone Avancée Configurer le trafic public dans une Zone Avancée Configurer un réseau invité partagé Si une interface est utilisée, ces IP devrait être dans le même CIDR dans le cas de l'IPv6. Dans une zone qui utilise un réseau avancé, vous devez configurer au moins une plage d'adresses IP pour le trafic Internet.  Choisissez Infrastructure dans le panneau de navigation à gauche. Dans le menu de gauche, choisir Infrastructure. Dans Zones, cliquer sur Voir Plus, puis cliquer sur la zone à laquelle vous voulez ajouter un réseau. Se connecter à l'interface de CloudStack comme administrateur. Dans zones, cliquez sur Voir tout. Sur le noeud Invité du diagramme, cliquer sur Configurer. Fournir les informations suivantes : Spécifier les informations suivantes : La fenêtre Ajouter un réseau invité est affichée. La fenêtre Ajouter un réseau invité est affichée : Ces étapes assume que vous êtes déjà connecté dans l'interface CloudStack. Pour configurer le réseau invité de base : A l'intérieur d'une zone qui utilise le réseau avancé, vous devez dire au serveur de gestion comment le réseau physique est configuré pour transporter différents types de trafics isolés. |addguestnetwork.png| 