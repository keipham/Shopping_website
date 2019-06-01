--------------------------------------------------------
--  DDL for Trigger SOK_PRODUCT_DETAIL_TG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SOK_PRODUCT_DETAIL_TG" 
    BEFORE INSERT OR UPDATE 
    ON SOK_PRODUCT_DETAIL_LU
    FOR EACH ROW
BEGIN
    IF INSERTING
    THEN
        :NEW.created_date := SYSDATE;
        :NEW.created_by := NVL (APEX_APPLICATION.g_user, USER);
        :NEW.updated_date := SYSDATE;
        :NEW.updated_by := NVL (APEX_APPLICATION.g_user, USER);

        IF :NEW.product_detail_id IS NULL THEN
            :NEW.product_detail_id := SOK_PRODUCT_DETAIL_SQ.NEXTVAL;
        END IF;
    ELSIF UPDATING THEN
        :NEW.updated_date := SYSDATE;
        :NEW.updated_by := NVL (APEX_APPLICATION.g_user, USER);
    END IF;
END;

/
ALTER TRIGGER "SOK_PRODUCT_DETAIL_TG" ENABLE;
