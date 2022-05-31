CREATE OR REPLACE FUNCTION generar_foja(id_obra numeric(5))
RETURNS numeric(1)  AS $$

declare

  idUltimaFoja numeric (5);
  itemsObra cursor for select * from item where item.idobra = id_obra;
  estadoAbiertoCPago numeric(1);

  detUltimaFoja cursor for select * from fojadet where fojadet.idfoja = idUltimaFoja;

  resultOperation numeric(1);

BEGIN
 --        Verificamos existencia de obra
 if not EXISTS(select idobra from obra where idobra = id_obra) then
    resultOperation := 1;
    raise Notice 'id obra "%" inexistente verifique e intentelo nuevamente',id_obra;
 else
 
     select max(idfoja) into idUltimaFoja from foja where idobra = id_obra;
     if (idUltimaFoja isnull) then  --Si no hay foja anterior existente =>

           insert into foja values (1,id_obra,(select current_date));
           for registro in itemsObra loop
               insert into fojadet values(1, registro.iditem, id_obra, 0.00, null);
           end loop;

           resultOperation := 0;

     else  --Si hay foja anterior existente =>
           if obtenerEstadoAbiertoCertPago(idUltimaFoja,id_obra) = 1 then 
                insert into foja values (idUltimaFoja + 1, id_obra, (select current_date));

                for registro in detUltimaFoja loop
                    insert into fojadet values (idUltimaFoja + 1, registro.iditem, id_obra, registro.avaacuanterior + registro.avaactual, null);
                end loop;
                 resultOperation := 0;
           else
                resultOperation := 1;
                raise Notice 'Certificado de pago abierto o no existente verifique e intentelo nuevamente';

           end if;
     end if;
 end if;
 
 return resultOperation;

END ; $$ LANGUAGE plpgsql