CREATE OR REPLACE PACKAGE BODY SOK_USER_ROLE_UTIL
AS 

  /* FUNCTION c_user_role
  ** Create user_role
  */
  PROCEDURE c_user_role(
      val_user_id IN SOK_USER_ROLE.user_id%TYPE,
      val_role_code IN SOK_USER_ROLE.role_code%TYPE)
  IS
    loc_count   NUMBER := 0;
  begin
    select count(user_id)
    into loc_count
    from SOK_USER_ROLE
    where user_id = val_user_id and role_code = val_role_code;
    if loc_count = 0 then
      insert into SOK_USER_ROLE 
      (
        user_id,
        role_code
      )
      values 
      (
        val_user_id,
        val_role_code
      );
    end if;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Create user_role" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Create user_role" failed. '||SQLERRM);
  END c_user_role;

  /* PROCEDURE d_user_role
  ** Delete a user_role from SOK_USER_ROLE
  */
  PROCEDURE d_user_role (
    val_user_id IN SOK_USER_ROLE.user_id%TYPE,
    val_role_code IN SOK_USER_ROLE.role_code%TYPE)
  IS 
  BEGIN
    DELETE FROM SOK_USER_ROLE
    WHERE user_id = val_user_id AND role_code = val_role_code;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Delete user_role" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Delete user_role" failed. '||SQLERRM);       
  END d_user_role;

  /* PROCEDURE d_all_user_role
  ** Delete all role associated to a given user from SOK_USER_ROLE_LU
  */
  PROCEDURE d_all_user_role (
    val_user_id IN SOK_USER_ROLE.user_id%TYPE)
  IS 
  BEGIN
    DELETE FROM SOK_USER_ROLE
    WHERE user_id = val_user_id;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Delete all role of the given user" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Delete all role of the given user" failed. '||SQLERRM);       
  END d_all_user_role;

END SOK_USER_ROLE_UTIL;
/