CREATE OR REPLACE PACKAGE BODY SOK_PRODUCT_DETAIL_UTIL
AS

  /* FUNCTION prod_detail_was_ordered
  ** Check if product_detail has already been ordered by a client
  ** return true it has already been ordered, else return false;
  */
  FUNCTION prod_detail_was_ordered(
    val_product_detail_id IN SOK_PRODUCT_DETAIL_LU.product_detail_id%TYPE)
    RETURN BOOLEAN
    IS
      loc_count INTEGER := 0;
    begin
      select count(product_detail_id) into loc_count
      from SOK_ORDER_CONTENT_DETAIL_VW
      where product_detail_id = val_product_detail_id;
      
      if loc_count > 0 THEN
        return true;
      else
        return false;
      end if;
    EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('Process "Check if product_detail was ordered" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Check if product_detail was ordered" failed. '||SQLERRM);
  END prod_detail_was_ordered;

  /* FUNCTION c_product_detail
  ** Create or update product_detail if already exist (the quantity of product detail will be add up to the one already existing)
  */
  PROCEDURE c_product_detail(
      val_size_range_code IN SOK_PRODUCT_DETAIL_LU.size_range_code%TYPE,
      val_sex_code IN SOK_PRODUCT_DETAIL_LU.sex_code%TYPE,
      val_product_id IN SOK_PRODUCT_DETAIL_LU.product_id%TYPE,
      val_product_detail_stock IN SOK_PRODUCT_DETAIL_LU.product_detail_stock%TYPE)
  IS
    loc_count_prod_detail        INTEGER := 0;
    loc_old_prod_det_stock       SOK_PRODUCT_DETAIL_LU.product_detail_stock%TYPE;
    loc_product_detail_id        SOK_PRODUCT_DETAIL_LU.product_detail_id%TYPE;
    loc_new_prod_det_stock       SOK_PRODUCT_DETAIL_LU.product_detail_stock%TYPE;
  begin
    --I check if the new product detail's sex_code and size_range_code already exists for the given product
    SELECT count(product_detail_id) into loc_count_prod_detail
    FROM SOK_PRODUCT_DETAIL_LIST_VW 
    WHERE product_id = val_product_id and sex_code = val_sex_code and size_range_code = val_size_range_code;
    
    If loc_count_prod_detail > 0 then
         
         --I get the product_detail_id and the old product detail stock value
         select product_detail_stock, product_detail_id 
         into loc_old_prod_det_stock, loc_product_detail_id 
         from SOK_PRODUCT_DETAIL_LIST_VW 
         where product_id = val_product_id and sex_code = val_sex_code and size_range_code = val_size_range_code;
        
         --I add up the old product detail stock value and the new one to get the sum
        loc_new_prod_det_stock := loc_old_prod_det_stock+val_product_detail_stock;
        
        UPDATE SOK_PRODUCT_DETAIL_LU
        SET
            size_range_code = val_size_range_code,
            sex_code = val_sex_code,
            product_detail_stock = loc_new_prod_det_stock
        WHERE
            product_detail_id = loc_product_detail_id;
         
      else 
      --I create new product detail
      insert into SOK_PRODUCT_DETAIL_LU 
      (
        size_range_code,
        sex_code,
        product_id,
        product_detail_stock
      )
      values 
      (
        val_size_range_code,
        val_sex_code,
        val_product_id,
        val_product_detail_stock
      );
      end if;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Create/Update product_detail" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Create/Update product_detail" failed. '||SQLERRM);
  END c_product_detail;

    /* PROCEDURE u_product_detail
    ** Update an order content in SOK_PRODUCT_DETAIL_LU 
    */
    PROCEDURE u_product_detail (
      val_product_detail_id IN SOK_PRODUCT_DETAIL_LU.product_detail_id%TYPE,
      val_size_range_code IN SOK_PRODUCT_DETAIL_LU.size_range_code%TYPE,
      val_sex_code IN SOK_PRODUCT_DETAIL_LU.sex_code%TYPE,
      val_product_detail_stock IN SOK_PRODUCT_DETAIL_LU.product_detail_stock%TYPE)
      IS
      begin
        --I update product detail
          UPDATE SOK_PRODUCT_DETAIL_LU
          SET
              size_range_code = val_size_range_code,
              sex_code = val_sex_code,
              product_detail_stock = val_product_detail_stock
          WHERE
              product_detail_id = val_product_detail_id;
      EXCEPTION
      WHEN OTHERS THEN
          logger.log_error('Process "Update product_detail" failed. '||SQLERRM);
          raise_application_error(-20001, 'Process "Update product_detail" failed. '||SQLERRM);         
      END u_product_detail;

  /* PROCEDURE d_one_product_detail
  ** Delete selected product_detail from SOK_PRODUCT_DETAIL_LU
  */
  PROCEDURE d_one_product_detail (
    val_product_detail_id IN SOK_PRODUCT_DETAIL_LU.product_detail_id%TYPE)
  IS 
    loc_count_prod_det INTEGER := 0;
    loc_product_id     SOK_PRODUCT_DETAIL_LU.product_id%TYPE;
  BEGIN
    
    --I get the product_id associated with given product_detail_id
    select product_id 
    into loc_product_id
    from SOK_PRODUCT_DETAIL_LU
    where product_detail_id = val_product_detail_id;
   
    --I check if the given product still have product_details if this one is deleted
    select count(product_detail_id) 
    into loc_count_prod_det 
    from SOK_PRODUCT_DETAIL_LU
    where product_id = loc_product_id;
    
  if loc_count_prod_det > 1 then
      
      --I delete selected product details from SOK_PRODUCT_DETAILS_LU
      DELETE FROM SOK_PRODUCT_DETAIL_LU
      WHERE product_detail_id = val_product_detail_id ;
  elsif loc_count_prod_det = 1 then
    apex_error.add_error(
      p_message => 'Product must have at least 1 product details.', 
      p_display_location => apex_error.c_on_error_page);
  end if;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Delete product_detail" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Delete product_detail" failed. '||SQLERRM);       
  END d_one_product_detail;

  /* PROCEDURE d_product_detail
  ** Delete an product_detail from SOK_PRODUCT_DETAIL_LU
  */
  PROCEDURE d_product_detail (
    val_product_id IN SOK_PRODUCT_DETAIL_LU.product_id%TYPE)
  IS 
  BEGIN
    DELETE FROM SOK_PRODUCT_DETAIL_LU
    WHERE product_id = val_product_id;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Delete product_detail" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Delete product_detail" failed. '||SQLERRM);       
  END d_product_detail;
  
  /* PROCEDURE u_product_detail_stock
  ** Update product_detail_stock in the case customer cancels his order
  */
  PROCEDURE u_product_detail_stock (
    val_product_detail_id IN SOK_PRODUCT_DETAIL_LU.product_detail_id%TYPE,
    val_order_product_quantity IN SOK_ORDER_CONTENT.order_product_quantity%TYPE)
  IS
    loc_size_range_code          SOK_PRODUCT_DETAIL_LU.size_range_code%TYPE;
    loc_sex_code                 SOK_PRODUCT_DETAIL_LU.sex_code%TYPE;
    loc_product_detail_stock     SOK_PRODUCT_DETAIL_LU.product_detail_stock%TYPE;
  BEGIN
    select size_range_code, sex_code, product_detail_stock 
    into loc_size_range_code, loc_sex_code, loc_product_detail_stock
    from SOK_PRODUCT_DETAIL_LU
    where product_detail_id = val_product_detail_id;
      
    loc_product_detail_stock := loc_product_detail_stock + val_order_product_quantity;
     
      SOK_PRODUCT_DETAIL_UTIL.u_product_detail (
          val_product_detail_id => val_product_detail_id,
          val_size_range_code => loc_size_range_code,
          val_sex_code => loc_sex_code,
          val_product_detail_stock => loc_product_detail_stock);
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Update product detail stock" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Update product detail stock" failed. '||SQLERRM);       
  END u_product_detail_stock;
END SOK_PRODUCT_DETAIL_UTIL;
/