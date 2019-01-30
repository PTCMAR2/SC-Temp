  CREATE OR REPLACE VIEW VWOM_ATRADIUSORGSV1 
  AS 
  SELECT OrgACorpAll.ID AS id
           , OrgACorpAll.TYPE_IND AS type_ind 
           , RefCod.RV_MEANING AS meaning_type_ind
           , OrgACorpAll.OPERATING_TYP AS operating_type  
           , RefCod.RV_MEANING AS meaning_operating_type
           , OrgACorpAll.FRONTER_FLAG AS fronter_flag 
           , OrgACorpAll.SHORT_NAME AS short_name 
           , OrgACorpAll.BULAE_LANG_CODE AS local_lang_code --org_language
           , OrgACorpAll.ORCUY_CODE AS currency_code
           , OrgACorpAll.ORNNN_ID AS org_id           
           , OrgACorpAll.PRUDENCE_ORG_ID AS prudence_id 
           , OrgACorpAll.GSFLN_NAME AS gsfln_name 
           , OrgACorpAll.CLRSE_ID AS risk_service_unit            
           , OrgNamAddr.EFFECT_FROM_DAT AS effective_from
           , OrgNamAddr.EFFECT_TO_DAT AS effective_to
           , OrgNamAddr.ORONE_ID AS org_name_id    
           , OrgNam.FIRST_LINE_NAME AS first_line_name
           , OrgNam.SECOND_LINE_NAME AS second_line_name 
           , OrgNam.THIRD_LINE_NAME AS third_line_name 
           , OrgNamUni.BULAE_LANG_CODE AS local_lang_code_uni
           , OrgNamUni.FIRST_LINE_NAME AS first_line_name_uni
           , OrgNamUni.SECOND_LINE_NAME AS second_line_name_uni 
           , OrgNamUni.THIRD_LINE_NAME AS third_line_name_uni 
           , OrgNamAddr.TYP AS address_type
           , OrgAddr.FIRST_LINE_STREET_ADDR AS first_line_street_addr
           , OrgAddr.SECOND_LINE_STREET_ADDR AS second_line_street_addr 
           , OrgAddr.THIRD_LINE_STREET_ADDR AS third_line_street_addr 
           , OrgAddr.REGION_NAME AS region_name 
           , OrgAddr.CITY_NAME AS city_name_org
           , OrgAddr.ORCTY_ID AS city_id
           , Cty.MAIN_NAME AS city_name
           , OrgAddr.POST_CODE AS post_code
           , OrgACorpAll.ORCOY_ID AS country_id
           , CtryNam.NAME AS country_name
           , OrdAddrUni.FIRST_LINE_STREET_ADDR AS first_line_street_addr_uni
           , OrdAddrUni.SECOND_LINE_STREET_ADDR AS second_line_street_addr_uni 
           , OrdAddrUni.THIRD_LINE_STREET_ADDR AS third_line_street_addr_uni 
           , OrdAddrUni.REGION_NAME AS region_name_uni 
           , OrdAddrUni.CITY_NAME AS city_name_uni 
           , OrdAddrUni.POST_CODE AS post_code_uni
           , Ctry.CODE AS country_code
           , OrgNamAddr.CO_REG_NR AS co_registered_nr 
           , OrgNamAddr.VAT_NR AS vat_nr 
           , OrgAddr.EDI_NR AS edi_nr 
           , OrgAddr.EMAIL_ADDR AS email_addr 
           , OrgAddr.FAX_NR AS fax_nr 
           , OrgAddr.TEL_IND AS tel_ind 
           , OrgAddr.TEL_NR AS tel_nr 
           , OrgAddr.TELEX_NR AS telex_nr  --DELETE ABOVE
           , RefCod.RV_LOW_VALUE AS low_value 
           , OrgNamAddr.ORNON_ID AS org_ornon_id
           , Ctry.ID AS ctry_orcoy_id   
           , Ctry.EFFECT_FROM_DAT AS effect_from         
           , Ctry.EFFECT_TO_DAT AS effect_to
           , OrgACorpAll.EFFECT_FROM_DAT AS org_effect_from  
           , Ctry.MAIN_NAME AS main_name_other
           , CtryNam.BULAE_LANG_CODE AS bulae_lang
           , CtryNam.EFFECT_FROM_DAT AS effect_from_other
           , CtryNam.EFFECT_TO_DAT AS effect_to_other
           , CtryNam.NAME AS ctry_name  
           , CtryNam.D_ORCOY_CODE AS country_code_alter
      FROM TBOR_CORP_ORGANISATIONS_ALL OrgACorpAll
      JOIN TBOR_ORG_NAME_ADDRESSES OrgNamAddr ON OrgNamAddr.ORNON_ID = OrgACorpAll.ID
      LEFT JOIN CG_REF_CODES RefCod ON RefCod.RV_LOW_VALUE = OrgNamAddr.TYP OR RefCod.RV_LOW_VALUE = OrgACorpAll.OPERATING_TYP
      JOIN TBOR_ORG_NAMES OrgNam ON OrgNam.ID = OrgNamAddr.ORONE_ID
      JOIN TBOR_ORG_NAMES_UNI OrgNamUni ON OrgNamUni.BULAE_LANG_CODE = OrgACorpAll.BULAE_LANG_CODE
      JOIN TBOR_ORG_ADDRESSES OrgAddr ON OrgAddr.ID = OrgNamAddr.OROAS_ID
      LEFT JOIN TBOR_ORG_ADDRESSES_UNI OrdAddrUni ON OrdAddrUni.OROAS_ID = OrgNamAddr.OROAS_ID
      JOIN TBOR_COUNTRY_NAMES CtryNam ON CtryNam.ORCOY_ID = OrgACorpAll.ORCOY_ID
      JOIN TBOR_CITIES Cty ON Cty.ID = OrgAddr.ORCTY_ID
      JOIN TBOR_COUNTRIES Ctry ON Ctry.ID = OrgACorpAll.ORCOY_ID
      WHERE 1=1 
       AND (RefCod.RV_DOMAIN = 'NON NCM NAME ADDRESS TYPE' 
       OR RefCod.RV_DOMAIN = 'NCM NAME ADDRESS TYPE' 
       OR RefCod.RV_DOMAIN = 'NAME ADDRESS TYPE')
       OR RefCod.RV_DOMAIN = 'OPERATING TYPE'
;
/
