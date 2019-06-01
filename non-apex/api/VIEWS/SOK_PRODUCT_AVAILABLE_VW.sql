--For each product this query will render two lines allowing user to calculate a possible discount rate.
CREATE OR REPLACE FORCE VIEW "SOK_PRODUCT_AVAILABLE_VW"
AS
   SELECT a.product_id,
    a.product_name,
    a.product_desc,
    a.product_image,
    d.sex_name,
    c.size_lower_value,
    c.size_higher_value,
    b.product_detail_stock,
    e.product_price_amount,
    e.created_date
  FROM SOK_PRODUCT_LU a
  INNER JOIN SOK_PRODUCT_DETAIL_LU b
  ON b.product_id = a.product_id
  INNER JOIN SOK_SEX_TYPE_LU d
  ON d.sex_code = b.sex_code
  INNER JOIN SOK_SIZE_RANGE_LU c
  ON c.size_range_code = b.size_range_code
  INNER JOIN (select * from SOK_PRODUCT_PRICE_LU where created_date < SYSDATE and ROWNUM < 3 ORDER BY created_date DESC) e
  ON e.product_id = a.product_id
  WHERE b.product_detail_stock > 0 ;
  /