prompt --application/pages/page_00500beginwwv_flow_api.create_page( p_id=>500,p_user_interface_id=>wwv_flow_api.id(327304041051455600),p_name=>'Administrator Dashboard',p_page_mode=>'NORMAL',p_step_title=>'Dashboard',p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS',p_first_item=>'NO_FIRST_ITEM',p_autocomplete_on_off=>'OFF',p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2('https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js','https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js')),p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2('https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css','https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css')),p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2('','body{','    font-family: ''Comic Sans MS'';','}')),p_page_template_options=>'#DEFAULT#',p_overwrite_navigation_list=>'N',p_page_is_public_y_n=>'N',p_cache_mode=>'NOCACHE',p_last_updated_by=>'defaultUser',p_last_upd_yyyymmddhh24miss=>'20000101000000');wwv_flow_api.create_report_region( p_id=>wwv_flow_api.id(382899633060154228),p_name=>'Dashboard',p_template=>wwv_flow_api.id(327274899983455556),p_display_sequence=>11,p_include_in_reg_disp_sel_yn=>'Y',p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle',p_component_template_options=>'#DEFAULT#',p_display_point=>'BODY',p_source=>wwv_flow_string.join(wwv_flow_t_varchar2('Select 1 as sort_order,','''Users'' title,','to_char(count(distinct user_id)) data,','''glyphicon glyphicon-user'' as icon_class,','''dash-box-color-1'' as class1,','''f?p=&APP_ID.:200:&SESSION.::&DEBUG.::::'' AS link','from SOK_USER_ROLE_VW','union all','Select 2 as sort_order,','''Roles'' title,','to_char(count(distinct role_code)) data,','''glyphicon glyphicon-cloud'' as icon_class,','''dash-box-color-2'' as class1,','''f?p=&APP_ID.:8:&SESSION.::&DEBUG.::::'' AS link','from SOK_USER_ROLE_VW','union all','Select 3 as sort_order,','''Products'' title,','to_char(count(distinct product_id)) data,','''glyphicon glyphicon-gift'' as icon_class,','''dash-box-color-3'' as class1,','''f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'' AS link','from SOK_PRODUCT_DETAIL_LU','union all','Select 4 as sort_order,','''New Order'' title,','to_char(count(distinct order_id)) data,','''glyphicon glyphicon-plane'' as icon_class,','''dash-box-color-4'' as class1,','''f?p=&APP_ID.:14:&SESSION.::&DEBUG.::::'' AS link','from SOK_ORDER_CONTENT_DETAIL_VW','where order_status_code = ''PAID''')),p_source_type=>'NATIVE_SQL_REPORT',p_header=>wwv_flow_string.join(wwv_flow_t_varchar2('<style>','  .javainhand {','   float: left;','    height: -22px;','    margin-right: 1%;','    padding: 5px;','    position: relative;','    width: 24%;','}','.dash-box {','    position: relative;','    background: rgb(255, 86, 65);','    background: -moz-linear-gradient(top, rgba(255, 86, 65, 1) 0%, rgba(253, 50, 97, 1) 100%);','    background: -webkit-linear-gradient(top, rgba(255, 86, 65, 1) 0%, rgba(253, 50, 97, 1) 100%);','    background: linear-gradient(to bottom, rgba(255, 86, 65, 1) 0%, rgba(253, 50, 97, 1) 100%);','    filter: progid: DXImageTransform.Microsoft.gradient( startColorstr=''#ff5641'', endColorstr=''#fd3261'', GradientType=0);','    border-radius: 4px;','    text-align: center;','    margin: 60px 0 50px;','}','.dash-box-icon {','    position: absolute;','    transform: translateY(-50%) translateX(-50%);','    left: 50%;','}','.dash-box-action {','    transform: translateY(-50%) translateX(-50%);','    position: absolute;','    left: 50%;','}','.dash-box-body {','    padding: 50px 20px;','}','.dash-box-icon:after {','    width: 60px;','    height: 60px;','    position: absolute;','    background: rgba(247, 148, 137, 0.91);','    content: '''';','    border-radius: 50%;','    left: -10px;','    top: -10px;','    z-index: -1;','}','.dash-box-icon > i {','    background: #ff5444;','    border-radius: 50%;','    line-height: 40px;','    color: #FFF;','    width: 40px;','    height: 40px;','	font-size:22px;','}','.dash-box-icon:before {','    width: 75px;','    height: 75px;','    position: absolute;','    background: rgba(253, 162, 153, 0.34);','    content: '''';','    border-radius: 50%;','    left: -17px;','    top: -17px;','    z-index: -2;','}','.dash-box-action > button {','    border: none;','    background: #FFF;','    border-radius: 19px;','    padding: 7px 16px;','    text-transform: uppercase;','    font-weight: 500;','    font-size: 11px;','    letter-spacing: .5px;','    color: #003e85;','    box-shadow: 0 3px 5px #d4d4d4;','}','.dash-box-body > .dash-box-count {','    display: block;','    font-size: 30px;','    color: #FFF;','    font-weight: 300;','}','.dash-box-body > .dash-box-title {','    font-size: 13px;','    color: rgba(255, 255, 255, 0.81);','}','','.dash-box.dash-box-color-2 {','    background: rgb(252, 190, 27);','    background: -moz-linear-gradient(top, rgba(252, 190, 27, 1) 1%, rgba(248, 86, 72, 1) 99%);','    background: -webkit-linear-gradient(top, rgba(252, 190, 27, 1) 1%, rgba(248, 86, 72, 1) 99%);','    background: linear-gradient(to bottom, rgba(252, 190, 27, 1) 1%, rgba(248, 86, 72, 1) 99%);','    filter: progid: DXImageTransform.Microsoft.gradient( startColorstr=''#fcbe1b'', endColorstr=''#f85648'', GradientType=0);','}','.dash-box-color-2 .dash-box-icon:after {','    background: rgba(254, 224, 54, 0.81);','}','.dash-box-color-2 .dash-box-icon:before {','    background: rgba(254, 224, 54, 0.64);','}','.dash-box-color-2 .dash-box-icon > i {','    background: #fb9f28;','}','','.dash-box.dash-box-color-3 {','    background: rgb(183,71,247);','    background: -moz-linear-gradient(top, rgba(183,71,247,1) 0%, rgba(108,83,220,1) 100%);','    background: -webkit-linear-gradient(top, rgba(183,71,247,1) 0%,rgba(108,83,220,1) 100%);','    background: linear-gradient(to bottom, rgba(183,71,247,1) 0%,rgba(108,83,220,1) 100%);','    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=''#b747f7'', endColorstr=''#6c53dc'',GradientType=0 );','}','.dash-box-color-3 .dash-box-icon:after {','    background: rgba(180, 70, 245, 0.76);','}','.dash-box-color-3 .dash-box-icon:before {','    background: rgba(226, 132, 255, 0.66);','}','.dash-box-color-3 .dash-box-icon > i {','    background: #8150e4;','}','  </style>')),p_ajax_enabled=>'Y',p_query_row_template=>wwv_flow_api.id(394576337588452462),p_query_num_rows=>15,p_query_options=>'DERIVED_REPORT_COLUMNS',p_query_show_nulls_as=>'-',p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST',p_pagination_display_position=>'BOTTOM_RIGHT',p_csv_output=>'N',p_prn_output=>'N',p_sort_null=>'L',p_plug_query_strip_html=>'N');wwv_flow_api.create_report_columns( p_id=>wwv_flow_api.id(394553297854987601),p_query_column_id=>1,p_column_alias=>'SORT_ORDER',p_column_display_sequence=>1,p_column_heading=>'Sort order',p_use_as_row_header=>'N',p_disable_sort_column=>'N',p_derived_column=>'N',p_include_in_export=>'Y');wwv_flow_api.create_report_columns( p_id=>wwv_flow_api.id(394553435279987602),p_query_column_id=>2,p_column_alias=>'TITLE',p_column_display_sequence=>2,p_column_heading=>'Title',p_use_as_row_header=>'N',p_disable_sort_column=>'N',p_derived_column=>'N',p_include_in_export=>'Y');wwv_flow_api.create_report_columns( p_id=>wwv_flow_api.id(394553512908987603),p_query_column_id=>3,p_column_alias=>'DATA',p_column_display_sequence=>3,p_column_heading=>'Data',p_use_as_row_header=>'N',p_disable_sort_column=>'N',p_derived_column=>'N',p_include_in_export=>'Y');wwv_flow_api.create_report_columns( p_id=>wwv_flow_api.id(394553657767987604),p_query_column_id=>4,p_column_alias=>'ICON_CLASS',p_column_display_sequence=>4,p_column_heading=>'Icon class',p_use_as_row_header=>'N',p_disable_sort_column=>'N',p_derived_column=>'N',p_include_in_export=>'Y');wwv_flow_api.create_report_columns( p_id=>wwv_flow_api.id(394553760345987605),p_query_column_id=>5,p_column_alias=>'CLASS1',p_column_display_sequence=>5,p_column_heading=>'Class1',p_use_as_row_header=>'N',p_disable_sort_column=>'N',p_derived_column=>'N',p_include_in_export=>'Y');wwv_flow_api.create_report_columns( p_id=>wwv_flow_api.id(394553978548987607),p_query_column_id=>6,p_column_alias=>'LINK',p_column_display_sequence=>6,p_column_heading=>'Link',p_use_as_row_header=>'N',p_disable_sort_column=>'N',p_derived_column=>'N',p_include_in_export=>'Y');end;/