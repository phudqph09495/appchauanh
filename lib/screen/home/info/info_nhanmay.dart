// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:ChauAnh/config/const.dart';
// import 'package:ChauAnh/config/path/image_path.dart';
// import 'package:ChauAnh/config/share_pref.dart';
// import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
// import '../../../model/model_local.dart';
// import '../../../style/init_style.dart';
// import '../../../widget/item/Dropdown1.dart';
// import '../../../widget/item/button.dart';
// import '../../../widget/item/input/text_filed.dart';
// import '../../add/add_baogia.dart';
//
// class InfoNhanMay extends StatefulWidget {
//   @override
//   State<InfoNhanMay> createState() => _InfoNhanMayState();
// }
//
// class _InfoNhanMayState extends State<InfoNhanMay> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   String? kho;
//   String? trangthai;
//   TextEditingController qrcode = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Thông tin đơn'),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: ColorApp.linearGradientBanner,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Ngày',
//                 style:
//                 StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               InputText1(
//                 borderColor: Colors.white,
//                 label: Const.formatTime(DateTime.now().millisecondsSinceEpoch),
//                 radius: 0,
//                 readOnly: true,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Khách hàng',
//                 style:
//                 StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InputText1(width: 250,
//                     borderColor: Colors.white,
//                     label: 'Nguyễn Văn Nam',
//                     radius: 0,
//                   ),
//                   InkWell(
//                     onTap: (){},
//                     child: Image.asset(ImagePath.bottomBarAdd,width: 50,height: 50,),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Địa Chỉ',
//                 style:
//                 StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               InputText1(
//                 borderColor: Colors.white,
//                 label: 'Khu 8- Trường Thịnh-Thanh Mai',
//                 radius: 0,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Số điện thoại',
//                 style:
//                 StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               InputText1(
//                 keyboardType: TextInputType.phone,
//                 borderColor: Colors.white,
//                 label: '0347589685',
//                 radius: 0,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Số seri',
//                 style:
//                 StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InputText1(
//                     controller: qrcode,
//                     width: 250,
//                     borderColor: Colors.white,
//                     label: '145269874',
//                     radius: 0,
//                   ),
//                   InkWell(
//                     child: Icon(
//                       Icons.qr_code_scanner,
//                       size: 40,
//                     ),
//                     onTap: () async {
//                       var res = await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                             const SimpleBarcodeScannerPage(),
//                           ));
//                       setState(() {
//                         if (res is String) {
//                           qrcode.text = res;
//                         }
//                       });
//                     },
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Model máy',
//                 style:
//                 StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               InputText1(
//
//                 borderColor: Colors.white,
//                 label: 'Samsung 014511',
//                 radius: 0,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Giá dự kiến',
//                 style:
//                 StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               InputText1(
//                 inputformater: [ThousandsSeparatorInputFormatter()],
//                 keyboardType: TextInputType.number,
//                 borderColor: Colors.white,
//                 label: '150000',
//                 radius: 0,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Kho định ngầm ',
//                 style:
//                 StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               DropDown2(
//                 listItem: [
//                   ModelLocal(id: "1", name: "Kho 1"),
//                   ModelLocal(id: "0", name: "Kho 2"),
//                   ModelLocal(id: "2", name: "Kho 3"),
//                 ],
//                 hint: 'Kho 2',
//                 onChanged: (value) {
//                   kho = value.name;
//                 },
//                 value: kho,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Tình trạng',
//                 style:
//                 StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               InputText1(
//                 borderColor: Colors.white,
//                 label: 'Hơi móp',
//                 radius: 0,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Divider(),
//               Text(
//                 'Nhân viên',
//                 style:
//                 StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               InputText1(
//                 borderColor: Colors.white,
//                 label: 'Trần Văn Bình',
//                 radius: 0,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Divider(),
//               Text(
//                 'Diễn giải',
//                 style:
//                 StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               InputText1(
//                 borderColor: Colors.white,
//                 label: 'Móp do vận chuyển',
//                 radius: 0,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Trạng thái',
//                 style:
//                 StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               DropDown2(
//                 listItem: [
//                   ModelLocal(id: "0", name: "Đang xử lý"),
//                   ModelLocal(id: "1", name: "Đã xử lý"),
//                   ModelLocal(id: "2", name: "Chờ linh kiện"),
//                   ModelLocal(id: "3", name: "Bảo hành"),
//                   ModelLocal(id: "4", name: "Không sửa được"),
//                   ModelLocal(id: "5", name: "Hoàn thành"),
//                 ],
//                 hint: 'Không sửa được',
//                 onChanged: (value) {
//                   trangthai = value.name;
//                 },
//                 value: trangthai,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//
//               Button1(colorButton: ColorApp.blue8F, textColor: ColorApp.whiteF7, textButton: 'Lưu',fontSize: 16,)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';

import 'package:ChauAnh/bloc/check_log_state.dart';
import 'package:ChauAnh/model/model_listKH.dart';
import 'package:ChauAnh/model/model_listKho.dart';
import 'package:ChauAnh/model/model_listPrd.dart';
import 'package:flutter/material.dart';
import 'package:ChauAnh/config/const.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:ChauAnh/config/share_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../../bloc/bloc/KhachHang/bloc_addKH.dart';
import '../../../bloc/bloc/congviec/bloc_info_dvsc.dart';
import '../../../bloc/bloc/nhanMay/bloc__nhanMay.dart';
import '../../../bloc/bloc/nhanMay/bloc_fullListKH.dart';
import '../../../bloc/bloc/nhanMay/bloc_fullListKho.dart';
import '../../../bloc/bloc/nhanMay/bloc_fullListNV.dart';
import '../../../bloc/bloc/nhanMay/bloc_fullListPrd.dart';
import '../../../bloc/event_bloc.dart';
import '../../../bloc/state_bloc.dart';
import '../../../model/model_info_dvsc.dart';
import '../../../model/model_listNV.dart';
import '../../../model/model_local.dart';
import '../../../style/init_style.dart';
import '../../../widget/item/Dropdown1.dart';
import '../../../widget/item/button.dart';
import '../../../widget/item/input/text_filed.dart';
import '../../add/add_baogia.dart';


class InfoNhanMay extends StatefulWidget {
  String id;
  InfoNhanMay({required this.id});
  @override
  State<InfoNhanMay> createState() => _InfoNhanMayState();
}

class _InfoNhanMayState extends State<InfoNhanMay> {

  BlocInfoDVSC blocInfoDVSC=BlocInfoDVSC();
  BlocFullListNV blocFullListNV=BlocFullListNV();
  BlocFullListPrd blocFullListPrd=BlocFullListPrd();
  BlocFullListKho blocFullListKho=BlocFullListKho();
  BlocFullListKH blocListKH=BlocFullListKH();
  BlocNhanMay blocNhanMay=BlocNhanMay();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blocInfoDVSC.add(GetData(param:widget.id ));
    blocListKH.add(GetData());
    blocFullListPrd.add(GetData2());
    blocFullListKho.add(GetData());
    blocFullListNV.add(GetData());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết đơn'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorApp.linearGradientBanner,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child:BlocBuilder(builder: (_,StateBloc state){
            if( state is LoadSuccess){
              ModelInfoDVSC modelInfoDVSC=state.data;
              String? kho;
              TextEditingController qrcode = TextEditingController();
              TextEditingController model = TextEditingController();
              model.text=modelInfoDVSC.productAttr!.imei??'';
              TextEditingController gia = TextEditingController();
              gia.text=modelInfoDVSC.productAttr!.exportPrice??'';
              TextEditingController newNane = TextEditingController();
              TextEditingController newPhone = TextEditingController();
              TextEditingController newAddress = TextEditingController();
              String? trangthai;
              String? kh;

              List<ModelSp> list = [];
              BlocADDKH blocADDKH=BlocADDKH();

              TextEditingController cusName=TextEditingController();
              cusName.text=modelInfoDVSC.productAttr!.customerName??'';
              TextEditingController cusPhone=TextEditingController();
              cusPhone.text=modelInfoDVSC.productAttr!.customerPhone??'';
              TextEditingController cusAdd=TextEditingController();
              cusAdd.text=modelInfoDVSC.productAttr!.customerAddress??'';
              TextEditingController proName=TextEditingController();
proName.text=modelInfoDVSC.productAttr!.productId![0].name??'';
              TextEditingController khoName=TextEditingController();
              khoName.text=modelInfoDVSC.productAttr!.warehouseId![0].name??'';
              TextEditingController NV=TextEditingController();

              TextEditingController soLuong=TextEditingController();
              soLuong.text=modelInfoDVSC.productAttr!.amount.toString();

              TextEditingController date=TextEditingController();
              date.text=modelInfoDVSC.productAttr!.importDate??'';
              TextEditingController note=TextEditingController();
              note.text=modelInfoDVSC.productAttr!.note??'';
              TextEditingController title=TextEditingController();
              title.text=modelInfoDVSC.productAttr!.title??'';

              int? proID;
              int? warehouseID;
              int? customerID;
              int? userID;
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Mã đơn hàng',
                  //   style:
                  //       StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // InputText1(
                  //   borderColor: Colors.white,
                  //   label: 'MĐH000000',
                  //   radius: 0,
                  //   readOnly: true,
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Divider(),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Text(
                    'Ngày',
                    style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputText1(
                    controller: date,
                    borderColor: Colors.white,
                    label: Const.formatTime(DateTime.now().millisecondsSinceEpoch),
                    radius: 0,
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Khách hàng',
                    style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder(builder: (_,StateBloc state){
                        if (state is LoadSuccess){
                          List<Customer> list=state.data;
                          return Expanded(
                            child:
                            InputText1(
                              controller: cusName,
                              readOnly: true,
                              onTap: (){
                                showDialog(context: context, builder: (_)=>AlertDialog(
                                  title: Center(child: Text('Chọn khách hàng',style: StyleApp.textStyle500(fontSize: 16),)),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  content: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.55,
                                    width: MediaQuery.of(context).size.width *
                                        0.9,
                                    child: ListView.builder(itemBuilder: (context,index){
                                      return InkWell(
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text('${list[index].fullName} - ${list[index].address} - ${list[index].phone}',style: StyleApp.textStyle500(),),
                                          ),
                                        ),
                                        onTap: (){
                                          cusName.text=list[index].fullName??'';
                                          customerID=list[index].id;
                                          cusPhone.text=list[index].phone??'';
                                          cusAdd.text=list[index].address??'';
                                          Navigator.pop(context);
                                        },
                                      );
                                    },shrinkWrap: true,physics: AlwaysScrollableScrollPhysics(),itemCount: list.length,),
                                  ),
                                ));
                              },
                              width: 250,
                              borderColor: Colors.white,
                              label: 'Chọn khách hàng',
                              radius: 0,
                            ),);

                        }
                        return SizedBox();
                      },bloc: blocListKH,),
                      // InputText1(
                      //   onTap: (){},
                      //   width: 250,
                      //   borderColor: Colors.white,
                      //   label: 'Nhập khách hàng',
                      //   radius: 0,
                      // ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Center(
                                    child: Text(
                                      'Tạo khách hàng mới'.toUpperCase(),
                                      style: StyleApp.textStyle500(fontSize: 16),
                                    )),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                content: Builder(
                                  builder: (context) {
                                    return Container(
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.55,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tên',
                                            style: StyleApp.textStyle500(
                                                color: ColorApp.blue8F,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          InputText1(
                                            controller: newNane,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.5,
                                            borderColor: Colors.white,
                                            label: 'Nhập tên KH',
                                            radius: 0,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Số điện thoại',
                                            style: StyleApp.textStyle500(
                                                color: ColorApp.blue8F,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          InputText1(
                                            keyboardType: TextInputType.phone,
                                            controller: newPhone,
                                            borderColor: Colors.white,
                                            label: 'Nhập sđt',
                                            radius: 0,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Địa chỉ',
                                            style: StyleApp.textStyle500(
                                                color: ColorApp.blue8F,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          InputText1(
                                            controller: newAddress,
                                            borderColor: Colors.white,
                                            label: 'Nhập địa chỉ',
                                            radius: 0,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          BlocListener(bloc: blocADDKH,
                                            listener: (_,StateBloc state) {
                                              Customer cus=state is LoadSuccess? state.data:Customer();
                                              CheckLogState.check(context, state: state,msg: 'Thêm khách hàng thành công',
                                                  success: (){
                                                    customerID=cus.id;
                                                    cusName.text=cus.fullName??'';
                                                    cusPhone.text=cus.phone??'';
                                                    cusAdd.text=cus.address??'';
                                                    newNane.clear();
                                                    newPhone.clear();
                                                    newAddress.clear();
                                                    Navigator.pop(context);
                                                  });
                                            },
                                            child: Button1(
                                                ontap: () {
                                                  blocADDKH.add(AddCustomer(
                                                      fullName: newNane.text,
                                                      phone: newPhone.text,
                                                      address: newAddress.text,
                                                      types: [1]
                                                  ));
                                                },
                                                colorButton: ColorApp.blue8F,
                                                textColor: Colors.white,
                                                textButton: 'Lưu'),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ));
                        },
                        child: Image.asset(
                          ImagePath.bottomBarAdd,
                          width: 50,
                          height: 50,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    'Địa Chỉ',
                    style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputText1(
                    controller: cusAdd,
                    borderColor: Colors.white,
                    label: 'Nhập địa chỉ',
                    radius: 0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Số điện thoại',
                    style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputText1(
                    controller: cusPhone,
                    keyboardType: TextInputType.phone,
                    borderColor: Colors.white,
                    label: 'Nhập số điện thoại',
                    radius: 0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nhập thông tin sản phẩm',
                        style: StyleApp.textStyle500(
                            color: ColorApp.blue8F, fontSize: 18),
                      ),

                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  BlocBuilder(builder: (_,StateBloc state){
                    if (state is LoadSuccess){
                      List<ModelListPrd> list=state.data;
                      return InputText1(
                        controller: proName,
                        readOnly: true,
                        onTap: (){
                          showDialog(context: context, builder: (_)=>AlertDialog(
                            title: Center(child: Text('Chọn sản phẩm',style: StyleApp.textStyle500(fontSize: 16),)),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0))),
                            content: Container(
                              height:
                              MediaQuery.of(context).size.height *
                                  0.55,
                              width: MediaQuery.of(context).size.width *
                                  0.9,
                              child: ListView.builder(itemBuilder: (context,index){
                                return InkWell(
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text('${list[index].code} - ${list[index].name} - ${list[index].note}',style: StyleApp.textStyle500(),),
                                    ),
                                  ),
                                  onTap: (){
                                    proName.text=list[index].name??'';
                                    proID=list[index].id;
                                    Navigator.pop(context);
                                  },
                                );
                              },shrinkWrap: true,physics: AlwaysScrollableScrollPhysics(),itemCount: list.length,),
                            ),
                          ));
                        },
                        width: 250,
                        borderColor: Colors.white,
                        label: 'Chọn sản phẩm',
                        radius: 0,
                      );

                    }
                    return SizedBox();
                  },bloc: blocFullListPrd,),
                  SizedBox(height: 10,),

                  Text(
                    'Số seri',
                    style: StyleApp.textStyle500(
                        color: ColorApp.blue8F,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      InputText1(
                        controller: qrcode,
                        width: MediaQuery.of(context)
                            .size
                            .width *
                            0.5,
                        borderColor: Colors.white,
                        label: 'Nhập số seri',
                        radius: 0,
                      ),
                      InkWell(
                        child: Icon(
                          Icons.qr_code_scanner,
                          size: 40,
                        ),
                        onTap: () async {
                          var res =
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const SimpleBarcodeScannerPage(),
                              ));
                          setState(() {
                            if (res is String) {
                              qrcode.text = res;
                            }
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Model máy',
                    style: StyleApp.textStyle500(
                        color: ColorApp.blue8F,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputText1(
                    controller: model,
                    borderColor: Colors.white,
                    label: 'Nhập model máy',
                    radius: 0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Giá dự kiến',
                    style: StyleApp.textStyle500(
                        color: ColorApp.blue8F,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputText1(
                    controller: gia,
                    inputformater: [
                      ThousandsSeparatorInputFormatter()
                    ],
                    keyboardType: TextInputType.number,
                    borderColor: Colors.white,
                    label: 'Nhập giá',
                    radius: 0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Số lượng',
                    style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputText1(
                    keyboardType: TextInputType.number,
                    controller: soLuong,
                    borderColor: Colors.white,
                    label: 'Số lượng',
                    radius: 0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Tình trạng',
                    style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputText1(
                    controller: title,
                    borderColor: Colors.white,
                    label: 'Nhập tình trạng',
                    radius: 0,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Kho định ngầm ',
                    style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocBuilder(builder: (_,StateBloc state){
                    if (state is LoadSuccess){
                      List<ModelListKho> list=state.data;
                      return InputText1(
                        controller: khoName,
                        readOnly: true,
                        onTap: (){
                          showDialog(context: context, builder: (_)=>AlertDialog(
                            title: Center(child: Text('Chọn kho định ngầm',style: StyleApp.textStyle500(fontSize: 16),)),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0))),
                            content: Container(
                              height:
                              MediaQuery.of(context).size.height *
                                  0.55,
                              width: MediaQuery.of(context).size.width *
                                  0.9,
                              child: ListView.builder(itemBuilder: (context,index){
                                return InkWell(
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text('${list[index].type} - ${list[index].name} - ${list[index].address}',style: StyleApp.textStyle500(),),
                                    ),
                                  ),
                                  onTap: (){
                                    khoName.text=list[index].name??'';
                                    warehouseID=list[index].id;
                                    Navigator.pop(context);
                                  },
                                );
                              },shrinkWrap: true,physics: AlwaysScrollableScrollPhysics(),itemCount: list.length,),
                            ),
                          ));
                        },
                        width: 250,
                        borderColor: Colors.white,
                        label: 'Chọn kho định ngầm',
                        radius: 0,
                      );

                    }
                    return SizedBox();
                  },bloc:blocFullListKho,),
                  SizedBox(
                    height: 20,
                  ),


                  Divider(),
                  Text(
                    'Nhân viên',
                    style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocBuilder(builder: (_,StateBloc state){
                    if (state is LoadSuccess){
                      List<ModelListNV> list=state.data;
                      return InputText1(
                        controller: NV,
                        readOnly: true,
                        onTap: (){
                          showDialog(context: context, builder: (_)=>AlertDialog(
                            title: Center(child: Text('Chọn sản phẩm',style: StyleApp.textStyle500(fontSize: 16),)),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0))),
                            content: Container(
                              height:
                              MediaQuery.of(context).size.height *
                                  0.55,
                              width: MediaQuery.of(context).size.width *
                                  0.9,
                              child: ListView.builder(itemBuilder: (context,index){
                                return InkWell(
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text('${list[index].fullName} - ${list[index].phone}',style: StyleApp.textStyle500(),),
                                    ),
                                  ),
                                  onTap: (){
                                    NV.text=list[index].fullName??'';
                                    userID=list[index].id;
                                    Navigator.pop(context);
                                  },
                                );
                              },shrinkWrap: true,physics: AlwaysScrollableScrollPhysics(),itemCount: list.length,),
                            ),
                          ));
                        },
                        width: 250,
                        borderColor: Colors.white,
                        label: 'Chọn nhân viên',
                        radius: 0,
                      );

                    }
                    return SizedBox();
                  },bloc: blocFullListNV,),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  Text(
                    'Diễn giải',
                    style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputText1(
                    controller: note,
                    borderColor: Colors.white,
                    label: 'Nhập diễn giải',
                    radius: 0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Trạng thái',
                    style:
                        StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropDown2(
                    listItem: [
                      ModelLocal(id: "0", name: "Đang xử lý"),
                      ModelLocal(id: "1", name: "Đã xử lý"),
                      ModelLocal(id: "2", name: "Chờ linh kiện"),
                      ModelLocal(id: "3", name: "Bảo hành"),
                      ModelLocal(id: "4", name: "Không sửa được"),
                      ModelLocal(id: "5", name: "Hoàn thành"),
                      ModelLocal(id: "6", name: "Nhà mua"),
                    ],
                    hint: 'Trạng thái',
                    onChanged: (value) {
                      trangthai = value.name;
                    },
                    value: trangthai,
                  ),
                  SizedBox(
                    height: 20,
                  ),


                  SizedBox(
                    height: 10,
                  ),
                  BlocListener(bloc: blocNhanMay,
                    listener: (_,StateBloc state) {
                      CheckLogState.check(context, state: state,msg: 'Thành công');
                    },
                    child: Button1(
                      ontap: (){
                        blocNhanMay.add(CreateRepairOrder(
                            productId: proID,
                            warehouseId: warehouseID,
                            customerId: customerID,
                            customerName: cusName.text,
                            customerPhone: cusPhone.text,
                            customerAddress: cusAdd.text,
                            userId: userID,
                            model: model.text,
                            serial: qrcode.text,
                            title: 'tittle',
                            exportPrice: gia.text.replaceAll(".", ""),
                            amount: soLuong.text,
                            importDate: DateTime.now().toString(),
                            note: note.text
                        ));
                      },
                      colorButton: ColorApp.blue8F,
                      textColor: ColorApp.whiteF7,
                      textButton: 'Lưu',
                      fontSize: 16,
                    ),
                  )
                ],
              );
            }
            return SizedBox();},bloc: blocInfoDVSC,),
        ),
      ),
    );
  }
}
