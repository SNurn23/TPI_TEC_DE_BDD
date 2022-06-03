-- simulacion de aplicacion que llama al precedimiento cargar foja para registrar todo los avances del mes a la foja correspondiente:

CREATE OR REPLACE PROCEDURE SIMULADOR_APP_CARGA_AVANCES() 
AS $$
DECLARE

  lista_avnaces_ingresados cursor for select * from avancesobracargar;

BEGIN

	for avance_item in lista_avnaces_ingresados loop
	   --     eqiv a print.console()           llamada funcion 
	   raise Notice 'result registro : %  avance: %',cargar_foja(avance_item.idobra, avance_item.idfoja,avance_item.iditem,avance_item.avaactual),avance_item.avaactual;
	end loop;

END; $$ LANGUAGE plpgsql