��          �               |  W   }     �  �   �  �   �    T  �   t    h  #   n  5   �  �   �  G   s  �   �     �  �   �      6	  (   W	  &   �	  "   �	  0   �	  L   �	  ;   H
  �  �
  W   e     �  �   �  �   �    <  �   \    P  #   V  5   z  �   �  G   [  �   �     i  �   �        (   ?  &   h  "   �  0   �  L   �  ;   0   Access user data by running the following command using the result of the above command CloudStack API CloudStack expects that a customer will have their own user provisioning infrastructure. It provides APIs to integrate with these existing systems where the systems call out to CloudStack to add/remove users.. CloudStack provides API access to attach up to 32KB of user data to a deployed VM. Deployed VMs also have access to instance metadata via the virtual router. CloudStack supports pluggable authenticators. By default, CloudStack assumes it is provisioned with the user’s password, and as a result authentication is done locally. However, external authentication is possible as well. For example, see Using an LDAP Server for User Authentication. Many CloudStack API calls are asynchronous. These will return a Job ID immediately when called. This Job ID can be used to query the status of the job later. Also, status calls on impacted resources will provide some indication of their state. Meta Data can be accessed similarly, using a URL of the form http://10.1.1.1/latest/meta-data/{metadata type}. (For backwards compatibility, the previous URL http://10.1.1.1/latest/{metadata type} is also supported.) For metadata type, use one of the following: Provisioning and Authentication API Run the following command to find the virtual router. See `the Developer’s Guide <https://cwiki.apache.org/confluence/display/CLOUDSTACK/Development+101>`_ and `the API Reference <http://cloudstack.apache.org/docs/api/>`_. The API has a REST-like query basis and returns results in XML or JSON. The CloudStack API is a low level API that has been used to implement the CloudStack web UIs. It is also a good basis for implementing other popular APIs such as EC2/S3 and emerging DMTF standards. User Data and Meta Data User data can be accessed once the IP address of the virtual router is known. Once the IP address is known, use the following steps to access the user data: availability-zone. The Zone name instance-id. The instance name of the VM local-hostname. The hostname of the VM local-ipv4. The guest IP of the VM public-hostname. This is the same as public-ipv4 public-ipv4. The first public IP for the router. (E.g. the first IP of eth2) service-offering. A description of the VMs service offering Project-Id-Version: Apache CloudStack Administration RTD
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-06-30 12:52+0200
PO-Revision-Date: 2014-06-30 12:04+0000
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: fr
Language-Team: French (http://www.transifex.com/ke4qqq/apache-cloudstack-administration-rtd/language/fr/)
Plural-Forms: nplurals=2; plural=(n > 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.3.4
 Access user data by running the following command using the result of the above command CloudStack API CloudStack expects that a customer will have their own user provisioning infrastructure. It provides APIs to integrate with these existing systems where the systems call out to CloudStack to add/remove users.. CloudStack provides API access to attach up to 32KB of user data to a deployed VM. Deployed VMs also have access to instance metadata via the virtual router. CloudStack supports pluggable authenticators. By default, CloudStack assumes it is provisioned with the user’s password, and as a result authentication is done locally. However, external authentication is possible as well. For example, see Using an LDAP Server for User Authentication. Many CloudStack API calls are asynchronous. These will return a Job ID immediately when called. This Job ID can be used to query the status of the job later. Also, status calls on impacted resources will provide some indication of their state. Meta Data can be accessed similarly, using a URL of the form http://10.1.1.1/latest/meta-data/{metadata type}. (For backwards compatibility, the previous URL http://10.1.1.1/latest/{metadata type} is also supported.) For metadata type, use one of the following: Provisioning and Authentication API Run the following command to find the virtual router. See `the Developer’s Guide <https://cwiki.apache.org/confluence/display/CLOUDSTACK/Development+101>`_ and `the API Reference <http://cloudstack.apache.org/docs/api/>`_. The API has a REST-like query basis and returns results in XML or JSON. The CloudStack API is a low level API that has been used to implement the CloudStack web UIs. It is also a good basis for implementing other popular APIs such as EC2/S3 and emerging DMTF standards. User Data and Meta Data User data can be accessed once the IP address of the virtual router is known. Once the IP address is known, use the following steps to access the user data: availability-zone. The Zone name instance-id. The instance name of the VM local-hostname. The hostname of the VM local-ipv4. The guest IP of the VM public-hostname. This is the same as public-ipv4 public-ipv4. The first public IP for the router. (E.g. the first IP of eth2) service-offering. A description of the VMs service offering 