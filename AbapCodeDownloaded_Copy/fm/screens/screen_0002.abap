****************************************************************																																
*   This file was generated by Direct Download Enterprise.     *																																
*   Please do not change it manually.                          *																																
****************************************************************																																
%_DYNPRO																																
SAPLZRMCA_INVOCING																																
0002																																
731																																
                40																																
%_HEADER																																
SAPLZRMCA_INVOCING                      0002 0002     61 83192 37  0  0 61 83  0G E                              20131009134738																																
%_DESCRIPTION																																
View maint: Overview screen ZCO_IL_COSTCTR																																
%_FIELDS																																
TCTRL_ZCO_IL_COSTCTR			 83	F8	FC	00	00	00	  1	  2	E	101	  1	  1		 59	T				  0	  0	101									
VIM_FRAME_FIELD		CHAR	 60	80	02	88	30	40	  1	  0	T	101	  1	  1		 60					  0	  0								____________________________________________________________		
*ZCO_IL_COSTCTR-TELNO	3	CHAR	 40	20	00	00	30	A0	  1	  1	T	101	  1	  1		 12					  0	  0								Telephone No.	                                       00	
*ZCO_IL_COSTCTR-NAME	3	CHAR	 40	20	00	00	30	80	  1	  2	T	101	  1	  1		120					  0	  0								Name	                                       00	
*ZCO_IL_COSTCTR-CO_CENTER	2	CHAR	 40	30	00	00	30	80	  1	  3	T	101	  1	  1		 15			KOS		  0	  0								Cost Center	                                       00	
VIM_MARKED		CHAR	  1	80	00	88	00	20	  1	  0	T	101	  1	  1		  1	C				  0	  0	103							_		
ZCO_IL_COSTCTR-TELNO	C	CHAR	 12	B0	00	80	30	20	  1	  1	T	101	  1	  1		 12					 24	  0				KEY				____________	                                       00	
ZCO_IL_COSTCTR-NAME	C	CHAR	120	B0	00	80	00	00	  1	  2	T	101	  1	  1		120					240	  0								________________________________________________________________________________________________________________________	                                       00	
ZCO_IL_COSTCTR-CO_CENTER	C	CHAR	 10	B0	00	80	00	00	  1	  3	T	101	  1	  1		 15			KOS	ALPHA	 20	  0								__________	                                       00	
VIM_POSI_PUSH		CHAR	 20	80	00	88	30	00	 61	 20		  0	  0	  0		 20	P				  0	  0	102							____________________	                                                                                                                                                                        POSI	
VIM_POSITION_INFO		CHAR	 30	80	02	88	33	00	 61	 41		  0	  0	  0		 30					  0	  0								______________________________		
OK_CODE		CHAR	  4	80	10	88	00	00	255	  4	O	  0	  0	  0		 20					  0	  0								____		
%_FLOWLOGIC																																
PROCESS BEFORE OUTPUT.																																
 MODULE LISTE_INITIALISIEREN.																																
 LOOP AT EXTRACT WITH CONTROL																																
  TCTRL_ZCO_IL_COSTCTR CURSOR NEXTLINE.																																
   MODULE LISTE_SHOW_LISTE.																																
 ENDLOOP.																																
*																																
PROCESS AFTER INPUT.																																
 MODULE LISTE_EXIT_COMMAND AT EXIT-COMMAND.																																
 MODULE LISTE_BEFORE_LOOP.																																
 LOOP AT EXTRACT.																																
   MODULE LISTE_INIT_WORKAREA.																																
   CHAIN.																																
    FIELD ZCO_IL_COSTCTR-TELNO .																																
    FIELD ZCO_IL_COSTCTR-NAME .																																
    FIELD ZCO_IL_COSTCTR-CO_CENTER .																																
    MODULE SET_UPDATE_FLAG ON CHAIN-REQUEST.																																
   ENDCHAIN.																																
   FIELD VIM_MARKED MODULE LISTE_MARK_CHECKBOX.																																
   CHAIN.																																
    FIELD ZCO_IL_COSTCTR-TELNO .																																
    MODULE LISTE_UPDATE_LISTE.																																
   ENDCHAIN.																																
 ENDLOOP.																																
 MODULE LISTE_AFTER_LOOP.																																
