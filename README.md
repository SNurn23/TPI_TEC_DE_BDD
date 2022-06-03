# TPI FINAL - Tecnología de Base de Datos 2022
## GRUPO DE TRABAJO
- Czajkowski Mirko / MAT 67104
- Kaechele Axel / MAT 67112
- Knüppelholz Adrián Carlos Gastón / MAT.67100
- Nürnberg Sofia / MAT 67111

## CONCIDERACIONES Y RANOZAMIENTO DEDUCTIVO

## Cambios y Modificaciones en el Modelo

En CONCEPTOSXCERTIF:

  - Se remplazo el Campo IMPORTE quedando en su lugar:
    - IMPORXIVA NUMERIC(15,2)
    - IMPORXINFRA(15,2)

En CONCEPTOSXOBRA:

  - Se agrego el Campo PORCENTAJE NUMERIC(2)

### Creacion PIE_CERT_PAGO

  - Este queda definido bajo la siguiente estructura:
    - IDCONCEPTO NUMERIC(3) <PK,FK>
    - IDOBRA NUMERIC(5) <PK,FK>
    - NROCERTIFICADO NUMERIC(3) <PK,FK>
    - ACUMULADO NUMERIC(15,2)


## Consultas Especificas

## Funciones

cargar_foja

generar_foja

**obtavanceacumuladoitem**

- En base a un ID de ítem y un ID obra, la función te devuelve el avance acumulado actual del item ingresado sobre la obra ingresada

**obtcontratobasico**

- En base a un ID de obra, la función retorna el valor del contrato básico de la obra ingresada

**obtcontratoredeterminado**

- En base a un ID de obra, la función retorna el valor del contrato redeterminado hasta la fecha de la obra ingresada

**obtenercostocalculado**

- Duevuelve el costo de un item particular perteneciente a una obra en especifico contemplando los Costos PorFlete,PorGastos,PorUti. Y por Ultimo aplica el IVA correspondiente segun el IDTIPOITEM corresponda.
Para su funcionamiento recibe como parametro el IDItem y El IDOBRA.

obtener_idobra

obtenerestadoabiertocertpago

**obtincidenciaitem**

- En base a un ID de ítem y un ID obra, la función te devuelve la incidencia que tiene el costo total del item ingresado sobre el costo total de la obra ingresada.

**obtultimafoja**

- En base a un ID de obra, la función retorna el ID de la última foja con certificado pago cerrado de la obra ingresada

**obtavanceobra**

- En base a un ID de obra, la función retorna el avance en porcentaje de la obra ingresada hasta el momento

**obtDiferenciaContratos**

- En base a un ID de obra, la función retorna la diferencia que existe entre el contrato básico y el contrato redeterminado de la obra ingresada

cargar_foja(id_obra numeric(5), id_foja numeric(5), id_item numeric(8), avance_item numeric(18,2)) :

Si la foja no tiene certifiacdo de pago o de obra y o certipago.abierto = 0 => se actualiza el campo avance del detalle de foja correspondiente con el item-obra-foja de ser cumplir la concidencia de claves de lo contrario no hace nada.

Si retorna 0 correcta actualizacion o registro de avance de lo contrario no se a realizado.

