--------------------------------------------------------
--  DDL for Table SOK_PRODUCT_DETAIL_LU
--------------------------------------------------------

  CREATE TABLE "SOK_PRODUCT_DETAIL_LU" 
   (	"PRODUCT_DETAIL_ID" NUMBER(*,0), 
	"SIZE_RANGE_CODE" VARCHAR2(30 BYTE), 
	"SEX_CODE" VARCHAR2(30 BYTE), 
	"PRODUCT_ID" NUMBER(*,0), 
	"PRODUCT_DETAIL_STOCK" NUMBER(*,0), 
	"CREATED_DATE" DATE, 
	"CREATED_BY" VARCHAR2(80 BYTE), 
	"UPDATED_DATE" DATE, 
	"UPDATED_BY" VARCHAR2(80 BYTE)
   ) ;
