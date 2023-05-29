import 'model_linhKien.dart';

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
  String? moneyBuy;
  String? exportPrice;
  int? amount;
  String? importDate;
  String? note;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<WarehouseId>? warehouseId;
  int? typeId;
  int? userId;
  List<CustomerId>? customerId;
  String? customerCode;
  String? customerType;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  int? projectId;
  String? isExport;
  List<ProductAttrMaterialAttr>? productAttrMaterialAttr;

  ProductAttr(
      {this.id,
        this.productId,
        this.imei,
        this.serial,
        this.title,
        this.importPrice,
        this.moneyBuy,
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
    moneyBuy = json['money_buy'];
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
    if (json['product_attr_material_attr'] != null) {
      productAttrMaterialAttr = <ProductAttrMaterialAttr>[];
      json['product_attr_material_attr'].forEach((v) {
        productAttrMaterialAttr!.add(new ProductAttrMaterialAttr.fromJson(v));
      });
    }
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
    data['money_buy'] = this.moneyBuy;
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
    if (this.productAttrMaterialAttr != null) {
      data['product_attr_material_attr'] =
          this.productAttrMaterialAttr!.map((v) => v.toJson()).toList();
    }
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

class ProductAttrMaterialAttr {
  int? id;
  int? productAttrId;
  int? materialAttrId;
  String? code;
  String? name;
  String? importPrice;
  String? salePrice;
  int? amount;
  Null? note;
  Null? customerId;
  Null? customerCode;
  Null? customerType;
  Null? customerName;
  Null? customerPhone;
  Null? customerAddress;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  ProductAttrMaterialAttr(
      {this.id,
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

  ProductAttrMaterialAttr.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
