import '../../../model/model_linhKien.dart';

abstract class EventBloc2 {}

class AddData extends EventBloc2 {
  ModelLinkKien linhkien;
  AddData({required this.linhkien});
}

class Reduce extends EventBloc2 {
  ModelLinkKien linkkien;
  Reduce({required this.linkkien});
}

class ClearAll extends EventBloc2 {}

class GetCart extends EventBloc2 {}

