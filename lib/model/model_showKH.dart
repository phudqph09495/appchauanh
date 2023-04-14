class ModelShowKH {

  List<Customers>? customers;

  ModelShowKH({ this.customers});

  ModelShowKH.fromJson(Map<String, dynamic> json) {

    if (json['customers'] != null) {
      customers = <Customers>[];
      json['customers'].forEach((v) {
        customers!.add(new Customers.fromJson(v));
      });
    }
  }


}



class Customers {
  int? id;
  String? code;
  String? fullName;
  String? phone;
  String? address;
  List<Type>? type;
  String? facebookUrl;
  String? deliveryPhone;
  String? deliveryMethod;
  int? debtDays;
  String? note;
  String? createdAt;
  String? updatedAt;


  Customers(
      {this.id,
        this.code,
        this.fullName,
        this.phone,
        this.address,
        this.type,
        this.facebookUrl,
        this.deliveryPhone,
        this.deliveryMethod,
        this.debtDays,
        this.note,
        this.createdAt,
        this.updatedAt,
      });

  Customers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    fullName = json['full_name'];
    phone = json['phone'];
    address = json['address'];
    if (json['type'] != null) {
      type = <Type>[];
      json['type'].forEach((v) {
        type!.add(new Type.fromJson(v));
      });
    }
    facebookUrl = json['facebook_url'];
    deliveryPhone = json['delivery_phone'];
    deliveryMethod = json['delivery_method'];
    debtDays = json['debt_days'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['full_name'] = this.fullName;
    data['phone'] = this.phone;
    data['address'] = this.address;
    if (this.type != null) {
      data['type'] = this.type!.map((v) => v.toJson()).toList();
    }
    data['facebook_url'] = this.facebookUrl;
    data['delivery_phone'] = this.deliveryPhone;
    data['delivery_method'] = this.deliveryMethod;
    data['debt_days'] = this.debtDays;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    return data;
  }
}

class Type {
  int? id;
  String? name;
bool? value;
  Type({this.id, this.name,this.value});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
