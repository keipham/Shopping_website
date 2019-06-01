CREATE OR REPLACE PACKAGE BODY SOK_SIZE_RANGE_UTIL
AS
  /* FUNCTION size_range_exists
  ** Check if current size_range already exists, e.g. does not exist 
  ** return true if the size_range already exists, else return false;
  */
  FUNCTION size_range_exists(
      val_size_lower_value IN SOK_SIZE_RANGE_LU.size_lower_value%TYPE,
      val_size_higher_value IN SOK_SIZE_RANGE_LU.size_higher_value%TYPE)
    RETURN BOOLEAN
  IS
	loc_count INTEGER := 0;
  BEGIN
    SELECT count(size_lower_value)
    INTO loc_count
    FROM SOK_SIZE_RANGE_LU
    WHERE size_lower_value = val_size_lower_value AND size_higher_value = val_size_higher_value;
    IF loc_count = 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('Process "Check if size range exists" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Check if size range exists" failed. '||SQLERRM);
  END size_range_exists;
  /* FUNCTION c_size_range
  ** Create size_range
  */
  PROCEDURE c_size_range(
      val_size_range_code IN SOK_SIZE_RANGE_LU.size_range_code%TYPE,
      val_size_lower_value IN SOK_SIZE_RANGE_LU.size_lower_value%TYPE,
      val_size_higher_value IN SOK_SIZE_RANGE_LU.size_higher_value%TYPE)
  IS
    loc_count   NUMBER := 0;
  begin
    select count(size_range_code)
    into loc_count
    from SOK_SIZE_RANGE_LU
    where size_range_code = val_size_range_code;
    if loc_count = 0 then
      insert into SOK_SIZE_RANGE_LU 
      (
        size_range_code,
        size_lower_value,
        size_higher_value
      )
      values 
      (
        val_size_range_code,
        val_size_lower_value,
        val_size_higher_value
      );
    end if;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Create size_range" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Create size_range" failed. '||SQLERRM);
  END c_size_range;

  /* PROCEDURE u_size_range
  ** Update a size_range in SOK_SIZE_RANGE_LU
  */
  PROCEDURE u_size_range (
      val_size_range_code IN SOK_SIZE_RANGE_LU.size_range_code%TYPE,
      val_size_lower_value IN SOK_SIZE_RANGE_LU.size_lower_value%TYPE,
      val_size_higher_value IN SOK_SIZE_RANGE_LU.size_higher_value%TYPE)
  IS
  BEGIN
      UPDATE SOK_SIZE_RANGE_LU
      SET
          size_lower_value = val_size_lower_value,
          size_higher_value = val_size_higher_value
      WHERE
          size_range_code = val_size_range_code;
  EXCEPTION
  WHEN OTHERS THEN
      logger.log_error('Process "Update size_range" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Update size_range" failed. '||SQLERRM);         
  END u_size_range;

  /* PROCEDURE d_size_range
  ** Delete a size_range from SOK_SIZE_RANGE_LU
  */
  PROCEDURE d_size_range (
      val_size_lower_value IN SOK_SIZE_RANGE_LU.size_lower_value%TYPE,
      val_size_higher_value IN SOK_SIZE_RANGE_LU.size_higher_value%TYPE)
  IS 
  BEGIN
    DELETE FROM SOK_SIZE_RANGE_LU
    WHERE size_lower_value = val_size_lower_value AND size_higher_value = val_size_higher_value;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Delete size_range" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Delete size_range" failed. '||SQLERRM);       
  END d_size_range;

END SOK_SIZE_RANGE_UTIL;
/