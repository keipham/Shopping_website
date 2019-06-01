CREATE OR REPLACE PACKAGE SOK_SEX_TYPE_UTIL
AS
  /* FUNCTION sex_type_name_exists
  ** Check if current sex_type_name already exists, e.g. does not exist 
  ** return true if the sex_type already exists, else return false;
  */
  FUNCTION sex_type_exists(
      val_sex_name IN SOK_SEX_TYPE_LU.sex_name%TYPE)
    RETURN BOOLEAN;
  /* PROCEDURE c_sex_type
  ** Create sex_type
  */
  PROCEDURE c_sex_type(
      val_sex_code IN SOK_SEX_TYPE_LU.sex_code%TYPE,
      val_sex_name IN SOK_SEX_TYPE_LU.sex_name%TYPE);

  /* PROCEDURE u_sex_type
  ** Update a sex_type in SOK_SEX_TYPE_LU
  */
  PROCEDURE u_sex_type (
      val_sex_code IN SOK_SEX_TYPE_LU.sex_code%TYPE,
      val_sex_name IN SOK_SEX_TYPE_LU.sex_name%TYPE);

  /* PROCEDURE d_sex_type
  ** Delete a sex_type from SOK_SEX_TYPE_LU
  */
  PROCEDURE d_sex_type (
    val_sex_name IN SOK_SEX_TYPE_LU.sex_name%TYPE);
END SOK_SEX_TYPE_UTIL;
/