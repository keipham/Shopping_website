CREATE OR REPLACE PACKAGE SOK_USER_UTIL
AS
  /* FUNCTION user_email_exists
  ** Check if current user's email is already used, e.g. not used 
  ** return true if the email is already associated with another account, else return false;
  */
  FUNCTION user_email_exists(
      val_user_email IN SOK_USER.user_email%TYPE)
    RETURN BOOLEAN;
	
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
    val_user_delivery_address in SOK_USER.user_delivery_address%TYPE);

  /* FUNCTION login_user
  ** Check if user's email and password are correct to login 
  ** return true if they exists in database, else return false;
  */
  FUNCTION login_user (
    p_username in SOK_USER.user_email%type,
    p_password in SOK_USER.user_password%type )
    return boolean;

  /* Function c_user
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
      RETURN SOK_USER.user_id%TYPE;

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
    val_user_delivery_address IN SOK_USER.user_delivery_address%TYPE);
  
  /* PROCEDURE d_user
  ** Delete a user from SOK_USER
  */
  PROCEDURE d_user (
    val_user_id IN SOK_USER.user_id%TYPE);
END SOK_USER_UTIL;
/