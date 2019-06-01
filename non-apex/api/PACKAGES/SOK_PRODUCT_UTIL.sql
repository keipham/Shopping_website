CREATE OR REPLACE PACKAGE SOK_PRODUCT_UTIL
AS
  /* FUNCTION product_name_exists
  ** Check if current product's email is already used, e.g. not used 
  ** return true if the email is already associated with another account, else return false;
  */
  FUNCTION product_name_exists(
      val_product_name IN SOK_PRODUCT_LU.product_name%TYPE)
    RETURN BOOLEAN;
	
  /* FUNCTION product_was_ordered
  ** Check if product has already been ordered by a client
  ** return true it has already been ordered, else return false;
  */
  FUNCTION product_was_ordered(
    val_product_id IN SOK_PRODUCT_DETAIL_LU.product_id%TYPE)
    RETURN BOOLEAN;

  /* FUNCTION c_product
  ** Create product
  */
  FUNCTION c_product(
      val_product_name IN SOK_PRODUCT_LU.product_name%TYPE,
      val_product_desc IN SOK_PRODUCT_LU.product_desc%TYPE,
	    val_product_image IN SOK_PRODUCT_LU.product_image%TYPE,
      val_product_price_amount IN SOK_PRODUCT_PRICE_LU.product_price_amount%TYPE)
      return SOK_PRODUCT_LU.product_id%TYPE;
      
  /* PROCEDURE u_product
  ** Update a product in SOK_PRODUCT_LU and it's price in SOK_PRODUCT_PRICE_LU
  */
  PROCEDURE u_product (
      val_product_id IN SOK_PRODUCT_LU.product_id%TYPE,
      val_product_name IN SOK_PRODUCT_LU.product_name%TYPE,
      val_product_desc IN SOK_PRODUCT_LU.product_desc%TYPE,
	    val_product_image IN SOK_PRODUCT_LU.product_image%TYPE,
      val_product_price_amount IN SOK_PRODUCT_PRICE_LU.product_price_amount%TYPE);
  
  /* PROCEDURE d_product
  ** Delete a product from SOK_PRODUCT_LU
  */
  PROCEDURE d_product (
    val_product_id IN SOK_PRODUCT_LU.product_id%TYPE);

  /* FUNCTION get_blob
  ** Allow to update product_image of a product from SOK_PRODUCT_LU
  */
  FUNCTION get_blob(val_name_blob IN VARCHAR2)
        return SOK_PRODUCT_LU.product_image%TYPE;

  /* PROCEDURE base64encode
    ** Convert BLOB to base64
    */
    PROCEDURE base64encode (i_blob   IN BLOB, 
                            io_clob  IN OUT NOCOPY CLOB );
  
  /* PROCEDURE clobToBlob
  ** Convert data encoded in bas64 contained in CLOB into BLOB 
  */
  PROCEDURE base64EncodedToBlob (i_clob   IN CLOB, 
                                  io_blob  IN OUT NOCOPY BLOB );
END SOK_PRODUCT_UTIL;
/