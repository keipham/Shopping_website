DECLARE
BEGIN
  SOK_USER_UTIL.register_user(
      val_user_firstname => 'guest',
      val_user_lastname => 'guest',
      val_user_email => 'guest@dng.com',
      val_user_password => 'guestguest',
      val_user_phone => null,
      val_user_invoicing_address => 'guest',
      val_user_delivery_address => 'guest');
      
    SOK_USER_UTIL.register_user(
      val_user_firstname => 'admin',
      val_user_lastname => 'admin',
      val_user_email => 'admin@dng.com',
      val_user_password => 'adminadmin',
      val_user_phone => null,
      val_user_invoicing_address => 'admin',
      val_user_delivery_address => 'admin');
   
   SOK_USER_ROLE_UTIL.c_user_role(
      val_user_id => 2,
      val_role_code => 'ADMIN');

END;
/