--------------------------------------------------------
--  DDL for Trigger SOK_ORDER_TG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SOK_ORDER_TG" 
    BEFORE INSERT OR UPDATE 
    ON SOK_ORDER
    FOR EACH ROW
BEGIN
    IF INSERTING
        THEN
            :NEW.created_date := SYSDATE;
            :NEW.created_by := NVL (APEX_APPLICATION.g_user, USER);
            :NEW.updated_date := SYSDATE;
            :NEW.updated_by := NVL (APEX_APPLICATION.g_user, USER);

            IF :NEW.order_id IS NULL THEN
                :NEW.order_id := SOK_ORDER_SQ.NEXTVAL;
            END IF;
    ELSIF UPDATING THEN
        :NEW.updated_date := SYSDATE;
        :NEW.updated_by := NVL (APEX_APPLICATION.g_user, USER);
    END IF;
END;

/
ALTER TRIGGER "SOK_ORDER_TG" ENABLE;
