create or replace function obtener_IdObra(nro_obra numeric(3))
	RETURNS numeric(5) AS $$
	
DECLARE
vIdObra numeric(5);

BEGIN

SELECT idObra INTO vIdObra FROM Obra O
WHERE O.numObra = nro_obra;

RETURN vIdObra;
END;
$$ LANGUAGE plpgsql;