CREATE OR REPLACE PACKAGE SOK_ORDER_CONTENT_UTIL
AS
  /* PROCEDURE c_order_content
  ** Create role
  */
  PROCEDURE c_order_content(
      val_order_id IN SOK_ORDER_CONTENT.order_id%TYPE,
      val_product_detail_id IN SOK_ORDER_CONTENT.product_detail_id%TYPE,
      val_order_product_quantity IN SOK_ORDER_CONTENT.order_product_quantity%TYPE);
  
  /* PROCEDURE u_order_content
  ** Update an order content in SOK_ORDER_CONTENT
  */
  PROCEDURE u_order_content (
      val_order_id IN SOK_ORDER_CONTENT.order_id%TYPE,
      val_product_detail_id IN SOK_ORDER_CONTENT.product_detail_id%TYPE,
      val_order_product_quantity IN SOK_ORDER_CONTENT.order_product_quantity%TYPE);

  /* PROCEDURE d_order_content_product
  ** Delete an order_content product from SOK_ORDER_CONTENT
  */
  PROCEDURE d_order_content_product (
    val_order_id IN SOK_ORDER_CONTENT.order_id%TYPE,
    val_product_detail_id IN SOK_ORDER_CONTENT.product_detail_id%TYPE);

  /* PROCEDURE d_order_content
  ** Delete a role from SOK_ORDER_CONTENT
  */
  PROCEDURE d_order_content (
      val_order_id IN SOK_ORDER_CONTENT.order_id%TYPE);
    
END SOK_ORDER_CONTENT_UTIL;
/