class ModelListKH {
  List<Customer>? customers;

  ModelListKH({this.customers});

  ModelListKH.fromJson(Map<String, dynamic> json) {
    if (json['customers'] != null) {
      customers = <Customer>[];
      json['customers'].forEach((v) {
        customers!.add(new Customer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customers != null) {
      data['customers'] = this.customers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? code;
  String? fullName;
  String? phone;
  String? address;
  String? type;
  String? facebookUrl;
  String? deliveryPhone;
  String? deliveryMethod;
  int? debtDays;
  String? note;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Customer(
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
        this.deletedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    fullName = json['full_name'];
    phone = json['phone'];
    address = json['address'];
    type = json['type'];
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
    data['type'] = this.type;
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
