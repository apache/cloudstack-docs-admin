��          �               �  �   �  Y   z     �  J   �  �   4  ,     K   8  W   �  �   �  t   �     �  �     B   �       e   ?  x   �  D        c  �   �     	  "   	  �   :	    �	  �     �  �  �   h  Y   5     �  J   �  �   �  ,   �  K   �  W   ?  �   �  t   @     �  �   �  B   �     �  e   �  x   `  D   �       �   =     �  "   �  �   �    �  �   �   Assume you have an AMI file and this file is called CentOS\_6.2\_x64. Assume further that you are working on a CentOS host. If the AMI is a Fedora image, you need to be working on a Fedora host initially. Based on your findings, create an entry in the grub.conf file. Below is an example entry. Change the password. Check `etc/ssh/sshd_config` for lines allowing ssh login using a password. Copy the image file to your XenServer host's file-based storage repository. In the example below, the Xenserver is "xenhost". This XenServer has an NFS repository whose uuid is a9c5b8c8-536b-a193-a6dc-51af3e5ff799. Create a grub entry in /boot/grub/grub.conf. Determine the name of the PV kernel that has been installed into the image. Edit etc/fstab, changing “sda1” to “xvda” and changing “sdb” to “xvdb”. Enable login via the console. The default console device in a XenServer system is xvc0. Ensure that etc/inittab and etc/securetty have the following lines respectively: Ensure the ramdisk supports PV disk and PV network. Customize this for the kernel version you have determined above. Exit out of chroot. If you need the template to be enabled to reset passwords from the CloudStack UI or API, install the password change script into the image at this point. See :ref:`adding-password-management-to-templates`. Import the image file into the VDI. This may take 10–20 minutes. Importing Amazon Machine Images Install the kernel-xen package into the image. This downloads the PV kernel and ramdisk to the image. Locate a the VHD file. This is the file with the VDI’s UUID as its name. Compress it and upload it to your web server. Log in to the Xenserver and create a VDI the same size as the image. Set up loopback on image file: The following procedures describe how to import an Amazon Machine Image (AMI) into CloudStack when using the XenServer hypervisor. To import an AMI: Unmount and delete loopback mount. When copying and pasting a command, be sure the command has pasted as a single line before executing. Some document viewers may introduce unwanted line breaks in copied text. Xen kernels/ramdisk always end with "xen". For the kernel version you choose, there has to be an entry for that version under lib/modules, there has to be an initrd and vmlinuz corresponding to that. Above, the only kernel that satisfies this condition is 2.6.18-164.15.1.el5xen. You need to have a XenServer host with a file-based storage repository (either a local ext3 SR or an NFS SR) to convert to a VHD once the image file has been customized on the Centos/Fedora host. Project-Id-Version: Apache CloudStack Administration Documentation 4.8
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2016-08-22 13:55+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: fr
Language-Team: fr <LL@li.org>
Plural-Forms: nplurals=2; plural=(n > 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.3.4
 Assume you have an AMI file and this file is called CentOS\_6.2\_x64. Assume further that you are working on a CentOS host. If the AMI is a Fedora image, you need to be working on a Fedora host initially. Based on your findings, create an entry in the grub.conf file. Below is an example entry. Change the password. Check `etc/ssh/sshd_config` for lines allowing ssh login using a password. Copy the image file to your XenServer host's file-based storage repository. In the example below, the Xenserver is "xenhost". This XenServer has an NFS repository whose uuid is a9c5b8c8-536b-a193-a6dc-51af3e5ff799. Create a grub entry in /boot/grub/grub.conf. Determine the name of the PV kernel that has been installed into the image. Edit etc/fstab, changing “sda1” to “xvda” and changing “sdb” to “xvdb”. Enable login via the console. The default console device in a XenServer system is xvc0. Ensure that etc/inittab and etc/securetty have the following lines respectively: Ensure the ramdisk supports PV disk and PV network. Customize this for the kernel version you have determined above. Exit out of chroot. If you need the template to be enabled to reset passwords from the CloudStack UI or API, install the password change script into the image at this point. See :ref:`adding-password-management-to-templates`. Import the image file into the VDI. This may take 10–20 minutes. Importing Amazon Machine Images Install the kernel-xen package into the image. This downloads the PV kernel and ramdisk to the image. Locate a the VHD file. This is the file with the VDI’s UUID as its name. Compress it and upload it to your web server. Log in to the Xenserver and create a VDI the same size as the image. Set up loopback on image file: The following procedures describe how to import an Amazon Machine Image (AMI) into CloudStack when using the XenServer hypervisor. To import an AMI: Unmount and delete loopback mount. When copying and pasting a command, be sure the command has pasted as a single line before executing. Some document viewers may introduce unwanted line breaks in copied text. Xen kernels/ramdisk always end with "xen". For the kernel version you choose, there has to be an entry for that version under lib/modules, there has to be an initrd and vmlinuz corresponding to that. Above, the only kernel that satisfies this condition is 2.6.18-164.15.1.el5xen. You need to have a XenServer host with a file-based storage repository (either a local ext3 SR or an NFS SR) to convert to a VHD once the image file has been customized on the Centos/Fedora host. 