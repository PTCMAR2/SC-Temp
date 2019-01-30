  CREATE OR REPLACE VIEW VWRD_LEGALSTATUSLISTV1 
  as
  SELECT LegSt.TYP AS legal_code
          , LegSt.DES AS status_desc
          , LegStDesc.BULAE_LANG_CODE AS language_code
          , LangNam.NAME
          , Lang.LANG_NAME
          , LegStDesc.DES
          , LegSt.VALID_FLAG AS validity_flag
          , LegSt.CATEGORY_CODE AS category_code
          , LangNam.BULAE_TARGET_LANG_CODE AS target_lang_code
      FROM TBBU_LEGAL_STATUSES LegSt
      JOIN TBBU_LEGAL_STATUS_DESCS LegStDesc ON LegSt.TYP = LegStDesc.BULSS_TYP
      JOIN TBBU_LANGUAGE_NAMES LangNam ON LangNam.BULAE_TARGET_LANG_CODE = LegStDesc.BULAE_LANG_CODE
      JOIN TBBU_LANGUAGES Lang ON Lang.LANG_CODE = LegStDesc.BULAE_LANG_CODE
      WHERE LangNam.BULAE_SOURCE_LANG_CODE = 'EN'
;
/
