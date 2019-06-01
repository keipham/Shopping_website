CREATE OR REPLACE FORCE VIEW "SOK_ORDER_STATUS_VW"
AS
  SELECT a.created_date,
    a.order_id,
    c.user_firstname,
    c.user_lastname,
    c.user_email,
    c.user_invoicing_address,
    c.user_delivery_address,
    b.order_status_name,
    b.updated_date
  FROM SOK_ORDER a
  INNER JOIN SOK_ORDER_STATUS_LU b
  ON b.order_status_code = a.order_status_code
  INNER JOIN SOK_USER c
  ON a.user_id = c.user_id;
  /
