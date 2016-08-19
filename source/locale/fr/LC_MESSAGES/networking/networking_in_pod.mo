��    	      d               �   H   �   O   �      F  !   Z  R   |  )  �  �   �     �  �  �  H   �  O   �     C  !   W  R   y  )  �  �   �     �   Hosts are also connected to one or more networks carrying guest traffic. Hosts are connected to networks for both management traffic and public traffic. Networking in a Pod Servers are connected as follows: Storage devices are connected to only the network that carries management traffic. The figure below illustrates network setup within a single pod. The hosts are connected to a pod-level switch. At a minimum, the hosts should have one physical uplink to each switch. Bonded NICs are supported as well. The pod-level switch is a pair of redundant gigabit switches with 10 G uplinks. We recommend the use of multiple physical Ethernet cards to implement each network interface as well as redundant switch fabric in order to maximize throughput and improve reliability. |networksinglepod.png| Project-Id-Version: Apache CloudStack Administration RTD
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-06-30 12:52+0200
PO-Revision-Date: 2014-06-30 12:06+0000
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: fr
Language-Team: French (http://www.transifex.com/ke4qqq/apache-cloudstack-administration-rtd/language/fr/)
Plural-Forms: nplurals=2; plural=(n > 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.3.4
 Hosts are also connected to one or more networks carrying guest traffic. Hosts are connected to networks for both management traffic and public traffic. Networking in a Pod Servers are connected as follows: Storage devices are connected to only the network that carries management traffic. The figure below illustrates network setup within a single pod. The hosts are connected to a pod-level switch. At a minimum, the hosts should have one physical uplink to each switch. Bonded NICs are supported as well. The pod-level switch is a pair of redundant gigabit switches with 10 G uplinks. We recommend the use of multiple physical Ethernet cards to implement each network interface as well as redundant switch fabric in order to maximize throughput and improve reliability. |networksinglepod.png| 