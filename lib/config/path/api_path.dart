class ApiPath {
  /// auth
 static const login="/api/login";
 static const profile="/api/user/profile";
 static const logout="/api/logout";

 ///Customer
static const listKH="/api/customer/type/";
static const infoKH="/api/customer/show/";
static const addKH="/api/customer/create";
 static const update="/api/customer/update/";
 static const lskh="api/customer/show/history/";

 /// ton kho
static const listTonKho="/api/material/inventory";
/// nhan may
static const fullListKH="/api/product-attribute/list-customer";
 static const fullListKho="/api/product-attribute/list-warehouse";
static const fullListPrd="/api/product-attribute/list-product";
 static const fullListNV="/api/product-attribute/list-user";
 static const createRepairOrder="/api/product-attribute/createOrder";

}
