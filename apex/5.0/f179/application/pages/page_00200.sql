prompt --application/pages/page_00200beginwwv_flow_api.create_page( p_id=>200,p_user_interface_id=>wwv_flow_api.id(327304041051455600),p_name=>'Users',p_page_mode=>'NORMAL',p_step_title=>'Users',p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS',p_first_item=>'NO_FIRST_ITEM',p_autocomplete_on_off=>'OFF',p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('','body{','    font-family: ''Comic Sans MS'';','}')),p_page_template_options=>'#DEFAULT#',p_required_role=>wwv_flow_api.id(328224405980893970),p_overwrite_navigation_list=>'N',p_page_is_public_y_n=>'N',p_cache_mode=>'NOCACHE',p_last_updated_by=>'defaultUser',p_last_upd_yyyymmddhh24miss=>'20000101000000');wwv_flow_api.create_page_plug( p_id=>wwv_flow_api.id(327536230207049026),p_plug_name=>'Users',p_region_template_options=>'#DEFAULT#',p_plug_template=>wwv_flow_api.id(327269938950455546),p_plug_display_sequence=>20,p_include_in_reg_disp_sel_yn=>'N',p_plug_new_grid_row=>false,p_plug_new_grid_column=>false,p_plug_display_point=>'BODY',p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2('  SELECT distinct a.user_id,','         a.user_firstname,','         a.user_lastname,','         a.user_email,','         a.user_password,','         a.user_phone,','         a.user_invoicing_address,','         a.user_delivery_address,','         b.role_names,','         a.created_date,','         a.updated_date,','         a.updated_by','        from SOK_USER_ROLE_VW a','        inner join ( select user_id,','                            LISTAGG(role_name, '', '') WITHIN GROUP (ORDER BY role_name) role_names','                     from SOK_USER_ROLE_VW','                     GROUP BY user_id) b','        on a.user_id = b.user_id','        order by a.created_date DESC;')),p_plug_source_type=>'NATIVE_IR',p_plug_query_row_template=>1,p_plug_query_options=>'DERIVED_REPORT_COLUMNS');wwv_flow_api.create_worksheet( p_id=>wwv_flow_api.id(327536608088049026),p_name=>'Report 1',p_max_row_count=>'1000000',p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.',p_no_data_found_message=>'No data found.',p_show_nulls_as=>'-',p_pagination_type=>'ROWS_X_TO_Y',p_pagination_display_pos=>'BOTTOM_RIGHT',p_report_list_mode=>'TABS',p_show_detail_link=>'C',p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF',p_detail_link=>'f?p=&APP_ID.:201:&APP_SESSION.::::P201_USER_ID:#USER_ID#',p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">',p_owner=>'KPQ',p_internal_uid=>327537218088049026);wwv_flow_api.create_worksheet_column( p_id=>wwv_flow_api.id(327536771353049026),p_db_column_name=>'USER_ID',p_display_order=>1,p_column_identifier=>'A',p_column_label=>'User Id',p_column_type=>'NUMBER',p_display_text_as=>'HIDDEN');wwv_flow_api.create_worksheet_column( p_id=>wwv_flow_api.id(327537134260049026),p_db_column_name=>'USER_FIRSTNAME',p_display_order=>2,p_column_identifier=>'B',p_column_label=>'Firstname',p_column_type=>'STRING',p_heading_alignment=>'LEFT',p_tz_dependent=>'N');wwv_flow_api.create_worksheet_column( p_id=>wwv_flow_api.id(327537561775049028),p_db_column_name=>'USER_LASTNAME',p_display_order=>3,p_column_identifier=>'C',p_column_label=>'Lastname',p_column_type=>'STRING',p_heading_alignment=>'LEFT',p_tz_dependent=>'N');wwv_flow_api.create_worksheet_column( p_id=>wwv_flow_api.id(327537985459049028),p_db_column_name=>'USER_EMAIL',p_display_order=>4,p_column_identifier=>'D',p_column_label=>'Email',p_column_type=>'STRING',p_heading_alignment=>'LEFT');wwv_flow_api.create_worksheet_column( p_id=>wwv_flow_api.id(327538318393049028),p_db_column_name=>'USER_PASSWORD',p_display_order=>5,p_column_identifier=>'E',p_column_label=>'Password',p_column_type=>'STRING',p_heading_alignment=>'LEFT',p_tz_dependent=>'N');wwv_flow_api.create_worksheet_column( p_id=>wwv_flow_api.id(327538750043049029),p_db_column_name=>'USER_PHONE',p_display_order=>6,p_column_identifier=>'F',p_column_label=>'Phone',p_column_type=>'NUMBER',p_heading_alignment=>'LEFT',p_tz_dependent=>'N');wwv_flow_api.create_worksheet_column( p_id=>wwv_flow_api.id(327539131421049029),p_db_column_name=>'USER_INVOICING_ADDRESS',p_display_order=>7,p_column_identifier=>'G',p_column_label=>'Invoicing address',p_column_type=>'STRING',p_heading_alignment=>'LEFT',p_tz_dependent=>'N');wwv_flow_api.create_worksheet_column( p_id=>wwv_flow_api.id(327539545126049029),p_db_column_name=>'USER_DELIVERY_ADDRESS',p_display_order=>8,p_column_identifier=>'H',p_column_label=>'Delivery Address',p_column_type=>'STRING',p_heading_alignment=>'LEFT',p_tz_dependent=>'N');wwv_flow_api.create_worksheet_column( p_id=>wwv_flow_api.id(327595476945222321),p_db_column_name=>'UPDATED_DATE',p_display_order=>78,p_column_identifier=>'Z',p_column_label=>'Updated date',p_column_type=>'DATE',p_column_alignment=>'CENTER',p_tz_dependent=>'N');wwv_flow_api.create_worksheet_column( p_id=>wwv_flow_api.id(327595513496222322),p_db_column_name=>'UPDATED_BY',p_display_order=>88,p_column_identifier=>'AA',p_column_label=>'Updated by',p_column_type=>'STRING');wwv_flow_api.create_worksheet_column( p_id=>wwv_flow_api.id(344816701703650230),p_db_column_name=>'ROLE_NAMES',p_display_order=>98,p_column_identifier=>'AB',p_column_label=>'Role',p_column_type=>'STRING');wwv_flow_api.create_worksheet_column( p_id=>wwv_flow_api.id(344816866237650231),p_db_column_name=>'CREATED_DATE',p_display_order=>108,p_column_identifier=>'AC',p_column_label=>'Created date',p_column_type=>'DATE',p_column_alignment=>'CENTER',p_tz_dependent=>'N');wwv_flow_api.create_worksheet_rpt( p_id=>wwv_flow_api.id(327544738181053098),p_application_user=>'APXWS_DEFAULT',p_report_seq=>10,p_report_alias=>'3275454',p_status=>'PUBLIC',p_is_default=>'Y',p_display_rows=>50,p_report_columns=>'USER_ID:USER_FIRSTNAME:USER_LASTNAME:USER_EMAIL:USER_PASSWORD:USER_PHONE:USER_INVOICING_ADDRESS:USER_DELIVERY_ADDRESS:UPDATED_DATE:UPDATED_BY:ROLE_NAMES:CREATED_DATE',p_flashback_enabled=>'N');wwv_flow_api.create_page_plug( p_id=>wwv_flow_api.id(327543911947049040),p_plug_name=>'Breadcrumb',p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle',p_component_template_options=>'#DEFAULT#',p_plug_template=>wwv_flow_api.id(327274899983455556),p_plug_display_sequence=>10,p_include_in_reg_disp_sel_yn=>'N',p_plug_display_point=>'REGION_POSITION_01',p_menu_id=>wwv_flow_api.id(327305317139455601),p_plug_source_type=>'NATIVE_BREADCRUMB',p_menu_template_id=>wwv_flow_api.id(327293780686455585),p_plug_query_row_template=>1);wwv_flow_api.create_page_button( p_id=>wwv_flow_api.id(327542423753049035),p_button_sequence=>20,p_button_plug_id=>wwv_flow_api.id(327536230207049026),p_button_name=>'CREATE',p_button_action=>'REDIRECT_PAGE',p_button_template_options=>'#DEFAULT#',p_button_template_id=>wwv_flow_api.id(327293267790455585),p_button_is_hot=>'Y',p_button_image_alt=>'Create',p_button_position=>'RIGHT_OF_IR_SEARCH_BAR',p_button_redirect_url=>'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:201::');wwv_flow_api.create_page_da_event( p_id=>wwv_flow_api.id(327541549655049035),p_name=>'on dialog close ',p_event_sequence=>10,p_triggering_element_type=>'REGION',p_triggering_region_id=>wwv_flow_api.id(327536230207049026),p_bind_type=>'bind',p_bind_event_type=>'apexafterclosedialog');wwv_flow_api.create_page_da_action( p_id=>wwv_flow_api.id(372551849173889417),p_event_id=>wwv_flow_api.id(327541549655049035),p_event_result=>'TRUE',p_action_sequence=>10,p_execute_on_page_init=>'N',p_action=>'NATIVE_JAVASCRIPT_CODE',p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2('apex.message.showPageSuccess(this.data.successMessage.text);','')));wwv_flow_api.create_page_da_action( p_id=>wwv_flow_api.id(327542032281049035),p_event_id=>wwv_flow_api.id(327541549655049035),p_event_result=>'TRUE',p_action_sequence=>20,p_execute_on_page_init=>'N',p_action=>'NATIVE_REFRESH',p_affected_elements_type=>'REGION',p_affected_region_id=>wwv_flow_api.id(327536230207049026));end;/