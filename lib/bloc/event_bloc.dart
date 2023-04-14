

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
  String? keySearch;
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
      this.keySearch,
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



