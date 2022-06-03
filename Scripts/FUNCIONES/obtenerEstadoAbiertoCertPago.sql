---------------------------------- Obtener atributo abierto de certipago ------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION obtenerEstadoAbiertoCertPago(id_foja numeric(5),id__obra numeric(5)) RETURNS numeric(1)
AS $$
DECLARE
 
 estadoCertPago numeric(1);

BEGIN
	
	select cP.abierto into estadoCertPago from certiobra as cO 
    inner join certipago as cP on cP.nrocertificado = cO.nrocertificado
    where cO.idfoja = id_foja and cO.idobra = id__obra;
	
	return estadoCertPago;
	
END;
$$ LANGUAGE plpgsql 
-- retorna null si no tiene certificado pago, obra o no existe la foja
-- retorna 0 si tiene asociado la foja un certificado obra y certi pago pero esta cerrado (no modificable)
-- retona 1 lo contrario => es modificable 