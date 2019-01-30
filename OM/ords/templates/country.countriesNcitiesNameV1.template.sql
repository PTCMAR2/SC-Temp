BEGIN
  ORDS.DEFINE_TEMPLATE(
       p_module_name    => 'country'
      ,p_pattern        => 'countriesNcitiesNameV1/get/:country_id'
      ,p_priority       => 0
      ,p_etag_type      => 'HASH'
      ,p_etag_query     => NULL
      ,p_comments       => NULL);
END;