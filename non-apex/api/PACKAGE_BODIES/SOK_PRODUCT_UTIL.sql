CREATE OR REPLACE PACKAGE BODY SOK_PRODUCT_UTIL
AS
  /* FUNCTION product_name_exists
  ** Check if current product's email already exists, e.g. does not exist 
  ** return true if the email is already associated with another account, else return false;
  */
  FUNCTION product_name_exists(
      val_product_name IN SOK_PRODUCT_LU.product_name%TYPE)
    RETURN BOOLEAN
  IS
	loc_count INTEGER := 0;
  BEGIN
    SELECT count(product_name)
    INTO loc_count
    FROM SOK_PRODUCT_LU
    WHERE product_name = val_product_name;
    IF loc_count = 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('Process "Check if product name exists" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Check if product name exists" failed. '||SQLERRM);
  END product_name_exists;
  
   /* FUNCTION product_was_ordered
  ** Check if product has already been ordered by a client
  ** return true it has already been ordered, else return false;
  */
  FUNCTION product_was_ordered(
    val_product_id IN SOK_PRODUCT_DETAIL_LU.product_id%TYPE)
    RETURN BOOLEAN
    IS
      loc_count INTEGER := 0;
    begin
      select count(product_name) into loc_count
      from SOK_ORDER_CONTENT_DETAIL_VW
      where product_id = val_product_id;
      logger.log(loc_count);
      if loc_count > 0 THEN
        return true;
      else
        return false;
      end if;
    EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('Process "Check if product was ordered" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Check if product was ordered" failed. '||SQLERRM);
  END product_was_ordered;

  /* FUNCTION c_product
  ** Create product
  */
  FUNCTION c_product(
      val_product_name IN SOK_PRODUCT_LU.product_name%TYPE,
      val_product_desc IN SOK_PRODUCT_LU.product_desc%TYPE,
	    val_product_image IN SOK_PRODUCT_LU.product_image%TYPE,
      val_product_price_amount IN SOK_PRODUCT_PRICE_LU.product_price_amount%TYPE)
      return SOK_PRODUCT_LU.product_id%TYPE
  IS
    loc_product_id SOK_PRODUCT_LU.product_id%TYPE;
    loc_sex_code SOK_SEX_TYPE_LU.sex_code%TYPE := 'UNDEFINED';
    loc_size_range_code SOK_SIZE_RANGE_LU.size_range_code%TYPE := 0;
    loc_product_detail_stock SOK_PRODUCT_DETAIL_LU.product_detail_stock%TYPE := 0;
  begin
      insert into SOK_PRODUCT_LU 
      (
        product_name,
        product_desc,
        product_image
      )
      values 
      (
        val_product_name,
        val_product_desc,
        val_product_image
      );
      -- I get the product_id
      select product_id into loc_product_id
      from SOK_PRODUCT_LU
      where product_name = val_product_name;
      --I create default product detail associated with my product
      SOK_PRODUCT_DETAIL_UTIL.c_product_detail(
          val_size_range_code => loc_size_range_code,
          val_sex_code => loc_sex_code,
          val_product_id => loc_product_id,
          val_product_detail_stock => loc_product_detail_stock
      );
      SOK_PRODUCT_PRICE_UTIL.c_product_price(
          val_product_price_amount => val_product_price_amount,
          val_product_id => loc_product_id
  );
      return loc_product_id;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Create product" failed.'||SQLERRM);
    raise_application_error(-20001, 'Process "Create product" failed. '||SQLERRM);
  END c_product;

    /* PROCEDURE u_product
    ** Update a product in SOK_PRODUCT_LU
    */
    PROCEDURE u_product (
      val_product_id IN SOK_PRODUCT_LU.product_id%TYPE,
      val_product_name IN SOK_PRODUCT_LU.product_name%TYPE,
      val_product_desc IN SOK_PRODUCT_LU.product_desc%TYPE,
	    val_product_image IN SOK_PRODUCT_LU.product_image%TYPE,
      val_product_price_amount IN SOK_PRODUCT_PRICE_LU.product_price_amount%TYPE)
    IS
    BEGIN
        if val_product_image is null then 
            UPDATE SOK_PRODUCT_LU
          SET
              product_name = val_product_name,
              product_desc = val_product_desc
          WHERE
              product_id = val_product_id;
        else
            UPDATE SOK_PRODUCT_LU
          SET
              product_name = val_product_name,
              product_desc = val_product_desc,
              product_image = val_product_image
          WHERE
              product_id = val_product_id;
        end if;
        --I associate the product with a new price
        SOK_PRODUCT_PRICE_UTIL.c_product_price(
            val_product_price_amount => val_product_price_amount,
            val_product_id => val_product_id);
    EXCEPTION
    WHEN OTHERS THEN
        logger.log_error('Process "Update product" failed.'||SQLERRM);
        raise_application_error(-20001, 'Process "Update product" failed. '||SQLERRM);         
    END u_product;

    /* PROCEDURE d_product
    ** Delete a product from SOK_PRODUCT_LU
    */
    PROCEDURE d_product (
      val_product_id IN SOK_PRODUCT_LU.product_id%TYPE)
    IS 
    BEGIN
      --delete prices associated with selected product from table SOK_PRODUCT_PRICE_LU
      SOK_PRODUCT_PRICE_UTIL.d_product_price(
          val_product_id => val_product_id);
      --delete all product details from SOK_PRODUCT_DETAILS_LU
      SOK_PRODUCT_DETAIL_UTIL.d_product_detail(
          val_product_id => val_product_id);
      --delete product
      DELETE FROM SOK_PRODUCT_LU
      WHERE product_id = val_product_id;
    EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('Process "Delete product" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Delete product" failed. '||SQLERRM);       
    END d_product;

    /* FUNCTION get_blob
    ** Allow to update product_image of a product from SOK_PRODUCT_LU
    */
    FUNCTION get_blob(val_name_blob IN VARCHAR2)
          return SOK_PRODUCT_LU.product_image%TYPE
    AS
        loc_image SOK_PRODUCT_LU.product_image%TYPE;
    BEGIN
        select blob_content
        into   loc_image
        from   app_file
        where  title = 'data_script'
        and    name  = val_name_blob ;
      
        return loc_image;
    END get_blob;

    /* PROCEDURE base64encode
    ** Convert BLOB to base64
    */
    PROCEDURE base64encode (i_blob   IN BLOB, 
                            io_clob  IN OUT NOCOPY CLOB )
    is
      l_step                          PLS_INTEGER := 22500; -- make sure you set a multiple of 3 not higher than 24573
      l_converted                     VARCHAR2(32767);

      l_buffer_size_approx            PLS_INTEGER := 1048576;
      l_buffer                        CLOB;
    begin
      dbms_lob.createtemporary(l_buffer, true, dbms_lob.call);
      --logger.log(dbms_lob.getlength(i_blob) - 1 );
      --logger.log(trunc((dbms_lob.getlength(i_blob) - 1 )/l_step));
      for i in 0 .. trunc((dbms_lob.getlength(i_blob) - 1 )/l_step) loop
          --logger.log(dbms_lob.getlength(l_buffer));
          logger.log(i);
          l_converted := utl_raw.cast_to_varchar2(utl_encode.base64_encode(dbms_lob.substr(i_blob, l_step, i * l_step + 1)));
          dbms_lob.writeappend(l_buffer, length(l_converted), l_converted);
          logger.log(i);
          if dbms_lob.getlength(l_buffer) >= l_buffer_size_approx then
              dbms_lob.append(io_clob, l_buffer);
              dbms_lob.trim(l_buffer, 0);
          end if;
      end loop;
      logger.log('je sors de la boucle');
      dbms_lob.append(io_clob, l_buffer);
      logger.log(dbms_lob.getlength(l_buffer));
      dbms_lob.freetemporary(l_buffer);
    end base64encode;

    /* PROCEDURE clobToBlob
    ** Convert data encoded in bas64 contained in CLOB into BLOB 
    */
    PROCEDURE base64EncodedToBlob (i_clob   IN CLOB, 
                                   io_blob  IN OUT NOCOPY BLOB )
    is
    begin
      --UTL_RAW.CAST_TO_RAW converts a value of data type VARCHAR2 into a raw value with the same number of bytes
      --"utl_encode.base64_decode" reads the base 64-encoded RAW input string and decodes it to its original RAW value
      --TO_BLOB converts LONG RAW and RAW values to BLOB values
      io_blob := TO_BLOB(utl_encode.base64_decode(utl_raw.cast_to_raw(i_clob))); 

    end base64EncodedToBlob;

END SOK_PRODUCT_UTIL;
/