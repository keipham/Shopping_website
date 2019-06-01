CREATE OR REPLACE PACKAGE SOK_ORDER_STATUS_UTIL
AS
  /* FUNCTION order_status_name_exists
  ** Check if current order_status_name already exists, e.g. does not exist 
  ** return true if the order_status_name is already exists, else return false;
  */
  FUNCTION order_status_name_exists(
      val_order_status_name IN SOK_ORDER_STATUS_LU.order_status_name%TYPE)
    RETURN BOOLEAN;
  /* PROCEDURE c_order_status
  ** Create order_status
  */
  PROCEDURE c_order_status(
      val_order_status_code IN SOK_ORDER_STATUS_LU.order_status_code%TYPE,
      val_order_status_name IN SOK_ORDER_STATUS_LU.order_status_name%TYPE);

  /* PROCEDURE u_order_status
  ** Update a order_status in SOK_ORDER_STATUS_LU
  */
  PROCEDURE u_order_status (
      val_order_status_code IN SOK_ORDER_STATUS_LU.order_status_code%TYPE,
      val_order_status_name IN SOK_ORDER_STATUS_LU.order_status_name%TYPE);

  /* PROCEDURE d_order_status
  ** Delete a order_status from SOK_ORDER_STATUS_LU
  */
  PROCEDURE d_order_status (
    val_order_status_name IN SOK_ORDER_STATUS_LU.order_status_name%TYPE);
END SOK_ORDER_STATUS_UTIL;
/