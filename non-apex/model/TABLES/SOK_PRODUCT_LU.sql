--------------------------------------------------------
--  DDL for Table SOK_PRODUCT_LU
--------------------------------------------------------

  CREATE TABLE "SOK_PRODUCT_LU" 
   (	"PRODUCT_ID" NUMBER(*,0), 
	"PRODUCT_NAME" VARCHAR2(30 BYTE), 
	"PRODUCT_DESC" VARCHAR2(240 BYTE), 
	"PRODUCT_IMAGE" BLOB, 
	"CREATED_DATE" DATE, 
	"CREATED_BY" VARCHAR2(80 BYTE), 
	"UPDATED_DATE" DATE, 
	"UPDATED_BY" VARCHAR2(80 BYTE)
   ) ;
