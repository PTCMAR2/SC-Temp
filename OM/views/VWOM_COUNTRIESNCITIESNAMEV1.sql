  CREATE OR REPLACE VIEW VWOM_COUNTRIESNCITIESNAMEV1 
  AS 
  SELECT Cty.ORCOY_ID AS country_id          
           , Cty.VALID_FLAG AS validity_flag
           , Cty.DES AS city_desc
           , Cty.ID AS city_id 
           , Cty.QUAL_LOCATION_NAME AS location_name
           , Cty.MAIN_NAME AS city_name
           , CtryNam.NAME AS country_name
           , CtryNam.BULAE_LANG_CODE AS language_code
           , CtryNam.EFFECT_FROM_DAT AS effective_from
           , CtryNam.EFFECT_TO_DAT AS effective_to
           , Ctry.MAIN_NAME AS main_name
      FROM TBOR_CITIES Cty
      JOIN TBOR_COUNTRY_NAMES CtryNam ON CtryNam.ORCOY_ID = Cty.ORCOY_ID
      JOIN TBOR_COUNTRIES Ctry ON Cty.ORCOY_ID = Ctry.ID
;
/
