import 'package:ChauAnh/model/model_profile.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/api.dart';
import '../../../config/path/api_path.dart';
import '../../../model/model_detailBG.dart';
import '../../../model/model_listBG.dart';
import '../../../model/model_login.dart';
import '../../event_bloc.dart';
import '../../state_bloc.dart';



class BlocDetailBG extends Bloc<EventBloc, StateBloc> {
  BlocDetailBG() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      yield Loading();
      try {

        var res = await Api.getAsync(
            endPoint: ApiPath.detailBG+event.param,  isToken: true);

        if (res['status'] == true) {
          ModelDetailBG model = ModelDetailBG.fromJson(res['data']);


          yield LoadSuccess(
            data: model,
          );
        } else if (res['status'] == false) {
          yield LoadFail(error: res['message'] ?? "Lỗi kết nối");
        }
      } on DioError catch (e) {
        yield LoadFail(error: e.error.toString());
      } catch (e) {
        print(e);
        yield LoadFail(error: e.toString());
      }
    }
  }
}
