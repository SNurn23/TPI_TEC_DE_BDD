CREATE OR REPLACE FUNCTION obtUltimaFoja (VidObra NUMERIC(5))
	RETURNS NUMERIC(5) AS $$
DECLARE
	ret NUMERIC(5);
BEGIN
	-----------------------------------------------------
	Select max(f.idfoja) into ret from foja f where (f.idobra = VidObra) and (obtenerestadoabiertocertpago(f.idfoja,f.idobra) = 0);
	-----------------------------------------------------
RETURN ret;
END;
$$ LANGUAGE plpgsql