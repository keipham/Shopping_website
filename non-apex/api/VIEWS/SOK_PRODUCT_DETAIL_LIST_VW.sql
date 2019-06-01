CREATE OR REPLACE FORCE VIEW "SOK_PRODUCT_DETAIL_LIST_VW"
AS
   SELECT a.product_id,
          a.product_name,
          b.product_detail_id,
          d.sex_code,
          d.sex_name,
          c.size_range_code,
          c.size_lower_value,
          c.size_higher_value,
          b.product_detail_stock,
          b.created_by,
          b.created_date,
          b.updated_by,
          b.updated_date
  FROM SOK_PRODUCT_LU a
  INNER JOIN SOK_PRODUCT_DETAIL_LU b
  ON b.product_id = a.product_id
  INNER JOIN SOK_SEX_TYPE_LU d
  ON d.sex_code = b.sex_code
  INNER JOIN SOK_SIZE_RANGE_LU c
  ON c.size_range_code = b.size_range_code
  /   