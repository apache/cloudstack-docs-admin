��          �            h     i  J   ~  ,   �  K   �  W   B     �  B   �     �  x        �  �   �     ,  "   >  �   a  p       �  g   �  2     C   5  S   y     �  G   �  &   '  �   N  3   �  �   	     �	  4   �	  �   �	     	                                                                
           Change the password. Check `etc/ssh/sshd_config` for lines allowing ssh login using a password. Create a grub entry in /boot/grub/grub.conf. Determine the name of the PV kernel that has been installed into the image. Edit etc/fstab, changing “sda1” to “xvda” and changing “sdb” to “xvdb”. Exit out of chroot. Import the image file into the VDI. This may take 10–20 minutes. Importing Amazon Machine Images Locate a the VHD file. This is the file with the VDI’s UUID as its name. Compress it and upload it to your web server. Set up loopback on image file: The following procedures describe how to import an Amazon Machine Image (AMI) into CloudStack when using the XenServer hypervisor. To import an AMI: Unmount and delete loopback mount. When copying and pasting a command, be sure the command has pasted as a single line before executing. Some document viewers may introduce unwanted line breaks in copied text. Project-Id-Version: Apache CloudStack Administration Documentation 4.8
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2016-08-22 13:55+0200
PO-Revision-Date: 2016-12-22 16:11+0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.3.4
Last-Translator: 
Language-Team: 
Language: fr_FR
X-Generator: Poedit 1.8.11
 Changer le mot de passe. Vérifier que `/etc/ssh/sshd_config` contienne les lignes autorisant la connexion SSH par mot de passe. Créer une entrée grub dans /boot/grub/grub.conf. Déterminer le nom du kernel PV qui a été installé dans l'image. Editer le fichier /etc/fstab, changer "sda1" par "xvda" et changer "sdb" par "xvdb" Sortir du chroot. Importer le fichier image dans le VDI. Cela peut prendre 10-20 minutes. Importer des images de Machines Amazon Trouvez le fichier VHD. Il s'agit du fichier avec comme nom l'UUID du VDI. Compressez le et téléchargez le vers votre serveur web. Configurer la boucle interne sur le fichier image : Les procédures suivantes décrivent comment importer une Image de Machine Amazon (AMI) dans CloudStack et pour l'utiliser avec l'hyperviseur XenServer. Pour importer un AMI Démonter et supprimer le montage en boucle interne. Lors du copier/coller d'une commande, soyez certain que la commande est collée sur une seule ligne avant de l'exécuter. Certains lecteur de document peuvent introduire un saut de ligne indésirable dans le texte copié. 