class ModelLinkKien {
  int? id;
  MaterialId? materialId;
  WarehouseId? warehouseId;
  String? code;
  String? name;
  ProjectId? unitId;
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
  Null? deletedAt;

  ModelLinkKien(
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

  ModelLinkKien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    materialId = json['material_id'] != null
        ? new MaterialId.fromJson(json['material_id'])
        : null;
    warehouseId = json['warehouse_id'] != null
        ? new WarehouseId.fromJson(json['warehouse_id'])
        : null;
    code = json['code'];
    name = json['name'];
    unitId = json['unit_id'] != null
        ? new ProjectId.fromJson(json['unit_id'])
        : null;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.materialId != null) {
      data['material_id'] = this.materialId!.toJson();
    }
    if (this.warehouseId != null) {
      data['warehouse_id'] = this.warehouseId!.toJson();
    }
    data['code'] = this.code;
    data['name'] = this.name;
    if (this.unitId != null) {
      data['unit_id'] = this.unitId!.toJson();
    }
    data['import_price'] = this.importPrice;
    data['sale_price'] = this.salePrice;
    data['amount'] = this.amount;
    data['import_date'] = this.importDate;
    data['note'] = this.note;
    data['customer_id'] = this.customerId;
    data['customer_code'] = this.customerCode;
    data['customer_type'] = this.customerType;
    data['customer_name'] = this.customerName;
    data['customer_phone'] = this.customerPhone;
    data['customer_address'] = this.customerAddress;
    data['project_id'] = this.projectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class MaterialId {
  String? name;
  String? code;

  MaterialId({this.name, this.code});

  MaterialId.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}

class WarehouseId {
  String? name;
  ProjectId? projectId;

  WarehouseId({this.name, this.projectId});

  WarehouseId.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    projectId = json['project_id'] != null
        ? new ProjectId.fromJson(json['project_id'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.projectId != null) {
      data['project_id'] = this.projectId!.toJson();
    }
    return data;
  }
}

class ProjectId {
  String? name;

  ProjectId({this.name});

  ProjectId.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
