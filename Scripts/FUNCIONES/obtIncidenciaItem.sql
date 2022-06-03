CREATE OR REPLACE FUNCTION obtIncidenciaItem (VidItem NUMERIC(8), VidObra NUMERIC(5))
	RETURNS NUMERIC(30,2) AS $$
DECLARE
	CCalculado NUMERIC(30,2);
BEGIN
	-----------------------------------------------------
	CCalculado := (obtCostoCalculado (VidItem, VidObra)) *100/ (obtContratoBasico (VidObra));
	-----------------------------------------------------
RETURN CCalculado;
END;
$$ LANGUAGE plpgsql