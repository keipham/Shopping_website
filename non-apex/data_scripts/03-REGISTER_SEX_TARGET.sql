DECLARE
BEGIN
  SOK_SEX_TYPE_UTIL.c_sex_type(
      val_sex_code => 'MALE',
      val_sex_name => 'Men'
  );
  SOK_SEX_TYPE_UTIL.c_sex_type(
      val_sex_code => 'FEMALE',
      val_sex_name => 'Women'
  );
  SOK_SEX_TYPE_UTIL.c_sex_type(
      val_sex_code => 'MIXED',
      val_sex_name => 'Mixed'
  );
  SOK_SEX_TYPE_UTIL.c_sex_type(
      val_sex_code => 'UNDEFINED',
      val_sex_name => 'Undefined'
  );

END;
/