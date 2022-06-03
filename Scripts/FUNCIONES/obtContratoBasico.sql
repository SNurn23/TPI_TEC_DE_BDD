--                      CONTRATO BÁSICO

CREATE OR REPLACE FUNCTION obtContratoBasico (VidObra NUMERIC(5))
	RETURNS NUMERIC(30,2) AS $$
DECLARE
	CCalculado NUMERIC(30,2);
BEGIN
	-----------------------------------------------------
	Select (
	COALESCE(costoviv,0)
	+
	   COALESCE((Select sum((((ic.costo*(1+o.porflete))*(1+o.porgastos))*(1+o.poruti))*(1+o.ivainfra)) as costoinfra from obra o
        inner join item i on i.idobra = o.idobra
        inner join itemcosto ic on (ic.iditem = i.iditem) and (ic.idobra = i.idobra)
        where (ic.idredeterminacion = 0) and (i.idtipoitem = 2) and (o.idobra = VidObra))
	   ,0)) as contrato_basico into CCalculado from 
    (Select sum((((ic.costo*(1+(o.porflete/100)))*(1+(o.porgastos/100)))*(1+(o.poruti/100)))*(1+(o.ivaviv/100))) as costoviv from obra o
        inner join item i on i.idobra = o.idobra
        inner join itemcosto ic on (ic.iditem = i.iditem) and (ic.idobra = i.idobra)
        where (ic.idredeterminacion = 0) and (i.idtipoitem = 1) and (o.idobra = VidObra)) as tablaviv;
	-----------------------------------------------------
RETURN CCalculado;
END;
$$ LANGUAGE plpgsql