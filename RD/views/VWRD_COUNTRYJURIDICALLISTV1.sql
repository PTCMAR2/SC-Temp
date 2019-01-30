  CREATE OR REPLACE VIEW VWRD_COUNTRYJURIDICALLISTV1 
  as
  SELECT JurCtryRson.ORCOY_ID AS country_id
			   , CtryNam.NAME AS country_name
			   , CtryNam.BULAE_LANG_CODE AS language_code
			   , JurCtryRson.BUJRS_ID AS juridical_reason_ID
			   , JurCtryRson.VALID_FLAG AS juridical_country_validity
			   , JurRson.ABREV AS juridical_abbrev
			   , JurRson.DES AS juridical_desc
			   , JurCtryRson.VALID_FLAG AS validity_flag
			   , Ctry.MAIN_NAME AS main_name
			   , CtryNam.ORCOY_ID AS CtryNam_id
		FROM TBBU_JURIDICAL_CTRY_REASONS JurCtryRson
		JOIN TBOR_COUNTRY_NAMES CtryNam ON CtryNam.ORCOY_ID = JurCtryRson.ORCOY_ID
		JOIN TBBU_JURIDICAL_REASONS JurRson ON JurRson.ID = JurCtryRson.BUJRS_ID				
		JOIN TBOR_COUNTRIES Ctry  ON  Ctry.ID = JurCtryRson.ORCOY_ID
		;
		/