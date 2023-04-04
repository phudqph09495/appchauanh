class ModelLocal {
  String? id;
  String? name;
bool? value;
  ModelLocal({this.id, this.name,this.value=false});
}

class ModelLocal2 {
  int? id;
  String? name;

  ModelLocal2({this.id, this.name});
}
class ModelKH {
  String id;
  String name;
String phone;
  ModelKH({required this.id, required this.name,required this.phone});
}
class ModelSp{
  String model;
  String seri;
  String gia;
  ModelSp({required this.model,required this.gia,required this.seri});
}
class ModelLink{
  String id;
  String name;
  String link;
  String soLuong;
  bool? value;
  ModelLink({this.value=false,required this.name,required this.id,required this.link,required this.soLuong});
}


