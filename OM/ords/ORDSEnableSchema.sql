BEGIN
  ORDS.ENABLE_SCHEMA(
       p_enabled             => TRUE
      ,p_schema              => 'ORABUP0'
      ,p_url_mapping_type    => 'BASE_PATH'
      ,p_url_mapping_pattern => 'orabup0'
      ,p_auto_rest_auth      => FALSE
	  );    
END;
/
