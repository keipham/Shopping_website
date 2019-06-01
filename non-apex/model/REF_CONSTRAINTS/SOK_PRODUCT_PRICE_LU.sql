--------------------------------------------------------
--  Ref Constraints for Table SOK_PRODUCT_PRICE_LU
--------------------------------------------------------

  ALTER TABLE "SOK_PRODUCT_PRICE_LU" ADD CONSTRAINT "SOK_PRODUCT_PRICE_PRODUCT_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "SOK_PRODUCT_LU" ("PRODUCT_ID") ENABLE;
