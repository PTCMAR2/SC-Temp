  CREATE OR REPLACE VIEW VWRD_JURIDICALREASONSV1 
  as
  SELECT JurRson.ID AS juridical_reason_id
           , JurRson.ABREV AS reason_abbrev
           , JurRson.DES AS desc
           , JurRson.VALID_FLAG AS validity_flag
      FROM TBBU_JURIDICAL_REASONS JurRson
;
/
