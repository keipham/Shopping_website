CREATE OR REPLACE PACKAGE SOK_USER_ROLE_UTIL
AS
  
  /* PROCEDURE c_user_role
  ** Create role
  */
  PROCEDURE c_user_role(
      val_user_id IN SOK_USER_ROLE.user_id%TYPE,
      val_role_code IN SOK_USER_ROLE.role_code%TYPE);

  /* PROCEDURE d_user_role
  ** Delete a role from SOK_USER_ROLE_LU
  */
  PROCEDURE d_user_role (
    val_user_id IN SOK_USER_ROLE.user_id%TYPE,
    val_role_code IN SOK_USER_ROLE.role_code%TYPE);

  /* PROCEDURE d_all_user_role
  ** Delete all role associated to a given user from SOK_USER_ROLE_LU
  */
  PROCEDURE d_all_user_role (
    val_user_id IN SOK_USER_ROLE.user_id%TYPE);
    
END SOK_USER_ROLE_UTIL;
/