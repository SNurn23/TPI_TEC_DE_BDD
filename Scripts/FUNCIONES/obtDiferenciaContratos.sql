--                      DIFERENCIA

CREATE OR REPLACE FUNCTION obtDiferenciaContratos (VidObra NUMERIC(5))
	RETURNS NUMERIC(15,2) AS $$
DECLARE
	ret NUMERIC(15,2);
BEGIN
	-----------------------------------------------------
	ret := obtContratoRedeterminado(VidObra) - obtContratoBasico(VidObra);
	-----------------------------------------------------
RETURN ret;
END;
$$ LANGUAGE plpgsql
