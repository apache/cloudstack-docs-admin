��    +      t  ;   �      �     �     �     �     �     �     �  �   �     �     �     �     �  1   �  R        q  U   }  ?   �       L   1  �   ~  )      6   *  #   a    �  �  �
  2   H  '   {     �  <   �     �  %   �          2     7  (   �     �  o   �  '   f  [   �  t   �  �   _  n   O  j   �  �  )     �     �               %     '    )     G     W     \     `  7   w  i   �       Z   %  Z   �  (   �  d     �   i  6     H   8  .   �  �  �    1  ;   A  1   }     �  T   �       6         W     q  �   w  7        I  �   f  ,       s   -   �   �   J  0!  �   {"  �   �"                "                              !      *   (          #      +                                      %                          &                 '         	               $   )           
       1 10.1.1.0/24 10.1.1.0/26 10.1.1.64 to 10.1.1.254 2 3 Apply IP Reservation to the guest network as soon as the network state changes to Implemented. If you apply reservation soon after the first guest VM is deployed, lesser conflicts occurs while applying reservation. Best Practices CIDR Case Click Apply. Click the name of the network you want to modify. Consider the following before you reserve an IP range for non-CloudStack machines: Description For example, the following table describes three scenarios of guest network creation: Guest VM CIDR you specify must be a subset of the network CIDR. IP Reservation Considerations IP Reservation can be applied only when the network is in Implemented state. IP Reservation configured by the UpdateNetwork API with guestvmcidr=10.1.1.0/26 or enter 10.1.1.0/26 in the CIDR field in the UI. IP Reservation in Isolated Guest Networks IP Reservation is supported only in Isolated networks. In CIDR, specify the Guest VM CIDR. In an Advanced zone, an IP address range or a CIDR is assigned to a network when the network is defined. The CloudStack virtual router acts as the DHCP server and uses CIDR for assigning IP addresses to the guest VMs. If you decide to reserve CIDR for non-CloudStack purposes, you can specify a part of the IP address range or the CIDR that should only be allocated by the DHCP service of the virtual router to the guest VMs created in CloudStack. The remaining IPs in that network are called Reserved IP Range. When IP reservation is configured, the administrator can add additional VMs or physical servers that are not part of CloudStack to the same network and assign them the Reserved IP addresses. CloudStack guest VMs cannot acquire IPs from the Reserved IP Range. In isolated guest networks, a part of the guest IP address space can be reserved for non-CloudStack VMs or physical servers. To do so, you configure a range of Reserved IP addresses by specifying the CIDR when a guest network is in Implemented state. If your customers wish to have non-CloudStack controlled VMs or physical servers on the same network, they can share a part of the IP address space that is primarily provided to the guest network. In the Details tab, click Edit. |ip-edit-icon.png| In the left navigation, choose Network. Limitations Log in to the CloudStack UI as an administrator or end user. Network CIDR No IP Reservation is done by default. No IP Reservation. None Removing IP Reservation by the UpdateNetwork API with guestvmcidr=10.1.1.0/24 or enter 10.1.1.0/24 in the CIDR field in the UI. Reserved IP Range for Non-CloudStack VMs Reserving an IP Range Specify a valid Guest VM CIDR. IP Reservation is applied only if no active IPs exist outside the Guest VM CIDR. The CIDR field changes to editable one. The IP Reservation is not supported if active IPs that are found outside the Guest VM CIDR. To reset an existing IP Reservation, apply IP reservation by specifying the value of network CIDR in the CIDR field. Upgrading network offering which causes a change in CIDR (such as upgrading an offering with no external devices to one with external devices) IP Reservation becomes void if any. Reconfigure IP Reservation in the new re-implemeted network. Wait for the update to complete. The Network CIDR and the Reserved IP Range are displayed on the Details page. You cannot apply IP Reservation if any VM is alloted with an IP address that is outside the Guest VM CIDR. Project-Id-Version: Apache CloudStack Administration RTD
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-06-30 12:52+0200
PO-Revision-Date: 2016-12-22 15:19+0100
Language-Team: French (http://www.transifex.com/ke4qqq/apache-cloudstack-administration-rtd/language/fr/)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Language: fr
Plural-Forms: nplurals=2; plural=(n > 1);
Last-Translator: 
X-Generator: Poedit 1.8.11
 1 10.1.1.0/24 10.1.1.0/26 10.1.1.64 à 10.1.1.254 2 3 Appliquer la réservation d'IP à un réseau invité aussitôt que l'état du réseau change pour Implémenté. Si vous appliquez la réservation aussitôt après que la première VM invitée soit déployée, des conflits mineurs apparaissent lors de l'application de la réservation.  Recommandations CIDR Cas Cliquer sur Appliquer. Cliquer sur le nom du réseau que vous voulez modifier. Prenez en compte ce qui suit avant de réserver une plage d'IP pour les machines externes à CloudStack : Description Par exemple, le tableau suivant décris trois scénarios de création de réseau invité : Le CIDR des VM Invités que vous spécifiez doit être un sous-réseau du CIDR du réseau. Considérations sur la réservation d'IP La réservation IP peut être appliquée seulement lorsque le réseau est dans l'état implémenté. Réservation d'IP configurée par l'API UpdateNetwork avec guestvmcidr=10.1.1.0/26 ou saisir 10.1.1.0/26 dans le champ CIDR de l'interface utilisateur. La réservation IP dans les réseaux invités isolés. La réservation d'IP est supportée seulement dans les réseaux isolés. Dans CIDR, spécifiez le CIDR des VM invités. Dans une zone Avancée, une plage d'adresses IP ou un CIDR est affecté à un réseau lorsque celui-ci est défini. Le routeur virtuel CloudStack agit comme serveur DHCP et utilise le CIDR pour attribuer des adresses IP aux VM invitées. Si vous décidez de réserver le CIDR à des fins autres que CloudStack, vous pouvez spécifier une partie de la plage d'adresses IP ou le CIDR qui ne devrait être attribuée que par le service DHCP du routeur virtuel aux VM invitées créées dans CloudStack. Les adresses IP restantes de ce réseau sont appelées Plage d'IP Réservée. Lorsque la réservation d'IP est configurée, l'administrateur peut ajouter des machines virtuelles ou des serveurs physiques qui ne font pas partie de CloudStack au même réseau et leur attribuer les adresses IP réservées. Les VM invitées CloudStack ne peuvent plus acquérir d'IP de cette plage d'IP réservées. Dans les réseaux d'invités isolés, une partie de l'espace d'adresses IP invité peut être réservée aux VM non CloudStack ou aux serveurs physiques. Pour ce faire, vous configurez une plage d'adresses IP réservées en spécifiant le CIDR lorsqu'un réseau invité est dans l'état Implémenté. Si vos clients souhaitent disposer de VM non contrôlées par CloudStack ou de serveurs physiques sur le même réseau, ils peuvent partager une partie de l'espace d'adressage IP qui est normalement fournie au réseau invité. Dans l'onglet Détails, cliquer sur Editer. |edit-icon.png| Dans la navigation à gauche, choisissez Réseau. Limitations Se connecter à l'interface de CloudStack comme administrateur ou utilisateur final. CIDR du réseau Aucune réservation d'IP n'est effectuée par défaut. Aucune réservation d'IP. Aucun Supprimez une Réservation d'IP par l'API UpdateNetwork avec guestvmcidr=10.1.1.0/24 ou saisir 10.1.1.0/24 dans le champ CIDR de l'interface utilisateur. Intervalle d'IP réservées pour les VMs Non-CloudStack Réserver un intervalle d'IP Spécifiez un CIDR de VM Invités valide. La réservation d'IP n'est appliquée que si aucune IP active n'existe à l'extérieur du CIDR des VM invités. Le champ CIDR change pour devenir éditable. La réservation d'IP n'est pas supportée si des IP actives sont trouvées à l'extérieur du CIDR des VM invités. Pour réinitialiser une réservation d'IP existante, appliquez la réservation IP en spécifiant la valeur du réseau CIDR dans le champ CIDR. La mise à niveau d'une offre réseau qui provoque une modification de son CIDR (comme une mise à niveau d'une offre sans périphériques externes vers une avec des périphériques externes), fait que la réservation d'IP devient nulle le cas échéant. Reconfigurez la réservation d'IP dans le nouveau réseau ré-implémenté. Attendre que la mise à jour soit finie. Le CIDR du réseau et la plage d'IP réservée sont affichées dans la page de Détails. Vous ne pouvez pas appliquer une réservation d'IP si une machine virtuelle s'est vue allouer une adresse IP se trouvant en dehors du CIDR des VM Invités. 