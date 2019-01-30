BEGIN
  ORDS.DEFINE_HANDLER(
       p_module_name    => 'country'
      ,p_pattern        => 'citySynonymsV1/get/:country_id'
      ,p_method         => 'POST'
      ,p_source_type    => 'plsql/block'
      ,p_items_per_page =>  0
      ,p_mimes_allowed  => 'application/json'
      ,p_comments       => NULL
      ,p_source         =>
'	declare
		outGenericInfo          output_generic_info_type;
		outputErrorDetailInfo ERROR_DETAIL_OUT_OBJ;
		outputGenericInfo_cur   sys_refcursor;
		outputErrorDetailInfo_cur sys_refcursor;
		city_synonyms sys_refcursor;
		l_inputGenericInfo  input_generic_info_type;

	begin
		l_inputGenericInfo   := FILL_INPUT_GENERIC(:body);

		om_country.p_getcitySynonymsV1(
						 p_country_id         => :country_id
						,p_language_code      => :language_code
						,p_type               => :type
						,p_validity_flag      => :validity_flag
						,p_city_id            => :city_id
						,i_inputgenericinfo   => l_inputGenericInfo
						,o_error_detail_out_o => outputErrorDetailInfo
						,o_outputgenericinfo  => outGenericInfo
						,city_synonyms        => :city_synonyms						
				);

		open outputGenericInfo_cur for
		select  outGenericInfo.status            as status
			  , outGenericInfo.current_row_num   as current_row_num
			  , outGenericInfo.total_rows        as total_rows
			  , outGenericInfo.error_id          as error_id
			  , outGenericInfo.error_desc        as error_desc
		from dual;

		open outputErrorDetailInfo_cur for
		select
			   outputErrorDetailInfo.error_code       as error_code
			 , outputErrorDetailInfo.error_message    as error_message
			 , outputErrorDetailInfo.error_indicator  as error_indicator
			 , outputErrorDetailInfo.error_identifier as error_identifier
			 , outputErrorDetailInfo.error_level      as error_level
		from
			   dual
		;
		:outputGenericInfo := outputGenericInfo_cur;
		:outputErrorDetailObj := outputErrorDetailInfo_cur;
	end;'
);
END;