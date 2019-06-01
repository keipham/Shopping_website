CREATE OR REPLACE PACKAGE SOK_PRODUCT_PRICE_UTIL
AS
  /* FUNCTION current_price
  ** Displays the current price of a given product 
  ** returns the current price;
  */
  FUNCTION get_current_price(
      val_product_id IN SOK_PRODUCT_PRICE_LU.product_id%TYPE)
    RETURN SOK_PRODUCT_PRICE_LU.product_price_amount%TYPE;
  /* FUNCTION paid_price
  ** Displays the price of a product based on the date it was ordered and takes into account price changes 
  ** returns the price that was paid at the time of the given order;
  */
  FUNCTION get_paid_price(
      val_product_id IN SOK_PRODUCT_PRICE_LU.product_id%TYPE,
      val_order_id IN SOK_ORDER.order_id%TYPE)
    RETURN SOK_PRODUCT_PRICE_LU.product_price_amount%TYPE;
  /* PROCEDURE c_product_price
  ** Create product_price
  */
  PROCEDURE c_product_price(
      val_product_price_amount IN SOK_PRODUCT_PRICE_LU.product_price_amount%TYPE,
      val_product_id IN SOK_PRODUCT_PRICE_LU.product_id%TYPE);

  /* PROCEDURE d_product_price
  ** Delete a product_price from SOK_PRODUCT_PRICE_LU
  */
  PROCEDURE d_product_price (
    val_product_id IN SOK_PRODUCT_PRICE_LU.product_id%TYPE);
END SOK_PRODUCT_PRICE_UTIL;
/