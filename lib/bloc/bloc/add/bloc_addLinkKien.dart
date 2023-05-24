import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../model/model_linhKien.dart';
import '../../state_bloc.dart';
import 'event_bloc2.dart';

class BlocCartLocal extends Bloc<EventBloc2, StateBloc> {
  BlocCartLocal() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc2 event) async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (event is AddData) {

      String jsonString = prefs.getString('cart') ?? '[]';
      List<ModelLinkKien> list = jsonString != "[]"&&jsonString != ''
          ? List<ModelLinkKien>.from(
          jsonDecode(jsonString).map((x) => ModelLinkKien.fromJson(x)))
          : [];
      list.add(event.linhkien);


      jsonString = jsonEncode(list);
      prefs.setString('cart', jsonString);
      print(jsonString);
      yield LoadSuccess(data: list);
    }
    if (event is GetCart) {
      String jsonString = prefs.getString('cart') ?? '[]';
      print(jsonString);
      List<ModelLinkKien> objects = jsonString != '' && jsonString != '[]'
          ? List<ModelLinkKien>.from(
          jsonDecode(jsonString).map((x) => ModelLinkKien.fromJson(x)))
          : [];

      yield LoadSuccess(data: objects,);
    }
    if (event is Reduce) {
      String jsonString = prefs.getString('cart') ?? '[]';

      List<ModelLinkKien> objects = jsonString != "[]"&&jsonString != ''
          ? List<ModelLinkKien>.from(
          jsonDecode(jsonString).map((x) => ModelLinkKien.fromJson(x)))
          : [];

      List<int> idList = [];
      for (var item in objects) {
        idList.add(item.id ?? 0);
      }
      for (var i = 0; i < objects.length; i++) {
        if (idList[i] == (event.linkkien.id)) {
          objects.removeAt(i);
          break;
        }
      }
      jsonString = jsonEncode(objects);
      prefs.setString('cart', jsonString);
      yield LoadSuccess(
        data: objects,
      );
    }
    if (event is ClearAll) {
      String jsonString = await prefs.getString('cart') ?? '';
      print(jsonString);
      List<ModelLinkKien> objects = jsonString != "[]"
          ? List<ModelLinkKien>.from(
          jsonDecode(jsonString).map((x) => ModelLinkKien.fromJson(x)))
          : [];
      objects.clear();
      jsonString = jsonEncode(objects);
      prefs.setString('cart', jsonString);
    }
  }
}
