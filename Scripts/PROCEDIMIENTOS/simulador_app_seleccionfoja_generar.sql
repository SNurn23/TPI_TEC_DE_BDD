---------------------------------------------SIMULACION GENERAR FOJAS-----------------------------------------------
create or replace procedure simulador_app_seleccionfoja_generar() as $$
declare
  lista_selec_obras_generar_foja cursor for select * from obrasSeleccionadas_para_GenerarFoja;
begin

	for obra in lista_selec_obras_generar_foja loop
	   --     eqiv a print.console()                                                     llamada funcion  
	   raise Notice 'Resultado de generacion foja en id obra %  : %',obra.id___obra ,generar_foja(obra.id___obra);
	end loop;


end; $$ language plpgsql