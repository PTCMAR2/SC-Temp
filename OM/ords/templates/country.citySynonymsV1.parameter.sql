BEGIN
  ORDS.DEFINE_PARAMETER(
       p_module_name        => 'country'
      ,p_pattern            => 'citySynonymsV1/get/:country_id'
      ,p_method             => 'POST'
      ,p_name               => 'city_synonyms'
      ,p_bind_variable_name => 'CITY_SYNONYMS'
      ,p_source_type        => 'RESPONSE'
      ,p_param_type         => 'RESULTSET'
      ,p_access_method      => 'OUT'
      ,p_comments           => NULL
	);   
  ORDS.DEFINE_PARAMETER(
       p_module_name        => 'country'
      ,p_pattern            => 'citySynonymsV1/get/:country_id'
      ,p_method             => 'POST'
      ,p_name               => 'country_id'
      ,p_bind_variable_name => 'COUNTRY_ID'
      ,p_source_type        => 'URI'
      ,p_param_type         => 'STRING'
      ,p_access_method      => 'IN'
      ,p_comments           => NULL
	);   
  ORDS.DEFINE_PARAMETER(
       p_module_name        => 'country'
      ,p_pattern            => 'citySynonymsV1/get/:country_id'
      ,p_method             => 'POST'
      ,p_name               => 'outputErrorDetailObj'
      ,p_bind_variable_name => 'OUTPUTERRORDETAILOBJ'
      ,p_source_type        => 'RESPONSE'
      ,p_param_type         => 'RESULTSET'
      ,p_access_method      => 'OUT'
      ,p_comments           => NULL
	);   
  ORDS.DEFINE_PARAMETER(
       p_module_name        => 'country'
      ,p_pattern            => 'citySynonymsV1/get/:country_id'
      ,p_method             => 'POST'
      ,p_name               => 'outputGenericInfo'
      ,p_bind_variable_name => 'OUTPUTGENERICINFO'
      ,p_source_type        => 'RESPONSE'
      ,p_param_type         => 'RESULTSET'
      ,p_access_method      => 'OUT'
      ,p_comments           => NULL
	);   

END;