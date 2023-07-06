import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/api.dart';
import '../../../config/path/api_path.dart';
import '../../../model/model_listKH.dart';
import '../../../model/model_login.dart';
import '../../event_bloc.dart';
import '../../state_bloc.dart';

class BlocNhanMay extends Bloc<EventBloc, StateBloc> {
  BlocNhanMay() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is CreateRepairOrder) {
      yield Loading();
      try {
        Map<String, dynamic> req = event.toJson();

        print(req);
        var res = await Api.postAsync(
            endPoint: ApiPath.createRepairOrder, req: req, isToken: true,hasForm: false);
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


