  CREATE OR REPLACE VIEW VWOM_ORGANISATIONDETAILSV1
  AS 
  SELECT OrgDet.ORNNN_ID AS org_id
           , OrgDet.EFFECT_FROM_DAT AS effective_from
           , OrgDet.EFFECT_TO_DAT AS effective_to
           , OrgDet.BUJRS_ID AS juridicial_reason_id 
           , OrgDet.BULAE_LANG_CODE AS local_lang_code
           , OrgDet.BULSS_TYP AS legal_status_type 
           , OrgDet.NDN_ORG_FLAG AS ndn_org_flag
           , OrgDet.ORCUY_CODE AS currency_code
           , OrgDet.PAYMENT_TYP AS payment_type
           , OrgDet.PUBLIC_CODE AS public_code
           , OrgDet.REASON_DAT AS reason_date 
           , OrgDet.REMITTANCE_TYP AS remittance_type
           , OrgDet.SHORT_NAME AS short_name
           , OrgDet.STATUS_CODE AS status_code
           , OrgDet.URL_NAME AS url_name 
           , BuyDet.EMPLOYEES_QTY AS emp_count 
           , BuyDet.FOUNDATION_DAT AS foundation_date 
      FROM TBOR_ORGANISATION_DETAILS OrgDet
      JOIN TBOR_BUYER_DETAILS BuyDet ON BuyDet.ORNNN_ID = OrgDet.ORNNN_ID AND OrgDet.EFFECT_TO_DAT = BuyDet.EFFECT_TO_DAT --Not found in MappingSheet but needed
;
/
