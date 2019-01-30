  CREATE OR REPLACE VIEW VWOM_ORGANISATIONSECTORSV1 
  AS 
  SELECT OrgTrdSect.ORNNN_ID AS org_id
           , OrgNam.FIRST_LINE_NAME AS first_line_name
           , OrgNam.SECOND_LINE_NAME AS second_line_name
           , OrgNam.THIRD_LINE_NAME AS third_line_name
           , OrgNamUni.FIRST_LINE_NAME AS first_line_name_uni
           , OrgNamUni.SECOND_LINE_NAME AS second_line_name_uni 
           , OrgNamUni.THIRD_LINE_NAME AS third_line_name_uni
           , OrgTrdSect.BUTSR_TRADE_NACE_CODE AS trade_nace_code
           , OrgTrdSect.MAIN_FLAG AS main_flag
           , TrdSect.NAME AS trade_sector_desc
           , OrgTrdSect.EFFECT_FROM_DAT AS effective_from
           , OrgTrdSect.EFFECT_TO_DAT AS effective_to
           , TrdSect.NAME AS name 
           , TrdSect.VALID_FLAG AS validity_flag
           , TrdSectDesc.BULAE_LANG_CODE AS language_code
      FROM TBOR_ORG_TRADE_SECTORS OrgTrdSect
      JOIN TBBU_TRADE_SECTOR_DESCS TrdSectDesc ON TrdSectDesc.TRADE_SECTOR_CODE_SET = OrgTrdSect.TRADE_SECTOR_CODE_SET
                                                AND TrdSectDesc.TRADE_SECTOR_CODE = OrgTrdSect.TRADE_SECTOR_CODE
      JOIN TBOR_ORG_NAME_ADDRESSES OrgNamAddr ON OrgNamAddr.ORNNN_ID = OrgTrdSect.ORNNN_ID
                                                AND OrgNamAddr.EFFECT_TO_DAT = OrgTrdSect.EFFECT_TO_DAT
      JOIN TBOR_ORG_NAMES OrgNam ON OrgNam.ID = OrgNamAddr.ORONE_ID
      JOIN TBOR_ORG_NAMES_UNI OrgNamUni ON OrgNamUni.ORONE_ID = OrgNamAddr.ORONE_ID
                                        --AND OrgNamUni.EFFECT_FROM_DAT = OrgNamAddr.EFFECT_FROM_DAT
      JOIN TBBU_TRADE_SECTORS TrdSect ON TrdSect.TRADE_NACE_CODE = OrgTrdSect.BUTSR_TRADE_NACE_CODE
      WHERE OrgNamAddr.TYP = 'REG'
;
/
