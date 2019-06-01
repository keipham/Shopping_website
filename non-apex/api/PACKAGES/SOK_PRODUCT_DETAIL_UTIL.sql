CREATE OR REPLACE PACKAGE SOK_PRODUCT_DETAIL_UTIL
AS

  /* FUNCTION prod_detail_was_ordered
  ** Check if product_detial has already been ordered by a client
  ** return true it has already been ordered, else return false;
  */
  FUNCTION prod_detail_was_ordered(
    val_product_detail_id IN SOK_PRODUCT_DETAIL_LU.product_detail_id%TYPE)
    RETURN BOOLEAN;

  /* PROCEDURE c_product_detail
  ** Create or update product_detail if already exist (the quantity of product detail will be add up to the one already existing)
  */
  PROCEDURE c_product_detail(
      val_size_range_code IN SOK_PRODUCT_DETAIL_LU.size_range_code%TYPE,
      val_sex_code IN SOK_PRODUCT_DETAIL_LU.sex_code%TYPE,
      val_product_id IN SOK_PRODUCT_DETAIL_LU.product_id%TYPE,
      val_product_detail_stock IN SOK_PRODUCT_DETAIL_LU.product_detail_stock%TYPE);

  /* PROCEDURE u_product_detail
  ** Update a product_detail in SOK_PRODUCT_DETAIL_LU 
  */
  PROCEDURE u_product_detail (
      val_product_detail_id IN SOK_PRODUCT_DETAIL_LU.product_detail_id%TYPE,
      val_size_range_code IN SOK_PRODUCT_DETAIL_LU.size_range_code%TYPE,
      val_sex_code IN SOK_PRODUCT_DETAIL_LU.sex_code%TYPE,
      val_product_detail_stock IN SOK_PRODUCT_DETAIL_LU.product_detail_stock%TYPE);

  /* PROCEDURE d_one_product_detail
  ** Delete selected product_detail from SOK_PRODUCT_DETAIL_LU
  */
  PROCEDURE d_one_product_detail (
    val_product_detail_id IN SOK_PRODUCT_DETAIL_LU.product_detail_id%TYPE);

  /* PROCEDURE d_product_detail
  ** Delete an product_detail from SOK_PRODUCT_DETAIL_LU
  */
  PROCEDURE d_product_detail (
    val_product_id IN SOK_PRODUCT_DETAIL_LU.product_id%TYPE);
  
  /* PROCEDURE u_product_detail_stock
  ** Update product_detail_stock in the case customer cancels his order
  */
  PROCEDURE u_product_detail_stock (
    val_product_detail_id IN SOK_PRODUCT_DETAIL_LU.product_detail_id%TYPE,
    val_order_product_quantity IN SOK_ORDER_CONTENT.order_product_quantity%TYPE);
    
END SOK_PRODUCT_DETAIL_UTIL;
/