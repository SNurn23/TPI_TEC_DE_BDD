--------------------------------------------------------FUNCION PARA CARGAR FOJA------------------------------------------------
CREATE OR REPLACE FUNCTION cargar_foja(id_obra numeric(5), id_foja numeric(5), id_item numeric(8), avance_item numeric(18,2)) RETURNS numeric(1)
AS $$
declare

BEGIN			

  --select max(idfoja) into id_foja from foja where foja.idobra = id_obra;
  if (obtenerEstadoAbiertoCertPago(id_foja,id_obra)) is null or obtenerEstadoAbiertoCertPago(id_foja,id_obra) = 0 then 
 		  update fojadet set avaactual = avance_item where iditem = id_item and idfoja = id_foja and  idobra = id_obra;
		  return 0; --actualizado correctamente 
   else
          return 1; --No se permitio actualizar avaactual
  end if;
 
END; $$ LANGUAGE plpgsql