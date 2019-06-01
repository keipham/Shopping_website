CREATE OR REPLACE PACKAGE BODY SOK_ORDER_CONTENT_UTIL
AS
  /* FUNCTION c_order_content
  ** Create order_content
  */
  PROCEDURE c_order_content(
      val_order_id IN SOK_ORDER_CONTENT.order_id%TYPE,
      val_product_detail_id IN SOK_ORDER_CONTENT.product_detail_id%TYPE,
      val_order_product_quantity IN SOK_ORDER_CONTENT.order_product_quantity%TYPE)
  IS
  begin
      insert into SOK_ORDER_CONTENT 
      (
        order_id,
        product_detail_id,
        order_product_quantity
      )
      values 
      (
        val_order_id,
        val_product_detail_id,
        val_order_product_quantity
      );
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Create order_content" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Create order_content" failed. '||SQLERRM);
  END c_order_content;
  /* PROCEDURE u_order_content
  ** Update an order content in SOK_ORDER_CONTENT
  */
  PROCEDURE u_order_content (
    val_order_id IN SOK_ORDER_CONTENT.order_id%TYPE,
    val_product_detail_id IN SOK_ORDER_CONTENT.product_detail_id%TYPE,
    val_order_product_quantity IN SOK_ORDER_CONTENT.order_product_quantity%TYPE)
  IS
  BEGIN
      UPDATE SOK_ORDER_CONTENT
      SET
          order_product_quantity = val_order_product_quantity
      WHERE
          order_id = val_order_id AND product_detail_id = val_product_detail_id;
  EXCEPTION
  WHEN OTHERS THEN
      logger.log_error('Process "Update order_content" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Update order_content" failed. '||SQLERRM);         
  END u_order_content;

  /* PROCEDURE d_order_content_product
  ** Delete an order_content product from SOK_ORDER_CONTENT
  */
  PROCEDURE d_order_content_product (
    val_order_id IN SOK_ORDER_CONTENT.order_id%TYPE,
    val_product_detail_id IN SOK_ORDER_CONTENT.product_detail_id%TYPE)
  IS 
  BEGIN
    DELETE FROM SOK_ORDER_CONTENT
    WHERE order_id = val_order_id AND product_detail_id = val_product_detail_id;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Delete order_content" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Delete order_content" failed. '||SQLERRM);       
  END d_order_content_product;

  /* PROCEDURE d_order_content
  ** Delete an order_content from SOK_ORDER_CONTENT
  */
  PROCEDURE d_order_content (
    val_order_id IN SOK_ORDER_CONTENT.order_id%TYPE)
  IS 
  BEGIN
    DELETE FROM SOK_ORDER_CONTENT
    WHERE order_id = val_order_id;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Delete order_content" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Delete order_content" failed. '||SQLERRM);       
  END d_order_content;

END SOK_ORDER_CONTENT_UTIL;
/