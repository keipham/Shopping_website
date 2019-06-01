prompt --application/pages/page_00006beginwwv_flow_api.create_page( p_id=>6,p_user_interface_id=>wwv_flow_api.id(327304041051455600),p_name=>'Display image',p_page_mode=>'MODAL',p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS',p_first_item=>'NO_FIRST_ITEM',p_autocomplete_on_off=>'OFF',p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('.modal {','    width: 100%;','}','.picture {','    width: 900px;','    height: 650px;','}')),p_page_template_options=>'#DEFAULT#',p_dialog_chained=>'Y',p_overwrite_navigation_list=>'N',p_page_is_public_y_n=>'Y',p_cache_mode=>'NOCACHE',p_last_updated_by=>'defaultUser',p_last_upd_yyyymmddhh24miss=>'20000101000000');wwv_flow_api.create_page_plug( p_id=>wwv_flow_api.id(382898771816154219),p_plug_name=>'Detailed view',p_region_template_options=>'#DEFAULT#',p_plug_template=>wwv_flow_api.id(327260456234455539),p_plug_display_sequence=>11,p_include_in_reg_disp_sel_yn=>'Y',p_plug_display_point=>'BODY',p_plug_query_options=>'DERIVED_REPORT_COLUMNS',p_attribute_01=>'N',p_attribute_02=>'HTML');wwv_flow_api.create_page_plug( p_id=>wwv_flow_api.id(729927837392217155),p_plug_name=>'Buttons',p_region_template_options=>'#DEFAULT#',p_plug_template=>wwv_flow_api.id(327260825035455539),p_plug_display_sequence=>10,p_include_in_reg_disp_sel_yn=>'N',p_plug_display_point=>'REGION_POSITION_01',p_plug_query_row_template=>1,p_plug_query_options=>'DERIVED_REPORT_COLUMNS',p_attribute_01=>'N',p_attribute_02=>'TEXT',p_attribute_03=>'Y');wwv_flow_api.create_page_item( p_id=>wwv_flow_api.id(382898794092154220),p_name=>'P6_PRODUCT_ID',p_item_sequence=>20,p_item_plug_id=>wwv_flow_api.id(382898771816154219),p_use_cache_before_default=>'NO',p_display_as=>'NATIVE_HIDDEN',p_attribute_01=>'Y');wwv_flow_api.create_page_item( p_id=>wwv_flow_api.id(383495567267782375),p_name=>'P6_IMAGE',p_item_sequence=>10,p_item_plug_id=>wwv_flow_api.id(382898771816154219),p_use_cache_before_default=>'NO',p_source=>'PRODUCT_IMAGE',p_source_type=>'DB_COLUMN',p_display_as=>'NATIVE_DISPLAY_IMAGE',p_tag_css_classes=>'picture',p_field_template=>wwv_flow_api.id(327292794678455582),p_item_template_options=>'#DEFAULT#',p_attribute_01=>'SQL',p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2('select product_image','from SOK_PRODUCT_LIST_VW ','where product_id = :P6_PRODUCT_ID')));end;/