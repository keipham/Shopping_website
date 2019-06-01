--------------------------------------------------------
--  DDL for Trigger SOK_ROLE_LU_TG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SOK_ROLE_LU_TG" 
    BEFORE INSERT OR UPDATE 
    ON SOK_ROLE_LU
    FOR EACH ROW
BEGIN
    IF INSERTING
    THEN
        :NEW.created_date := SYSDATE;
        :NEW.created_by := NVL (APEX_APPLICATION.g_user, USER);
        :NEW.updated_date := SYSDATE;
        :NEW.updated_by := NVL (APEX_APPLICATION.g_user, USER);
    ELSIF UPDATING THEN
        :NEW.updated_date := SYSDATE;
        :NEW.updated_by := NVL (APEX_APPLICATION.g_user, USER);
    END IF;
END;

/
ALTER TRIGGER "SOK_ROLE_LU_TG" ENABLE;
