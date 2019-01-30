  CREATE OR REPLACE VIEW VWRD_COUNTRYLISTV1 
  as
  SELECT Ctry.ID AS country_id
        , CtryNam.BULAE_LANG_CODE AS language_code
        , CAST(Ctry.EFFECT_FROM_DAT AS TIMESTAMP) AS effective_from
        , CAST(Ctry.EFFECT_TO_DAT AS TIMESTAMP) AS effective_to
        , CtryNam.NAME
        , Ctry.MAIN_NAME
        , Ctry.CODE AS country_code
        , Ctry.SUB_AREA_CODE AS country_sub_code
        , Ctry.ISO_2CHAR_CODE AS iso_2char_code
        , Ctry.INTL_CALL_FROM_TEL_NR AS international_dial_from_code
        , Ctry.INTERNAT_CALL_TO_TEL_NR AS international_dial_to_code
  FROM TBOR_COUNTRIES Ctry
  JOIN TBOR_COUNTRY_NAMES CtryNam ON CtryNam.ORCOY_ID = Ctry.ID
  ;
  /
  