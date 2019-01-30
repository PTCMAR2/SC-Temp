  CREATE OR REPLACE VIEW VWOM_INDIVIDUALSV1 
  AS 
  SELECT '' AS org_id 
           , OrgNam.FIRST_LINE_NAME AS first_line_name
           , IndivUni.INDIV_ID AS individual_id_uni
           , IndivUni.INDIV_NAME AS individual_name_uni
           , IndivUni.INDIV_ID AS individual_id
           , Indiv.BULAE_LANG_CODE AS local_lang_code
           , Indiv.ORSUS_ID AS system_user_id
           , IndivUni.INDIV_NAME AS individual_name
           , Indiv.EFFECT_FROM_DAT AS effective_from
           , Indiv.LAST_UPDATE_DAT AS last_update_date
           , Indiv.LAST_UPDATE_SEQ AS last_update_seq
           , Indiv.ORNON_ID AS corp_org_all_id
           , Indiv.ORNNN_ID AS non_ncm_org_id
           , Indiv.SALUTAT_NAME AS salutat_name
           , Indiv.EFFECT_TO_DAT AS effective_to
           , Indiv.FAX_NR AS fax_nr
           , Indiv.TELEXT_NR AS telext_nr 
           , Indiv.TEL_NR AS tel_nr 
           , Indiv.EDI_NR AS edi_nr 
           , Indiv.TELEX_NR AS telex_nr 
           , Indiv.DEPT_NAME AS dept_name 
           , Indiv.JOB_TITLE_DES AS job_title_desc 
           , Indiv.WMWSN_ID AS workGroup_Sec_id 
           , Indiv.EXT_REF_NR AS ext_ref_nr 
           , Indiv.DECISION_MAKER_FLAG AS decision_maker_flag 
           , Indiv.EMAIL_ADDR AS email_addr 
           , Indiv.MOBILE_TEL_NR AS mobile_tel_nr 
           , Indiv.GENDER_IND AS gender_ind 
           , Indiv.JOB_LEVEL_CODE AS job_level_code 
           , Indiv.AVAILABLE_PERC AS available_perc 
           , Indiv.BIRTH_DAT AS birth_date 
           , Indiv.EMAIL_OUTPUT_FLAG AS email_output_flag          
           , Indiv.EMAIL_STATUS_IND AS email_status_ind 
           , Indiv.EMAIL_STATUS_DAT AS email_status_date 
           , Indiv.TEL_IND AS tel_ind 
           , Indiv.FIRST_NAME AS first_name 
           , Indiv.LAST_NAME AS last_name 
           , Indiv.NO_DETAILS_FLAG AS number_details_flag 
           , Indiv.NO_MAIL_FLAG AS number_mail_flag 
           , Indiv.PERSONAL_TEXT AS personal_text 
           , Indiv.BUSINESS_TEXT AS business_text 
           , Indiv.NOTE_TEXT AS note_text 
           , Indiv.EDO_STATUS_DAT AS edo_status_date 
           , Indiv.EDO_TERMS_ACCEPTED AS edo_terms_accepted 
           , Indiv.EDO_ACCEPTED_DAT AS edo_accepted_date 
           , Indiv.IDENTITY_VERIFIED_FLAG AS identity_verified_flag
      FROM TBOR_INDIVIDUALS Indiv
      JOIN TBOR_ORG_NAME_ADDRESSES OrgNamAddr ON OrgNamAddr.ORNNN_ID = Indiv.ORNNN_ID
                                                   OR OrgNamAddr.ORNON_ID = Indiv.ORNON_ID
      JOIN TBOR_ORG_NAMES OrgNam ON OrgNam.ID = OrgNamAddr.ORONE_ID
      JOIN TBOR_INDIVIDUALS_UNI IndivUni ON IndivUni.BULAE_LANG_CODE = Indiv.BULAE_LANG_CODE
                                              AND IndivUni.INDIV_ID = Indiv.INDIV_ID
      WHERE 1=1
      AND OrgNamAddr.TYP = 'REG'
;
/
