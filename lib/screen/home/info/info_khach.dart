import 'package:ChauAnh/bloc/check_log_state.dart';
import 'package:ChauAnh/bloc/event_bloc.dart';
import 'package:ChauAnh/model/model_showKH.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc/KhachHang/bloc_infoKH.dart';
import '../../../bloc/bloc/KhachHang/bloc_updateKH.dart';
import '../../../bloc/state_bloc.dart';
import '../../../model/model_local.dart';
import '../../../style/init_style.dart';
import '../../../widget/item/button.dart';
import '../../../widget/item/custom_toast.dart';
import '../../../widget/item/dialog_item.dart';
import '../../../widget/item/input/text_filed.dart';
import 'lichsu_khach.dart';

class Info_Khach extends StatefulWidget {
  String id;
  Info_Khach({required this.id});

  @override
  State<Info_Khach> createState() => _Info_KhachState();
}

class _Info_KhachState extends State<Info_Khach> {
  List<ModelLocal> multipleSelected = <ModelLocal>[];
  BlocInfoKH blocInfoKH = BlocInfoKH();
  TextEditingController name = TextEditingController();
  TextEditingController fb = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController deli_phone = TextEditingController();
  TextEditingController deli_method = TextEditingController();
  TextEditingController note = TextEditingController();
  Customers customers = Customers();
  BlocUpdateKH blocUpdateKH = BlocUpdateKH();
  List<Type> checkListItems = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blocInfoKH.add(GetData(param: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin chi tiết'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorApp.linearGradientBanner,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: BlocBuilder(
        builder: (_, StateBloc state) {
          if (state is LoadSuccess) {
            customers = state.data;
            checkListItems = customers.type ?? [];
            name.text = customers.fullName ?? '';
            fb.text = customers.facebookUrl ?? '';
            phone.text = customers.phone ?? '';
            address.text = customers.address ?? '';
            deli_phone.text = customers.deliveryPhone ?? '';
            deli_method.text = customers.deliveryMethod ?? '';
            note.text = customers.note ?? '';
            return Padding(
              padding: const EdgeInsets.all(8.0),
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
                  InputText1(
                    onChanged: (val) {
                      customers.fullName = val;
                    },
                    controller: name,
                    label: customers.fullName ?? '',
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
                    'Mã khách hàng',
                    style: StyleApp.textStyle700(
                        fontSize: 18, color: ColorApp.blue00),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    customers.id.toString() ?? '',
                    style: StyleApp.textStyle500(color: ColorApp.black49),
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
                    onChanged: (val) {
                      customers.facebookUrl = val;
                    },
                    controller: fb,
                    label: '',
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
                    onChanged: (val) {
                      customers.phone = val;
                    },
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    label: '',
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
                    onChanged: (val) {
                      customers.address = val;
                    },
                    controller: address,
                    label: '',
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
                    onChanged: (val) {
                      customers.deliveryPhone = val;
                    },
                    controller: deli_phone,
                    keyboardType: TextInputType.phone,
                    label: '',
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
                    controller: deli_method,
                    onChanged: (val) {
                      customers.deliveryMethod = val;
                    },
                    label: '',
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  Divider(),
                  Text(
                    'Số ngày công nợ',
                    style: StyleApp.textStyle700(
                        fontSize: 18, color: ColorApp.blue00),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    customers.debtDays.toString() ?? '',
                    style: StyleApp.textStyle500(color: ColorApp.black49),
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
                    onChanged: (val) {
                      customers.note = val;
                    },
                    controller: note,
                    maxLine: 3,
                    label: '',
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LichSuKhach(id: '${customers.id}',)));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Lịch sử đơn hàng',
                            style: StyleApp.textStyle700(
                                fontSize: 18, color: ColorApp.blue00),
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: ColorApp.blue00,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  BlocListener(
                    bloc: blocUpdateKH,
                    listener: (_, StateBloc state) {

                   if(state is LoadSuccess){
                     CustomToast.showToast(context: context, msg: 'Cập nhật thành công',duration:2 );
                     Navigator.pop(context);

                   }
                   if(state is LoadFail){

                     DialogItem.showMsg(context: context, title: "Lỗi", msg: state.error);
                   }
                    },
                    child: Button1(
                      colorButton: ColorApp.blue00,
                      textColor: Colors.white,
                      textButton: 'Lưu',
                      fontSize: 16,
                      ontap: () {
                        List<int> type = [];
                        for (var item in checkListItems) {
                          if (item.value == true) {
                            type.add(item.id ?? 0);
                          }
                          blocUpdateKH.add(AddCustomer(
                              id: customers.id.toString(),
                              types: type,
                              fullName: name.text,
                              address: address.text,
                              phone: phone.text,
                              fbURL: fb.text,
                              deliPhone: deli_phone.text,
                              deliMethod: deli_method.text,
                              note: note.text));
                        }
                        print(name.text);
                      },
                    ),
                  )
                ],
              ),
            );
          }
          return SizedBox();
        },
        bloc: blocInfoKH,
      )),
    );
  }
}
