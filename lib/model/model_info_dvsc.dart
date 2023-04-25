class ModelInfoDVSC {
  ProductAttr? productAttr;

  ModelInfoDVSC({this.productAttr});

  ModelInfoDVSC.fromJson(Map<String, dynamic> json) {
    productAttr = json['productAttr'] != null
        ? new ProductAttr.fromJson(json['productAttr'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productAttr != null) {
      data['productAttr'] = this.productAttr!.toJson();
    }
    return data;
  }
}

class ProductAttr {
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
  Null? deletedAt;
  List<WarehouseId>? warehouseId;
  int? typeId;
  int? userId;
  List<CustomerId>? customerId;
  String? customerCode;
  Null? customerType;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  int? projectId;
  String? isExport;
  List<Null>? productAttrMaterialAttr;

  ProductAttr(
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
        this.deletedAt,
        this.warehouseId,
        this.typeId,
        this.userId,
        this.customerId,
        this.customerCode,
        this.customerType,
        this.customerName,
        this.customerPhone,
        this.customerAddress,
        this.projectId,
        this.isExport,
        this.productAttrMaterialAttr});

  ProductAttr.fromJson(Map<String, dynamic> json) {
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
    deletedAt = json['deleted_at'];
    if (json['warehouse_id'] != null) {
      warehouseId = <WarehouseId>[];
      json['warehouse_id'].forEach((v) {
        warehouseId!.add(new WarehouseId.fromJson(v));
      });
    }
    typeId = json['type_id'];
    userId = json['user_id'];
    if (json['customer_id'] != null) {
      customerId = <CustomerId>[];
      json['customer_id'].forEach((v) {
        customerId!.add(new CustomerId.fromJson(v));
      });
    }
    customerCode = json['customer_code'];
    customerType = json['customer_type'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    customerAddress = json['customer_address'];
    projectId = json['project_id'];
    isExport = json['is_export'];
 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.productId != null) {
      data['product_id'] = this.productId!.map((v) => v.toJson()).toList();
    }
    data['imei'] = this.imei;
    data['serial'] = this.serial;
    data['title'] = this.title;
    data['import_price'] = this.importPrice;
    data['export_price'] = this.exportPrice;
    data['amount'] = this.amount;
    data['import_date'] = this.importDate;
    data['note'] = this.note;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.warehouseId != null) {
      data['warehouse_id'] = this.warehouseId!.map((v) => v.toJson()).toList();
    }
    data['type_id'] = this.typeId;
    data['user_id'] = this.userId;
    if (this.customerId != null) {
      data['customer_id'] = this.customerId!.map((v) => v.toJson()).toList();
    }
    data['customer_code'] = this.customerCode;
    data['customer_type'] = this.customerType;
    data['customer_name'] = this.customerName;
    data['customer_phone'] = this.customerPhone;
    data['customer_address'] = this.customerAddress;
    data['project_id'] = this.projectId;
    data['is_export'] = this.isExport;

    return data;
  }
}

class ProductId {
  String? code;
  String? name;

  ProductId({this.code, this.name});

  ProductId.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}

class WarehouseId {
  String? name;

  WarehouseId({this.name});

  WarehouseId.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class CustomerId {
  String? fullName;

  CustomerId({this.fullName});

  CustomerId.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    return data;
  }
}
