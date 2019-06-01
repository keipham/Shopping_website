CREATE OR REPLACE PACKAGE BODY SOK_ORDER_STATUS_UTIL
AS
  /* FUNCTION order_status_name_exists
  ** Check if current order_status_name already exists, e.g. does not exist 
  ** return true if the order_status_name already exists, else return false;
  */
  FUNCTION order_status_name_exists(
      val_order_status_name IN SOK_ORDER_STATUS_LU.order_status_name%TYPE)
    RETURN BOOLEAN
  IS
	loc_count INTEGER := 0;
  BEGIN
    SELECT count(order_status_name)
    INTO loc_count
    FROM SOK_ORDER_STATUS_LU
    WHERE order_status_name = val_order_status_name;
    IF loc_count = 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Check if order status name exists" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Check if order status name exists" failed. '||SQLERRM);
  END order_status_name_exists;
  /* FUNCTION c_order_status
  ** Create order_status
  */
  PROCEDURE c_order_status(
      val_order_status_code IN SOK_ORDER_STATUS_LU.order_status_code%TYPE,
      val_order_status_name IN SOK_ORDER_STATUS_LU.order_status_name%TYPE)
  IS
    loc_count   NUMBER := 0;
  begin
    select count(order_status_code)
    into loc_count
    from SOK_ORDER_STATUS_LU
    where order_status_code = val_order_status_code;
    if loc_count = 0 then
      insert into SOK_ORDER_STATUS_LU 
      (
        order_status_code,
        order_status_name
      )
      values 
      (
        val_order_status_code,
        val_order_status_name
      );
    end if;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Create order_status" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Create order_status" failed. '||SQLERRM);
  END c_order_status;

  /* PROCEDURE u_order_status
  ** Update a order_status in SOK_ORDER_STATUS_LU
  */
  PROCEDURE u_order_status (
      val_order_status_code IN SOK_ORDER_STATUS_LU.order_status_code%TYPE,
      val_order_status_name IN SOK_ORDER_STATUS_LU.order_status_name%TYPE)
  IS
  BEGIN
      UPDATE SOK_ORDER_STATUS_LU
      SET
          order_status_name = val_order_status_name
      WHERE
          order_status_code = val_order_status_code;
  EXCEPTION
  WHEN OTHERS THEN
      logger.log_error('Process "Update order_status" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Update order_status" failed. '||SQLERRM);         
  END u_order_status;

  /* PROCEDURE d_order_status
  ** Delete a order_status from SOK_ORDER_STATUS_LU
  */
  PROCEDURE d_order_status (
    val_order_status_name IN SOK_ORDER_STATUS_LU.order_status_name%TYPE)
  IS 
  BEGIN
    DELETE FROM SOK_ORDER_STATUS_LU
    WHERE order_status_name = val_order_status_name;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Delete order_status" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Delete order_status" failed. '||SQLERRM);       
  END d_order_status;

END SOK_ORDER_STATUS_UTIL;
/