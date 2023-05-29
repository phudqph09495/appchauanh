

import '../model/model_linhKien.dart';

abstract class EventBloc {}

class LoadMoreEvent extends EventBloc {
  String? id;
  int limit, page;
  bool cleanList, loadMore;

  LoadMoreEvent({
    this.id,
    this.cleanList = false,
    this.limit = 12,
    this.page = 1,
    this.loadMore = false,
  });
}



class GetData extends EventBloc {
  int? cat_id;
  int? class_id;
  int? subject_id;
  String? id;
  String keySearch;
  String? keySearch1;
  String? keySearch2;
  String? keyword;
  String? name;
  String? number;
  String? bankName;
  String? money;

  int? countFilter;
  int? delete;
  bool? isUser = true;
  int limit, page;
  String param;
  bool cleanList, loadMore;

  GetData(
      {this.keyword,
      this.cat_id,
      this.class_id,
      this.id,
      this.subject_id,
      this.keySearch='',
      this.keySearch1,
      this.keySearch2,
      this.bankName,
      this.name,
      this.number,
this.param='',
      this.money,
      this.delete,
      this.cleanList = false,
      this.limit = 20,
      this.page = 1,
      this.loadMore = false,
      this.isUser});
}

class GetData2 extends EventBloc{}



class UpdateProfile extends EventBloc {
  String? user_id;
  String? birthday;
  String? phone;
  String? email;
  String? sex;
  String? avatar;
  String? cmt;
  String? province_id;
  String? district_id;
  Map<String, dynamic>? req;

  UpdateProfile(
      {this.req,
      this.user_id,
      this.birthday,
      this.phone,
      this.email,
      this.sex,
      this.avatar,
      this.cmt,
      this.province_id,
      this.district_id});
}



class LoginApp extends EventBloc {
  String userName;
  String password;

  LoginApp({
    required this.userName,
    required this.password,
  });
}

class AddCustomer extends EventBloc{
  String? id;
  String? fullName;
  String? phone;
  String? address;
  String? fbURL;
  String? deliPhone;
  String? deliMethod;
  String? note;
  List<int>?  types;
  AddCustomer({this.note,this.address,this.phone,this.fullName,this.deliMethod,this.deliPhone,this.fbURL,this.types,this.id});
}

class CreateRepairOrder extends EventBloc{
  int? productId;
  int? warehouseId;
  int? customerId;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  String? customerCode;
  String? moneyBuy;
  String? importPrice;
  int? type;
  int? userId;
  String? model;
  String? serial;
  String? title;
  String? exportPrice;
  String? amount;
  String? importDate;
  String? note;
  List<MaterialAttribute>? materialAttribute;

  CreateRepairOrder(
      {this.productId,
        this.warehouseId,
        this.customerId,
        this.type,
        this.importPrice,
        this.customerCode,
        this.moneyBuy,
        this.customerName,
        this.customerPhone,
        this.customerAddress,
        this.userId,
        this.model,
        this.serial,
        this.title,
        this.exportPrice,
        this.amount,
        this.importDate,
        this.materialAttribute,
        this.note});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product_id'] = productId;
    data['warehouse_id'] = warehouseId;
    data['customer_id'] = customerId;
    data['customer_name'] = customerName;
    data['customer_phone'] = customerPhone;
    data['customer_address'] = customerAddress;
    data['user_id'] = userId;
    data['model'] = model;
    data['serial'] = serial;
    data['title'] = title;
    data['export_price'] = exportPrice;
    data['amount'] = amount;
    data['import_date'] = importDate;
    data['note'] = note;


    data['customer_code'] = customerCode;
    data['money_buy'] = moneyBuy;
    data['import_price'] = importPrice;
    data['type'] = type;
    if (this.materialAttribute != null) {
      data['materialAttribute'] =
          this.materialAttribute!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UpdateOrder extends EventBloc{
  int? id;
  int? status;
  String? note;
  List<MaterialAttribute>? materialAttribute;
  UpdateOrder({this.id,this.status,this.note,this.materialAttribute});

}
class MaterialAttribute {
  int? id;
  int? amount;

  MaterialAttribute({this.id, this.amount});

  MaterialAttribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    return data;
  }
}
class DanhSachLK{
  ModelLinkKien? modelLinkKien;
  int? soLuong;
  DanhSachLK({this.modelLinkKien,this.soLuong});
}
class materrial{
  int? id;
  int? solUong;
  materrial({this.id,this.solUong});
}




