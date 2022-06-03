
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
-------------
alter table PIE_CERT_PAGO
   add constraint FK_REFERENCE_CERTIPAG foreign key (IDOBRA, NROCERTIFICADO)
      references CERTIPAGO (IDOBRA, NROCERTIFICADO);

alter table PIE_CERT_PAGO
   add constraint FK_CONCEPTO_REF_CONXCERTIF foreign key (IDCONCEPTO)
      references CONCEPTO (IDCONCEPTO);
-------------
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