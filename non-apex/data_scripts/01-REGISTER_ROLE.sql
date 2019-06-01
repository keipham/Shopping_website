DECLARE
BEGIN
  SOK_ROLE_UTIL.c_role(
      val_role_code => 'ADMIN',
      val_role_name => 'administrator');
  SOK_ROLE_UTIL.c_role(
      val_role_code => 'USER',
      val_role_name => 'user');

END;
/