import 'package:ChauAnh/bloc/check_log_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:ChauAnh/widget/item/button.dart';
import 'package:ChauAnh/widget/item/custom_toast.dart';

import '../../bloc/bloc/auth/bloc_check_login.dart';
import '../../bloc/bloc/auth/bloc_login.dart';
import '../../bloc/event_bloc.dart';
import '../../bloc/state_bloc.dart';
import '../../config/path/share_pref_path.dart';
import '../../config/share_pref.dart';
import '../../home.dart';
import '../../model/model_login.dart';
import '../../style/init_style.dart';
import '../../validator.dart';
import '../../widget/item/input/text_filed.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final keyForm = GlobalKey<FormState>();
  BlocLogin blocLogin=BlocLogin();
  TextEditingController userName=TextEditingController();
  TextEditingController pass=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double a= MediaQuery.of(context).size.height-780;
    return Scaffold(
      backgroundColor: ColorApp.bg,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(ImagePath.loginUp),
            Center(
              child: Form(
                key: keyForm,
                child: Column(
                  children: [
                    Image.asset(ImagePath.logo),
                    Text(
                      'Đăng Nhập',
                      style: StyleApp.dangnhap(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InputText1(
                      width: 330,
                      controller: userName,
                      label: 'Nhập tài khoản',
                      validator: (val) {
                        return ValidatorApp.checkNull(text: val, isTextFiled: true);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InputText1(
                      controller: pass,
                      validator: (val) {
                        return ValidatorApp.checkPass(text: val);
                      },
                      width: 330,
                      label: 'Nhập mật khẩu',
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    BlocListener(bloc: blocLogin,
                      listener: (_,StateBloc state) {
                        ModelLogin model = ModelLogin();

                        if (state is LoadSuccess) {
                          model = state.data;
                        }

                      CheckLogState.check(context, state: state,msg: 'Đăng nhập thành công',
                      success: ()async{
                        await SharePrefsKeys.saveUserKey(model);
                        // await    SharedPrefs.saveString(SharePrefsKeys.user_token,model.accessToken);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyHomePage()));
                      });
                      },
                      child: Button1(
                          width: 330,
                          radius: 20,
                          ontap: () async {

                           if(keyForm.currentState!.validate()){
                           blocLogin.add(LoginApp(userName: userName.text, password: pass.text));
                           }
                          },
                          colorButton: ColorApp.main,
                          textColor: Colors.white,
                          textButton: 'Đăng Nhập'),
                    )
                  ],
                ),
              ),
            ),
      a>=0?      SizedBox(height: a,):Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(ImagePath.loginDown1),
                Image.asset(ImagePath.loginDown2)
              ],
            ),


          ],
        ),
      ),
    );
  }
}
