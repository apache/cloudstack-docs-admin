��          �      �        v  	      �    �  I   �     �  5     i  M  1   �  
   �  �   �     �  ,   �     �  �   �  �   �	  .   $
  *   S
  �   ~
  h     	   n  �   x  �     �  �    �  )   �  �  �  k   u  %   �  I     �  Q  A   $     f  �   y  /   '  =   W  3   �  �   �  �   {  >   6  -   u  �   �  }   V     �  �   �  �   �        	                                                                 
                               As always, you can specify an IP from the guest subnet; if not specified, an IP is automatically picked up from the guest VM subnet. You can view the IPs associated with for each guest VM NICs on the UI. You can apply NAT on these additional guest IPs by using network configuration option in the CloudStack UI. You must specify the NIC to which the IP should be associated. Assigning Additional IPs to a VM Because multiple IPs can be associated per NIC, you are allowed to select a desired IP for the Port Forwarding and StaticNAT services. The default is the primary IP. To enable this functionality, an extra optional parameter 'vmguestip' is added to the Port forwarding and StaticNAT APIs (enableStaticNat, createIpForwardingRule) to indicate on what IP address NAT need to be configured. If vmguestip is passed, NAT is configured on the specified private IP of the VM. if not passed, NAT is configured on the primary IP of the VM. Click Acquire New Secondary IP, and click Yes in the confirmation dialog. Click View Secondary IPs. Click the name of the instance you want to work with. CloudStack provides you the ability to associate multiple private IP addresses per guest VM NIC. In addition to the primary IP, you can assign additional IPs to the guest VM NIC. This feature is supported on all the network configurations: Basic, Advanced, and VPC. Security Groups, Static NAT and Port forwarding services are supported on these additional IPs. Configuring Multiple IP Addresses on a Single NIC Guidelines Hosting multiple SSL Websites on a single instance. You can install multiple SSL certificates on a single instance, each associated with a distinct IP address. In the Details tab, click NICs. In the left navigation bar, click Instances. Log in to the CloudStack UI. Moving private IP addresses between interfaces or instances. Applications that are bound to specific IP addresses can be moved between instances. Network devices, such as firewalls and load balancers, generally work best when they have access to multiple IP addresses on the network interface. Port Forwarding and StaticNAT Services Changes Some of the use cases are described below: This feature is supported on XenServer, KVM, and VMware hypervisors. Note that Basic zone security groups are not supported on VMware. To prevent IP conflict, configure different subnets when multiple networks are connected to the same VM. Use Cases Within a few moments, the new IP address should appear with the state Allocated. You can now use the IP address in Port Forwarding or StaticNAT rules. You need to configure the IP on the guest VM NIC manually. CloudStack will not automatically configure the acquired IP address on the VM. Ensure that the IP address configuration persist on VM reboot. Project-Id-Version: Apache CloudStack Administration RTD
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-06-30 12:52+0200
PO-Revision-Date: 2016-12-22 15:05+0100
Language-Team: French (http://www.transifex.com/ke4qqq/apache-cloudstack-administration-rtd/language/fr/)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Language: fr
Plural-Forms: nplurals=2; plural=(n > 1);
Last-Translator: 
X-Generator: Poedit 1.8.11
 Comme toujours, vous pouvez spécifier une IP à partir du sous-réseau invité ; si elle n'est pas spécifiée, une IP est automatiquement récupérée à partir du sous-réseau VM invité. Vous pouvez afficher les IP associées à chaque NIC de la VM invité sur l'interface utilisateur. Vous pouvez appliquer du NAT sur ces IP supplémentaires de l'invité en utilisant l'option de configuration réseau dans l'interface utilisateur CloudStack. Vous devez spécifier la carte réseau à laquelle l'adresse IP doit être associée. Assigner des IPs additionnelles à une VM Étant donné que plusieurs IP peuvent être associées par carte réseau, vous êtes autorisé à sélectionner l'adresse IP désirée pour les services Port Forwarding et StaticNAT. La valeur par défaut est l'adresse IP principale. Pour activer cette fonctionnalité, un paramètre optionnel supplémentaire 'vmguestip' est ajouté aux API du port forwarding et du StaticNAT (enableStaticNat, createIpForwardingRule) pour indiquer sur quelle adresse IP le NAT doit être configuré. Si vmguestip est passé, le NAT est configuré sur l'IP privée spécifiée de la VM. Si elle n'est pas passée, le NAT est configuré sur l'adresse IP principale de la VM. Cliquez sur Obtenir une nouvelle adresse IP, et cliquez sur Oui dans la boîte de dialogue de confirmation. Cliquer sur Voir les IPs secondaires. Cliquez sur le nom de l'instance avec laquelle vous souhaitez travailler. CloudStack offre la possibilité d'associer plusieurs adresses IP privées par interface NIC sur les VM clients. En plus de l'IP primaire, vous pouvez affecter des adresses IP supplémentaires à l'interface NIC de la VM invitée. Cette fonctionnalité est prise en charge sur toutes les configurations réseau : Basique, Avancée et VPC. Les services de Groupes de sécurité, de NAT statique et de transfert de port sont pris en charge sur ces IP supplémentaires. Configurer plusieurs adresses IP sur une seule interface réseau. Lignes directrices Héberger plusieurs sites webs SSL sur une seule instance. Vous pouvez installer plusieurs certificats sur une seule instance, chacun associé avec une adresse IP distincte. Dans l'onglet Détails, cliquer sur Interfaces. Dans la barre de navigation de gauche, cliquer sur Instances. Se connecter à l'interface utilisateur CloudStack. Déplacer des adresses IP privées entre interfaces ou instances. Les applications qui sont liées à des adresses IP spécifiques peuvent être déplacées entre les instances. Les périphériques réseaux, comme les pare-feu ou les répartiteurs de charge, fonctionnent généralement mieux lorsqu'ils ont accès à plusieurs adresses IP sur l'interface réseau. Changements de services de redirection de port et de StaticNAT Les exemples suivants sont des cas d'usages : Cette fonctionnalité est supportée sur les hyperviseurs XenServer, KVM et VMware. Notez que les groupes de sécurité dans les zones Basiques ne sont pas supportés sur VMware. Pour éviter des conflits IP, configurer différents sous-réseaux lorsque plusieurs réseaux sont connectés à la même VM. Cas d'usages Au bout de quelques instants, la nouvelle adresse IP devrait apparaître dans l'état Allouée. Vous pouvez maintenant utiliser l'adresse IP pour la redirection de port ou les règles de NAT statiques. Vous devez configurer l'IP sur l'interface de la VM invitée manuellement. CloudStack ne va pas automatiquement configurer l'IP acquise sur la VM. Assurez vous que la configuration de l'adresse IP soit persistante après le redémarrage. 