CREATE OR REPLACE FUNCTION obtenerestadoabiertocertpago(id_foja numeric, id__obra numeric)
    RETURNS numeric AS $$
	
DECLARE
 estadoCertPago numeric(1);

BEGIN
	--max alternativa
	select cP.abierto into estadoCertPago from certiobra as cO 
    inner join certipago as cP on cP.nrocertificado = cO.nrocertificado
    where cO.idfoja = id_foja and cO.idobra = id__obra;
	
	return estadoCertPago;
	
END; 
$$ LANGUAGE plpgsql