--------------------------------------------------------
--  DDL for Table SOK_ORDER
--------------------------------------------------------

  CREATE TABLE "SOK_ORDER" 
   (	"ORDER_ID" NUMBER(*,0), 
	"CREATED_DATE" DATE, 
	"USER_ID" NUMBER(*,0), 
	"ORDER_STATUS_CODE" VARCHAR2(30 BYTE), 
	"UPDATED_DATE" DATE, 
	"UPDATED_BY" VARCHAR2(80 BYTE), 
	"CREATED_BY" VARCHAR2(80 BYTE)
   ) ;
