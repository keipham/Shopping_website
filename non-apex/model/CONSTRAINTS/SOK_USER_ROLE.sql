--------------------------------------------------------
--  Constraints for Table SOK_USER_ROLE
--------------------------------------------------------

  ALTER TABLE "SOK_USER_ROLE" ADD CONSTRAINT "SOK_USER_ROLE_PKV1" PRIMARY KEY ("USER_ID", "ROLE_CODE") ENABLE;
  ALTER TABLE "SOK_USER_ROLE" MODIFY ("ROLE_CODE" NOT NULL ENABLE);
  ALTER TABLE "SOK_USER_ROLE" MODIFY ("USER_ID" NOT NULL ENABLE);
