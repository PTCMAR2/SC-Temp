  CREATE OR REPLACE VIEW VWOM_ORGROLETYPESV1 
  AS 
  SELECT OrdRolTyp.CODE AS code
           , OrdRolTyp.NAME AS name
           , OrdRolTyp.RESTRICT_FLAG AS restricted
      FROM TBOR_ORG_ROLE_TYPES OrdRolTyp
;
/