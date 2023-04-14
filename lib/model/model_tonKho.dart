class ModelTonKho {
  List<Materials>? material;

  ModelTonKho({this.material});

  ModelTonKho.fromJson(Map<String, dynamic> json) {
    if (json['material'] != null) {
      material = <Materials>[];
      json['material'].forEach((v) {
        material!.add(new Materials.fromJson(v));
      });
    }
  }


}

class Materials {
  int? id;
  String? name;
  String? code;
  List<MaterialAttrs>? materialAttrs;
  int? totalAmount;
  String? averagePrice;

  Materials(
      {this.id,
        this.name,
        this.code,
        this.materialAttrs,
        this.totalAmount,
        this.averagePrice});

  Materials.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    if (json['material_attrs'] != null) {
      materialAttrs = <MaterialAttrs>[];
      json['material_attrs'].forEach((v) {
        materialAttrs!.add(new MaterialAttrs.fromJson(v));
      });
    }
    totalAmount = json['total_amount']!=null?json['total_amount']:0;
    averagePrice = json['average_price'].toString()!='null'?json['average_price'].toString():'0';
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
  String? customerId;
  String? customerCode;
  String? customerType;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  String? projectId;
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
    note = json['note'].toString();
    customerId = json['customer_id'].toString();
    customerCode = json['customer_code'].toString();
    customerType = json['customer_type'].toString();
    customerName = json['customer_name'].toString();
    customerPhone = json['customer_phone'].toString();
    customerAddress = json['customer_address'].toString();
    projectId = json['project_id'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'].toString();
  }

}
