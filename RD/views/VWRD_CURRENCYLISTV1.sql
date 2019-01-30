  CREATE OR REPLACE VIEW VWRD_CURRENCYLISTV1 
  as
  SELECT Curr.CODE AS currency_code
           , Curr.VALID_FLAG AS validity_flag
           , CurrNam.BULAE_LANG_CODE AS language_code
           , Curr.NAME AS local_currency_name
           , Curr.SYMBOL_IND AS currency_symbol
           , Curr.EURO_FIXED_FLAG AS euro_fixed_flag
           , Curr.INTEGER_FLAG AS integer_flag
           , Curr.AU_TRUNC_AMT AS au_trunc_amt
           , Curr.STAND_NCM_FLAG AS stand_ncm_flag
           , CurrNam.NAME AS local_currency_name_other
      FROM TBOR_CURRENCIES Curr
      JOIN TBOR_CURRENCY_NAMES CurrNam ON CurrNam.ORCUY_CODE = Curr.CODE
;
/
