--------------------------------------------------------
--  DDL for Index SOK_USER_ROLE
--------------------------------------------------------

  CREATE INDEX "SOK_USER_ROLE_PK" ON "SOK_USER_ROLE" ("USER_ID", "ROLE_CODE");
  CREATE INDEX "SOK_USER_ROLE_IDX1" ON "SOK_USER_ROLE" ("USER_ID");
  CREATE INDEX "SOK_USER_ROLE_IDX2" ON "SOK_USER_ROLE" ("ROLE_CODE");