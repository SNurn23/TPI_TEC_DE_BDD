------------------TRIGGER DE SECUENCIA DE ID FOJA-----
CREATE OR REPLACE FUNCTION Fn_idFoja() RETURNS TRIGGER AS $$

BEGIN

SELECT nextval('sec_id_foja') INTO NEW.idfoja;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER Tr_insert_foja BEFORE INSERT ON foja
FOR EACH ROW
EXECUTE PROCEDURE Fn_idFoja();

----------------TRIGGER DE SECUENCIA DE ID_CERT_PAGO-----------
CREATE OR REPLACE FUNCTION Fn_NroCertPago() RETURNS TRIGGER AS $$

BEGIN

SELECT nextval('sec_nro_cert_pago') INTO NEW.nrocertificado;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER Tr_insert_certiPago before insert on certipago
FOR EACH ROW
EXECUTE PROCEDURE Fn_NroCertPago();

----------------TRIGGER DE SECUENCIA DE ID_CERT_PAGO-----------
CREATE OR REPLACE FUNCTION Fn_NroCertObra() RETURNS TRIGGER AS $$

BEGIN

SELECT nextval('sec_id_cert_obra') INTO NEW.nrocerobra;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE  TRIGGER Tr_insert_certiObra BEFORE INSERT ON certiobra
FOR EACH ROW
EXECUTE PROCEDURE Fn_NroCertObra();
