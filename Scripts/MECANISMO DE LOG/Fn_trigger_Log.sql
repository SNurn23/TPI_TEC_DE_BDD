------------------------FUNCION DEL TRIGGER DEL LOG----------------------------
CREATE OR REPLACE FUNCTION Fn_LOG_TABLA() RETURNS TRIGGER AS $$

DECLARE
usuario varchar(50) := User;
fecha date:= current_Date;
tiempo Time := current_Time;
id_log int;

BEGIN
	 SELECT nextval('sec_id_log') INTO id_log;

	IF	(TG_OP = 'DELETE') 	THEN
		INSERT INTO LOG_TABLA VALUES(id_log, TG_RELNAME, 'DELETE', NULL, OLD, fecha, tiempo, usuario);
		RETURN OLD;
	ELSEIF	(TG_OP = 'UPDATE')	THEN
		INSERT INTO LOG_TABLA VALUES(id_log, TG_RELNAME, 'UPDATE', NEW, OLD, fecha, tiempo, usuario);
		RETURN NEW;
	ELSEIF	(TG_OP = 'INSERT')	THEN
		INSERT INTO LOG_TABLA VALUES(id_log, TG_RELNAME, 'INSERT', NEW, NULL, fecha, tiempo, usuario);
		RETURN NEW;
	END IF;
	
RETURN NULL;
END;
$$ LANGUAGE plpgsql;