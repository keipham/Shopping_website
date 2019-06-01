CREATE OR REPLACE PACKAGE BODY SOK_SEX_TYPE_UTIL
AS
  /* FUNCTION sex_type_name_exists
  ** Check if current sex_type_name already exists, e.g. does not exist 
  ** return true if the sex_type already exists, else return false;
  */
  FUNCTION sex_type_exists(
      val_sex_name IN SOK_SEX_TYPE_LU.sex_name%TYPE)
    RETURN BOOLEAN
  IS
	loc_count INTEGER := 0;
  BEGIN
    SELECT count(sex_name)
    INTO loc_count
    FROM SOK_SEX_TYPE_LU
    WHERE sex_name = val_sex_name;
    IF loc_count = 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('Process "Check if sex type exists" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Check if sex type exists" failed. '||SQLERRM);
  END sex_type_exists;
  /* FUNCTION c_sex_type
  ** Create sex_type
  */
  PROCEDURE c_sex_type(
      val_sex_code IN SOK_SEX_TYPE_LU.sex_code%TYPE,
      val_sex_name IN SOK_SEX_TYPE_LU.sex_name%TYPE)
  IS
    loc_count   NUMBER := 0;
  begin
    select count(sex_code)
    into loc_count
    from SOK_SEX_TYPE_LU
    where sex_code = val_sex_code;
    if loc_count = 0 then
      insert into SOK_SEX_TYPE_LU 
      (
        sex_code,
        sex_name
      )
      values 
      (
        val_sex_code,
        val_sex_name
      );
    end if;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Create sex_type" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Create sex_type" failed. '||SQLERRM);
  END c_sex_type;

  /* PROCEDURE u_sex_type
  ** Update a sex_type in SOK_SEX_TYPE_LU
  */
  PROCEDURE u_sex_type (
      val_sex_code IN SOK_SEX_TYPE_LU.sex_code%TYPE,
      val_sex_name IN SOK_SEX_TYPE_LU.sex_name%TYPE)
  IS
  BEGIN
      UPDATE SOK_SEX_TYPE_LU
      SET
          sex_name = val_sex_name
      WHERE
          sex_code = val_sex_code;
  EXCEPTION
  WHEN OTHERS THEN
      logger.log_error('Process "Update sex_type" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Update sex_type" failed. '||SQLERRM);         
  END u_sex_type;

  /* PROCEDURE d_sex_type
  ** Delete a sex_type from SOK_SEX_TYPE_LU
  */
  PROCEDURE d_sex_type (
    val_sex_name IN SOK_SEX_TYPE_LU.sex_name%TYPE)
  IS 
  BEGIN
    DELETE FROM SOK_SEX_TYPE_LU
    WHERE sex_name = val_sex_name;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Delete sex_type" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Delete sex_type" failed. '||SQLERRM);       
  END d_sex_type;

END SOK_SEX_TYPE_UTIL;
/