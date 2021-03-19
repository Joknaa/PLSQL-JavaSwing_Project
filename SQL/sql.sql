

--------------------------------------------------------
--  Fichier cr�� - vendredi-mars-19-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CLIENTLIST
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."CLIENTLIST" 
   (	"CLIENTCODE" NUMBER(*,0), 
	"NAME" VARCHAR2(32 BYTE), 
	"ADDRESS" VARCHAR2(255 BYTE), 
	"REGION" NUMBER(*,0), 
	"CONTRACTDATE" DATE, 
	"EMAIL" VARCHAR2(64 BYTE), 
	"OBSERVATIONS" CHAR(255 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table FAMILIES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."FAMILIES" 
   (	"CODE" NUMBER(*,0), 
	"LABEL" VARCHAR2(32 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table COMMAND
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."COMMAND" 
   (	"COMMANDID" NUMBER(*,0), 
	"COMMANDDATE" DATE, 
	"CLIENTID" NUMBER(*,0), 
	"PRODUCTREF" VARCHAR2(20 BYTE), 
	"QTE" NUMBER, 
	"PAID" NUMBER(*,0) DEFAULT 0, 
	"TOTALTTC" FLOAT(126)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CATALOGUE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."CATALOGUE" 
   (	"REF" VARCHAR2(8 BYTE), 
	"LABEL" VARCHAR2(64 BYTE), 
	"CATEGORY" NUMBER(*,0), 
	"FAMILY" NUMBER(*,0), 
	"PU" NUMBER(*,0), 
	"TVA" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CATEGORIES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."CATEGORIES" 
   (	"CODE" NUMBER(*,0), 
	"LABEL" VARCHAR2(32 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."PRODUCT" 
   (	"PRODUCTID" NUMBER GENERATED ALWAYS AS IDENTITY,
	"LIBELLE" VARCHAR2(60 BYTE), 
	"QUANTITY" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REGIONS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REGIONS" 
   (	"REGIONCODE" NUMBER(*,0), 
	"LABEL" VARCHAR2(64 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

Insert into SYSTEM.CLIENTLIST (CLIENTCODE,NAME,ADDRESS,REGION,CONTRACTDATE,EMAIL,OBSERVATIONS) values ('1','BENTAJER','Mhannech II, Tetouan','1',to_date('02/12/19','DD/MM/RR'),'ahmed@mail.com','A pass� une grosse commande en janvier 2018 ; depuis, plus rien. Penser � reprendre contact                                                                                                                                                                  ');
Insert into SYSTEM.CLIENTLIST (CLIENTCODE,NAME,ADDRESS,REGION,CONTRACTDATE,EMAIL,OBSERVATIONS) values ('2','ESSEGHIRI','Res Naoufal app 8, Maarif, Casablanca','2',to_date('27/10/18','DD/MM/RR'),'youssef@mail.com','Client contact�e gr�ce � M. Houty de Casablanca. Remise de 10% sur laderni�re commande suite � un retard d�envoi                                                                                                                                        ');
Insert into SYSTEM.CLIENTLIST (CLIENTCODE,NAME,ADDRESS,REGION,CONTRACTDATE,EMAIL,OBSERVATIONS) values ('3','Belmir','Tetouan','2',to_date('20/11/18','DD/MM/RR'),'karim@mail.com','Client fid�le qui passe des commandes r�guli�rement (environ une par mois)                                                                                                                                                                                  ');


Insert into SYSTEM.COMMAND (COMMANDID,COMMANDDATE,CLIENTID,PRODUCTREF,QTE,PAID,TOTALTTC) values ('886',to_date('01/02/19','DD/MM/RR'),'2','A01','10','0','1680');
Insert into SYSTEM.COMMAND (COMMANDID,COMMANDDATE,CLIENTID,PRODUCTREF,QTE,PAID,TOTALTTC) values ('888',to_date('01/02/19','DD/MM/RR'),'2','A02','1','0','537.6');
Insert into SYSTEM.COMMAND (COMMANDID,COMMANDDATE,CLIENTID,PRODUCTREF,QTE,PAID,TOTALTTC) values ('887',to_date('01/02/19','DD/MM/RR'),'2','B15','2','0','2818.8');
Insert into SYSTEM.COMMAND (COMMANDID,COMMANDDATE,CLIENTID,PRODUCTREF,QTE,PAID,TOTALTTC) values ('889',to_date('01/02/19','DD/MM/RR'),'3','B15','5','1','1987');
Insert into SYSTEM.COMMAND (COMMANDID,COMMANDDATE,CLIENTID,PRODUCTREF,QTE,PAID,TOTALTTC) values ('79',to_date('01/02/19','DD/MM/RR'),'4','A05','6','0',null);
Insert into SYSTEM.COMMAND (COMMANDID,COMMANDDATE,CLIENTID,PRODUCTREF,QTE,PAID,TOTALTTC) values ('81',to_date('01/02/19','DD/MM/RR'),'4','A11','6','0','4500');
Insert into SYSTEM.COMMAND (COMMANDID,COMMANDDATE,CLIENTID,PRODUCTREF,QTE,PAID,TOTALTTC) values ('82',to_date('01/02/19','DD/MM/RR'),'4','A11','6','0','585');
Insert into SYSTEM.COMMAND (COMMANDID,COMMANDDATE,CLIENTID,PRODUCTREF,QTE,PAID,TOTALTTC) values ('83',to_date('01/02/19','DD/MM/RR'),'4','A11','6','0','5040');
Insert into SYSTEM.COMMAND (COMMANDID,COMMANDDATE,CLIENTID,PRODUCTREF,QTE,PAID,TOTALTTC) values ('84',to_date('01/02/19','DD/MM/RR'),'4','A11','6','0','4788');
Insert into SYSTEM.COMMAND (COMMANDID,COMMANDDATE,CLIENTID,PRODUCTREF,QTE,PAID,TOTALTTC) values ('85',to_date('01/02/19','DD/MM/RR'),'4','A11','6','0','4536');


Insert into SYSTEM.CATALOGUE (REF,LABEL,CATEGORY,FAMILY,PU,TVA) values ('A01','Barrette Memoire 2Go','1','1','150','12');
Insert into SYSTEM.CATALOGUE (REF,LABEL,CATEGORY,FAMILY,PU,TVA) values ('A02','Barrette Memoire 4Go','1','1','240','12');
Insert into SYSTEM.CATALOGUE (REF,LABEL,CATEGORY,FAMILY,PU,TVA) values ('B15','Carte Graphique AMD Radeon RX 570 Pulse, 4Go','5','2','2349','20');
Insert into SYSTEM.CATALOGUE (REF,LABEL,CATEGORY,FAMILY,PU,TVA) values ('A11','Carte son Asus Xonar DG','4','2','750','12');
Insert into SYSTEM.CATALOGUE (REF,LABEL,CATEGORY,FAMILY,PU,TVA) values ('C80','Disque Externe Toshiba usb 3.0 1000Go','2','3','546','33');


Insert into SYSTEM.CATEGORIES (CODE,LABEL) values ('1','MEMOIRE');
Insert into SYSTEM.CATEGORIES (CODE,LABEL) values ('2','CARTE');
Insert into SYSTEM.CATEGORIES (CODE,LABEL) values ('3','DISQUE');


Insert into SYSTEM.REGIONS (REGIONCODE,LABEL) values ('1','Tanger-T�touan-Al Hoce�ma');
Insert into SYSTEM.REGIONS (REGIONCODE,LABEL) values ('2','R�gion de l Oriental');
Insert into SYSTEM.REGIONS (REGIONCODE,LABEL) values ('3','R�gion de F�s-Mekn�s');
Insert into SYSTEM.REGIONS (REGIONCODE,LABEL) values ('4','R�gion de Rabat-Sal�-K�nitra');
Insert into SYSTEM.REGIONS (REGIONCODE,LABEL) values ('5','R�gion de B�ni Mellal-Kh�nifra');
Insert into SYSTEM.REGIONS (REGIONCODE,LABEL) values ('6','R�gion de Casablanca-Settat');
Insert into SYSTEM.REGIONS (REGIONCODE,LABEL) values ('7','R�gion de Marrakech-Safi');
--------------------------------------------------------
--  DDL for Index CLIENTLIST_REGIONS_REGIONCODE_FK
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."CLIENTLIST_REGIONS_REGIONCODE_FK" ON "SYSTEM"."CLIENTLIST" ("REGION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index CLIENTLIST_CLIENTCODE_UINDEX
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."CLIENTLIST_CLIENTCODE_UINDEX" ON "SYSTEM"."CLIENTLIST" ("CLIENTCODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007362
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007362" ON "SYSTEM"."FAMILIES" ("CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007379
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007379" ON "SYSTEM"."COMMAND" ("COMMANDID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index COMMAND_CATEGORIES_CODE_FK
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."COMMAND_CATEGORIES_CODE_FK" ON "SYSTEM"."COMMAND" ("PRODUCTREF") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index COMMAND_CLIENTLIST_CLIENTCODE_FK
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."COMMAND_CLIENTLIST_CLIENTCODE_FK" ON "SYSTEM"."COMMAND" ("CLIENTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007391
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007391" ON "SYSTEM"."CATALOGUE" ("REF") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007373
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007373" ON "SYSTEM"."CATEGORIES" ("CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007371
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007371" ON "SYSTEM"."REGIONS" ("REGIONCODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;


  ALTER TABLE "SYSTEM"."CLIENTLIST" MODIFY ("CONTRACTDATE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CLIENTLIST" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CLIENTLIST" MODIFY ("OBSERVATIONS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CLIENTLIST" ADD CONSTRAINT "CLIENTLIST_CLIENTCODE_UINDEX" UNIQUE ("CLIENTCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FAMILIES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."FAMILIES" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."FAMILIES" MODIFY ("LABEL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."FAMILIES" ADD PRIMARY KEY ("CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMAND
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."COMMAND" MODIFY ("COMMANDID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."COMMAND" MODIFY ("COMMANDDATE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."COMMAND" MODIFY ("CLIENTID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."COMMAND" MODIFY ("PRODUCTREF" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."COMMAND" MODIFY ("PAID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."COMMAND" ADD PRIMARY KEY ("COMMANDID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."COMMAND" MODIFY ("QTE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CATALOGUE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."CATALOGUE" MODIFY ("REF" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CATALOGUE" MODIFY ("LABEL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CATALOGUE" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CATALOGUE" MODIFY ("FAMILY" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CATALOGUE" MODIFY ("PU" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CATALOGUE" ADD PRIMARY KEY ("REF")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CATEGORIES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."CATEGORIES" MODIFY ("LABEL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CATEGORIES" ADD PRIMARY KEY ("CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;


  ALTER TABLE "SYSTEM"."REGIONS" ADD PRIMARY KEY ("REGIONCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
