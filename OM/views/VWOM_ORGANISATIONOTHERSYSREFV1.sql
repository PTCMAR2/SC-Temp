  CREATE OR REPLACE VIEW VWOM_ORGANISATIONOTHERSYSREFV1 
  AS 
  SELECT OrgSys.CODE AS other_sys_code
           , OrgSysDesc.NAME AS other_sys_desc_name 
           , OrgSysDesc.BULAE_LANG_CODE AS language_code
           , LangNam.NAME AS language_name
           , OrgSys.TYP AS other_sys_type
           , OrgSys.VALID_FLAG AS validity_flag
           , OrgSys.CHECK_IND AS check_ind
           , OrgSys.FORMAT_TEXT AS format_text
           ,OrgSys.ALLOW_NDN_USE_FLAG AS allow_NDN_use_flag
           ,OrgSys.DES AS des
		   ,LangNam.BULAE_TARGET_LANG_CODE AS bulae_target_lang_code 
           ,LANG.LANG_NAME AS lang_name
      FROM TBOR_ORG_OTHER_SYSTEMS OrgSys
      JOIN TBOR_ORG_OTHER_SYSTEM_DESCS OrgSysDesc ON OrgSysDesc.OROOM_CODE = OrgSys.CODE
      JOIN TBBU_LANGUAGE_NAMES LangNam ON LangNam.BULAE_SOURCE_LANG_CODE = OrgSysDesc.BULAE_LANG_CODE
      JOIN TBBU_LANGUAGES Lang ON OrgSysDesc.BULAE_LANG_CODE = Lang.LANG_CODE
;
/
