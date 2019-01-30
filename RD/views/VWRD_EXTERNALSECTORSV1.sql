  CREATE OR REPLACE VIEW VWRD_EXTERNALSECTORSV1 
  as
  SELECT TrdSectDesc.TRADE_SECTOR_CODE_SET AS sector_code_set
          , RefCod.RV_MEANING AS ind_classification_meaning
          , TrdSectDesc.TRADE_SECTOR_CODE AS sector_code 
          , TrdSectDesc.TRADE_SHORT_DESC AS short_desc
          , TrdSectDesc.TRADE_FULL_DESC AS full_desc
          , TrdSectDesc.BULAE_LANG_CODE AS language_code
      FROM TBBU_TRADE_SECTOR_DESCS TrdSectDesc
      JOIN CG_REF_CODES RefCod ON RefCod.RV_LOW_VALUE = TrdSectDesc.TRADE_SECTOR_CODE_SET
      WHERE 
      RefCod.RV_DOMAIN = 'TRADE_TYP'
;
/
