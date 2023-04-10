import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/api.dart';
import '../../../config/path/api_path.dart';
import '../../../model/model_login.dart';
import '../../event_bloc.dart';
import '../../state_bloc.dart';



class BlocLogout extends Bloc<EventBloc, StateBloc> {
  BlocLogout() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is GetData) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();

        var res = await Api.postAsync(
            endPoint: ApiPath.logout, req: req, isToken: true);

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
