CREATE OR REPLACE PACKAGE BODY SOK_PRODUCT_PRICE_UTIL
AS
  /* FUNCTION get_current_price
  ** Displays the current price of a given product 
  ** returns the current price;
  */
  FUNCTION get_current_price(
      val_product_id IN SOK_PRODUCT_PRICE_LU.product_id%TYPE)
    RETURN SOK_PRODUCT_PRICE_LU.product_price_amount%TYPE
  IS
    loc_current_price SOK_PRODUCT_PRICE_LU.product_price_amount%TYPE;
  BEGIN
    SELECT product_price_amount 
    INTO loc_current_price
    FROM SOK_PRODUCT_PRICE_LU
    WHERE product_id = val_product_id AND ROWNUM<2
    ORDER BY created_date DESC; 
    RETURN loc_current_price;
  EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('Process "Get current product price" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Get current product price" failed. '||SQLERRM);
  END get_current_price;

  /* FUNCTION get_paid_price
  ** Displays the price of a product based on the date it was ordered and takes into account price changes 
  ** returns the price that was paid at the time of the given order;
  */
  FUNCTION get_paid_price(
      val_product_id IN SOK_PRODUCT_PRICE_LU.product_id%TYPE,
      val_order_id IN SOK_ORDER.order_id%TYPE)
    RETURN SOK_PRODUCT_PRICE_LU.product_price_amount%TYPE
  IS
    loc_paid_price SOK_PRODUCT_PRICE_LU.product_price_amount%TYPE;
  BEGIN
    SELECT product_price_amount 
    INTO loc_paid_price
    FROM SOK_PRODUCT_PRICE_LU
    WHERE product_id = val_product_id AND created_date < (select created_date from sok_order where order_id = val_order_id) AND ROWNUM <2 
    ORDER BY created_date DESC; 
    RETURN loc_paid_price;
  EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('Process "Get paid product price" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Get paid product price" failed. '||SQLERRM);
  END get_paid_price;
  /* FUNCTION c_product_price
  ** Create product_price
  */
  PROCEDURE c_product_price(
    val_product_price_amount IN SOK_PRODUCT_PRICE_LU.product_price_amount%TYPE,
    val_product_id IN SOK_PRODUCT_PRICE_LU.product_id%TYPE)
  IS
  begin
      insert into SOK_PRODUCT_PRICE_LU 
      (
        product_id,
        product_price_amount
      )
      values 
      (
        val_product_id,
        val_product_price_amount
      );
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Create product_price" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Create product_price" failed. '||SQLERRM);
  END c_product_price;

  /* PROCEDURE d_product_price
  ** Delete a product_price from SOK_PRODUCT_PRICE_LU
  */
  PROCEDURE d_product_price (
    val_product_id IN SOK_PRODUCT_PRICE_LU.product_id%TYPE
  )
  IS 
  BEGIN
    DELETE FROM SOK_PRODUCT_PRICE_LU
    WHERE product_id = val_product_id;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Delete product_price" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Delete product_price" failed. '||SQLERRM);       
  END d_product_price;

END SOK_PRODUCT_PRICE_UTIL;
/