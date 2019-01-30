  CREATE OR REPLACE VIEW VWRD_LANGUAGELISTV1 
  as
  SELECT Lang.LANG_CODE AS source_lang_code
           , LangNam.BULAE_TARGET_LANG_CODE AS target_lang_code
           , Lang.DECIMAL_IND AS decimal_ind
           , Lang.THOUSAND_IND AS thousand_separator
           , Lang.NON_LATIN_FLAG AS non_latin_flag
           , Lang.LANG_NAME AS target_lang_name
           , LangNam.NAME AS target_lang_name_other
      FROM TBBU_LANGUAGES Lang
      JOIN TBBU_LANGUAGE_NAMES LangNam ON LangNam.BULAE_TARGET_LANG_CODE = Lang.LANG_CODE
;
/
