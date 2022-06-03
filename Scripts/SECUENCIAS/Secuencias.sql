--------SECUENCIA DE FOJA-----------
create sequence SEC_ID_FOJA
start with 1
increment by 1
maxvalue 99999
minvalue 0

----------SECUENCIA DE LOG_TABLA---------
create sequence SEC_ID_LOG
start with 1
increment by 1
maxvalue 99999
minvalue 0
-----------------------
----------SECUENCIA DE CERT_PAGO-----------
create sequence SEC_NRO_CERT_PAGO
start with 1
increment by 1
maxvalue 999
minvalue 0
-------------------------------------------
----------SECUENCIA DE CERT_OBRA-----------
create sequence SEC_NRO_CERT_OBRA
start with 1
increment by 1
maxvalue 999
minvalue 0
-------------------------------------------
-----------------------------------------ESTAS SECUENCIAS EMPIEZAN DESDE EL UTLIMO ID INGRESADO----------------------------------------------------------------------
----------SECUENCIA DE ID_OBRA-----------
create sequence SEC_ID_OBRA
start 10101  
increment by 1
maxvalue 99999
minvalue 0
---------------
----------SECUENCIA DE ID_EMPRESA-----------
create sequence SEC_ID_EMPRESA
start 26  
increment by 1
maxvalue 9999
minvalue 0
---------------
----------SECUENCIA DE ID_LOCALIDAD-----------
create sequence SEC_ID_LOCALIDAD
start 97  
increment by 1
maxvalue 999
minvalue 0
---------------
----------SECUENCIA DE ID_TIPOCONTRATACION-----------
create sequence SEC_ID_TIPOCONTRATACION
start 4 
increment by 1
maxvalue 99
minvalue 0
---------------
----------SECUENCIA DE ID_TIPOCONTRATACION-----------
create sequence SEC_ID_TIPOCONTRATACION
start 3 
increment by 1
maxvalue 99
minvalue 0
---------------
----------SECUENCIA DE ID_TIPOCONTRATACION-----------
create sequence SEC_ID_REDETERMINACION
start 4 
increment by 1
maxvalue 99
minvalue 0
---------------
----------SECUENCIA DE ID_CONCEPTO-----------
create sequence SEC_ID_CONCEPTO
start 4 
increment by 1
maxvalue 999
minvalue 0
---------------


-----CONSULTAR ULTIMOS ID-----------
SELECT MAX(IDOBRA) FROM OBRA 
SELECT MAX(IDEMPRESA) FROM EMPRESA
SELECT MAX(IDLOCALIDAD) FROM LOCALIDAD
SELECT MAX(IDTIPCONTRAT) FROM TIPOCONTRATACION
SELECT MAX(IDITEM) FROM ITEM
SELECT MAX(IDTIPOITEM) FROM TIPOITEM
SELECT MAX(IDREDETERMINACION) FROM REDETERMINACION
SELECT MAX(IDCONCEPTO) FROM CONCEPTO

