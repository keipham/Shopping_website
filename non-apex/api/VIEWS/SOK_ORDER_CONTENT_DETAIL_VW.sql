CREATE OR REPLACE FORCE VIEW "SOK_ORDER_CONTENT_DETAIL_VW"
AS
  SELECT * from
  (
    SELECT ppl.CREATED_DATE AS PRODUCT_PRICE_CREATED_DATE,
          o.CREATED_DATE AS ORDER_CREATED_DATE,
          o.ORDER_ID,
          o.order_status_code,
          o.user_id,
          oc.order_product_quantity,
          pdl.PRODUCT_ID,
          pl.product_name,
          pl.product_desc,
          pl.product_image,
          pdl.product_detail_id,
          stl.sex_name,
          stl.sex_code,
          srl.size_lower_value,
          srl.size_higher_value,
          pdl.size_range_code,
          ppl.product_price_amount as product_unitary_price,
          ppl.product_price_amount*oc.order_product_quantity as product_total_price,
          MAX(ppl.CREATED_DATE) over (partition by ppl.PRODUCT_ID order by pdl.product_detail_id ) as PRODUCT_PRICE_DATE_TO_KEEP
          FROM SOK_PRODUCT_PRICE_LU ppl
            INNER JOIN SOK_PRODUCT_DETAIL_LU pdl
            ON ppl.PRODUCT_ID = pdl.PRODUCT_ID
            INNER JOIN SOK_ORDER_CONTENT oc
            ON oc.product_detail_id = pdl.product_detail_id
            INNER JOIN SOK_ORDER o
            ON o.ORDER_ID = oc.ORDER_ID
            INNER JOIN SOK_PRODUCT_LU pl
            ON pl.product_id = pdl.product_id
            INNER JOIN SOK_SEX_TYPE_LU stl
            ON stl.sex_code = pdl.sex_code
            INNER JOIN SOK_SIZE_RANGE_LU srl
            ON srl.size_range_code = pdl.size_range_code
            WHERE ppl.CREATED_DATE < o.CREATED_DATE
  )
    where PRODUCT_PRICE_CREATED_DATE = PRODUCT_PRICE_DATE_TO_KEEP;
/ 