BEGIN
  ORDS.DEFINE_MODULE(
       p_module_name    => 'country',
      ,p_base_path      => '/country/'
      ,p_items_per_page =>  25
      ,p_status         => 'PUBLISHED'
      ,p_comments       => NULL
	);      
END;
/
