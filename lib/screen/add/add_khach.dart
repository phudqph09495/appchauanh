import 'package:ChauAnh/bloc/event_bloc.dart';
import 'package:ChauAnh/model/model_local.dart';
import 'package:ChauAnh/widget/item/button.dart';
import 'package:ChauAnh/widget/item/custom_toast.dart';
import 'package:ChauAnh/widget/item/input/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/KhachHang/bloc_addKH.dart';
import '../../bloc/check_log_state.dart';
import '../../bloc/state_bloc.dart';
import '../../style/init_style.dart';
import '../../validator.dart';

class AddKhach extends StatefulWidget {
  @override
  State<AddKhach> createState() => _AddKhachState();
}

class _AddKhachState extends State<AddKhach> {
  BlocADDKH blocADDKH = BlocADDKH();
  List<ModelLocal> multipleSelected = <ModelLocal>[];

  final keyForm = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController fbURL = TextEditingController();
  TextEditingController deliPhone = TextEditingController();
  TextEditingController deliMethod = TextEditingController();
  TextEditingController note = TextEditingController();

  List<ModelLocal> checkListItems = [
    ModelLocal(
      name: 'Khách thợ',
      id: '1',
    ),
    ModelLocal(
      name: 'Khách buôn',
      id: '2',
    ),
    ModelLocal(
      name: 'Khách dân',
      id: '3',
    ),
    ModelLocal(
      name: 'Nhà cung cấp',
      id: '3',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm khách hàng'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorApp.linearGradientBanner,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Họ và tên',
                    style: StyleApp.textStyle700(
                        fontSize: 18, color: ColorApp.blue00),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputText1(      validator: (val) {
                    return ValidatorApp.checkNull(text: val, isTextFiled: true);
                  },
                    controller: name,
                    label: 'Nhập họ và tên',
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  Divider(),
                  Text(
                    'Nhóm khách hàng',
                    style: StyleApp.textStyle700(
                        fontSize: 18, color: ColorApp.blue00),
                  ),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4,
                        crossAxisSpacing: 0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        checkboxShape: CircleBorder(),
                        activeColor: Colors.green,
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: Text(
                          checkListItems[index].name ?? '',
                          style: StyleApp.textStyle500(),
                        ),
                        value: checkListItems[index].value,
                        onChanged: (value) {
                          setState(() {
                            checkListItems[index].value = value;
                            // if (multipleSelected.contains(checkListItems[index])) {
                            //   multipleSelected.remove(checkListItems[index]);
                            // } else {
                            //   multipleSelected.add(checkListItems[index]);
                            // }
                          });
                        },
                      );
                    },
                    itemCount: checkListItems.length,
                  ),
                  Divider(),
                  Text(
                    'FaceBook  ',
                    style: StyleApp.textStyle700(
                        fontSize: 18, color: ColorApp.blue00),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputText1(
                    controller: fbURL,
                    label: 'Nhập link facebook',
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  Divider(),
                  Text(
                    'Số điện thoại  ',
                    style: StyleApp.textStyle700(
                        fontSize: 18, color: ColorApp.blue00),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputText1(
                    validator: (val) {
                      return ValidatorApp.checkNull(text: val, isTextFiled: true);
                    },
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    label: 'Nhập số điện thoại',
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  Divider(),
                  Text(
                    'Địa chỉ  ',
                    style: StyleApp.textStyle700(
                        fontSize: 18, color: ColorApp.blue00),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputText1(
                    validator: (val) {
                      return ValidatorApp.checkNull(text: val, isTextFiled: true);
                    },
                    controller: address,
                    label: 'Nhập địa chỉ',
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  Divider(),
                  Text(
                    'Số điện thoại nhà xe ',
                    style: StyleApp.textStyle700(
                        fontSize: 18, color: ColorApp.blue00),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputText1(
                    controller: deliPhone,
                    keyboardType: TextInputType.phone,
                    label: 'Nhập số điện thoại nhà xe',
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  Divider(),
                  Text(
                    'Hình thức nhận trả hàng ',
                    style: StyleApp.textStyle700(
                        fontSize: 18, color: ColorApp.blue00),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputText1(
                    controller: deliMethod,
                    label: 'Nhập hình thức',
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  Divider(),
                  Text(
                    'Diễn giải ',
                    style: StyleApp.textStyle700(
                        fontSize: 18, color: ColorApp.blue00),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InputText1(
                    controller: note,
                    label: 'Nhập diễn giải',
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocListener(
                      bloc: blocADDKH,
                      listener: (_, StateBloc state) {
                        CheckLogState.check(context, state: state,msg: 'Thêm khách hàng thành công',success: (){
                          Navigator.pop(context);
                        });
                      },
                      child: Button1(
                        ontap: (){
                          List<int> type = [];
                          for( var item in checkListItems){
                            if(item.value==true){
                              type.add(int.parse('${item.id}'));
                            }
                          }
                      if(type.length>0&&(keyForm.currentState!.validate())){
                        blocADDKH.add(AddCustomer(
                          fullName: name.text,
                          phone: phone.text,
                          address: address.text,
                          fbURL: fbURL.text,
                          deliPhone: deliPhone.text,
                          deliMethod: deliMethod.text,
                          note: note.text,
                          types: type
                        ));
                      }else if(type.length==0){
                        CustomToast.showToast(context: context, msg: 'Hãy chọn nhóm khách hàng');
                      }

                        },
                        colorButton: ColorApp.blue00,
                        textColor: Colors.white,
                        textButton: 'Lưu',
                        fontSize: 16,
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
