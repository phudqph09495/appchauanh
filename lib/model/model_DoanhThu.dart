class ModelDoanhThu {
  List<Orders>? orders;
  int? total;
  int? orderTotalImportPrice;
  int? orderTotalPrice;
  ModelDoanhThu({this.orders,
    this.total,
    this.orderTotalImportPrice,
    this.orderTotalPrice});

  ModelDoanhThu.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    total = json['total'];
    orderTotalImportPrice = json['order_total_import_price'];
    orderTotalPrice = json['order_total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  int? type;
  int? productId;
  int? productAttrId;
  String? imei;
  String? serial;
  String? title;
  String? importPrice;
  String? exportPrice;
  int? amount;
  String? importDate;
  String? totalPrice;
  String? totalPriceGet;
  String? note;
  List<UserId>? userId;
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
  int? revenue;
  List<OrderDetails>? orderDetails;
  String? totalImportPrice;

  Orders(
      {this.id,
        this.type,
        this.productId,
        this.productAttrId,
        this.imei,
        this.serial,
        this.title,
        this.importPrice,
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
        this.statusId,
        this.revenue,
        this.orderDetails,
        this.totalImportPrice});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    productId = json['product_id'];
    productAttrId = json['product_attr_id'];
    imei = json['imei'];
    serial = json['serial'];
    title = json['title'];
    importPrice = json['import_price'];
    exportPrice = json['export_price'];
    amount = json['amount'];
    importDate = json['import_date'];
    totalPrice = json['total_price'];
    totalPriceGet = json['total_price_get'];
    note = json['note'];
    if (json['user_id'] != null) {
      userId = <UserId>[];
      json['user_id'].forEach((v) {
        userId!.add(new UserId.fromJson(v));
      });
    }
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
    revenue = json['revenue'];
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
    totalImportPrice = json['total_import_price'].toString()!=""?json['total_import_price'].toString():"0";
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
    data['export_price'] = this.exportPrice;
    data['amount'] = this.amount;
    data['import_date'] = this.importDate;
    data['total_price'] = this.totalPrice;
    data['total_price_get'] = this.totalPriceGet;
    data['note'] = this.note;
    if (this.userId != null) {
      data['user_id'] = this.userId!.map((v) => v.toJson()).toList();
    }
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
    data['revenue'] = this.revenue;
    if (this.orderDetails != null) {
      data['order_details'] =
          this.orderDetails!.map((v) => v.toJson()).toList();
    }
    data['total_import_price'] = this.totalImportPrice;
    return data;
  }
}

class UserId {
  String? fullName;

  UserId({this.fullName});

  UserId.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    return data;
  }
}

class OrderDetails {
  int? id;
  int? orderId;
  int? productAttrId;
  int? materialAttrId;
  String? code;
  String? name;
  String? importPrice;
  String? salePrice;
  int? amount;
  String? note;
  int? customerId;
  String? customerCode;
  String? customerType;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  OrderDetails(
      {this.id,
        this.orderId,
        this.productAttrId,
        this.materialAttrId,
        this.code,
        this.name,
        this.importPrice,
        this.salePrice,
        this.amount,
        this.note,
        this.customerId,
        this.customerCode,
        this.customerType,
        this.customerName,
        this.customerPhone,
        this.customerAddress,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productAttrId = json['product_attr_id'];
    materialAttrId = json['material_attr_id'];
    code = json['code'];
    name = json['name'];
    importPrice = json['import_price'];
    salePrice = json['sale_price'];
    amount = json['amount'];
    note = json['note'];
    customerId = json['customer_id'];
    customerCode = json['customer_code'];
    customerType = json['customer_type'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    customerAddress = json['customer_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_attr_id'] = this.productAttrId;
    data['material_attr_id'] = this.materialAttrId;
    data['code'] = this.code;
    data['name'] = this.name;
    data['import_price'] = this.importPrice;
    data['sale_price'] = this.salePrice;
    data['amount'] = this.amount;
    data['note'] = this.note;
    data['customer_id'] = this.customerId;
    data['customer_code'] = this.customerCode;
    data['customer_type'] = this.customerType;
    data['customer_name'] = this.customerName;
    data['customer_phone'] = this.customerPhone;
    data['customer_address'] = this.customerAddress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
