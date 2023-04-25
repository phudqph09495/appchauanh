class ModelTonKho {
  List<Product>? product;

  ModelTonKho({this.product});

  ModelTonKho.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }


}

class Product {
  int? id;
  String? name;
  String? code;
  List<MaterialAttrs>? materialAttrs;
  int? totalAmount;
  String? averagePrice;

  Product(
      {this.id,
        this.name,
        this.code,
        this.materialAttrs,
        this.totalAmount,
        this.averagePrice});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    if (json['material_attrs'] != null) {
      materialAttrs = <MaterialAttrs>[];
      json['material_attrs'].forEach((v) {
        materialAttrs!.add(new MaterialAttrs.fromJson(v));
      });
    }
    totalAmount = json['total_amount'];
    averagePrice = json['average_price'].toString();
  }


}

class MaterialAttrs {
  int? id;
  int? materialId;
  int? warehouseId;
  String? code;
  String? name;
  String? unitId;
  String? importPrice;
  String? salePrice;
  int? amount;
  String? importDate;
  String? note;
  int? customerId;
  String? customerCode;
  String? customerType;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  int? projectId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  MaterialAttrs(
      {this.id,
        this.materialId,
        this.warehouseId,
        this.code,
        this.name,
        this.unitId,
        this.importPrice,
        this.salePrice,
        this.amount,
        this.importDate,
        this.note,
        this.customerId,
        this.customerCode,
        this.customerType,
        this.customerName,
        this.customerPhone,
        this.customerAddress,
        this.projectId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  MaterialAttrs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    materialId = json['material_id'];
    warehouseId = json['warehouse_id'];
    code = json['code'];
    name = json['name'];
    unitId = json['unit_id'];
    importPrice = json['import_price'];
    salePrice = json['sale_price'];
    amount = json['amount'];
    importDate = json['import_date'];
    note = json['note'];
    customerId = json['customer_id'];
    customerCode = json['customer_code'];
    customerType = json['customer_type'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    customerAddress = json['customer_address'];
    projectId = json['project_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }


}
