class ModelListBaoGia {
  List<ProductAttrQuoteOrders>? productAttrQuoteOrders;
  List<MaterialAttrQuoteOrders>? materialAttrQuoteOrders;

  ModelListBaoGia({this.productAttrQuoteOrders, this.materialAttrQuoteOrders});

  ModelListBaoGia.fromJson(Map<String, dynamic> json) {
    if (json['productAttrQuoteOrders'] != null) {
      productAttrQuoteOrders = <ProductAttrQuoteOrders>[];
      json['productAttrQuoteOrders'].forEach((v) {
        productAttrQuoteOrders!.add(new ProductAttrQuoteOrders.fromJson(v));
      });
    }
    if (json['materialAttrQuoteOrders'] != null) {
      materialAttrQuoteOrders = <MaterialAttrQuoteOrders>[];
      json['materialAttrQuoteOrders'].forEach((v) {
        materialAttrQuoteOrders!.add(new MaterialAttrQuoteOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productAttrQuoteOrders != null) {
      data['productAttrQuoteOrders'] =
          this.productAttrQuoteOrders!.map((v) => v.toJson()).toList();
    }
    if (this.materialAttrQuoteOrders != null) {
      data['materialAttrQuoteOrders'] =
          this.materialAttrQuoteOrders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductAttrQuoteOrders {
  int? id;
  int? type;
  int? productId;
  int? productAttrId;
  String? imei;
  String? serial;
  String? title;
  String? importPrice;
  String? moneyBuy;
  String? exportPrice;
  int? amount;
  String? importDate;
  String? totalPrice;
  String? totalPriceGet;
  String? note;
  int? userId;
  int? customerId;
  String? customerCode;
  String? customerType;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  int? accountingStatus;
  String? userExportId;
  String? warehouseId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? isProcess;
  String? statusId;

  ProductAttrQuoteOrders(
      {this.id,
        this.type,
        this.productId,
        this.productAttrId,
        this.imei,
        this.serial,
        this.title,
        this.importPrice,
        this.moneyBuy,
        this.exportPrice,
        this.amount,
        this.importDate,
        this.totalPrice,
        this.totalPriceGet,
        this.note,
        this.userId,
        this.customerId,
        this.customerCode,
        this.customerType,
        this.customerName,
        this.customerPhone,
        this.customerAddress,
        this.accountingStatus,
        this.userExportId,
        this.warehouseId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.isProcess,
        this.statusId});

  ProductAttrQuoteOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    productId = json['product_id'];
    productAttrId = json['product_attr_id'];
    imei = json['imei'];
    serial = json['serial'];
    title = json['title'];
    importPrice = json['import_price'];
    moneyBuy = json['money_buy'];
    exportPrice = json['export_price'];
    amount = json['amount'];
    importDate = json['import_date'];
    totalPrice = json['total_price'];
    totalPriceGet = json['total_price_get'];
    note = json['note'];
    userId = json['user_id'];
    customerId = json['customer_id'];
    customerCode = json['customer_code'];
    customerType = json['customer_type'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    customerAddress = json['customer_address'];
    accountingStatus = json['accounting_status'];
    userExportId = json['user_export_id'];
    warehouseId = json['warehouse_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isProcess = json['is_process'];
    statusId = json['status_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['product_id'] = this.productId;
    data['product_attr_id'] = this.productAttrId;
    data['imei'] = this.imei;
    data['serial'] = this.serial;
    data['title'] = this.title;
    data['import_price'] = this.importPrice;
    data['money_buy'] = this.moneyBuy;
    data['export_price'] = this.exportPrice;
    data['amount'] = this.amount;
    data['import_date'] = this.importDate;
    data['total_price'] = this.totalPrice;
    data['total_price_get'] = this.totalPriceGet;
    data['note'] = this.note;
    data['user_id'] = this.userId;
    data['customer_id'] = this.customerId;
    data['customer_code'] = this.customerCode;
    data['customer_type'] = this.customerType;
    data['customer_name'] = this.customerName;
    data['customer_phone'] = this.customerPhone;
    data['customer_address'] = this.customerAddress;
    data['accounting_status'] = this.accountingStatus;
    data['user_export_id'] = this.userExportId;
    data['warehouse_id'] = this.warehouseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['is_process'] = this.isProcess;
    data['status_id'] = this.statusId;
    return data;
  }
}

class MaterialAttrQuoteOrders {
  int? id;
  int? type;
  Null? productId;
  Null? productAttrId;
  Null? imei;
  Null? serial;
  String? title;
  String? importPrice;
  String? moneyBuy;
  String? exportPrice;
  int? amount;
  Null? importDate;
  String? totalPrice;
  String? totalPriceGet;
  Null? note;
  Null? userId;
  int? customerId;
  String? customerCode;
  Null? customerType;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  int? accountingStatus;
  Null? userExportId;
  Null? warehouseId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? isProcess;
  String? statusId;

  MaterialAttrQuoteOrders(
      {this.id,
        this.type,
        this.productId,
        this.productAttrId,
        this.imei,
        this.serial,
        this.title,
        this.importPrice,
        this.moneyBuy,
        this.exportPrice,
        this.amount,
        this.importDate,
        this.totalPrice,
        this.totalPriceGet,
        this.note,
        this.userId,
        this.customerId,
        this.customerCode,
        this.customerType,
        this.customerName,
        this.customerPhone,
        this.customerAddress,
        this.accountingStatus,
        this.userExportId,
        this.warehouseId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.isProcess,
        this.statusId});

  MaterialAttrQuoteOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    productId = json['product_id'];
    productAttrId = json['product_attr_id'];
    imei = json['imei'];
    serial = json['serial'];
    title = json['title'];
    importPrice = json['import_price'];
    moneyBuy = json['money_buy'];
    exportPrice = json['export_price'];
    amount = json['amount'];
    importDate = json['import_date'];
    totalPrice = json['total_price'];
    totalPriceGet = json['total_price_get'];
    note = json['note'];
    userId = json['user_id'];
    customerId = json['customer_id'];
    customerCode = json['customer_code'];
    customerType = json['customer_type'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    customerAddress = json['customer_address'];
    accountingStatus = json['accounting_status'];
    userExportId = json['user_export_id'];
    warehouseId = json['warehouse_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isProcess = json['is_process'];
    statusId = json['status_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['product_id'] = this.productId;
    data['product_attr_id'] = this.productAttrId;
    data['imei'] = this.imei;
    data['serial'] = this.serial;
    data['title'] = this.title;
    data['import_price'] = this.importPrice;
    data['money_buy'] = this.moneyBuy;
    data['export_price'] = this.exportPrice;
    data['amount'] = this.amount;
    data['import_date'] = this.importDate;
    data['total_price'] = this.totalPrice;
    data['total_price_get'] = this.totalPriceGet;
    data['note'] = this.note;
    data['user_id'] = this.userId;
    data['customer_id'] = this.customerId;
    data['customer_code'] = this.customerCode;
    data['customer_type'] = this.customerType;
    data['customer_name'] = this.customerName;
    data['customer_phone'] = this.customerPhone;
    data['customer_address'] = this.customerAddress;
    data['accounting_status'] = this.accountingStatus;
    data['user_export_id'] = this.userExportId;
    data['warehouse_id'] = this.warehouseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['is_process'] = this.isProcess;
    data['status_id'] = this.statusId;
    return data;
  }
}
