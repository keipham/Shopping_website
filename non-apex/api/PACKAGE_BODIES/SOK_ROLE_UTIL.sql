CREATE OR REPLACE PACKAGE BODY SOK_ROLE_UTIL
AS
  /* FUNCTION role_name_exists
  ** Check if current role_name already exists, e.g. does not exist 
  ** return true if the role already exists, else return false;
  */
  FUNCTION role_name_exists(
      val_role_name IN SOK_ROLE_LU.role_name%TYPE)
    RETURN BOOLEAN
  IS
	loc_count INTEGER := 0;
  BEGIN
    SELECT count(role_name)
    INTO loc_count
    FROM SOK_ROLE_LU
    WHERE role_name = val_role_name;
    IF loc_count = 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('Process "Check if role name exists" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Check if role name exists" failed. '||SQLERRM);
  END role_name_exists;
  /* FUNCTION c_role
  ** Create role
  */
  PROCEDURE c_role(
      val_role_code IN SOK_ROLE_LU.role_code%TYPE,
      val_role_name IN SOK_ROLE_LU.role_name%TYPE)
  IS
    loc_count NUMBER := 0;
  begin
    select count(role_code)
    into loc_count
    from SOK_ROLE_LU
    where role_code = val_role_code;
    if loc_count = 0 then
      insert into SOK_ROLE_LU 
      (
        role_code,
        role_name
      )
      values 
      (
        val_role_code,
        val_role_name
      );
    end if;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Create role" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Create role" failed. '||SQLERRM);
  END c_role;

  /* PROCEDURE u_role
  ** Update a role in SOK_ROLE_LU
  */
  PROCEDURE u_role (
      val_role_code IN SOK_ROLE_LU.role_code%TYPE,
      val_role_name IN SOK_ROLE_LU.role_name%TYPE)
  IS
  BEGIN
      UPDATE SOK_ROLE_LU
      SET
          role_name = val_role_name
      WHERE
          role_code = val_role_code;
  EXCEPTION
  WHEN OTHERS THEN
      logger.log_error('Process "Update role" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Update role" failed. '||SQLERRM);         
  END u_role;

  /* PROCEDURE d_role
  ** Delete a role from SOK_ROLE_LU
  */
  PROCEDURE d_role (
    val_role_name IN SOK_ROLE_LU.role_name%TYPE)
  IS 
  BEGIN
    DELETE FROM SOK_ROLE_LU
    WHERE role_name = val_role_name;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Delete role" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Delete role" failed. '||SQLERRM);       
  END d_role;

END SOK_ROLE_UTIL;
/