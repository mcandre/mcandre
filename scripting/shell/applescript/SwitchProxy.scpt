FasdUAS 1.101.10   ��   ��    k             l     �� ��      Christopher Soghoian       	  l     �� 
��   
   csoghoian@gmail.com    	     l     �� ��      Oct 23 2006         l     ������  ��        l     �� ��    J D Oops. Fixed initial release bug with space at the end of localhost.         l     ������  ��        l     �� ��    : 4 This is based on a script by RickoKid posted here:          l     �� ��    D > http://www.macosxhints.com/article.php?story=2003101617122867         l     ������  ��        l     �� ��    ] W His script didn't work in OSX/Tiger, and didn't allow for multiple network interfaces.        !   l     �� "��   "   I've fixed that.    !  # $ # l     ������  ��   $  % & % l     '�� ' O      ( ) ( k     * *  + , + r     - . - I   �� / 0
�� .sysodlogaskr        TEXT / m     1 1  Select Interface:    0 �� 2 3
�� 
btns 2 J     4 4  5 6 5 m     7 7  AirPort    6  8 9 8 m     : :  Built-in Ethernet    9  ;�� ; m    	 < <  Cancel   ��   3 �� =��
�� 
dflt = m     > >  Cancel   ��   . o      ���� 0 proxy_dialog   ,  ?�� ? r     @ A @ n     B C B 1    ��
�� 
bhit C o    ���� 0 proxy_dialog   A o      ���� 0 proxy_interface  ��   ) m      D D�null     ߀��  �
Finder.appU  ��8 '�������t  D���7 ����԰�����������ⰘL�MACS   alis    `  Marvin                     ��BH+    �
Finder.app                                                       ES�P�        ����  	                CoreServices    ���      ���      �  f  e  -Marvin:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    M a r v i n  &System/Library/CoreServices/Finder.app  / ��  ��   &  E F E l     ������  ��   F  G H G l   ' I�� I Z    ' J K���� J =    L M L o    ���� 0 proxy_interface   M m     N N  Cancel    K L   ! #����  ��  ��  ��   H  O P O l     ������  ��   P  Q R Q l     ������  ��   R  S T S l  ( + U�� U r   ( + V W V m   ( ) X X  	localhost    W o      ���� 0 proxyserver proxyServer��   T  Y Z Y l  , 3 [�� [ r   , 3 \ ] \ m   , / ^ ^ 
 8080    ] o      ���� 0 	proxyport 	proxyPort��   Z  _ ` _ l     ������  ��   `  a b a l  4 O c�� c O   4 O d e d k   : N f f  g h g I  : ?������
�� .miscactvnull��� ��� null��  ��   h  i�� i r   @ N j k j 4   @ H�� l
�� 
xppb l m   D G m m " com.apple.preference.network    k 1   H M��
�� 
xpcp��   e m   4 7 n n�null     #���� -�System Preferences.app����  |���7 ����԰�����������ⰘL�sprf   alis    j  Marvin                     ��BH+   -�System Preferences.app                                           o4���        ����  	                Applications    ���      ���     -�  *Marvin:Applications:System Preferences.app  .  S y s t e m   P r e f e r e n c e s . a p p    M a r v i n  #Applications/System Preferences.app   / ��  ��   b  o p o l  P� q�� q O   P� r s r k   V� t t  u v u e   V \ w w 1   V \��
�� 
pALL v  x�� x O   ]� y z y O   h� { | { k   s� } }  ~  ~ I  s }�� ���
�� .prcsclicuiel    ��� uiel � 4   s y�� �
�� 
popB � m   w x���� ��     � � � l  ~ ~������  ��   �  � � � I  ~ ��� ���
�� .prcsclicuiel    ��� uiel � n   ~ � � � � 4   � ��� �
�� 
menI � o   � ����� 0 proxy_interface   � n   ~ � � � � 4   � ��� �
�� 
menE � m   � �����  � 4   ~ ��� �
�� 
popB � m   � ����� ��   �  � � � O   �y � � � O   �x � � � k   �w � �  � � � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � ����� ��   �  � � � I  � ��� ���
�� .prcsclicuiel    ��� uiel � 4   � ��� �
�� 
radB � m   � � � �  Proxies   ��   �  � � � Q   � � � ��� � I  � ��� ���
�� .prcsclicuiel    ��� uiel � n   � � � � � 4   � ��� �
�� 
butT � m   � � � � % Click the lock to make changes.    � n   � � � � � 4   � ��� �
�� 
cwin � m   � � � �  Network    � n   � � � � � 4   � ��� �
�� 
prcs � l 	 � � ��� � m   � � � �  System Preferences   ��   � m   � � � ��null     � ��  �System Events.app'�������2  ����7 ����԰�����������ⰘL�sevs   alis    |  Marvin                     ��BH+    �System Events.app                                                n��SL        ����  	                CoreServices    ���      ���      �  f  e  4Marvin:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a r v i n  -System/Library/CoreServices/System Events.app   / ��  ��   � R      ������
�� .ascrerr ****      � ****��  ��  ��   �  ��� � O   �w � � � k   �v � �  � � � O   �P � � � k   �O � �  � � � r   � � � � m   � ���
�� boovtrue � n       � � � 1   ���
�� 
selE � 4   � ��� �
�� 
crow � m   � �����  �  � � � I �� ���
�� .prcsclicuiel    ��� uiel � n   � � � m  ��
�� 
chbx � 4  �� �
�� 
crow � m  	
���� ��   �  ��� � Z  O � ��� � � = % � � � n  # � � � 1  #��
�� 
valL � l  ��� � n   � � � 4  �� �
�� 
chbx � m  ����  � 4  �� �
�� 
crow � m  ���� ��   � m  #$����  � r  (E � � � b  (A � � � b  (= � � � b  (9 � � � b  (5 � � � b  (3 � � � b  (/ � � � m  (+ � �  Turned Web Proxy ON     � l 
+. ��� � o  +.��
�� 
ret ��   � m  /2 � �  	(set to '    � o  34���� 0 proxyserver proxyServer � m  58 � �  :    � o  9<���� 0 	proxyport 	proxyPort � m  =@ � �  ')    � o      ���� 0 outstr outStr��   � r  HO � � � m  HK � �  Turned Web Proxy OFF    � o      ���� 0 outstr outStr��   � n   � � � � � 4   � ��� �
�� 
tabB � m   � �����  � 4   � ��� �
�� 
scra � m   � �����  �  ��� � O  Qv � � � k  Zu � �  � � � r  Zf � � � o  Z[���� 0 proxyserver proxyServer � n       � � � 1  ae��
�� 
valL � 4  [a�� �
�� 
txtf � m  _`����  �  ��� � r  gu � � � o  gj���� 0 	proxyport 	proxyPort � n       � � � 1  pt��
�� 
valL � 4  jp�� �
�� 
txtf � m  no���� ��   � 4  QW�� �
�� 
sgrp � m  UV���� ��   � 4   � ��� �
�� 
sgrp � m   � ����� ��   � 4   � �� 
� 
tabg  m   � ��~�~  � 4   � ��}
�} 
sgrp m   � ��|�|  � �{ I z��z�y
�z .prcsclicuiel    ��� uiel 4  z��x
�x 
butT m  ~�  	Apply Now   �y  �{   | 4   h p�w
�w 
cwin m   l o  Network    z 4   ] e�v
�v 
prcs m   a d		  System Preferences   ��   s m   P S ���   p 

 l     �u�t�u  �t   �s l ���r P  ���q k  ��  O �� I ���p�o�n
�p .aevtquitnull���    obj �o  �n   m  �� n �m O  �� I ���l
�l .sysodlogaskr        TEXT o  ���k�k 0 outstr outStr �j
�j 
btns J  �� �i m  ��  Ok   �i   �h�g
�h 
givu m  ���f�f �g   m  �� D�m  �q   �e�d
�e consrmte�d  �r  �s       �c !�c    �b
�b .aevtoappnull  �   � ****! �a"�`�_#$�^
�a .aevtoappnull  �   � ****" k    �%%  %&&  G''  S((  Y))  a**  o++ �]�]  �`  �_  #  $ ? D 1�\ 7 : <�[ >�Z�Y�X�W�V N X�U ^�T n�S�R m�Q ��P�O	�N�M�L�K�J�I�H�G�F � � ��E ��D�C�B�A�@�?�>�= ��< � � ��; ��:�9�8
�\ 
btns
�[ 
dflt�Z 
�Y .sysodlogaskr        TEXT�X 0 proxy_dialog  
�W 
bhit�V 0 proxy_interface  �U 0 proxyserver proxyServer�T 0 	proxyport 	proxyPort
�S .miscactvnull��� ��� null
�R 
xppb
�Q 
xpcp
�P 
pALL
�O 
prcs
�N 
cwin
�M 
popB
�L .prcsclicuiel    ��� uiel
�K 
menE
�J 
menI
�I 
sgrp
�H 
tabg
�G .sysodelanull��� ��� nmbr
�F 
radB
�E 
butT�D  �C  
�B 
scra
�A 
tabB
�@ 
crow
�? 
selE
�> 
chbx
�= 
valL
�< 
ret �; 0 outstr outStr
�: 
txtf
�9 .aevtquitnull���    obj 
�8 
givu�^�� �����mv��� 	E�O��,E�UO��  hY hO�E�Oa E` Oa  *j O*a a /*a ,FUOa 4*a ,EO*a a /!*a a /*a l/j O*a l/a k/a  �/j O*a !k/ �*a "k/ �kj #O*a $a %/j O !a a a &/a a '/a (a )/j W X * +hO*a !k/ �*a ,k/a -k/ Ye*a .l/a /,FO*a .k/a 0,j O*a .l/a 0k/a 1,k  "a 2_ 3%a 4%�%a 5%_ %a 6%E` 7Y 	a 8E` 7UO*a !k/ �*a 9l/a 1,FO_ *a 9k/a 1,FUUUUO*a (a :/j UUUOga ; &a  *j <UO� _ 7�a =kva >l� 	UV ascr  ��ޭ