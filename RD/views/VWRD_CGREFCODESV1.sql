  CREATE OR REPLACE VIEW VWRD_CGREFCODESV1 
  SELECT RefCod.RV_DOMAIN AS domain
           , RefCod.RV_LOW_VALUE AS low_value
           , RefCod.RV_HIGH_VALUE AS high_value
           , RefCod.RV_ABBREVIATION AS abbreviation
           , RefCod.RV_MEANING AS meaning
           , RefCod.RV_TYPE AS type
           , RefCodDesc.BULAE_LANG_CODE AS language_code
           , RefCodDesc.MEANING AS refcoddesc_meaning
      FROM CG_REF_CODES RefCod
      JOIN TBBU_CG_REF_CODES_DESCS RefCodDesc ON RefCodDesc.CGRFC_RV_DOMAIN = RefCod.RV_DOMAIN
                                             AND RefCodDesc.CGRFC_RV_LOW_VALUE = RefCod.RV_LOW_VALUE
;
/
											 