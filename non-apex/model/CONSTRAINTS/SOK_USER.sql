--------------------------------------------------------
--  Constraints for Table SOK_USER
--------------------------------------------------------

  ALTER TABLE "SOK_USER" ADD CONSTRAINT "SOK_USER_UK" UNIQUE ("USER_EMAIL")
  USING INDEX  ENABLE;
  ALTER TABLE "SOK_USER" ADD CONSTRAINT "SOK_USER_PK" PRIMARY KEY ("USER_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "SOK_USER" MODIFY ("CREATED_BY" NOT NULL ENABLE);
  ALTER TABLE "SOK_USER" MODIFY ("CREATED_DATE" NOT NULL ENABLE);
  ALTER TABLE "SOK_USER" MODIFY ("UPDATED_BY" NOT NULL ENABLE);
  ALTER TABLE "SOK_USER" MODIFY ("UPDATED_DATE" NOT NULL ENABLE);
  ALTER TABLE "SOK_USER" MODIFY ("USER_DELIVERY_ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "SOK_USER" MODIFY ("USER_INVOICING_ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "SOK_USER" MODIFY ("USER_PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "SOK_USER" MODIFY ("USER_EMAIL" NOT NULL ENABLE);
  ALTER TABLE "SOK_USER" MODIFY ("USER_LASTNAME" NOT NULL ENABLE);
  ALTER TABLE "SOK_USER" MODIFY ("USER_FIRSTNAME" NOT NULL ENABLE);
  ALTER TABLE "SOK_USER" MODIFY ("USER_ID" NOT NULL ENABLE);
