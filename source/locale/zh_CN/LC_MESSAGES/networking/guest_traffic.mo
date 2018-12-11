Þ          \                 ò           .     j   Í  Ú   8           Ô  ®  Ç        K  -   X  p     ¸   ÷    °	     9   A network can carry guest traffic only between VMs within one zone. Virtual machines in different zones cannot communicate with each other using their IP addresses; they must communicate with each other by routing through a public IP address. Guest Traffic See a typical guest traffic setup given below: Source NAT is automatically configured in the virtual router to forward outbound traffic for all guest VMs The virtual router provides DHCP and will automatically assign an IP address for each guest VM within the IP range assigned for the network. The user can manually reconfigure guest VMs to assume different IP addresses. Typically, the Management Server automatically creates a virtual router for each network. A virtual router is a special virtual machine that runs on the hosts. Each virtual router in an isolated network has three network interfaces. If multiple public VLAN is used, the router will have multiple public interfaces. Its eth0 interface serves as the gateway for the guest traffic and has the IP address of 10.1.1.1. Its eth1 interface is used by the system to configure the virtual router. Its eth2 interface is assigned a public IP address for public traffic. If multiple public VLAN is used, the router will have multiple public interfaces. |guest-traffic-setup.png| Project-Id-Version: Apache CloudStack Administration RTD
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-06-30 12:52+0200
PO-Revision-Date: 2014-06-30 12:05+0000
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: Chinese (China) (http://www.transifex.com/projects/p/apache-cloudstack-administration-rtd/language/zh_CN/)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Language: zh_CN
Plural-Forms: nplurals=1; plural=0;
 å¨åä¸ä¸ªåºååï¼å®¢æ·èææºä¹é´å¯ä»¥äºè®¿ï¼ä½å¨ä¸åçåºååï¼å®¢æ·èææºä¹é´ä¸å¯ä»¥éè¿ï¼åç½ï¼IPå°åäºè®¿ï¼èåªè½éè¿å¬ç½IPè·¯ç±æå¯ä»¥äºè¿ã æ¥å®¾æµé ä¸å¾æ¯ä¸ä¸ªå¸åçæ¥å®¾æµéè®¾ç½®ï¼ Source NATåè½æ¯å¨èæè·¯ç±éèªå¨éç½®å¥½çï¼å®å¯ä»¥è½¬åæææ¥å®¾èææºçå¤åºæµéã èæè·¯ç±å¨æä¾DHCPåè½ï¼è½èªå¨çä¸ºæ¯ä¸ä¸ªå®¢æ·èææºå¨é¢åå®ä¹å¥½çIPèå´ä¹ååéIPå°åãç¨æ·ä¹å¯ä»¥ä¸ºèææºæå·¥éç½®ä¸åçIPå°åã éå¸¸ï¼ç®¡çæå¡ä¼èªå¨ä¸ºæ¯ä¸ä¸ªç½ç»å»ºç«ä¸ä¸ªèæè·¯ç±ãä¸ä¸ªèæè·¯ç±å®éä¸å°±æ¯è¿è¡å¨ç©çä¸»æºä¸çä¸å°ç¹æ®çèææºãæ¯ä¸å°å¨ä¸ä¸ªç¬ç«ç½ç»ä¸­çèæè·¯ç±æ3ä¸ªç½å£ãå¦æä½¿ç¨å¤ä¸ªå¬å± VLANï¼ç¸åºçè¿å°è·¯ç±å¨å°±æå¤ä¸ªå¬å±çç½å£ã å®ç eth0 ç½å£æ¯æä¾å®¢æ·æºéä¿¡çç½å³æå¡çï¼å®çIPå°åæ¯ 10.1.1.1ãeth1 ç½å£æ¯ä¸ºç³»ç»æ¥éç½®è¿ä¸ªèæè·¯ç±èæä¾çãeth2 ç½å£è¢«èµäºä¸ä¸ªå¬å± IP å°åç¨æ¥å®ç°å¤é¨çå¬å±éä¿¡ã åæ ·å¦æä½¿ç¨äºå¤ä¸ªå¬å± VLAN æ¥å¥ï¼è¿å°è·¯ç±å¨å°ä¼æ¥æå¤ä¸ªå¬å±çç½å£ã |guest-traffic-setup.png| 