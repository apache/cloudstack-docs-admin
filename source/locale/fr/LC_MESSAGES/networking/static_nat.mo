��          �      �       H  %  I     o  +   �  3   �  :   �      #     D  j   �  i   /  '   �  <   �  
   �  w   	  �  �  n  K  !   �  >   �  8   	  D   T	  $   �	  �   �	  �   ]
  �   �
  1   r  T   �  
   �  s                                                          
      	    A static NAT rule maps a public IP address to the private IP address of a VM in order to allow Internet traffic into the VM. The public IP address always remains the same, which is why it is called static NAT. This section tells how to enable or disable static NAT for a particular IP address. Click View IP Addresses. Click the IP address you want to work with. Click the Static NAT |enabledisablenat.png| button. Click the name of the network where you want to work with. Enabling or Disabling Static NAT If a guest VM is part of more than one network, static NAT rules will function only if they are defined on the default network. If port forwarding rules are already in effect for an IP address, you cannot enable static NAT to that IP. If you are enabling static NAT, a dialog appears where you can choose the destination VM and click Apply. In the left navigation, choose Network. Log in to the CloudStack UI as an administrator or end user. Static NAT The button toggles between Enable and Disable, depending on whether static NAT is currently enabled for the IP address. Project-Id-Version: Apache CloudStack Administration RTD
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-06-30 12:52+0200
PO-Revision-Date: 2016-12-20 22:47+0100
Language-Team: French (http://www.transifex.com/ke4qqq/apache-cloudstack-administration-rtd/language/fr/)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Language: fr
Plural-Forms: nplurals=2; plural=(n > 1);
Last-Translator: 
X-Generator: Poedit 1.8.11
 Une règle de NAT statique associe une adresse IP publique à l'adresse IP privée d'une VM afin de permettre le trafic Internet vers la machine virtuelle. L'adresse IP publique reste toujours la même, raison pour laquelle cette solution est appelée static NAT. Cette section explique comment activer ou désactiver le static NAT pour une adresse IP particulière. Cliquez sur Voir les adresses IP. Cliquer sur l'adresse IP avec laquelle vous voulez travailler. Cliquer sur le bouton Static NAT |enabledisablenat.png|. Cliquez sur le nom du réseau avec lequel vous souhaitez travailler. Activer ou désactiver le Static NAT Si une VM invitée fait partie de plus d'un réseau, les règles de static NAT ne fonctionneront uniquement si elle sont définies sur le réseau par défaut. Si les règles de redirection de port sont déjà mise en oeuvre pour une adresse IP, vous ne pouvez pas activer le static NAT pour cette IP. Si vous activez le static NAT, une boite de dialogue apparaît dans laquelle vous pouvez choisir la VM cible et cliquer sur Appliquer. Dans la navigation à gauche, choisissez Réseau. Se connecter à l'interface de CloudStack comme administrateur ou utilisateur final. Static NAT Le bouton bascule entre Activer et Désactiver, selon que le static NAT est actuellement activé pour l'adresse IP. 