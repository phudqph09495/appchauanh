class ModelDetailBG {
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
  List<UserId>? userId;
  int? customerId;
  String? customerCode;
  String? customerType;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  int? accountingStatus;
  List<UserId>? userExportId;
  List<UserId>? warehouseId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? isProcess;
  String? statusId;
  List<OrderDetails>? orderDetails;

  ModelDetailBG(
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
        this.statusId,
        this.orderDetails});

  ModelDetailBG.fromJson(Map<String, dynamic> json) {
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
    if (json['user_export_id'] != null) {
      userExportId = <UserId>[];
      json['user_export_id'].forEach((v) {
        userExportId!.add(new UserId.fromJson(v));
      });
    }
    if (json['warehouse_id'] != null) {
      warehouseId = <UserId>[];
      json['warehouse_id'].forEach((v) {
        warehouseId!.add(new UserId.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isProcess = json['is_process'];
    statusId = json['status_id'];
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
  }


}

class UserId {
  int? id;
  String? name;

  UserId({this.id, this.name});

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
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

  String? createdAt;
  String? updatedAt;


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

        this.createdAt,
        this.updatedAt,
       });

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

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

  }

}
