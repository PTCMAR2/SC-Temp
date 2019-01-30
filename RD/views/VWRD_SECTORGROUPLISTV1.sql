  CREATE OR REPLACE VIEW VWRD_SECTORGROUPLISTV1 
  as
  SELECT TrdSect.TRADE_NACE_CODE AS trade_sector_code
			   , TrdSect.NAME AS sector_name
			   , TrdSect.VALID_FLAG AS validity_flag_sector
			   , GrpSec.BUTSG_TYP AS sector_group_type
			   , GrpSecTyp.DES AS sector_desc
			   , GrpSec.BUTSG_SEQ AS sector_seq
			   , TrdSectGrp.NAME AS sector_group_name
			   , TrdSectGrp.VALID_FLAG AS validity_flag_sectorgrp
			   , GrpSec.EFFECT_FROM_DAT AS effective_from 
			   , GrpSec.EFFECT_TO_DAT AS effective_to		   	   			   
		FROM TBBU_TRADE_SECTORS TrdSect		  
		JOIN TBBU_GROUPING_SECTORS GrpSec ON GrpSec.BUTSR_TRADE_NACE_CODE = TrdSect.TRADE_NACE_CODE 
		JOIN TBBU_TRADE_SECTOR_GROUPINGS TrdSectGrp ON TrdSectGrp.TYP = GrpSec.BUTSG_TYP
													AND TrdSectGrp.SEQ = GrpSec.BUTSG_SEQ                                      
		LEFT JOIN TBBU_GROUPING_SECTOR_TYPES GrpSecTyp ON GrpSec.BUTSG_TYP = GrpSecTyp.TYP
;
/
