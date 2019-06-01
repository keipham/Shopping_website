CREATE OR REPLACE PACKAGE BODY SOK_ORDER_UTIL
AS
  /* FUNCTION c_order
  ** Create order
  */
  FUNCTION c_order(
      val_user_id IN SOK_ORDER.user_id%TYPE,
      val_order_status_code IN SOK_ORDER.order_status_code%TYPE)
      RETURN SOK_ORDER.order_id%TYPE
  IS
    loc_order_id SOK_ORDER.order_id%TYPE;
  begin
      logger.log('je rentre dans la fonction');
      insert into SOK_ORDER 
      (
        user_id,
        order_status_code
      )
      values 
      (
        val_user_id,
        val_order_status_code
      ) returning order_id into loc_order_id;
      logger.log('bbb');
      return loc_order_id;
  EXCEPTION
  WHEN OTHERS THEN
    logger.log_error('Process "Create order" failed. '||SQLERRM);
    raise_application_error(-20001, 'Process "Create order" failed. '||SQLERRM);
  END c_order;

    /* FUNCTION u_order
      ** Update an order in SOK_ORDER
      */
    FUNCTION u_order (
      val_order_id IN SOK_ORDER.order_id%TYPE,
      val_order_status_code IN SOK_ORDER.order_status_code%TYPE)
      RETURN SOK_ORDER.order_status_code%TYPE 
    IS
      loc_order_status_code   SOK_ORDER.order_status_code%TYPE;
    BEGIN
        UPDATE SOK_ORDER
        SET
            order_status_code = val_order_status_code
        WHERE
            order_id = val_order_id
        returning order_status_code into loc_order_status_code;
        return loc_order_status_code;
    EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('Process "Update order" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Update order" failed. '||SQLERRM);         
    END u_order;

    /* PROCEDURE d_order
    ** Delete a order from SOK_order
    */
    PROCEDURE d_order (
      val_order_id IN SOK_ORDER.order_id%TYPE)
    IS 
    BEGIN
      DELETE FROM SOK_ORDER
      WHERE order_id = val_order_id;
    EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('Process "Delete order" failed. '||SQLERRM);
      raise_application_error(-20001, 'Process "Delete order" failed. '||SQLERRM);       
    END d_order;

END SOK_ORDER_UTIL;
/