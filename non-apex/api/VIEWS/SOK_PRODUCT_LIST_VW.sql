CREATE OR REPLACE FORCE VIEW "SOK_PRODUCT_LIST_VW"
AS
    SELECT a.product_id,
          a.product_name,
          a.product_desc,
          a.product_image,
          b.total_product_stock,
          e.product_price_amount,
          e.product_price_id,
          a.updated_date,
          a.updated_by
    FROM SOK_PRODUCT_LU a
    INNER JOIN (
                SELECT PRODUCT_ID, SUM(product_detail_stock) as total_product_stock
                FROM SOK_PRODUCT_DETAIL_LU
                GROUP BY PRODUCT_ID) b
          on b.product_id = a.product_id
    INNER JOIN (
                SELECT PRODUCT_ID, MAX(CREATED_DATE) AS CREATED_DATE
                FROM SOK_PRODUCT_PRICE_LU
                GROUP BY PRODUCT_ID) f
          ON b.product_id = f.product_id
    JOIN 
        SOK_PRODUCT_PRICE_LU e
        ON e.PRODUCT_ID = f.PRODUCT_ID 
        AND e.CREATED_DATE = f.CREATED_DATE;
/