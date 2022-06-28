CREATE OR REPLACE FUNCTION Obtener_Obras_Con_Fojas_Abiertas()
RETURNS TABLE(

 IDOBRA               numeric(5),
   IDLOCALIDAD          numeric(3),
   IDTIPCONTRAT         numeric(2),
   IDEMPRESA            numeric(4),
   NOMOBRA              VARCHAR(250),
   FECINICIO            DATE,
   PLAZO_MES            numeric(3),
   NUMOBRA              numeric(5),
   PORFLETE             numeric(5,2),
   PORGASTOS            numeric(5,2),
   PORUTI               numeric(5,2),
   IVAVIV               numeric(5,2),
   IVAINFRA             numeric(5,2)
)

AS $$
BEGIN
RETURN QUERY
SELECT  * FROM OBRA o
WHERE o.idobra IN (select distinct fd.idobra from fojaDet fd
where fd.avaactual is null);
END;
$$ LANGUAGE plpgsql;

SELECT * FROM obtener_obras_con_fojas_abiertas()

-----------------------------------------------------------