--------------------------------------------------------
--  Ref Constraints for Table SOK_ORDER
--------------------------------------------------------

  ALTER TABLE "SOK_ORDER" ADD CONSTRAINT "SOK_ORDER_STATUS_FK" FOREIGN KEY ("ORDER_STATUS_CODE")
	  REFERENCES "SOK_ORDER_STATUS_LU" ("ORDER_STATUS_CODE") ENABLE;
  ALTER TABLE "SOK_ORDER" ADD CONSTRAINT "SOK_ORDER_USER_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SOK_USER" ("USER_ID") ENABLE;
