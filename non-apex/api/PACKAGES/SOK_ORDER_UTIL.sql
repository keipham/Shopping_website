CREATE OR REPLACE PACKAGE SOK_ORDER_UTIL
AS
  /* FUNCTION c_order
  ** Create order
  */
  FUNCTION c_order(
      val_user_id IN SOK_ORDER.user_id%TYPE,
      val_order_status_code IN SOK_ORDER.order_status_code%TYPE)
      RETURN SOK_ORDER.order_id%TYPE;

  /* FUNCTION u_order
  ** Update an order in SOK_ORDER
  */
  FUNCTION u_order (
      val_order_id IN SOK_ORDER.order_id%TYPE,
      val_order_status_code IN SOK_ORDER.order_status_code%TYPE)
      RETURN SOK_ORDER.order_status_code%TYPE;

  /* PROCEDURE d_order
  ** Delete an order from SOK_ORDER
  */
  PROCEDURE d_order (
    val_order_id IN SOK_ORDER.order_id%TYPE);
END SOK_ORDER_UTIL;
/