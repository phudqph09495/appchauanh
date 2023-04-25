class ModelDVSC {
  User? user;
  List<ProductAttrs>? productAttrs;

  ModelDVSC({this.user, this.productAttrs});

  ModelDVSC.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['productAttrs'] != null) {
      productAttrs = <ProductAttrs>[];
      json['productAttrs'].forEach((v) {
        productAttrs!.add(ProductAttrs.fromJson(v));
      });
    }
  }


}

class User {
  int? id;
  String? name;
  String? fullName;
  String? email;
  String? phone;
  int? role;
  int? projectId;
  String? emailVerifiedAt;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  User(
      {this.id,
        this.name,
        this.fullName,
        this.email,
        this.phone,
        this.role,
        this.projectId,
        this.emailVerifiedAt,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    projectId = json['project_id'];
    emailVerifiedAt = json['email_verified_at'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['project_id'] = this.projectId;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class ProductAttrs {
  int? id;
  int? productId;
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
  int? warehouseId;
  int? typeId;
  int? userId;
  int? customerId;
  String? customerCode;
  Null? customerType;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  int? projectId;
  String? isExport;
  // List<Null>? productAttrMaterialAttr;

  ProductAttrs(
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
        // this.productAttrMaterialAttr
      });

  ProductAttrs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
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
    warehouseId = json['warehouse_id'];
    typeId = json['type_id'];
    userId = json['user_id'];
    customerId = json['customer_id'];
    customerCode = json['customer_code'];
    customerType = json['customer_type'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    customerAddress = json['customer_address'];
    projectId = json['project_id'];
    isExport = json['is_export'];
    // if (json['product_attr_material_attr'] != null) {
    //   productAttrMaterialAttr = <Null>[];
    //   json['product_attr_material_attr'].forEach((v) {
    //     productAttrMaterialAttr!.add(new Null.fromJson(v));
    //   });
    // }
  }

}
