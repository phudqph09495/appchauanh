class ModelListKH {
  List<Types>? types;
  List<Customers>? customers;

  ModelListKH({this.types, this.customers});

  ModelListKH.fromJson(Map<String, dynamic> json) {
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
    if (json['customers'] != null) {
      customers = <Customers>[];
      json['customers'].forEach((v) {
        customers!.add(new Customers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    if (this.customers != null) {
      data['customers'] = this.customers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Types {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Types({this.id, this.name, this.createdAt, this.updatedAt, this.deletedAt});

  Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Customers {
  int? id;
  String? fullName;
  String? address;
  String? phone;
  List<Type>? type;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Customers(
      {this.id,
        this.fullName,
        this.address,
        this.phone,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Customers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    address = json['address'];
    phone = json['phone'];
    if (json['type'] != null) {
      type = <Type>[];
      json['type'].forEach((v) {
        type!.add(new Type.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['address'] = this.address;
    data['phone'] = this.phone;
    if (this.type != null) {
      data['type'] = this.type!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Type {
  int? id;
  String? name;

  Type({this.id, this.name});

  Type.fromJson(Map<String, dynamic> json) {
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
