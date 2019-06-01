create or replace PACKAGE BODY SOK_USER_UTIL
AS
  /* FUNCTION user_email_exists
  ** Check if current user's email already exists, e.g. does not exist 
  ** return true if the email is already associated with another account, else return false;
  */
  FUNCTION user_email_exists(
      val_user_email IN SOK_USER.user_email%TYPE)
    RETURN BOOLEAN
  IS
	loc_count INTEGER := 0;
  BEGIN
    SELECT count(user_email)
    INTO loc_count
    FROM sok_user
    WHERE user_email = val_user_email;
    IF loc_count     = 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Check if user email exists" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Check if user email exists" failed. '||SQLERRM);
  END user_email_exists;

  /* PROCEDURE register_user
  ** Create user and associate "USER" role by default
  */

  PROCEDURE register_user (
    val_user_firstname in SOK_USER.user_firstname%TYPE,
    val_user_lastname in SOK_USER.user_lastname%TYPE,
    val_user_email in SOK_USER.user_email%TYPE,
    val_user_phone in SOK_USER.user_phone%TYPE,
    val_user_password in SOK_USER.user_password%TYPE,
    val_user_invoicing_address in SOK_USER.user_invoicing_address%TYPE,
    val_user_delivery_address in SOK_USER.user_delivery_address%TYPE)
    is
      loc_user_id   SOK_USER.user_id%TYPE;
      loc_role_code SOK_USER_ROLE.role_code%TYPE := 'USER';
      loc_count     NUMBER := 0;
    begin
      select count(user_id)
      into loc_count
      from SOK_USER
      where user_email = val_user_email;
      if loc_count = 0 then
        loc_user_id := SOK_USER_UTIL.c_user(
          val_user_firstname => val_user_firstname,
          val_user_lastname => val_user_lastname,
          val_user_email => val_user_email,
          val_user_password => val_user_password,
          val_user_phone => val_user_phone,
          val_user_invoicing_address => val_user_invoicing_address,
          val_user_delivery_address => val_user_delivery_address
        ) ;
        SOK_USER_ROLE_UTIL.c_user_role(
            val_user_id => loc_user_id,
            val_role_code => loc_role_code 
        );
      end if;
    exception
      when OTHERS then 
        logger.log('Process "register_user" failed' );
    end register_user;

  /* FUNCTION login_user
  ** Check if user's email and password are correct to login 
  ** return true if they exists in database, else return false;
  */
  FUNCTION login_user (
    p_username in SOK_USER.user_email%type,
    p_password in SOK_USER.user_password%type )
    return boolean
    is
      loc_user_email SOK_USER.user_email%type := p_username;
      loc_user_password  SOK_USER.user_password%type := p_password;
      loc_count_email INTEGER := 0;
    begin
      select count(user_email)
      into loc_count_email
      from SOK_USER_ROLE_VW
      where user_email = UPPER(loc_user_email) AND user_password = loc_user_password;
      if loc_count_email > 0 then
        return true;
      else 
        APEX_UTIL.set_custom_auth_status(p_status => 'Your email '''||UPPER(p_username)|| ''' or your password is incorrect. Please review and try again.');
        return false;
      end if;
    exception
      when OTHERS then 
        logger.log('Process "my_authentication" failed');
        APEX_UTIL.set_custom_auth_status(p_status => 'An error occured. Please review and try again.');
    end login_user;

  /* FUNCTION c_user
  ** Create user
  */
  FUNCTION c_user(
      val_user_firstname IN SOK_USER.user_firstname%TYPE,
      val_user_lastname IN SOK_USER.user_lastname%TYPE,
	    val_user_email IN SOK_USER.user_email%TYPE,
	    val_user_password IN SOK_USER.user_password%TYPE,
	    val_user_phone IN SOK_USER.user_phone%TYPE,
	    val_user_invoicing_address IN SOK_USER.user_invoicing_address%TYPE,
	    val_user_delivery_address IN SOK_USER.user_delivery_address%TYPE)
      return SOK_USER.user_id%TYPE
  IS
    loc_user_id SOK_USER.user_id%TYPE;
  begin
      insert into SOK_USER 
      (
        user_firstname,
        user_lastname,
        user_email,
        user_password,
        user_phone,
        user_invoicing_address,
        user_delivery_address
      )
      values 
      (
        val_user_firstname,
        val_user_lastname,
        val_user_email,
        val_user_password,
        val_user_phone,
        val_user_invoicing_address,
        val_user_delivery_address
      ) returning user_id into loc_user_id;
      
      return loc_user_id;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Create user" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Create user" failed. '||SQLERRM);
  END c_user;


    /* PROCEDURE u_user
      ** Update a user in SOK_USER
      */
    PROCEDURE u_user (
      val_user_id IN SOK_USER.USER_id%TYPE,
      val_user_firstname IN SOK_USER.user_firstname%TYPE,
      val_user_lastname IN SOK_USER.user_lastname%TYPE,
	    val_user_email IN SOK_USER.user_email%TYPE,
	    val_user_password IN SOK_USER.user_password%TYPE,
	    val_user_phone IN SOK_USER.user_phone%TYPE,
	    val_user_invoicing_address IN SOK_USER.user_invoicing_address%TYPE,
	    val_user_delivery_address IN SOK_USER.user_delivery_address%TYPE)
    IS
    BEGIN
        UPDATE SOK_USER
        SET
            user_firstname = val_user_firstname,
            user_lastname = val_user_lastname,
            user_email = val_user_email,
            user_password = val_user_password,
            user_phone = val_user_phone,
            user_invoicing_address = val_user_invoicing_address,
            user_delivery_address = val_user_delivery_address
        WHERE
            user_id = val_user_id;
    EXCEPTION
    WHEN OTHERS THEN
        logger.log_error('Process "Update user" failed. '||SQLERRM);
        raise_application_error(-20001, 'Process "Update user" failed. '||SQLERRM);         
    END u_user;

    /* PROCEDURE d_user
    ** Delete a user from SOK_USER
    */
    PROCEDURE d_user (
      val_user_id IN SOK_USER.user_id%TYPE)
    IS 
    BEGIN
      DELETE FROM SOK_USER
      WHERE user_id = val_user_id;
    EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('Process "Delete user" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Delete user" failed. '||SQLERRM);       
    END d_user;

END SOK_USER_UTIL;
/