import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/api.dart';
import '../../../config/path/api_path.dart';
import '../../../model/model_listKH.dart';
import '../../../model/model_showKH.dart';
import '../../../model/model_login.dart';
import '../../../model/model_tonKho.dart';
import '../../event_bloc.dart';
import '../../state_bloc.dart';



class BlocListTonKho extends Bloc<EventBloc, StateBloc> {
  BlocListTonKho() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      yield Loading();
      try {

        var res = await Api.getAsync(
            endPoint: ApiPath.listTonKho,  isToken: true);

        if (res['status'] == true) {
          ModelTonKho model = ModelTonKho.fromJson(res['data']);


          yield LoadSuccess(
            data: model,
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
