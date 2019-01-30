
  CREATE OR REPLACE VIEW VWOM_CITYSYNONYMSV1 
  AS 
  SELECT Cty.ORCOY_ID AS country_id 
           , CtryNam.NAME AS ctrynam_name
           , Ctry.MAIN_NAME AS ctry_main_name
           , CtryNam.BULAE_LANG_CODE AS language_code
           , CtryNam.EFFECT_FROM_DAT AS effective_from
           , CtryNam.EFFECT_TO_DAT AS effective_to
           , Cty.ID AS city_id 
           , CtyNam.TYP AS city_type 
           , CtyNam.NAME AS city_name           
           , Cty.VALID_FLAG AS validity_flag
           , Cty.DES AS city_desc
           , Cty.QUAL_LOCATION_NAME AS location_name
      FROM TBOR_CITIES Cty
      JOIN TBOR_COUNTRY_NAMES CtryNam ON CtryNam.ORCOY_ID = Cty.ORCOY_ID
      JOIN TBOR_CITY_NAMES CtyNam ON CtyNam.ORCTY_ID = Cty.ID
      JOIN TBOR_COUNTRIES Ctry ON Ctry.ID = Cty.ORCOY_ID
;
/
