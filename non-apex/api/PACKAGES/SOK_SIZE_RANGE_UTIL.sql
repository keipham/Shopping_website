CREATE OR REPLACE PACKAGE SOK_SIZE_RANGE_UTIL
AS
  /* FUNCTION size_range_exists
  ** Check if current size_range already exists, e.g. does not exist 
  ** return true if the size_range already exists, else return false;
  */
  FUNCTION size_range_exists(
      val_size_lower_value IN SOK_SIZE_RANGE_LU.size_lower_value%TYPE,
      val_size_higher_value IN SOK_SIZE_RANGE_LU.size_higher_value%TYPE)
    RETURN BOOLEAN;
  /* PROCEDURE c_size_range
  ** Create size_range
  */
  PROCEDURE c_size_range(
      val_size_range_code IN SOK_SIZE_RANGE_LU.size_range_code%TYPE,
      val_size_lower_value IN SOK_SIZE_RANGE_LU.size_lower_value%TYPE,
      val_size_higher_value IN SOK_SIZE_RANGE_LU.size_higher_value%TYPE);

  /* PROCEDURE u_size_range
  ** Update a size_range in SOK_SIZE_RANGE_LU
  */
  PROCEDURE u_size_range (
      val_size_range_code IN SOK_SIZE_RANGE_LU.size_range_code%TYPE,
      val_size_lower_value IN SOK_SIZE_RANGE_LU.size_lower_value%TYPE,
      val_size_higher_value IN SOK_SIZE_RANGE_LU.size_higher_value%TYPE);

  /* PROCEDURE d_size_range
  ** Delete a size_range from SOK_SIZE_RANGE_LU
  */
  PROCEDURE d_size_range (
      val_size_lower_value IN SOK_SIZE_RANGE_LU.size_lower_value%TYPE,
      val_size_higher_value IN SOK_SIZE_RANGE_LU.size_higher_value%TYPE);
END SOK_SIZE_RANGE_UTIL;
/