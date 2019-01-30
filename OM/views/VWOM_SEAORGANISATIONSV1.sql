  CREATE OR REPLACE VIEW VWOM_SEAORGANISATIONSV1 
  AS 
  SELECT   OrgSrch.NAME_MATCHING_ID AS match_id
            , OrgSrch.SCORE AS score
            , OrgSrch.ORCOY_ID AS country_id
            , OrgSrch.ORNNN_ID AS org_id
            , OrgSrch.FIRST_LINE_NAME AS first_line_name
            , OrgSrch.SECOND_LINE_NAME AS second_line_name
            , OrgSrch.THIRD_LINE_NAME AS third_line_name
            , OrgSrch.FIRST_LINE_STREET_ADDR AS first_line_street_addr
            , OrgSrch.SECOND_LINE_STREET_ADDR AS second_line_street_addr
            , OrgSrch.THIRD_LINE_STREET_ADDR AS third_line_street_addr
            , OrgSrch.ORCTY_ID AS city_id
            , OrgSrch.CITY_NAME AS city_name
            , OrgSrch.POST_CODE AS post_code
            , OrgSrch.VAT_NR AS vat_nr
            , OrgSrch.FIRST_NAT_NR AS co_registered_nr
            , OrgSrch.BUTSR_TRADE_NACE_CODE AS trade_nace_code
            , OrgSrch.TYP AS address_type
            , OrgSrch.ORONE_ID AS org_name_id
            , OrgSrch.OROAS_ID AS org_addr_id
            , OrgSrch.OROOM_CODE AS other_system_code1
            , OrgSrch.OTHER_SYSTEM_REF_NR AS other_system_ref_nr1
            , OrgSrch.OROOM_CODE2 AS other_system_code2
            , OrgSrch.OTHER_SYSTEM_REF_NR2 AS other_system_ref_nr2
      FROM TBOS_TRANS_ORGSEARCH OrgSrch
;
/
