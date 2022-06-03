-------------------------------------------------------TABLAS TEMPORALES------------------------------------------------------
-- Tabla que simula lista de obras seleccionadas para que se generen sus fojas correspondientes
create table obrasSeleccionadas_para_GenerarFoja(
	
	id___obra numeric(5)
	
)

-- Tabla con avances de los fojadet para simular la carga de los avances del mes (lo otorgado por el inspector)

CREATE TABLE avancesobracargar
(
    idfoja numeric(5,0),
    iditem numeric(8,0),
    idobra numeric(5,0),
    avaactual numeric(18,2)
)