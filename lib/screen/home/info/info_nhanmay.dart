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
import 'package:intl/intl.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../../bloc/bloc/KhachHang/bloc_addKH.dart';
import '../../../bloc/bloc/add/bloc_dsLinhKien.dart';
import '../../../bloc/bloc/congviec/bloc_info_dvsc.dart';
import '../../../bloc/bloc/congviec/bloc_updateDVSC.dart';
import '../../../bloc/bloc/nhanMay/bloc__nhanMay.dart';
import '../../../bloc/bloc/nhanMay/bloc_fullListKH.dart';
import '../../../bloc/bloc/nhanMay/bloc_fullListKho.dart';
import '../../../bloc/bloc/nhanMay/bloc_fullListNV.dart';
import '../../../bloc/bloc/nhanMay/bloc_fullListPrd.dart';
import '../../../bloc/event_bloc.dart';
import '../../../bloc/state_bloc.dart';
import '../../../home.dart';
import '../../../model/model_info_dvsc.dart';
import '../../../model/model_linhKien.dart';
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
  List<ModelLocal> listt = [
    ModelLocal(id: '1', name: 'Đang xử lý'),
    ModelLocal(id: '2', name: 'Đã xử lý'),
    ModelLocal(id: '3', name: 'Chờ linh kiện'),
    ModelLocal(id: '4', name: 'Không sửa được'),
    ModelLocal(id: '5', name: 'Nhà mua'),
    ModelLocal(id: '6', name: 'Bảo hành'),
    ModelLocal(id: '7', name: 'Hoàn Thành'),
  ];
  List<MaterialAttribute> listM = [];
  String? status;
  int? idStt;
  BlocInfoDVSC blocInfoDVSC = BlocInfoDVSC();
  BlocFullListNV blocFullListNV = BlocFullListNV();
  BlocFullListPrd blocFullListPrd = BlocFullListPrd();
  BlocFullListKho blocFullListKho = BlocFullListKho();
  BlocFullListKH blocListKH = BlocFullListKH();
  BlocUpdateOrder blocUpdateOrder = BlocUpdateOrder();
  BlocDsLinhKien blocDsLinhKien = BlocDsLinhKien();
  ModelInfoDVSC modelInfoDVSC = ModelInfoDVSC();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blocInfoDVSC.add(GetData(param: widget.id));
    blocListKH.add(GetData());
    blocFullListPrd.add(GetData2());
    blocFullListKho.add(GetData());
    blocFullListNV.add(GetData());
    blocDsLinhKien.add(GetData());
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
          child: BlocBuilder(
            builder: (_, StateBloc state) {
              if (state is LoadFail) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text('Phiên đăng nhập đã hết, vui lòng đăng nhập lại'
                          ''),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage(
                                        index: 3,
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(border: Border.all()),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Đăng Nhập',
                              style:
                                  StyleApp.textStyle500(color: ColorApp.blue00),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (state is Loading) {
                return Text('Đang Load, đợi xíu...');
              }
              if (state is LoadSuccess) {
                modelInfoDVSC = state.data;
                TextEditingController note = TextEditingController();
                note.text = modelInfoDVSC.productAttr!.note ?? '';
                status = modelInfoDVSC.productAttr!.status ?? '';
listM=[];

                for (var item
                    in modelInfoDVSC.productAttr!.productAttrMaterialAttr!) {

                  listM.add(MaterialAttribute(
                      id: item.materialAttrId, amount: item.amount));
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ngày',
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputText1(
                      borderColor: Colors.white,
                      label: modelInfoDVSC.productAttr!.importDate ?? '',
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
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder(
                          builder: (_, StateBloc state) {
                            if (state is LoadSuccess) {
                              List<Customer> list = state.data;
                              return Expanded(
                                child: InputText1(
                                  readOnly: true,
                                  width: 250,
                                  borderColor: Colors.white,
                                  label: modelInfoDVSC.productAttr!
                                          .customerId![0].fullName ??
                                      '',
                                  radius: 0,
                                ),
                              );
                            }
                            return SizedBox();
                          },
                          bloc: blocListKH,
                        ),
                        // InputText1(
                        //   onTap: (){},
                        //   width: 250,
                        //   borderColor: Colors.white,
                        //   label: 'Nhập khách hàng',
                        //   radius: 0,
                        // ),
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
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputText1(
                      readOnly: true,
                      borderColor: Colors.white,
                      label: modelInfoDVSC.productAttr!.customerAddress ?? '',
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
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputText1(
                      readOnly: true,
                      borderColor: Colors.white,
                      label: modelInfoDVSC.productAttr!.customerPhone ?? '',
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
                    BlocBuilder(
                      builder: (_, StateBloc state) {
                        if (state is LoadSuccess) {
                          List<ModelListPrd> list = state.data;
                          return InputText1(
                            readOnly: true,
                            width: 250,
                            borderColor: Colors.white,
                            label:
                                modelInfoDVSC.productAttr!.productId![0].name ??
                                    '',
                            radius: 0,
                          );
                        }
                        return SizedBox();
                      },
                      bloc: blocFullListPrd,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Số seri',
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InputText1(
                          readOnly: true,
                          width: MediaQuery.of(context).size.width * 0.5,
                          borderColor: Colors.white,
                          label: modelInfoDVSC.productAttr!.serial ?? '',
                          radius: 0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Model máy',
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputText1(
                      readOnly: true,
                      borderColor: Colors.white,
                      label: modelInfoDVSC.productAttr!.imei ?? '',
                      radius: 0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Giá dự kiến',
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputText1(
                      readOnly: true,
                      inputformater: [ThousandsSeparatorInputFormatter()],
                      keyboardType: TextInputType.number,
                      borderColor: Colors.white,
                      label: Const.ConvertPrice.format(int.parse(
                          modelInfoDVSC.productAttr!.exportPrice ?? '0')),
                      radius: 0,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Số lượng',
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputText1(
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      borderColor: Colors.white,
                      label: modelInfoDVSC.productAttr!.amount.toString(),
                      radius: 0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tình trạng',
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputText1(
                      readOnly: true,
                      borderColor: Colors.white,
                      label: modelInfoDVSC.productAttr!.title ?? '',
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
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BlocBuilder(
                      builder: (_, StateBloc state) {
                        if (state is LoadSuccess) {
                          List<ModelListKho> list = state.data;
                          return InputText1(
                            readOnly: true,
                            width: 250,
                            borderColor: Colors.white,
                            label: modelInfoDVSC
                                    .productAttr!.warehouseId![0].name ??
                                '',
                            radius: 0,
                          );
                        }
                        return SizedBox();
                      },
                      bloc: blocFullListKho,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    Text(
                      'Nhân viên',
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BlocBuilder(
                      builder: (_, StateBloc state) {
                        if (state is LoadSuccess) {
                          List<ModelListNV> list = state.data;
                          String? tenNV;
                          for (var item in list) {
                            if (modelInfoDVSC.productAttr!.userId == item.id) {
                              tenNV = item.fullName;
                            }
                          }
                          return InputText1(
                            readOnly: true,
                            width: 250,
                            borderColor: Colors.white,
                            label: tenNV ?? '',
                            radius: 0,
                          );
                        }
                        return SizedBox();
                      },
                      bloc: blocFullListNV,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    Text(
                      'Diễn giải',
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputText1(
                      onChanged: (val) {
                        modelInfoDVSC.productAttr!.note = val;
                      },
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
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PopupMenuButton(
                        child: Text(status ?? ''),
                        itemBuilder: (context) {
                          return List.generate(
                              listt.length,
                              (index) => PopupMenuItem(
                                  onTap: () {
                                    setState(() {
                                      modelInfoDVSC.productAttr!.status =
                                          listt[index].name;
                                     idStt=int.parse('${listt[index].id}');
                                    });
                                  },
                                  value: index,
                                  child: Text(
                                    listt[index].name ?? '',
                                    style: StyleApp.textStyle500(),
                                    textAlign: TextAlign.end,
                                  )));
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    Text(
                      'Danh sách linh kiện',
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        String trangthai='';
                        Color color=ColorApp.black;
                        TextEditingController con = TextEditingController();
                        switch( modelInfoDVSC
                            .productAttr!.productAttrMaterialAttr![index].isApproved){
                          case 0: {
                            trangthai='Chờ duyệt';
                            color=ColorApp.orangeF0;
                          }break;
                          case 1: {
                            trangthai='Đã duyệt';
                            color=ColorApp.blue1F;
                          }break;
                          case 2: {
                            trangthai='Huỷ bỏ';
                            color=ColorApp.red;
                          }break;
                        }
                        con.text = modelInfoDVSC
                            .productAttr!.productAttrMaterialAttr![index].amount
                            .toString();
                        return Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '${modelInfoDVSC.productAttr!.productAttrMaterialAttr![index].code} - ${modelInfoDVSC.productAttr!.productAttrMaterialAttr![index].name} '),
                                  Row(
                                    children: [
                                      Text('Trạng thái : '),
                                      Container(color: color,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('${trangthai} ',style: StyleApp.textStyle500(color: Colors.white),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: NumberInputPrefabbed.roundedButtons(
                                  initialValue: modelInfoDVSC.productAttr!
                                      .productAttrMaterialAttr![index].amount!,
                                  incDecBgColor: ColorApp.blue00,
                                  onChanged: (val) {
                                    listM[index].amount = val.toInt();

                                    // modelInfoDVSC
                                    //     .productAttr!
                                    //     .productAttrMaterialAttr![index]
                                    //     .amount = val.toInt();
                                  },
                                  onDecrement: (val) {
                                    listM[index].amount = val.toInt();
                                    // modelInfoDVSC
                                    //     .productAttr!
                                    //     .productAttrMaterialAttr![index]
                                    //     .amount = val.toInt();
                                  },
                                  onIncrement: (val) {
                                    listM[index].amount = val.toInt();
                                    // modelInfoDVSC
                                    //     .productAttr!
                                    //     .productAttrMaterialAttr![index]
                                    //     .amount = val.toInt();
                                  },
                                  onSubmitted: (val) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  scaleHeight: 0.7,
                                  scaleWidth: 0.9,
                                  controller: con,
                                  min: 0,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: modelInfoDVSC
                          .productAttr!.productAttrMaterialAttr!.length,
                      shrinkWrap: true,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  content: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.55,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: SingleChildScrollView(
                                      child: BlocBuilder(
                                        builder: (_, StateBloc state) {
                                          if (state is LoadSuccess) {
                                            List<ModelLinkKien> list =
                                                state.data;
                                            return SingleChildScrollView(
                                              child: ListView.builder(
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      if (list[index].amount! >
                                                          0) {
                                                        modelInfoDVSC
                                                            .productAttr!
                                                            .productAttrMaterialAttr!
                                                            .add(
                                                                ProductAttrMaterialAttr(
                                                                  code: list[index].code,
                                                                  name: list[index].name,
                                                                  materialAttrId: list[index].id,
                                                                  importPrice: list[index].importPrice,
                                                                  amount: 0,
                                                                ));
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: Text(
                                                                    'Linh kiện đã hết')));
                                                      }

                                                      setState(() {});
                                                      Navigator.pop(context);
                                                    },
                                                    child: Card(
                                                        child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${list[index].materialId!.code} - ${list[index].materialId!.name}',
                                                            style: StyleApp
                                                                .textStyle500(),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),


                                                          list[index].amount!>0?Text('Còn hàng',style: StyleApp.textStyle500(color: Colors.green),):Text('Hết hàng',style: StyleApp.textStyle500(color: Colors.red),),
                                                          // Text(
                                                          //     'Số lượng : ${list[index].amount}',
                                                          //     style: StyleApp
                                                          //         .textStyle500()),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              'Kho: ${list[index].warehouseId!.name} - ${list[index].warehouseId!.projectId!.name}',
                                                              style: StyleApp
                                                                  .textStyle500()),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              'Ghi chú: ${list[index].note}',
                                                              style: StyleApp
                                                                  .textStyle500())
                                                        ],
                                                      ),
                                                    )),
                                                  );
                                                },
                                                shrinkWrap: true,
                                                itemCount: list.length,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                              ),
                                            );
                                          }
                                          return SizedBox();
                                        },
                                        bloc: blocDsLinhKien,
                                      ),
                                    ),
                                  ),
                                ));
                      },
                      child: Image.asset(
                        ImagePath.bottomBarAdd,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    BlocListener(
                      bloc: blocUpdateOrder,
                      listener: (_, StateBloc state) {
                        CheckLogState.check(context,
                            state: state, msg: 'Thành công', success: () {
                          Navigator.pop(context);
                        });
                      },
                      child: Button1(
                        ontap: () {


                          blocUpdateOrder.add(UpdateOrder(
                            id: int.parse('${widget.id}'),
                            status: idStt,
                            note: note.text,
                            materialAttribute: listM

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
              if (state is LoadFail2) {
                return Text('${state.error}');
              }
              return SizedBox();
            },
            bloc: blocInfoDVSC,
          ),
        ),
      ),
    );
  }
}
