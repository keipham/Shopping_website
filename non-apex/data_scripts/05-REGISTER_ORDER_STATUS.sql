DECLARE
BEGIN
  SOK_ORDER_STATUS_UTIL.c_order_status(
      val_order_status_code => 'PAID',
      val_order_status_name => 'Paid');

  SOK_ORDER_STATUS_UTIL.c_order_status(
      val_order_status_code => 'PROCESSED',
      val_order_status_name => 'Processed');

  SOK_ORDER_STATUS_UTIL.c_order_status(
      val_order_status_code => 'SENT',
      val_order_status_name => 'Shipped');

  SOK_ORDER_STATUS_UTIL.c_order_status(
      val_order_status_code => 'DELIVERED',
      val_order_status_name => 'Delivered');

  SOK_ORDER_STATUS_UTIL.c_order_status(
      val_order_status_code => 'CANCELLED',
      val_order_status_name => 'Cancelled');
END;
/