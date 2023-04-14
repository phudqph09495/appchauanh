import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/api.dart';
import '../../../config/path/api_path.dart';
import '../../../model/model_login.dart';
import '../../event_bloc.dart';
import '../../state_bloc.dart';

class BlocUpdateKH extends Bloc<EventBloc, StateBloc> {
  BlocUpdateKH() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is AddCustomer) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();
        req['full_name'] = event.fullName;
        req['phone'] = event.phone;
        req['address'] = event.address;
        req['facebook_url'] = event.fbURL;
        req['delivery_phone'] = event.deliPhone;
        req['delivery_method'] = event.deliMethod;
        req['note'] = event.note;
        req['types'] = event.types;
        print(req);
        var res = await Api.postAsync(
            endPoint: ApiPath.update+event.id.toString(), req: req, isToken: true,hasForm: false);
        print(res);

        if (res['status'] == true) {

          yield LoadSuccess(
          );
        } else if (res['status'] == false) {
          yield LoadFail(error: res['message'] ?? "Lỗi kết nối");
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error.error);
      } catch (e) {
        print(e);
        yield LoadFail(error: e.toString());
      }
    }
  }
}
