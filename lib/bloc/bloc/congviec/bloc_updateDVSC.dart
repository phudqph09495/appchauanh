import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/api.dart';
import '../../../config/path/api_path.dart';
import '../../../model/model_listKH.dart';
import '../../../model/model_login.dart';
import '../../event_bloc.dart';
import '../../state_bloc.dart';

class BlocUpdateOrder extends Bloc<EventBloc, StateBloc> {
  BlocUpdateOrder() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc event) async* {
    if (event is UpdateOrder) {
      yield Loading();
      try {
        Map<String, dynamic> req = Map();

        req['productAttr_id']=event.id;
        req['status']=event.status;
        req['note']=event.note;
        req['materialAttribute']=event.materialAttribute;


        var res = await Api.postAsync(
            endPoint: ApiPath.updateJob, req: req, isToken: true,hasForm: false);


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
