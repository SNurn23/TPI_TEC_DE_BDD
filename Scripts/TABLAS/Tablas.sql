
/*==============================================================*/
/* Table: CERTIOBRA                                             */
/*==============================================================*/
create table CERTIOBRA 
(
   IDOBRA               numeric(5)            not null,
   NROCERTIFICADO       numeric(3)            not null,
   NROCEROBRA           numeric(3)            not null,
   IDFOJA               numeric(5),
   constraint PK_CERTIOBRA primary key (IDOBRA, NROCERTIFICADO, NROCEROBRA)
);

/*==============================================================*/
/* Table: CERTIPAGO                                             */
/*==============================================================*/
create table CERTIPAGO 
(
   IDOBRA               numeric(5)            not null,
   NROCERTIFICADO       numeric(3)            not null,
   FECHACERT            DATE,
   ABIERTO              numeric(1),
   constraint PK_CERTIPAGO primary key (IDOBRA, NROCERTIFICADO)
);

/*==============================================================*/
/* Table: CONCEPTO                                              */
/*==============================================================*/
create table CONCEPTO 
(
   IDCONCEPTO           numeric(3)            not null,
   DENCONCEPTO          VARCHAR(70),
   constraint PK_CONCEPTO primary key (IDCONCEPTO)
);

/*==============================================================*/
/* Table: CONCEPTOSXCERTIF                                      */
/*==============================================================*/
create table CONCEPTOSXCERTIF 
(
   IDOBRA               numeric(5)            not null,
   NROCERTIFICADO       numeric(3)            not null,
   IDCONCEPTO           numeric(3)            not null,
   IMPORXVIV            numeric(15,2),
   IMPORXINFRA          numeric(15,2),
   constraint PK_CONCEPTOSXCERTIF primary key (IDOBRA, NROCERTIFICADO, IDCONCEPTO)
);

/*==============================================================*/
/* Table: PIE_CERT_PAGO                                         */
/*==============================================================*/
create table PIE_CERT_PAGO(
	IDCONCEPTO           numeric(3)            not null,
	NROCERTIFICADO       numeric(3)            not null,
	IDOBRA               numeric(5)            not null,
	ACUMULADO			 numeric(15,2),
	constraint PK_PIE_CERT_PAGO primary key (IDOBRA, NROCERTIFICADO, IDCONCEPTO)
);

/*==============================================================*/
/* Table: CONCEPTOSXOBRA                                        */
/*==============================================================*/
create table CONCEPTOSXOBRA 
(
   IDOBRA               numeric(5)            not null,
   IDCONCEPTO           numeric(3)            not null,
   ORDENIMP             numeric(2),
   CALCFONDOREPARO      numeric(1),
   PORCENTAJE           numeric(2),
   constraint PK_CONCEPTOSXOBRA primary key (IDOBRA, IDCONCEPTO)
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA 
(
   IDEMPRESA            numeric(4)            not null,
   RAZONSOCIAL          VARCHAR(70),
   CUIT                 numeric(12),
   constraint PK_EMPRESA primary key (IDEMPRESA)
);

/*==============================================================*/
/* Table: FOJA                                                  */
/*==============================================================*/
create table FOJA 
(
   IDFOJA               numeric(5)            not null,
   IDOBRA               numeric(5),
   FECHA                DATE,
   constraint PK_FOJA primary key (IDFOJA)
);

/*==============================================================*/
/* Table: FOJADET                                               */
/*==============================================================*/
create table FOJADET 
(
   IDFOJA               numeric(5)            not null,
   IDITEM               numeric(8)            not null,
   IDOBRA               numeric(5)            not null,
   AVAACUANTERIOR       numeric(18,2),
   AVAACTUAL            numeric(18,2),
   constraint PK_FOJADET primary key (IDFOJA, IDITEM, IDOBRA)
);

/*==============================================================*/
/* Table: ITEM                                                  */
/*==============================================================*/
create table ITEM 
(
   IDITEM               numeric(8)            not null,
   IDOBRA               numeric(5)            not null,
   IDTIPOITEM           numeric(2),
   DENITEM              VARCHAR(120),
   ORDEN                numeric(2),
   constraint PK_ITEM primary key (IDITEM, IDOBRA)
);

/*==============================================================*/
/* Table: ITEMCOSTO                                             */
/*==============================================================*/
create table ITEMCOSTO 
(
   IDITEM               numeric(8)            not null,
   IDOBRA               numeric(5)            not null,
   IDREDETERMINACION    numeric(2)            not null,
   COSTO                numeric(18,2),
   constraint PK_ITEMCOSTO primary key (IDITEM, IDOBRA, IDREDETERMINACION)
);

/*==============================================================*/
/* Table: LOCALIDAD                                             */
/*==============================================================*/
create table LOCALIDAD 
(
   IDLOCALIDAD          numeric(3)            not null,
   NOMLOC               VARCHAR(40),
   CP                   VARCHAR(10),
   constraint PK_LOCALIDAD primary key (IDLOCALIDAD)
);

/*==============================================================*/
/* Table: OBRA                                                  */
/*==============================================================*/
create table OBRA 
(
   IDOBRA               numeric(5)            not null,
   IDLOCALIDAD          numeric(3),
   IDTIPCONTRAT         numeric(2),
   IDEMPRESA            numeric(4),
   NOMOBRA              VARCHAR(250),
   FECINICIO            DATE,
   PLAZO_MES            numeric(3),
   NUMOBRA              numeric(5),
   PORFLETE             numeric(5,2),
   PORGASTOS            numeric(5,2),
   PORUTI               numeric(5,2),
   IVAVIV               numeric(5,2),
   IVAINFRA             numeric(5,2),
   constraint PK_OBRA primary key (IDOBRA)
);

/*==============================================================*/
/* Table: REDETERMINACION                                       */
/*==============================================================*/
create table REDETERMINACION 
(
   IDREDETERMINACION    numeric(2)            not null,
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
   IDTIPCONTRAT         numeric(2)            not null,
   DENTIPCONTRAT        VARCHAR(30),
   constraint PK_TIPOCONTRATACION primary key (IDTIPCONTRAT)
);


/*==============================================================*/
/* Table: TIPOITEM                                              */
/*==============================================================*/
create table TIPOITEM 
(
   IDTIPOITEM           numeric(2)            not null,
   DENTIPO              VARCHAR(60),
   constraint PK_TIPOITEM primary key (IDTIPOITEM)
);
