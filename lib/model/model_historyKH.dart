class ModelHistory {
  InfoKH? customer;
  List<ProductAttribute>? productAttribute;

  ModelHistory({this.customer, this.productAttribute});

  ModelHistory.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? new InfoKH.fromJson(json['customer'])
        : null;
    if (json['product_attribute'] != null) {
      productAttribute = <ProductAttribute>[];
      json['product_attribute'].forEach((v) {
        productAttribute!.add(new ProductAttribute.fromJson(v));
      });
    }
  }


}

class InfoKH {
  int? id;
  String? code;
  String? fullName;
  String? phone;
  String? address;

  String? facebookUrl;
  String? deliveryPhone;
  String? deliveryMethod;
  int? debtDays;
  String? note;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  InfoKH(
      {this.id,
        this.code,
        this.fullName,
        this.phone,
        this.address,

        this.facebookUrl,
        this.deliveryPhone,
        this.deliveryMethod,
        this.debtDays,
        this.note,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  InfoKH.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    fullName = json['full_name'];
    phone = json['phone'];
    address = json['address'];

    facebookUrl = json['facebook_url'];
    deliveryPhone = json['delivery_phone'];
    deliveryMethod = json['delivery_method'];
    debtDays = json['debt_days'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['full_name'] = this.fullName;
    data['phone'] = this.phone;
    data['address'] = this.address;

    data['facebook_url'] = this.facebookUrl;
    data['delivery_phone'] = this.deliveryPhone;
    data['delivery_method'] = this.deliveryMethod;
    data['debt_days'] = this.debtDays;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class ProductAttribute {
  int? id;
  List<ProductId>? productId;
  String? imei;
  String? serial;
  String? title;
  String? importPrice;
  String? exportPrice;
  int? amount;
  String? importDate;
  String? note;
  int? status;
  String? createdAt;
  String? updatedAt;

  int? warehouseId;
  int? typeId;
  List<UserId>? userId;
  int? customerId;
  String? customerCode;

  String? customerName;
  String? customerPhone;
  String? customerAddress;
  int? projectId;
  String? isExport;

  ProductAttribute(
      {this.id,
        this.productId,
        this.imei,
        this.serial,
        this.title,
        this.importPrice,
        this.exportPrice,
        this.amount,
        this.importDate,
        this.note,
        this.status,
        this.createdAt,
        this.updatedAt,

        this.warehouseId,
        this.typeId,
        this.userId,
        this.customerId,
        this.customerCode,

        this.customerName,
        this.customerPhone,
        this.customerAddress,
        this.projectId,
        this.isExport});

  ProductAttribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['product_id'] != null) {
      productId = <ProductId>[];
      json['product_id'].forEach((v) {
        productId!.add(new ProductId.fromJson(v));
      });
    }
    imei = json['imei'];
    serial = json['serial'];
    title = json['title'];
    importPrice = json['import_price'];
    exportPrice = json['export_price'];
    amount = json['amount'];
    importDate = json['import_date'];
    note = json['note'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    warehouseId = json['warehouse_id'];
    typeId = json['type_id'];
    if (json['user_id'] != null) {
      userId = <UserId>[];
      json['user_id'].forEach((v) {
        userId!.add(new UserId.fromJson(v));
      });
    }
    customerId = json['customer_id'];
    customerCode = json['customer_code'];

    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    customerAddress = json['customer_address'];
    projectId = json['project_id'];
    isExport = json['is_export'];
  }


}

class ProductId {
  int? id;
  int? projectId;
  String? code;
  String? name;
  String? note;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  ProductId(
      {this.id,
        this.projectId,
        this.code,
        this.name,
        this.note,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  ProductId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    code = json['code'];
    name = json['name'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    data['code'] = this.code;
    data['name'] = this.name;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class UserId {
  int? id;
  String? fullName;

  UserId({this.id, this.fullName});

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    return data;
  }
}
