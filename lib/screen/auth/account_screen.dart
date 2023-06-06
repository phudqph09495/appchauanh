import 'package:ChauAnh/bloc/bloc/auth/bloc_profile.dart';
import 'package:ChauAnh/bloc/check_log_state.dart';
import 'package:ChauAnh/bloc/event_bloc.dart';
import 'package:ChauAnh/model/model_profile.dart';
import 'package:ChauAnh/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:ChauAnh/widget/item/load_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/auth/bloc_check_login.dart';
import '../../bloc/bloc/auth/bloc_logout.dart';
import '../../bloc/state_bloc.dart';
import '../../config/path/share_pref_path.dart';
import '../../style/init_style.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  BlocProfile blocProfile=BlocProfile()..add(GetData());
  BlocLogout blocLogout=BlocLogout();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder(builder: (_,StateBloc state){
      if(state is LoadSuccess){
        ModelProfile modelProfile=state.data;
         return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Image.asset(
              ImagePath.logomau,
              width: 60,
              height: 60,
            ),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: ColorApp.linearGradientBanner,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        ClipOval(
                            child: LoadImage(
                              url:
                              'https://pbs.twimg.com/media/FsF1CjHacAAW-bR?format=jpg&name=large',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${modelProfile.name}',
                          style: StyleApp.textStyle700(fontSize: 22),
                        ),
                      ],
                    ),
                  ),SizedBox(height: 10,),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Phone Number',
                    style:
                    StyleApp.textStyle600(fontSize: 18, color: ColorApp.blue8F),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${modelProfile.phone}',
                    style:
                    StyleApp.textStyle400(fontSize: 15, color: ColorApp.grey8B),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Email',
                    style:
                    StyleApp.textStyle600(fontSize: 18, color: ColorApp.blue8F),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${modelProfile.email}',
                    style:
                    StyleApp.textStyle400(fontSize: 15, color: ColorApp.grey8B),
                  ),
                  SizedBox(
                    height: 5
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Chức vụ',
                    style:
                    StyleApp.textStyle600(fontSize: 18, color: ColorApp.blue8F),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    modelProfile.role!.name??'',
                    style:
                    StyleApp.textStyle400(fontSize: 15, color: ColorApp.grey8B),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Chí nhánh',
                    style:
                    StyleApp.textStyle600(fontSize: 18, color: ColorApp.blue8F),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                 ...List.generate(modelProfile.projectId!.length, (index) => Text(
                   '${modelProfile.projectId![index].name} - ${modelProfile.projectId![index].description}',
                   style:
                   StyleApp.textStyle400(fontSize: 15, color: ColorApp.grey8B),
                 ),),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  BlocListener(bloc: blocLogout,
                    listener: (_,StateBloc state) {
                    CheckLogState.check(context, state: state,msg: 'Đăng xuất thành công',success: ()async{
                      SharePrefsKeys.removeAllKey();
                      context.read<BlocCheckLogin>().add(GetData());
                    });
                    },
                    child: InkWell(onTap: (){
                      blocLogout.add(GetData());
                    },
                      child: Container(width: double.infinity,
                        color: ColorApp.blue00,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text('Đăng xuất',textAlign: TextAlign.center,style: StyleApp.textStyle500(color: Colors.white),),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
      if(state is LoadFail){
        return LoginScreen();
      }
      if(state is Loading){
        return Center(child: Text('Đang load, đợi xíu...'),);
      }
      return SizedBox();
    },bloc: blocProfile,);
  }
}
