CREATE OR REPLACE FORCE VIEW "SOK_USER_ROLE_VW"
AS
  SELECT a.user_id,
    a.user_firstname,
    a.user_lastname,
    UPPER(a.user_email) as user_email,
    a.user_password,
    a.user_phone,
    a.user_invoicing_address,
    a.user_delivery_address,
    c.role_name,
    c.role_code,
    a.updated_date,
    a.updated_by,
    a.created_date,
    a.created_by
  FROM SOK_USER a
  INNER JOIN SOK_USER_ROLE b
  ON a.user_id = b.user_id
  INNER JOIN SOK_ROLE_LU c
  ON b.role_code = c.role_code;
  /
