  CREATE OR REPLACE VIEW VWOM_ORGEXTERNALIDENTIFIERSV1 
  AS 
  SELECT OrgSysRef.ORNNN_ID AS org_id
           , OrgSysRef.OTHER_SYSTEM_REF_NR AS other_system_ref_nr
           , OrgSysRef.OROOM_CODE AS other_sys_code
           , OrgSysDesc.BULAE_LANG_CODE AS local_lang_code
           , OrgSysDesc.NAME
           , OrgSys.TYP AS type
           , OrgSys.FORMAT_TEXT AS format_text
           , OrgSysRef.SEQ AS seq
           , OrgSysRef.MASTER_IND AS master_ind
           , OrgSys.VALID_FLAG AS validity_flag
           , OrgSys.CHECK_IND AS check_ind
           , OrgSysRef.IFACE_NEXT_RUN_FLAG AS iface_next_run_flag
           , OrgSysRef.IFACE_FLAG AS iface_flag
           , OrgSysRef.EFFECT_FROM_DAT AS effective_from
           , OrgSysRef.EFFECT_TO_DAT AS effective_to
           , OrgSys2.DES
      FROM TBOR_ORG_OTHER_SYS_REFS OrgSysRef
      JOIN TBOR_ORG_OTHER_SYSTEM_DESCS OrgSysDesc ON OrgSysRef.OROOM_CODE = OrgSysDesc.OROOM_CODE
      JOIN TBOR_ORG_OTHER_SYSTEMS OrgSys ON OrgSysRef.ORNNN_ID = OrgSys.ORNNN_ID
      LEFT JOIN TBOR_ORG_OTHER_SYSTEMS OrgSys2 ON OrgSysRef.OROOM_CODE = OrgSys2.CODE
;
/
