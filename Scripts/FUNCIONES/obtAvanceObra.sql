CREATE OR REPLACE FUNCTION obtAvanceObra (VidObra NUMERIC(5))
	RETURNS NUMERIC(6,2) AS $$
DECLARE
	ret NUMERIC(6,2);
BEGIN
	-----------------------------------------------------
	Select sum((obtAvanceAcumuladoItem(io.it,VidObra))/100*(obtIncidenciaItem(io.it,VidObra))) into ret 
		from (Select i.iditem as it from item i where (i.idobra = VidObra)) as io;
	-----------------------------------------------------
RETURN ret;
END;
$$ LANGUAGE plpgsql
