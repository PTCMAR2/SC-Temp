  CREATE OR REPLACE VIEW VWOM_ORGCONTACTPOINTSV1 
  AS 
  SELECT CntPnt.ORNAE_ID AS ornae_id
           , CntPnt.SEQ AS seq
           , CntPnt.TYP AS contact_type
           , RefCod.RV_MEANING AS contact_meaning
           , CntPnt.SALES_POSITION AS sales_position
           , CntPnt.SALES_ROLE AS sales_role
           , CntPnt.ENBET_TYP AS enbet_typ
           , CntPnt.ENORL_ID AS enorl_id
           , CntPnt.MAILSHOT_SUPPRESS_FLAG AS mailshot_suppress_flag
           , CntPnt.EFFECT_FROM_DAT AS effective_from
           , CntPnt.EFFECT_TO_DAT AS effective_to
           , CntPnt.EDI_NR AS edi_nr 
           , CntPnt.FAX_NR AS fax_nr 
           , CntPnt.TEL_NR AS tel_nr_contactPoint
           , CntPnt.TELEX_NR AS telex_nr_contactPoint
           , Indiv.INDIV_NAME AS individual_name
           , Indiv.SALUTAT_NAME AS salutat_name
           , IndivUni.BULAE_LANG_CODE AS individual_lang_code
           , IndivUni.INDIV_NAME AS individual_name_uni
           , IndivUni.SALUTAT_NAME AS salutat_name_uni
           , Indiv.EMAIL_ADDR AS email_addr 
           , Indiv.MOBILE_TEL_NR AS mobile_tel_nr 
           , Indiv.TEL_IND AS tel_ind 
           , CntPnt.TEL_NR AS tel_nr 
           , CntPnt.TELEX_NR AS telex_nr 
           , Indiv.TELEXT_NR AS telext_nr 
           , OrgNam.FIRST_LINE_NAME AS first_line_name
           , OrgNam.SECOND_LINE_NAME AS second_line_name
           , OrgNam.THIRD_LINE_NAME AS third_line_name
           , OrgNamUni.BULAE_LANG_CODE AS Org_name_lang_code
           , OrgNamUni.FIRST_LINE_NAME AS first_line_name_uni
           , OrgNamUni.SECOND_LINE_NAME AS second_line_name_uni 
           , OrgNamUni.THIRD_LINE_NAME AS third_line_name_uni 
           , OrgNamAddr.TYP AS Org_name_address_type
           , OrgAddr.FIRST_LINE_STREET_ADDR AS first_line_street_addr
           , OrgAddr.SECOND_LINE_STREET_ADDR AS second_line_street_addr 
           , OrgAddr.THIRD_LINE_STREET_ADDR AS third_line_street_addr 
           , OrgAddr.CITY_NAME AS city_name
           , OrgNNcm.ORCOY_ID AS country_id
           , CtryNam.BULAE_LANG_CODE AS country_lang_code
           , CtryNam.NAME
           , Ctry.MAIN_NAME
           , OrgAddr.ORCTY_ID AS city_id
           , OrgAddr.POST_CODE AS post_code
           , OrgAddr.REGION_NAME AS region_name
           , OrdAddrUni.BULAE_LANG_CODE AS org_address_lang_code
           , OrdAddrUni.FIRST_LINE_STREET_ADDR AS first_line_street_addr_uni 
           , OrdAddrUni.SECOND_LINE_STREET_ADDR AS second_line_street_addr_uni 
           , OrdAddrUni.THIRD_LINE_STREET_ADDR AS third_line_street_addr_uni 
           , OrdAddrUni.CITY_NAME AS city_name_uni 
           , OrdAddrUni.ORCOY_NAME AS country_id_uni 
           , OrdAddrUni.POST_CODE AS post_code_uni
           , OrdAddrUni.REGION_NAME AS region_name_uni
           , OrgAddr.EDI_NR AS edi_nr_address
           , OrgAddr.EMAIL_ADDR AS email_addr_address
           , OrgAddr.FAX_NR AS fax_nr_address
           , OrgAddr.TEL_IND AS tel_ind_address
           , OrgAddr.TEL_NR AS tel_nr_address
           , OrgAddr.TELEX_NR AS telex_nr_address
           , Indiv.ORNON_ID
           , Indiv.ORNNN_ID
           , RefCod.RV_LOW_VALUE
      FROM TBOR_CONTACT_POINTS CntPnt
      LEFT JOIN CG_REF_CODES RefCod ON RefCod.RV_LOW_VALUE = CntPnt.TYP AND RefCod.RV_DOMAIN = 'CONTACT TYPE'
      JOIN TBOR_INDIVIDUALS Indiv ON CntPnt.ORIDL_INDIV_ID = Indiv.INDIV_ID
      JOIN TBOR_INDIVIDUALS_UNI IndivUni ON CntPnt.ORIDL_INDIV_ID = IndivUni.INDIV_ID 
      JOIN TBOR_ORG_NAME_ADDRESSES OrgNamAddr ON OrgNamAddr.ID = CntPnt.ORNAE_ID
      JOIN TBOR_ORG_NAMES OrgNam ON OrgNam.ID = OrgNamAddr.ORONE_ID
      JOIN TBOR_ORG_NAMES_UNI OrgNamUni ON OrgNamUni.ORONE_ID = OrgNamAddr.ORONE_ID
      JOIN TBOR_ORG_ADDRESSES OrgAddr ON OrgAddr.ID = OrgNamAddr.OROAS_ID
      JOIN TBOR_ORG_ADDRESSES_UNI OrdAddrUni ON OrdAddrUni.OROAS_ID = OrgNamAddr.OROAS_ID
      LEFT JOIN TBOR_NON_NCM_ORGANISATIONS OrgNNcm ON OrgNNcm.ID = Indiv.ORNNN_ID
      LEFT JOIN TBOR_CORP_ORGANISATIONS_ALL OrgACorpAll ON OrgACorpAll.ID = Indiv.ORNON_ID
      JOIN TBOR_COUNTRY_NAMES CtryNam ON CtryNam.ORCOY_ID = OrgNNcm.ORCOY_ID OR CtryNam.ORCOY_ID = OrgACorpAll.ORCOY_ID
      JOIN TBOR_COUNTRIES Ctry ON Ctry.ID = OrgNNcm.ORCOY_ID OR Ctry.ID = OrgACorpAll.ORCOY_ID
;
/
