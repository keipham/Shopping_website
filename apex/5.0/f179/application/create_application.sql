prompt --application/create_applicationbeginwwv_flow_api.create_flow( p_id=>wwv_flow.g_flow_id,p_display_id=>nvl(wwv_flow_application_install.get_application_id,179),p_owner=>nvl(wwv_flow_application_install.get_schema,'DNG_SOK'),p_name=>nvl(wwv_flow_application_install.get_application_name,'DNG_SOK'),p_alias=>nvl(wwv_flow_application_install.get_application_alias,'DNG_SOK'),p_page_view_logging=>'YES',p_page_protection_enabled_y_n=>'Y',p_checksum_salt=>'8375BD05FC6F5194885197E1A8239BAB2B255D6D55C003F6C8DA48028589916D',p_bookmark_checksum_function=>'SH512',p_compatibility_mode=>'5.1',p_flow_language=>'en',p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE',p_direction_right_to_left=>'N',p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,''),p_authentication=>'PLUGIN',p_authentication_id=>wwv_flow_api.id(327974156802703843),p_application_tab_set=>0,p_logo_image=>'TEXT:SOCK.com',p_logo_image_attributes=>'style="font-family:Arial; color:#FFFFFF; font-size:22px; white-space:nowrap; font-weight:bold;"',p_public_user=>'APEX_PUBLIC_USER',p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,''),p_flow_version=>'release 1.0',p_flow_status=>'AVAILABLE_W_EDIT_LINK',p_flow_unavailable_text=>'This application is currently unavailable at this time.',p_exact_substitutions_only=>'Y',p_browser_cache=>'N',p_browser_frame=>'D',p_rejoin_existing_sessions=>'N',p_csv_encoding=>'Y',p_auto_time_zone=>'N',p_last_updated_by=>'defaultUser',p_last_upd_yyyymmddhh24miss=>'20000101000000',p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,''),p_ui_type_name => null);end;/