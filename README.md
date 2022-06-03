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

obtavanceacumuladoitem

obtcontratobasico

obtcontratoredeterminado

**obtenercostocalculado**

- Duevuelve el costo de un item particular perteneciente a una obra en especifico contemplando los Costos PorFlete,PorGastos,PorUti. Y por Ultimo aplica el IVA correspondiente segun el IDTIPOITEM corresponda.
Para su funcionamiento recibe como parametro el IDItem y El IDOBRA.

obtener_idobra

obtenerestadoabiertocertpago

obtincidenciaitem

obtultimafoja

obtavanceobra
