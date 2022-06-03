-----------------------------TRIGGERS-------------------------------

---------------FOJA-------------
CREATE OR REPLACE TRIGGER Tr_foja_log AFTER INSERT OR UPDATE OR DELETE ON foja
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------EMPRESA--------
CREATE OR REPLACE TRIGGER Tr_empresa_log AFTER INSERT OR UPDATE OR DELETE ON empresa
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------CONCEPTO--------
CREATE OR REPLACE TRIGGER Tr_concepto_log AFTER INSERT OR UPDATE OR DELETE ON concepto
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------CONCEPTOS X OBRA--------
CREATE OR REPLACE TRIGGER Tr_conceptosxobra_log AFTER INSERT OR UPDATE OR DELETE ON conceptosxobra
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------ITEM--------
CREATE OR REPLACE TRIGGER Tr_item_log AFTER INSERT OR UPDATE OR DELETE ON item
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------ITEM COSTO--------
CREATE OR REPLACE TRIGGER Tr_itemcosto_log AFTER INSERT OR UPDATE OR DELETE ON itemcosto
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------TIPO ITEM--------
CREATE OR REPLACE TRIGGER Tr_tipoitem_log AFTER INSERT OR UPDATE OR DELETE ON tipoitem
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------TIPO CONTRATACION--------
CREATE OR REPLACE TRIGGER Tr_tipocontratacion_log AFTER INSERT OR UPDATE OR DELETE ON tipocontratacion
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------REDETERMINACION--------
CREATE OR REPLACE TRIGGER Tr_redeterminacion_log AFTER INSERT OR UPDATE OR DELETE ON redeterminacion
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------PIE_CERT_PAGO--------
CREATE OR REPLACE TRIGGER Tr_pie_certPago_log AFTER INSERT OR UPDATE OR DELETE ON pie_cert_pago
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------OBRA--------
CREATE OR REPLACE TRIGGER Tr_obra_log AFTER INSERT OR UPDATE OR DELETE ON obra
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------LOCALIDAD--------
CREATE OR REPLACE TRIGGER Tr_localidad_log AFTER INSERT OR UPDATE OR DELETE ON localidad
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------FOJA  DET--------
CREATE OR REPLACE TRIGGER Tr_fojaDet_log AFTER INSERT OR UPDATE OR DELETE ON fojadet
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------CONCEPTOS X CERTIF--------
CREATE OR REPLACE TRIGGER Tr_conceptosxcertif_log AFTER INSERT OR UPDATE OR DELETE ON conceptosxcertif
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------CERTIOBRA--------
CREATE OR REPLACE TRIGGER Tr_certiobra_log AFTER INSERT OR UPDATE OR DELETE ON certiobra
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------
---------------CERTIPAGO--------
CREATE OR REPLACE TRIGGER Tr_certipago_log AFTER INSERT OR UPDATE OR DELETE ON certipago
FOR EACH ROW
EXECUTE PROCEDURE Fn_LOG_TABLA();
-------------------------------------------