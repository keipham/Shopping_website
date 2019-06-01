--------------------------------------------------------
--  Ref Constraints for Table SOK_USER_ROLE
--------------------------------------------------------

  ALTER TABLE "SOK_USER_ROLE" ADD CONSTRAINT "SOK_USER_ROLE_ROLE_FK" FOREIGN KEY ("ROLE_CODE")
	  REFERENCES "SOK_ROLE_LU" ("ROLE_CODE") ENABLE;
  ALTER TABLE "SOK_USER_ROLE" ADD CONSTRAINT "SOK_USER_ROLE_USER_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SOK_USER" ("USER_ID") ENABLE;
