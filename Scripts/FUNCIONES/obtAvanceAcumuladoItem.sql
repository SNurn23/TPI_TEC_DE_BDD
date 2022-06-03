CREATE OR REPLACE FUNCTION obtAvanceAcumuladoItem (VidItem NUMERIC(8), VidObra NUMERIC(5))
	RETURNS NUMERIC(6,2) AS $$
DECLARE
	ret NUMERIC(6,2);
BEGIN
	-----------------------------------------------------
	Select (fd.avaacuanterior+fd.avaactual) into ret from fojadet fd where (fd.idfoja = obtUltimaFoja(VidObra)) and (fd.iditem = VidItem) and (fd.idobra = VidObra);
	-----------------------------------------------------
RETURN ret;
END;
$$ LANGUAGE plpgsql