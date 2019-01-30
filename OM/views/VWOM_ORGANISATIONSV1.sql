  CREATE OR REPLACE VIEW VWOM_ORGANISATIONSV1 
  AS 
  select OrgNNcm.ID AS org_id
           , OrgNamAddr.EFFECT_FROM_DAT AS effective_from
           , OrgNNcm.EFFECT_TO_DAT AS effective_to
           , OrgNamAddr.ID AS org_name_addr_id
           , OrgNam.FIRST_LINE_NAME AS first_line_name
           , OrgNam.SECOND_LINE_NAME AS second_line_name
           , OrgNam.THIRD_LINE_NAME AS third_line_name 
           , OrgDet.SHORT_NAME AS short_name
           , OrgNamUni.BULAE_LANG_CODE AS local_lang_code
           , OrgNamUni.FIRST_LINE_NAME AS first_line_name_uni
           , OrgNamUni.SECOND_LINE_NAME AS second_line_name_uni 
           , OrgNamUni.THIRD_LINE_NAME AS third_line_name_uni 
           , OrgNamAddr.TYP AS address_type
           , RefCod.RV_MEANING AS rv_meaning
           , OrgAddr.FIRST_LINE_STREET_ADDR AS first_line_street_addr
           , OrgAddr.SECOND_LINE_STREET_ADDR AS second_line_street_addr 
           , OrgAddr.THIRD_LINE_STREET_ADDR AS third_line_street_addr 
           , OrgAddr.REGION_NAME AS region_name 
           , OrgAddr.CITY_NAME AS city_name_org
           , OrgAddr.ORCTY_ID AS city_id
           , OrgAddr.CITY_NAME AS city_name
           , OrgAddr.POST_CODE AS post_code
           , OrgNNcm.ORCOY_ID AS country_id
           , CtryNam.NAME
           , Ctry.MAIN_NAME
           , OrdAddrUni.BULAE_LANG_CODE AS address_lang_code
           , OrdAddrUni.FIRST_LINE_STREET_ADDR AS first_line_street_addr_uni
           , OrdAddrUni.SECOND_LINE_STREET_ADDR AS second_line_street_addr_uni 
           , OrdAddrUni.THIRD_LINE_STREET_ADDR AS third_line_street_addr_uni 
           , OrdAddrUni.REGION_NAME AS region_name_uni 
           , OrdAddrUni.CITY_NAME AS city_name_uni 
           , OrdAddrUni.POST_CODE AS post_code_uni
           , OrgNamAddr.CO_REG_NR AS co_registered_nr 
           , OrgNamAddr.VAT_NR AS vat_nr 
           , OrgAddr.EDI_NR AS edi_nr 
           , OrgAddr.EMAIL_ADDR AS email_addr 
           , OrgAddr.FAX_NR AS fax_nr 
           , OrgAddr.TEL_IND AS tel_ind 
           , OrgAddr.TEL_NR AS tel_nr 
           , OrgAddr.TELEX_NR AS telex_nr
           , OrgDet.ORNNN_ID AS orgdet_ornnn_id
           , OrgNamAddr.ORNNN_ID AS orgnam_ornnn_id
           , RefCod.RV_LOW_VALUE AS ref_low_value
           , CtryNam.BULAE_LANG_CODE AS ctry_lang
           , OrgDet.BULAE_LANG_CODE as orgdet_lang
           from TBOR_NON_NCM_ORGANISATIONS OrgNNcm
JOIN TBOR_ORG_NAME_ADDRESSES OrgNamAddr ON OrgNamAddr.ORNNN_ID = OrgNNcm.ID AND OrgNamAddr.EFFECT_TO_DAT = OrgNNcm.EFFECT_TO_DAT
JOIN TBOR_ORGANISATION_DETAILS OrgDet ON OrgDet.ORNNN_ID = OrgNNcm.ID  AND OrgDet.EFFECT_TO_DAT = OrgNNcm.EFFECT_TO_DAT
JOIN TBOR_ORG_NAMES OrgNam ON OrgNam.ID = OrgNamAddr.ORONE_ID
JOIN TBOR_ORG_NAMES_UNI OrgNamUni ON OrgNamUni.ORONE_ID = OrgNamAddr.ORONE_ID
JOIN TBOR_ORG_ADDRESSES OrgAddr ON OrgAddr.ID = OrgNamAddr.OROAS_ID
JOIN TBOR_COUNTRY_NAMES CtryNam ON CtryNam.ORCOY_ID = OrgNNcm.ORCOY_ID
JOIN TBOR_COUNTRIES Ctry ON Ctry.ID = OrgNNcm.ORCOY_ID
JOIN TBOR_ORG_ADDRESSES_UNI OrdAddrUni ON OrdAddrUni.OROAS_ID = OrgNamAddr.OROAS_ID
LEFT JOIN CG_REF_CODES RefCod ON RefCod.RV_LOW_VALUE = OrgNamAddr.TYP
WHERE RefCod.RV_DOMAIN = 'NAME ADDRESS TYPE'
;
/
