
/*==============================================================*/
/* Table: CERTIOBRA                                             */
/*==============================================================*/
create table CERTIOBRA 
(
   IDOBRA               NUMBER(5)            not null,
   NROCERTIFICADO       NUMBER(3)            not null,
   NROCEROBRA           NUMBER(3)            not null,
   IDFOJA               NUMBER(5),
   constraint PK_CERTIOBRA primary key (IDOBRA, NROCERTIFICADO, NROCEROBRA)
);

/*==============================================================*/
/* Table: CERTIPAGO                                             */
/*==============================================================*/
create table CERTIPAGO 
(
   IDOBRA               NUMBER(5)            not null,
   NROCERTIFICADO       NUMBER(3)            not null,
   FECHACERT            DATE,
   ABIERTO              NUMBER(1),
   constraint PK_CERTIPAGO primary key (IDOBRA, NROCERTIFICADO)
);

/*==============================================================*/
/* Table: CONCEPTO                                              */
/*==============================================================*/
create table CONCEPTO 
(
   IDCONCEPTO           NUMBER(3)            not null,
   DENCONCEPTO          VARCHAR2(70),
   constraint PK_CONCEPTO primary key (IDCONCEPTO)
);

/*==============================================================*/
/* Table: CONCEPTOSXCERTIF                                      */
/*==============================================================*/
create table CONCEPTOSXCERTIF 
(
   IDOBRA               NUMBER(5)            not null,
   NROCERTIFICADO       NUMBER(3)            not null,
   IDCONCEPTO           NUMBER(3)            not null,
   IMPORTE              NUMBER(15,2),
   constraint PK_CONCEPTOSXCERTIF primary key (IDOBRA, NROCERTIFICADO, IDCONCEPTO)
);

/*==============================================================*/
/* Table: CONCEPTOSXOBRA                                        */
/*==============================================================*/
create table CONCEPTOSXOBRA 
(
   IDOBRA               NUMBER(5)            not null,
   IDCONCEPTO           NUMBER(3)            not null,
   ORDENIMP             NUMBER(2),
   CALCFONDOREPARO      NUMBER(1),
   constraint PK_CONCEPTOSXOBRA primary key (IDOBRA, IDCONCEPTO)
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA 
(
   IDEMPRESA            NUMBER(4)            not null,
   RAZONSOCIAL          VARCHAR(70),
   CUIT                 NUMBER(12),
   constraint PK_EMPRESA primary key (IDEMPRESA)
);

/*==============================================================*/
/* Table: FOJA                                                  */
/*==============================================================*/
create table FOJA 
(
   IDFOJA               NUMBER(5)            not null,
   IDOBRA               NUMBER(5),
   FECHA                DATE,
   constraint PK_FOJA primary key (IDFOJA)
);

/*==============================================================*/
/* Table: FOJADET                                               */
/*==============================================================*/
create table FOJADET 
(
   IDFOJA               NUMBER(5)            not null,
   IDITEM               NUMBER(8)            not null,
   IDOBRA               NUMBER(5)            not null,
   AVAACUANTERIOR       NUMBER(18,2),
   AVAACTUAL            NUMBER(18,2),
   constraint PK_FOJADET primary key (IDFOJA, IDITEM, IDOBRA)
);

/*==============================================================*/
/* Table: ITEM                                                  */
/*==============================================================*/
create table ITEM 
(
   IDITEM               NUMBER(8)            not null,
   IDOBRA               NUMBER(5)            not null,
   IDTIPOITEM           NUMBER(2),
   DENITEM              VARCHAR(120),
   ORDEN                NUMBER(2),
   constraint PK_ITEM primary key (IDITEM, IDOBRA)
);

/*==============================================================*/
/* Table: ITEMCOSTO                                             */
/*==============================================================*/
create table ITEMCOSTO 
(
   IDITEM               NUMBER(8)            not null,
   IDOBRA               NUMBER(5)            not null,
   IDREDETERMINACION    NUMBER(2)            not null,
   COSTO                NUMBER(18,2),
   constraint PK_ITEMCOSTO primary key (IDITEM, IDOBRA, IDREDETERMINACION)
);

/*==============================================================*/
/* Table: LOCALIDAD                                             */
/*==============================================================*/
create table LOCALIDAD 
(
   IDLOCALIDAD          NUMBER(3)            not null,
   NOMLOC               VARCHAR(40),
   CP                   VARCHAR(10),
   constraint PK_LOCALIDAD primary key (IDLOCALIDAD)
);

/*==============================================================*/
/* Table: OBRA                                                  */
/*==============================================================*/
create table OBRA 
(
   IDOBRA               NUMBER(5)            not null,
   IDLOCALIDAD          NUMBER(3),
   IDTIPCONTRAT         NUMBER(2),
   IDEMPRESA            NUMBER(4),
   NOMOBRA              VARCHAR(250),
   FECINICIO            DATE,
   PLAZO_MES            NUMBER(3),
   NUMOBRA              NUMBER(5),
   PORFLETE             NUMBER(5,2),
   PORGASTOS            NUMBER(5,2),
   PORUTI               NUMBER(5,2),
   IVAVIV               NUMBER(5,2),
   IVAINFRA             NUMBER(5,2),
   constraint PK_OBRA primary key (IDOBRA)
);

/*==============================================================*/
/* Table: REDETERMINACION                                       */
/*==============================================================*/
create table REDETERMINACION 
(
   IDREDETERMINACION    NUMBER(2)            not null,
   FECHAREDET           DATE,
   FECHADESDE           DATE,
   FECHAHASTA           DATE,
   NRORESOLUCION        VARCHAR(10),
   constraint PK_REDETERMINACION primary key (IDREDETERMINACION)
);

/*==============================================================*/
/* Table: TIPOCONTRATACION                                      */
/*==============================================================*/
create table TIPOCONTRATACION 
(
   IDTIPCONTRAT         NUMBER(2)            not null,
   DENTIPCONTRAT        VARCHAR(30),
   constraint PK_TIPOCONTRATACION primary key (IDTIPCONTRAT)
);

/*==============================================================*/
/* Table: TIPOITEM                                              */
/*==============================================================*/
create table TIPOITEM 
(
   IDTIPOITEM           NUMBER(2)            not null,
   DENTIPO              VARCHAR(60),
   constraint PK_TIPOITEM primary key (IDTIPOITEM)
);

alter table CERTIOBRA
   add constraint FK_CERTIOBR_REFERENCE_CERTIPAG foreign key (IDOBRA, NROCERTIFICADO)
      references CERTIPAGO (IDOBRA, NROCERTIFICADO);

alter table CERTIOBRA
   add constraint FK_CERTIOBR_REFERENCE_FOJA foreign key (IDFOJA)
      references FOJA (IDFOJA);

alter table CERTIPAGO
   add constraint FK_CERTIPAG_REFERENCE_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA);

alter table CONCEPTOSXCERTIF
   add constraint FK_CONCEPTO_REFERENCE_CERTIPAG foreign key (IDOBRA, NROCERTIFICADO)
      references CERTIPAGO (IDOBRA, NROCERTIFICADO);

alter table CONCEPTOSXCERTIF
   add constraint FK_CONCEPTO_REF_CONXCERTIF foreign key (IDCONCEPTO)
      references CONCEPTO (IDCONCEPTO);

alter table CONCEPTOSXOBRA
   add constraint FK_CONCEPTO_REF_CONCEPTOXOBRA foreign key (IDCONCEPTO)
      references CONCEPTO (IDCONCEPTO);

alter table CONCEPTOSXOBRA
   add constraint FK_CONCEPTO_REFERENCE_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA);

alter table FOJA
   add constraint FK_FOJA_REFERENCE_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA);

alter table FOJADET
   add constraint FK_FOJADET_REFERENCE_ITEM foreign key (IDITEM, IDOBRA)
      references ITEM (IDITEM, IDOBRA);

alter table FOJADET
   add constraint FK_FOJADET_REFERENCE_FOJA foreign key (IDFOJA)
      references FOJA (IDFOJA);

alter table ITEM
   add constraint FK_ITEM_REFERENCE_OBRA foreign key (IDOBRA)
      references OBRA (IDOBRA);


alter table ITEM
   add constraint FK_ITEM_REFERENCE_TIPOITEM foreign key (IDTIPOITEM)
      references TIPOITEM (IDTIPOITEM);

alter table ITEMCOSTO
   add constraint FK_ITEMCOST_REFERENCE_REDETERM foreign key (IDREDETERMINACION)
      references REDETERMINACION (IDREDETERMINACION);

alter table ITEMCOSTO
   add constraint FK_ITEMCOST_REFERENCE_ITEM foreign key (IDITEM, IDOBRA)
      references ITEM (IDITEM, IDOBRA);

alter table OBRA
   add constraint FK_OBRA_REFERENCE_LOCALIDA foreign key (IDLOCALIDAD)
      references LOCALIDAD (IDLOCALIDAD);

alter table OBRA
   add constraint FK_OBRA_REFERENCE_TIPOCONT foreign key (IDTIPCONTRAT)
      references TIPOCONTRATACION (IDTIPCONTRAT);

alter table OBRA
   add constraint FK_OBRA_REFERENCI_EMPRESA foreign key (IDEMPRESA)
      references EMPRESA (IDEMPRESA);
--------------------------------------------------------------------------------
insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (1, 'UCITE S.A. ', 32242668620);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (2, 'MALTERRA S.A.', 32244562991);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (3, 'HISTORY S.A.', 21231947176);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (4, 'MEMBRETE S.A.', 32245445258);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (5, 'SORING S.A.', 32206016123);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (6, 'I SWEAR S.A.', 35396702196);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (7, 'SANGULON S.A.', 32245778449);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (8, 'PEDROSSO S.A.', 32217415705);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (9, 'MENGUELENGUE S.A.', 32243169334);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (10, 'KIPOTSO S.A.', 32137949753);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (11, 'ULACA S.A.', 32232980308);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (12, 'USTERMI S.A.', 32188422396);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (13, 'OLAPSE S.A.', 32187489616);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (14, 'WEEWWQ S.A.', 32244114744);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (15, 'NIUMA S.A.', 21105341357);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (16, 'LINTEREO S.A.', 32244651709);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (17, 'BASE SURTIDA S.A.', 32244537804);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (18, 'SANTURRE S.A.', 32222317736);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (19, 'QUILIMAN S.A.', 35323776882);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (20, 'KIROSOE S.A.', 32245011022);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (21, 'PALEONTINA S.A.', 35397227154);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (22, 'MERMELADA S.A.', 21294688511);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (24, 'YUCATUM S.A.', 21156133202);

insert into empresa (IDEMPRESA, RAZONSOCIAL, CUIT)
values (25, 'JURITMA S.A.', 28506133887);
--------------------------------------------------------------------------------
insert into tipocontratacion (IDTIPCONTRAT, DENTIPCONTRAT)
values (1, 'LICITACION PUBLICA');

insert into tipocontratacion (IDTIPCONTRAT, DENTIPCONTRAT)
values (2, 'LICITACION PRIVADA');

insert into tipocontratacion (IDTIPCONTRAT, DENTIPCONTRAT)
values (3, 'CONCURSO');
--------------------------------------------------------------------------------
insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (1, 'NO ESPECIFICADO', null);

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (2, 'POZO AZUL', '3364');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (3, 'POSADAS', '3300');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (4, 'FACHINAL', '3304');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (5, 'OBERA', '3360');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (6, 'APOSTOLES', '3350');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (7, 'SAN IGNACIO', '3322');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (8, 'JARDIN AMERICA', '3328');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (9, 'MONTECARLO', '3384');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (11, 'CAA YARÍ', '3315');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (12, 'CAMPO GRANDE', '3362');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (13, 'CAMPO RAMÓN', '3361');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (14, 'CAMPO VIERA', '3362');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (15, 'CANDELARIA', '3308');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (16, 'CAPIOVI', '3332');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (17, 'CARAGUATAY', '3386');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (18, 'CERRO AZUL', '3313');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (19, 'CERRO CORÁ', '3309');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (20, 'COLONIA ALBERDI', '3361');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (21, 'COLONIA AURORA', '3363');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (22, 'COLONIA DELICIA', '3381');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (23, 'COLONIA POLANA', '3326');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (24, 'CONCEPCIÓN DE LA SIERRA', '3355');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (25, 'CORPUS CHRISTI', '3327');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (26, 'DOS ARROYOS', '3315');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (27, 'DOS DE MAYO', '3364');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (28, 'EL ALCAZAR', '3384');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (29, 'EL SOBERBIO', '3364');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (30, 'ELDORADO', '3380');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (31, 'GARUHAPÉ', '3334');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (32, 'GARUPÁ', '3304');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (33, 'GENERAL ALVEAR', '3361');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (34, 'GENERAL URQUIZA', '3322');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (35, 'GOBERNADOR LOPEZ', '3315');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (36, 'GOBERNADOR ROCA', '3324');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (37, 'GUARANI', '3361');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (38, 'HIPOLITO YRIGOYEN', '3328');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (39, 'PUERTO IGUAZÚ', '3370');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (40, 'ITACARUARÉ', '3353');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (41, 'LEANDRO N. ALEM', '3315');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (42, 'PUERTO LIBERTAD', '3374');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (43, 'LORETO', '3316');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (44, 'LOS HELECHOS', '3361');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (45, 'MARTIRES', '3300');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (46, 'MOJÓN GRANDE', '3315');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (47, 'OLEGARIO V. ANDRADE', '3311');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (48, 'PANAMBÍ', '3361');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (49, 'PROFUNDIDAD', '3308');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (50, 'PUERTO LEONI', '3332');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (51, 'PUERTO PIRAY', '3381');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (52, 'PUERTO RICO', '3334');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (53, 'RUIZ DE MONTOYA', '3334');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (54, 'SAN ANTONIO', '3366');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (55, 'SAN JAVIER', '3357');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (56, 'SAN JOSE', '3306');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (57, 'SAN MARTIN', '3363');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (58, 'SAN PEDRO', '3364');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (59, 'SAN VICENTE', '3364');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (60, 'SANTA ANA', '3316');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (61, 'SANTIAGO DE LINIERS', '3381');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (62, 'SANTO PIPÓ', '3326');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (63, 'TRES CAPONES', '3353');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (64, '9 DE JULIO', '3380');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (65, 'ALBA POSSE', '3363');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (66, 'ALMAFUERTE', '3317');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (67, 'ARISTOBULO DEL VALLE', '3364');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (68, 'ARROYO DEL MEDIO', '3313');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (69, 'AZARA', '3351');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (70, 'BERNARDO DE IRIGOYEN', '3366');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (71, 'BONPLAND', '3317');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (72, '25 DE MAYO', '3363');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (73, 'COLONIA VICTORIA', '3382');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (74, 'COLONIA WANDA', '3376');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (75, 'FLORENTINO AMEGHINO', '3361');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (76, 'CABUREI', '3371');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (77, 'FRACRAN', '3364');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (79, 'DOS HERMANAS', '3315');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (80, 'SALTO ENCANTADO', '3364');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (81, 'VILLA BONITA', '3361');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (82, 'PUEBLO ILLIA', '3364');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (83, 'COLONIA ALICIA', '3363');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (84, 'SANTA RITA', '3363');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (85, 'OASIS', '3328');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (86, 'PARAJE MARIA SOLEDAD', '3371');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (87, 'PARAJE INTEGRACION', '3326');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (88, 'EL CHATON', '3315');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (89, 'CMTE. ANDRESITO', '3385');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (90, 'MARÍA SOLEDAD', '3326');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (91, 'EL NARANJITO', '3326');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (92, 'PIÑALITO NORTE', '3366');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (93, 'PUERTO ESPERANZA', '3378');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (94, 'SANTA MARIA', '3353');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (95, 'BUENOS AIRES', '0001');

insert into localidad (IDLOCALIDAD, NOMLOC, CP)
values (96, 'ITUZAINGO', '3302');

select * from obra
--------------------------------------------------------------------------------
insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (10062, 1, 1, 6, '30 MEJORAMIENTOS DE EMERGENCIA HÍDRICA - SAN JAVIER - ALBA POSSE - COLONIA AURORA - MISIONES', to_date('02-03-2016', 'dd-mm-yyyy'), 4, 4712, 2.00, 15.00, 10.00, 0.00, 25.50);

insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (10100, 3, 1, 21, 'REMODELACIÓN DE PLAZOLETAS Nº 27, 28, 29 Y 30 SOBRE AV. MITRE - POSADAS - MISIONES', to_date('03-04-2018', 'dd-mm-yyyy'), 4, 4800, 0.00, 15.00, 10.00, 0.00, 24.90);

insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (10087, 3, 1, 21, 'AMPLIACIONES Y REFACCIONES EN EL INSTITUTO VIRGEN DE ITATI - POSADAS - MISIONES', to_date('02-05-2017', 'dd-mm-yyyy'), 12, 4802, 0.00, 15.00, 10.00, 0.00, 25.50);

insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (10084, 3, 1, 7, 'REPARACIONES GENERALES EN ESCUELA Nº 43 - POSADAS - MISIONES', to_date('02-06-2017', 'dd-mm-yyyy'), 12, 4803, 0.00, 15.00, 10.00, 0.00, 25.50);

insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (10061, 3, 1, 14, 'SISTEMA DE VIDEO VIGILANCIA DE LA CIUDAD DE POSADAS - MISIONES - 2º ETAPA', to_date('02-02-2016', 'dd-mm-yyyy'), 6, 4783, 0.00, 15.00, 10.00, 0.00, 25.50);

insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (10054, 3, 1, 13, '**PAVIMENTACION DE TRAMA VIAL TRANSITO LIVIANO ETAPA II.5  (UOCRA) - URBANIZACION 740 HAS ITAEMBE GUAZU - POSADAS - MISIONES', to_date('02-10-2018', 'dd-mm-yyyy'), 6, 4778, 0.00, 15.00, 10.00, 0.00, 25.50);

insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (10048, 3, 1, 14, '***PAVIMENTACIÓN DE TRAMA VIAL TRÁNSITO LIVIANO ETAPA II.8  (573 VIV.) - URBANIZACIÓN 740 HAS ITAEMBÉ GUAZÚ -. POSADAS - MISIONES', to_date('02-10-2018', 'dd-mm-yyyy'), 6, 4772, 0.00, 15.00, 10.00, 0.00, 25.50);

insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (9994, 3, 1, 13, 'NEXO DE AGUA POTABLE - CAÑERIA PVC Ø 160 - ETAPA II.6, II.7 Y II,8 (573 VIVIENDAS)  URBANIZACIÓN 740 HAS ITAEMBE GUAZÚ', to_date('02-11-2015', 'dd-mm-yyyy'), 6, 4730, 0.00, 15.00, 10.00, 0.00, 25.50);

insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (9990, 3, 1, 5, 'NEXO DE AGUA POTABLE - CAÑERÍA PVC Ø 160 - ETAPA II.5 (300 VIVIENDAS UOCRA)  URBANIZACIÓN 740 HAS ITAEMBE GUAZÚ', to_date('02-11-2015', 'dd-mm-yyyy'), 6, 4725, 0.00, 15.00, 10.00, 0.00, 25.50);

insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (10042, 5, 1, 13, 'REFACCIONES GENERALES EN LA ESCUELA Nº 185 - OBERA - MISIONES', to_date('02-05-2016', 'dd-mm-yyyy'), 8, 4765, 0.00, 15.00, 10.00, 0.00, 25.50);

insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (10006, 9, 1, 19, 'ESCUELA IEA Nº 8 - MONTECARLO - MISIONES', to_date('02-03-2018', 'dd-mm-yyyy'), 8, 4739, 0.00, 15.00, 10.00, 0.00, 25.50);

insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (10098, 50, 1, 8, 'SISTEMA DE PROVISIÓN DE AGUA POTABLE PARA BARRIO TAKAKURA', to_date('01-02-2016', 'dd-mm-yyyy'), 6, 4788, 1.00, 15.00, 10.00, 0.00, 25.50);

insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (10096, 55, 1, 8, 'SISTEMA DE PROVISIÓN DE AGUA POTABLE PARA PJE MARIA AUXILIADORA', to_date('01-02-2016', 'dd-mm-yyyy'), 6, 4787, 1.00, 15.00, 10.00, 0.00, 25.50);

insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (9963, 59, 1, 10, '8 MEJORAMIENTOS DE EMERGENCIA POR TORNADO - SAN VICENTE', to_date('02-12-2015', 'dd-mm-yyyy'), 6, 4702, 2.00, 15.00, 10.00, 25.50, 0.00);

insert into OBRA (IDOBRA, IDLOCALIDAD, IDTIPCONTRAT, IDEMPRESA, NOMOBRA, FECINICIO, PLAZO_MES, NUMOBRA, PORFLETE, PORGASTOS, PORUTI, IVAVIV, IVAINFRA)
values (10099, 65, 1, 8, 'SISTEMA DE PROVISIÓN DE AGUA POTABLE PARA PJE  SAN FRANCISCO DE ASÍS', to_date('01-02-2016', 'dd-mm-yyyy'), 8, 4789, 2.00, 15.00, 10.00, 0.00, 25.50);
--------------------------------------------------------------------------------
insert into TipoItem (IDTIPOITEM, DENTIPO)
values (1, 'VIVIENDA');

insert into TipoItem (IDTIPOITEM, DENTIPO)
values (2, 'INFRA');

SELECT * FROM TipoItem
SELECT  * FROM ITEM
WHERE IDITEM = 41
-------------------------------------------------------------------------------
insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (1, 10096, 2, 'SIST. ABASTECIMIENTO AGUA POTABLE', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (2, 10096, 2, 'CONEXION DOMICI. AGUA DE RED', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (3, 10096, 2, 'SIST. DESAGUES PLUVIALES', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (4, 10096, 2, 'OBRAS COMPLEMENTARIAS', 4);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (5, 10096, 2, 'PERFORACION', 5);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (6, 10096, 2, 'TANQUE ELEVADO', 6);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (7, 10096, 2, 'OBRAS DE INFRA. PRIVADA-CONEX EXISTENTE', 7);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (1, 10098, 2, 'SIST. ABASTECIMIENTO AGUA POTABLE', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (2, 10098, 2, 'CONEXION DOMICI. AGUA DE RED', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (3, 10098, 2, 'SIST. DESAGUES PLUVIALES', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (4, 10098, 2, 'OBRAS COMPLEMENTARIAS', 4);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (5, 10098, 2, 'PERFORACION', 5);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (6, 10098, 2, 'TANQUE ELEVADO', 6);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (7, 10098, 2, 'OBRAS DE INFRA. PRIVADA-CONEX EXISTENTE', 7);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (1, 10099, 2, 'SIST. ABASTECIMIENTO AGUA POTABLE', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (2, 10099, 2, 'CONEXION DOMICI. AGUA DE RED', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (3, 10099, 2, 'REFUGIOS', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (4, 10099, 2, 'OBRAS COMPLEMENTARIAS', 4);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (5, 10099, 2, 'PERFORACION', 5);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (6, 10099, 2, 'TANQUE ELEVADO', 6);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (7, 10099, 2, 'OBRAS DE INFRA. PRIVADA-CONEX EXISTENTE', 7);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (1, 9990, 2, 'TRABAJOS PRELIMINARES', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (2, 9990, 2, 'MOVIMIENTO DE SUELOS', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (3, 9990, 2, 'RED DE AGUA POTABLE', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (4, 9990, 2, 'CAMARAS REGULADORAS DE PRESION', 4);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (5, 9990, 2, 'MOVILIZACION DE OBRA', 5);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (1, 9994, 2, 'TRABAJOS PRELIMINARES', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (2, 9994, 2, 'EXCAVACION Y TAPADO DE ZANJAS', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (3, 9994, 2, 'PEOVISION DE CAÑOS DE PVC JD CLASE 10', 4);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (4, 9994, 2, 'COLOCACION DE CAÑERIA DE PVC C/10', 5);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (5, 9994, 2, 'PROVISION DE VALVULAS', 6);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (6, 9994, 2, 'ACCESORIOS ', 7);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (7, 9994, 2, 'CAMARAS PARA VALVULAS', 8);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (9, 9994, 2, 'HORMIGON', 9);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (10, 9994, 2, 'MOVILIDAD DE OBRA', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (1, 10006, 2, 'TRABAJOS PREPARATORIOS', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (2, 10006, 2, 'MOVIMIENTO DE SUELOS', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (3, 10006, 2, 'ESTRUCTURA RESISETENTE', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (4, 10006, 2, 'MAMPOSTERIA', 5);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (5, 10006, 2, 'AISLACIONES', 4);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (6, 10006, 2, 'CUBIERTA DE TECHOS', 7);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (7, 10006, 2, 'REVOQUES', 6);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (8, 10006, 2, 'CIELORRASOS', 8);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (9, 10006, 2, 'CONTRAPISOS', 9);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (10, 10006, 2, 'PISOS Y ZOCALOS', 10);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (11, 10006, 2, 'REVESTIMIENTOS', 11);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (12, 10006, 2, 'CARPINTERIAS', 12);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (15, 10006, 2, 'INSTALACION DE SEGURIDAD', 17);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (16, 10006, 2, 'CRISTALES, ESPEJOS Y VIDRIOS', 15);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (17, 10006, 2, 'PINTURAS', 16);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (19, 10006, 2, 'VARIOS', 18);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (20, 10006, 2, 'INSTALACION ELECTRICA', 13);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (21, 10006, 2, 'INSTALACION SANITARIA', 14);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (1, 10100, 2, 'REMODELACION PLAZOLETA Nº 29 ', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (2, 10100, 2, 'REMODELACION PLAZOLETA Nº 30 - RENACER', 4);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (3, 10100, 2, 'REMODELACION PLAZOLETA Nº 28 - DE LAS AMERICAS', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (4, 10100, 2, 'REMODELACION PLAZOLETA Nº 27 - NORMA D´INDIO', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (2, 10061, 2, 'MOVIMIENTO DE SUELO', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (3, 10061, 2, 'DEMOLICIONES', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (4, 10061, 2, 'ESTRUCTURAS', 4);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (5, 10061, 2, 'REPARACION DE MAMPOSTERIA', 5);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (6, 10061, 2, 'REVOQUES Y REVESTIMIENTOS DE FRENTE', 6);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (7, 10061, 2, 'CONTRAPISOS Y CARPETAS', 7);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (8, 10061, 2, 'PISOS', 8);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (9, 10061, 2, 'ZOCALOS', 9);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (10, 10061, 2, 'CARPINTERIA DE CHAPA', 10);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (12, 10061, 2, 'CONSTRUCCION EN SECO', 11);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (14, 10061, 2, 'PINTURAS', 12);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (15, 10061, 2, 'INSTALACION DE AIRE ACONDICIONADO', 13);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (16, 10061, 2, 'INSTALACION ELECTRICA', 14);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (23, 10061, 2, 'COLUMNAS Y PROVISION DE ENERGIA', 15);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (25, 10061, 2, 'DERECHOS', 16);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (26, 10061, 2, 'VARIOS', 17);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (27, 10061, 2, 'AMOBLAMIENTO', 18);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (30, 10061, 2, 'EQUIPAMIENTO', 19);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (31, 10061, 2, '16 CAMARAS ITAEMBÉ GUAZÚ Y 3 EN BARRIOS DE PDAS, ESTUDIOS PRELIM - INGENIERIA', 20);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (32, 10061, 2, 'CÁMARAS DOMO, CONEXIONES DE 16 CÁMARAS EN ITAEMBÉ GUAZÚ', 21);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (33, 10061, 2, 'CÁMARAS DOMOS, ENLACES, CONEXIONES DE 3 CÁMARAS EN DISTINTOS BARRIOS DE POSADAS', 22);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (34, 10061, 2, 'TABLEROS Y GABINETES EN CÁMARAS', 23);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (35, 10061, 2, 'VISUALIZACIÓN, ALMACENAMIENTO Y GESTIÓN', 24);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (36, 10061, 2, 'VISUALIZACIÓN DE DESTACAMENTOS', 25);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (37, 10061, 2, 'INSTALACIÓN E INTEGRACIÓN', 26);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (38, 10061, 2, 'MANTENIMIENTO PREVENTIVO', 27);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (40, 10061, 2, 'TRABAJOS PRELIMINARES', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (41, 10061, 2, 'FIBRA OPTICA AEREA DE MARANDU HASTA DATA CENTER DE VIDEOVIGILANCIS', 28);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (1, 10062, 2, 'ALBINO DA ROSA NOEMI', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (2, 10062, 2, 'ALEXANDRETE DANIELA', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (3, 10062, 2, 'ALVES DORACILIA', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (4, 10062, 2, 'BARBOSA DA SILVA SILVIA', 4);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (5, 10062, 2, 'DO SANTOS ARTURO', 5);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (6, 10062, 2, 'ROA  MARIA', 6);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (7, 10062, 2, 'RODRIGUEZ RENE RICARDO', 7);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (8, 10062, 2, 'VIERA ANGELICA', 8);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (9, 10062, 2, 'VILLALBA  ALBERTO ANTONIO', 9);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (10, 10062, 2, 'ENGERS PAOLA NOEMI', 10);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (11, 10062, 2, 'ALVEZ MARGARITA', 11);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (12, 10062, 2, 'BURGIN MARCOS', 12);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (13, 10062, 2, 'CORREA GUILLERMO', 13);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (14, 10062, 2, 'ESCANDIEL MERCEDES', 14);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (15, 10062, 2, 'ESCHER ARTURO', 15);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (16, 10062, 2, 'FERREIRA VILMAR', 16);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (17, 10062, 2, 'FERREYRA JOSE MILTON', 17);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (18, 10062, 2, 'FREY TERESA', 18);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (19, 10062, 2, 'GOTIN DAERIO', 19);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (20, 10062, 2, 'KUMM EDUINO', 20);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (21, 10062, 2, 'OLIVERA ANTONIO', 21);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (1, 9963, 1, 'BALKE MARLEY', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (2, 9963, 1, 'ROLON JUAN CARLOS', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (3, 9963, 1, 'AREA CELIA NOEMI', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (4, 9963, 1, 'SILVA MARIO ANIBAL', 4);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (5, 9963, 1, 'ALVEZ SERGIO DAVID', 5);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (6, 9963, 1, 'BREZISCKI JOSE', 6);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (7, 9963, 1, 'SANCHEZ HORACIO JUAN', 7);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (8, 9963, 1, 'ATHAIDE MARCO ANTONIO', 8);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (1, 10042, 2, 'MOVIMIETNO DE SUELO: BIBLIOTECA ', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (2, 10042, 2, 'ESTRUCTURA DE HºAº : BIBLIOTECA', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (3, 10042, 2, 'ALBAÑILERIA: BIBLIOTECA', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (4, 10042, 2, 'PISOS Y ZOCALOS BIBLIOTECA', 4);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (5, 10042, 2, 'CUBIERTA BIBLIOTECA', 5);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (6, 10042, 2, 'CIELORRASO BIBLIOTECA', 6);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (7, 10042, 2, 'CARPINTERIA BIBLIOTECA', 7);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (8, 10042, 2, 'INSTALACION ELECTRICA', 8);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (9, 10042, 2, 'VIDRIOS', 9);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (10, 10042, 2, 'PINTURAS BIBLIOTECA', 10);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (11, 10042, 2, 'TRABAJOS PRELIMINARES - EDIFICIO EXIST', 11);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (12, 10042, 2, 'DEMOLICIONES- EDIFICIO EXIST', 12);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (13, 10042, 2, 'ALBAÑILERIA Y REVOQUES EDIFICIO EXIST', 13);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (14, 10042, 2, 'REVESTIMIENTOS EN EDIFICIO EXIST.', 14);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (15, 10042, 2, 'PISOS Y ZOCALOS EDIFICIO EXIST', 15);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (16, 10042, 2, 'CUBIERTA DE TECHO EDIFICIO EXIST', 16);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (17, 10042, 2, 'CIELORRASOS EDIFICIO EXIST', 17);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (18, 10042, 2, 'CARPINTERIAS EDIFICIO EXIST', 18);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (19, 10042, 2, 'PINTURA EDIFICIO EXIST.', 19);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (20, 10042, 2, 'INSTALACION ELECTRICA EDIFICIO EXIST.', 20);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (21, 10042, 2, 'INSTALACION CONTRA INCENDIO EDIFICIO EXIST', 21);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (22, 10042, 2, 'INSTALACION SANITARIA EDIFICIO EXIST', 22);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (23, 10042, 2, 'INSTALACION DE GAS', 23);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (24, 10042, 2, 'VARIOS', 24);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (10, 10048, 2, 'TRABAJOS PREPARATORIOS', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (12, 10048, 2, 'EXCAVACIONES', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (13, 10048, 2, 'PAVIMENTO PARA TRANSITO LIVIANO', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (14, 10048, 2, 'MOVILIZACION DE OBRA', 14);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (10, 10054, 2, 'TRABAJOS PREPARATORIOS', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (12, 10054, 2, 'MOVIMIENTO DE SUELOS', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (13, 10054, 2, 'PAVIMENTO TRANSITO LIVIANO', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (1, 10084, 2, 'TRABAJOS PRELIMINARES', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (2, 10084, 2, 'MAMPOSTERIA', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (3, 10084, 2, 'CAPA AISLADORA', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (4, 10084, 2, 'TECHOS', 4);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (5, 10084, 2, 'REVOQUES', 5);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (6, 10084, 2, 'CIELORRASO', 6);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (7, 10084, 2, 'CONTRAPISOS', 7);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (8, 10084, 2, 'PISOS', 8);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (9, 10084, 2, 'ZOCALOS', 9);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (10, 10084, 2, 'REVESTIMIENTO', 10);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (11, 10084, 2, 'CARPINTERIA', 11);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (12, 10084, 2, 'VIDRIOS', 12);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (13, 10084, 2, 'INSTALACION ELECTRICA', 13);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (14, 10084, 2, 'INSTALACION SANITARIA', 14);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (15, 10084, 2, 'DESAGUES PLUVIALES', 15);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (16, 10084, 2, 'INSTALACION DE SEGURIDAD C/INCENDIO', 16);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (17, 10084, 2, 'INSTALACION DE GAS', 17);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (18, 10084, 2, 'PINTURA', 18);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (19, 10084, 2, 'REPAR. E INST. NUEVAS EN SUBSUELO Y SALA MAQ', 19);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (20, 10084, 2, 'VARIOS', 20);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (1, 10087, 2, 'PRELIMINARES', 1);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (2, 10087, 2, 'MOVIMIENTO DE SUELO', 2);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (3, 10087, 2, 'ESTRUCTURA DE HºAº', 3);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (4, 10087, 2, 'ALBAÑILERIA', 4);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (5, 10087, 2, 'REVESTIMIENTOS', 5);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (6, 10087, 2, 'PISOS Y ZOCALOS', 6);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (7, 10087, 2, 'MARMOLERIA', 7);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (8, 10087, 2, 'CUBIERTA DE TECHO', 8);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (9, 10087, 2, 'CIELORRASO', 9);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (10, 10087, 2, 'CARPINTERIAS', 10);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (11, 10087, 2, 'INSTALACION ELECTRICA', 11);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (12, 10087, 2, 'INSTALACION SANITARIA', 12);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (13, 10087, 2, 'INSTALACION DE GAS', 13);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (14, 10087, 2, 'INSTALACION DE SEGURIDAD', 14);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (15, 10087, 2, 'CRISTALES, ESPEJOS Y VIDRIOS', 15);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (16, 10087, 2, 'PINTURAS', 16);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (17, 10087, 2, 'SEÑALETICA', 17);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (18, 10087, 2, 'INSTALACIONES ESPECIALES', 18);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (19, 10087, 2, 'VARIOS', 19);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (20, 10087, 2, 'TANQUE DE RESERVA', 20);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (21, 10087, 2, 'CUBIERTA DE TECHO SOBRE PLAYON DEPORTIVO', 21);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (22, 10062, 2, 'OLIVERA JOSE LUIS', 22);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (23, 10062, 2, 'PEREIRA ANDRES', 23);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (24, 10062, 2, 'PEREIRA ANTUNEZ ADRIAN', 24);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (25, 10062, 2, 'PEREIRA MIGUEL ANGEL', 25);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (26, 10062, 2, 'RADKE LUIS CARLOS', 26);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (27, 10062, 2, 'RODRIGUEZ DE ALMEIDA MABEL', 27);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (28, 10062, 2, 'VACCARI JOSE', 28);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (29, 10062, 2, 'VELASO LUCIO', 29);

insert into ITEM (IDITEM, IDOBRA, IDTIPOITEM, DENITEM, ORDEN)
values (30, 10062, 2, 'WISCOW ALFREDO', 30);
-------------------------------------------------------------------------------
insert into REDETERMINACION (IDREDETERMINACION, FECHAREDET, FECHADESDE, FECHAHASTA, NRORESOLUCION)
values (0, null, null, null, null);
-------------------------------------------------------------------------------
insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (1, 0, 66775.73, 9963);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO,  IDOBRA)
values (1, 0, 197532.61, 9990);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO,  IDOBRA)
values (1, 0, 43210.56, 9994);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO,  IDOBRA)
values (1, 0, 36853.56, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO,  IDOBRA)
values (1, 0, 12560.17, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO,  IDOBRA)
values (1, 0, 61754.07, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO,  IDOBRA)
values (1, 0, 1887323.20, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO,  IDOBRA)
values (1, 0, 93775.17, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO,  IDOBRA)
values (1, 0, 982847.95, 10096);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (1, 0, 878491.77, 10098);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (1, 0, 748720.56, 10099);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (1, 0, 806848.49, 10100);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (2, 0, 84791.13, 9963);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (2, 0, 968647.68, 9990);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (2, 0, 1548179.98, 9994);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (2, 0, 38613.15, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (2, 0, 62111.49, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (2, 0, 9859.62, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (2, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (2, 0, 106953.31, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (2, 0, 237546.88, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (2, 0, 118406.00, 10096);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (2, 0, 178849.88, 10098);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (2, 0, 196065.48, 10099);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (2, 0, 637535.49, 10100);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (3, 0, 132940.64, 9963);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (3, 0, 1436759.50, 9990);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (3, 0, 1282377.38, 9994);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (3, 0, 408746.87, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (3, 0, 96073.89, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (3, 0, 17482.93, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (3, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (3, 0, 12139.31, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (3, 0, 654620.60, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (3, 0, 164523.39, 10096);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (3, 0, 11783.57, 10098);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (3, 0, 23373.50, 10099);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (3, 0, 1138827.81, 10100);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (4, 0, 63576.83, 9963);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (4, 0, 850113.72, 9990);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (4, 0, 212558.21, 9994);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (4, 0, 572440.01, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (4, 0, 50150.04, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (4, 0, 114991.01, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (4, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (4, 0, 839903.65, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (4, 0, 748497.69, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (4, 0, 123228.67, 10096);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (4, 0, 277516.96, 10098);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (4, 0, 205953.81, 10099);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (4, 0, 1209778.15, 10100);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (5, 0, 28889.72, 9963);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (5, 0, 181000.00, 9990);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (5, 0, 328363.86, 9994);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (5, 0, 17625.89, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (5, 0, 69183.02, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (5, 0, 1671.71, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (5, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (5, 0, 480338.58, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (5, 0, 10624.50, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (5, 0, 136349.96, 10096);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (5, 0, 136300.12, 10098);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (5, 0, 135062.53, 10099);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (6, 0, 3529.61, 9963);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (6, 0, 115201.81, 9994);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (6, 0, 769067.63, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (6, 0, 20256.96, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (6, 0, 686.70, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (6, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (6, 0, 375618.86, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (6, 0, 352571.31, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (6, 0, 402990.83, 10096);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (6, 0, 555536.28, 10098);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (6, 0, 487882.50, 10099);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (7, 0, 9804.23, 9963);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (7, 0, 157744.50, 9994);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (7, 0, 124321.76, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (7, 0, 31988.43, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (7, 0, 10644.78, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (7, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (7, 0, 174155.40, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (7, 0, 16202.49, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (7, 0, 43746.81, 10096);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (7, 0, 66149.35, 10098);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (7, 0, 1196574.23, 10099);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (8, 0, 1372.65, 9963);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (8, 0, 171551.59, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (8, 0, 31154.29, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (8, 0, 28702.25, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (8, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (8, 0, 826326.38, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (8, 0, 727690.56, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (9, 0, 99242.35, 9994);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (9, 0, 241599.65, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (9, 0, 7747.87, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (9, 0, 6131.31, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (9, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (9, 0, 70167.74, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (9, 0, 139744.00, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (10, 0, 199400.00, 9994);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (10, 0, 208939.58, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (10, 0, 18719.29, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (10, 0, 268450.27, 10048);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (10, 0, 1193254.80, 10054);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (10, 0, 14811.72, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (10, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (10, 0, 364086.41, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (10, 0, 1113575.19, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (11, 0, 41777.27, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (11, 0, 154547.09, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (11, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (11, 0, 2525769.23, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (11, 0, 297929.90, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (12, 0, 410173.50, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (12, 0, 260882.53, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (12, 0, 12295341.00, 10048);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (12, 0, 9610218.50, 10054);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (12, 0, 57920.36, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (12, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (12, 0, 181353.56, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (12, 0, 424243.75, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (13, 0, 530851.17, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (13, 0, 9772927.00, 10048);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (13, 0, 7632284.80, 10054);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (13, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (13, 0, 2080447.25, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (13, 0, 16270.35, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (14, 0, 108338.49, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (14, 0, 1100000.00, 10048);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (14, 0, 54345.39, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (14, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (14, 0, 438365.54, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (14, 0, 22748.90, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (15, 0, 5732.95, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (15, 0, 1383384.52, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (15, 0, 37391.16, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (15, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (15, 0, 52219.42, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (15, 0, 87221.24, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (16, 0, 19053.05, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (16, 0, 216671.96, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (16, 0, 46422.43, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (16, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (16, 0, 28690.79, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (16, 0, 749088.44, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (17, 0, 131851.26, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (17, 0, 268120.37, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (17, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (17, 0, 25207.61, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (17, 0, 23041.39, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (18, 0, 1470124.36, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (18, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (18, 0, 1072903.92, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (18, 0, 2908.63, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (19, 0, 14620.23, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (19, 0, 1241245.49, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (19, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (19, 0, 100808.95, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (19, 0, 160866.82, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (20, 0, 216950.59, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (20, 0, 1033105.82, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (20, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (20, 0, 864403.80, 10084);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (20, 0, 72437.52, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (21, 0, 275593.86, 10006);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (21, 0, 290491.96, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (21, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (21, 0, 392974.20, 10087);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (22, 0, 506799.71, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (22, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (23, 0, 20047.21, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (23, 0, 436271.97, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (23, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (24, 0, 345468.53, 10042);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (24, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (25, 0, 24747.86, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (25, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (26, 0, 8922.87, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (26, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (27, 0, 41809.00, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (27, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (28, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (29, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (30, 0, 442260.82, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (30, 0, 61754.06, 10062);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (31, 0, 183256.97, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (32, 0, 1606229.44, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (33, 0, 398132.91, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (34, 0, 637903.90, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (35, 0, 533231.71, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (36, 0, 176569.56, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (37, 0, 891559.62, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (38, 0, 373204.86, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (40, 0, 59985.41, 10061);

insert into ITEMCOSTO (IDITEM, IDREDETERMINACION, COSTO, IDOBRA)
values (41, 0, 423888.14, 10061);

SELECT * FROM ITEMCOSTO
WHERE IDITEM = 41
