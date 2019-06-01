CREATE OR REPLACE PACKAGE SOK_ROLE_UTIL
AS
  /* FUNCTION role_name_exists
  ** Check if current role_name already exists, e.g. does not exist 
  ** return true if the role already exists, else return false;
  */
  FUNCTION role_name_exists(
      val_role_name IN SOK_ROLE_LU.role_name%TYPE)
    RETURN BOOLEAN;
  /* PROCEDURE c_role
  ** Create role
  */
  PROCEDURE c_role(
      val_role_code IN SOK_ROLE_LU.role_code%TYPE,
      val_role_name IN SOK_ROLE_LU.role_name%TYPE);

  /* PROCEDURE u_role
  ** Update a role in SOK_ROLE_LU
  */
  PROCEDURE u_role (
      val_role_code IN SOK_ROLE_LU.role_code%TYPE,
      val_role_name IN SOK_ROLE_LU.role_name%TYPE);

  /* PROCEDURE d_role
  ** Delete a role from SOK_ROLE_LU
  */
  PROCEDURE d_role (
    val_role_name IN SOK_ROLE_LU.role_name%TYPE);
END SOK_ROLE_UTIL;
/