class ModelDVSC {
  User? user;
  List<ProductAttrs>? productAttrs;
  List<Total>? total;

  ModelDVSC({this.user, this.productAttrs, this.total});

  ModelDVSC.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['productAttrs'] != null) {
      productAttrs = <ProductAttrs>[];
      json['productAttrs'].forEach((v) {
        productAttrs!.add(new ProductAttrs.fromJson(v));
      });
    }
    if (json['total'] != null) {
      total = <Total>[];
      json['total'].forEach((v) {
        total!.add(new Total.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.productAttrs != null) {
      data['productAttrs'] = this.productAttrs!.map((v) => v.toJson()).toList();
    }
    if (this.total != null) {
      data['total'] = this.total!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? fullName;
  Null? email;
  String? phone;
  int? role;
  int? projectId;
  Null? emailVerifiedAt;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  List<UserId>? userId;
  int? customerId;
  String? customerCode;
  Null? customerType;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  int? projectId;
  String? isExport;
  List<ProductAttrMaterialAttr>? productAttrMaterialAttr;

  ProductAttrs(
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

  ProductAttrs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
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

    typeId = json['type_id'];
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
    if (json['warehouse_id'] != null) {
      warehouseId = <WarehouseId>[];
      json['warehouse_id'].forEach((v) {
        warehouseId!.add(new WarehouseId.fromJson(v));
      });
    }

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
    data['product_id'] = this.productId;
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
    data['warehouse_id'] = this.warehouseId;
    data['type_id'] = this.typeId;
    if (this.userId != null) {
      data['user_id'] = this.userId!.map((v) => v.toJson()).toList();
    }
    data['customer_id'] = this.customerId;
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

class WarehouseId {
  int? id;
  String? name;

  WarehouseId({this.id, this.name});

  WarehouseId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class UserId {
  String? fullName;
  int? id;
  UserId({this.fullName,this.id});

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    return data;
  }
}

class ProductAttrMaterialAttr {
  String? code;

  ProductAttrMaterialAttr({this.code});

  ProductAttrMaterialAttr.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    return data;
  }
}

class Total {
  int? total;
  int? dangXuLy;
  int? daXuLy;
  int? choLinhKien;
  int? khongSuaDuoc;
  int? nhaMua;
  int? baoHanh;
  int? hoanThanh;

  Total(
      {this.total,
        this.dangXuLy,
        this.daXuLy,
        this.choLinhKien,
        this.khongSuaDuoc,
        this.nhaMua,
        this.baoHanh,
        this.hoanThanh});

  Total.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    dangXuLy = json['dang_xu_ly'];
    daXuLy = json['da_xu_ly'];
    choLinhKien = json['cho_linh_kien'];
    khongSuaDuoc = json['khong_sua_duoc'];
    nhaMua = json['nha_mua'];
    baoHanh = json['bao_hanh'];
    hoanThanh = json['hoan_thanh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['dang_xu_ly'] = this.dangXuLy;
    data['da_xu_ly'] = this.daXuLy;
    data['cho_linh_kien'] = this.choLinhKien;
    data['khong_sua_duoc'] = this.khongSuaDuoc;
    data['nha_mua'] = this.nhaMua;
    data['bao_hanh'] = this.baoHanh;
    data['hoan_thanh'] = this.hoanThanh;
    return data;
  }
}
