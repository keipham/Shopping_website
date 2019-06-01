--------------------------------------------------------
--  DDL for Trigger SOK_USER_TG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SOK_USER_TG" 
    BEFORE INSERT OR UPDATE
    ON SOK_USER
    FOR EACH ROW
BEGIN
    IF INSERTING
    THEN
        IF LENGTH(:NEW.user_firstname) < 2 THEN
            raise_application_error(-20002, 'Firstname needs to contain at least 2 letters. Please review and update.');
        ELSIF LENGTH(:NEW.user_lastname) < 2 THEN
            raise_application_error(-20003, 'Lastname needs to contain at least 2 letters. Please review and update.');
        ELSIF LENGTH(:NEW.user_password) < 6 THEN
            raise_application_error(-20004, 'Password needs to contain at least 6 characters. Please review and update.');
        ELSIF LENGTH(:NEW.user_phone) < 8 THEN
            raise_application_error(-20004, 'Phone number needs to contain at least 8 numbers. Please review and update.');
        ELSIF :NEW.user_id IS NULL THEN
            :NEW.user_id := SOK_USER_SQ.NEXTVAL;
        END IF;
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
ALTER TRIGGER "SOK_USER_TG" ENABLE;
