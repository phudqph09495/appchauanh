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
import 'dart:typed_data';

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
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:share_plus/share_plus.dart';
import 'package:printing/printing.dart';

class InfoNhanMay extends StatefulWidget {
  String id;
  InfoNhanMay({required this.id});
  @override
  State<InfoNhanMay> createState() => _InfoNhanMayState();
}

class _InfoNhanMayState extends State<InfoNhanMay> {
  String khoName = 'Chọn kho';
  String khoID = '';
  TextEditingController search = TextEditingController();
  List<MaterialAttribute> listM = [];
  String? status;
  Color? color;
  int? idStt;
  BlocInfoDVSC blocInfoDVSC = BlocInfoDVSC();
  BlocFullListNV blocFullListNV = BlocFullListNV();
  BlocFullListPrd blocFullListPrd = BlocFullListPrd();
  BlocFullListKho blocFullListKho = BlocFullListKho();
  BlocFullListKH blocListKH = BlocFullListKH();
  BlocUpdateOrder blocUpdateOrder = BlocUpdateOrder();
  BlocDsLinhKien blocDsLinhKien = BlocDsLinhKien();
  ModelInfoDVSC modelInfoDVSC = ModelInfoDVSC();

  Future<Uint8List> generatePdf(String name, String address, String code,
      String model, String seri, String tingTr, String note) async {
    final font = await PdfGoogleFonts.beVietnamProRegular();
    final font1 = await PdfGoogleFonts.beVietnamProBold();
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start,children: [
            pw.Text('TRUNG TÂM ĐIỆN MÁY CHÂU ANH',
                style: pw.TextStyle(font: font1, fontSize: 25,)),
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Họ tên: ${name}',
                      style: pw.TextStyle(font: font, fontSize: 30)),
                  pw.SizedBox(height: 5),
                  pw.Text('Địa chỉ: ${address}',
                      style: pw.TextStyle(font: font, fontSize: 30)),
                  pw.SizedBox(height: 5),
                  pw.Text('Mã KH: ${code}',
                      style: pw.TextStyle(font: font, fontSize: 30)),
                  pw.SizedBox(height: 5),
                  pw.Text('Model: ${model}',
                      style: pw.TextStyle(font: font, fontSize: 30)),
                  pw.SizedBox(height: 5),
                  pw.Text('Seri: ${seri}',
                      style: pw.TextStyle(font: font, fontSize: 30)),
                  pw.SizedBox(height: 5),
                  pw.Text('Tình trạng nhận máy: ${tingTr}',
                      style: pw.TextStyle(font: font, fontSize: 30)),
                  pw.SizedBox(height: 5),
                  pw.Text('Ghi Chú: ${note}',
                      style: pw.TextStyle(font: font, fontSize: 30)),
                  pw.SizedBox(height: 15),
                ])
          ]);
        },
      ),
    );

    return pdf.save();
  }

  List<ModelLocal> listt = [
    ModelLocal(id: '1', name: 'Đang xử lý', color: ColorApp.blue00),
    ModelLocal(id: '2', name: 'Đã xử lý', color: ColorApp.blue8F),
    ModelLocal(id: '3', name: 'Chờ linh kiện', color: ColorApp.black),
    ModelLocal(id: '4', name: 'Không sửa được', color: ColorApp.red),
    ModelLocal(id: '5', name: 'Nhà Mua', color: ColorApp.orangeF0),
    ModelLocal(id: '6', name: 'Bảo Hành', color: ColorApp.grey8B),
    ModelLocal(id: '7', name: 'Hoàn thành', color: Colors.green),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blocInfoDVSC.add(GetData(param: widget.id));
    blocListKH.add(GetData());
    blocFullListPrd.add(GetData2());
    blocFullListKho.add(GetData());
    blocFullListNV.add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin sửa chữa'),
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
                switch (modelInfoDVSC.productAttr!.status) {
                  case 'Đang xử lý':
                    {
                      color = ColorApp.blue00;
                    }
                    break;
                  case 'Đã xử lý':
                    {
                      color = ColorApp.blue8F;
                    }
                    break;
                  case 'Chờ linh kiện':
                    {
                      color = ColorApp.black;
                    }
                    break;
                  case 'Không sửa được':
                    {
                      color = ColorApp.red;
                    }
                    break;
                  case 'Nhà Mua':
                    {
                      color = ColorApp.orangeF0;
                    }
                    break;
                  case 'Bảo Hành':
                    {
                      color = ColorApp.grey8B;
                    }
                    break;
                  case 'Hoàn thành':
                    {
                      color = Colors.green;
                    }
                    break;
                }
                listM = [];
                for (var item in listt) {
                  if (status == item.name) {
                    idStt = int.parse(item.id!);
                  }
                }
                for (var item
                    in modelInfoDVSC.productAttr!.productAttrMaterialAttr!) {
                  listM.add(MaterialAttribute(
                      id: item.materialAttrId, amount: item.amount));
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ngày nhận máy',
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
                      'Mã Khách hàng',
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputText1(
                      readOnly: true,
                      borderColor: Colors.white,
                      label: modelInfoDVSC.productAttr!.customerCode ?? '',
                      radius: 0,
                    ),
                    Text(
                      'Tên khách hàng',
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputText1(
                      readOnly: true,
                      width: 250,
                      borderColor: Colors.white,
                      label:
                          modelInfoDVSC.productAttr!.customerId![0].fullName ??
                              '',
                      radius: 0,
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
                    InputText1(
                      readOnly: true,
                      borderColor: Colors.white,
                      label:
                          modelInfoDVSC.productAttr!.warehouseId![0].name ?? '',
                      radius: 0,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       'Nhập thông tin sản phẩm',
                    //       style: StyleApp.textStyle500(
                    //           color: ColorApp.blue8F, fontSize: 18),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // BlocBuilder(
                    //   builder: (_, StateBloc state) {
                    //     if (state is LoadSuccess) {
                    //       List<ModelListPrd> list = state.data;
                    //       return InputText1(
                    //         readOnly: true,
                    //         width: 250,
                    //         borderColor: Colors.white,
                    //         label:
                    //             modelInfoDVSC.productAttr!.productId![0].name ??
                    //                 '',
                    //         radius: 0,
                    //       );
                    //     }
                    //     return SizedBox();
                    //   },
                    //   bloc: blocFullListPrd,
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),

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
                    Text(
                      'Số seri',
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputText1(
                      readOnly: true,
                      borderColor: Colors.white,
                      label: modelInfoDVSC.productAttr!.serial ?? '',
                      radius: 0,
                    ),
                    SizedBox(
                      height: 10,
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
                      'Tình trạng nhận máy',
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

                    Text(
                      'Nhân viên sửa chữa',
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
                      'Ghi chú',
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
                        child: Container(
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: Text(
                              status ?? '',
                              style: StyleApp.textStyle600(color: Colors.white),
                            ),
                          ),
                        ),
                        itemBuilder: (context) {
                          return List.generate(
                              listt.length,
                              (index) => PopupMenuItem(
                                  onTap: () {
                                    setState(() {
                                      modelInfoDVSC.productAttr!.status =
                                          listt[index].name;
                                      idStt = int.parse('${listt[index].id}');
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
                      'Linh kiện thay thế',
                      style: StyleApp.textStyle500(
                          color: ColorApp.blue8F, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        String trangthai = '';
                        Color color = ColorApp.black;
                        bool fix = true;
                        TextEditingController con = TextEditingController();
                        switch (modelInfoDVSC.productAttr!
                            .productAttrMaterialAttr![index].isApproved) {
                          case 0:
                            {
                              trangthai = 'Chờ duyệt';
                              fix = true;
                              color = ColorApp.orangeF0;
                            }
                            break;
                          case 1:
                            {
                              fix = false;
                              trangthai = 'Đã duyệt';
                              color = ColorApp.blue1F;
                            }
                            break;
                          case 2:
                            {
                              fix = true;
                              trangthai = 'Huỷ bỏ';
                              color = ColorApp.red;
                            }
                            break;
                        }
                        con.text = modelInfoDVSC
                            .productAttr!.productAttrMaterialAttr![index].amount
                            .toString();
                        return Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Text(
                                        '${modelInfoDVSC.productAttr!.productAttrMaterialAttr![index].code} - ${modelInfoDVSC.productAttr!.productAttrMaterialAttr![index].name} '),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Trạng thái : '),
                                          Container(
                                            color: color,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '${trangthai} ',
                                                style: StyleApp.textStyle500(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      fix == true
                                          ? InkWell(
                                              onTap: () {
                                                setState(() {
                                                  modelInfoDVSC.productAttr!
                                                      .productAttrMaterialAttr!
                                                      .removeAt(index);
                                                });
                                              },
                                              child: Container(
                                                  color: ColorApp.red,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2,
                                                            vertical: 8),
                                                    child: Text(
                                                      'Huỷ',
                                                      style:
                                                          StyleApp.textStyle500(
                                                              color: ColorApp
                                                                  .whiteF0),
                                                    ),
                                                  )),
                                            )
                                          : SizedBox()
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: fix == true
                                    ? NumberInputPrefabbed.roundedButtons(
                                        initialValue: modelInfoDVSC
                                            .productAttr!
                                            .productAttrMaterialAttr![index]
                                            .amount!,
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
                                      )
                                    : Container(
                                        height: 30,
                                        decoration:
                                            BoxDecoration(border: Border.all()),
                                        child: Text(
                                          '${modelInfoDVSC.productAttr!.productAttrMaterialAttr![index].amount}',
                                          textAlign: TextAlign.center,
                                        ),
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
                                  content: StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState1) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.75,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            InputText1(
                                              controller: search,
                                              label: 'Tìm kiếm',
                                              hasLeading: true,
                                              suffix: InkWell(
                                                  onTap: () {
                                                    blocDsLinhKien.add(GetData(
                                                        keySearch: search.text,
                                                        id: khoID.toString()));
                                                  },
                                                  child: Icon(Icons.search)),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            BlocBuilder(
                                              builder: (_, StateBloc state) {
                                                if (state is LoadSuccess) {
                                                  List<ModelListKho> listKho =
                                                      state.data;

                                                  return PopupMenuButton(
                                                      child: Card(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            children: [
                                                              Text(khoName),
                                                              Icon(Icons
                                                                  .keyboard_arrow_down_rounded)
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      itemBuilder: (context) {
                                                        return List.generate(
                                                            listKho.length,
                                                            (index) =>
                                                                PopupMenuItem(
                                                                    value:
                                                                        index,
                                                                    onTap: () {
                                                                      setState1(
                                                                          () {
                                                                        khoName =
                                                                            '${listKho[index].name}';
                                                                        listKho[index].id !=
                                                                                null
                                                                            ? khoID =
                                                                                listKho[index].id.toString()
                                                                            : khoID = '';
                                                                      });
                                                                      blocDsLinhKien.add(GetData(
                                                                          keySearch: search
                                                                              .text,
                                                                          id: khoID
                                                                              .toString()));
                                                                    },
                                                                    child: Text(
                                                                        '${listKho[index].name}')));
                                                      });
                                                }
                                                return SizedBox();
                                              },
                                              bloc: blocFullListKho,
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            BlocBuilder(
                                              builder: (_, StateBloc state) {
                                                if (state is LoadSuccess) {
                                                  List<ModelLinkKien> list =
                                                      state.data;
                                                  return ListView.builder(
                                                    itemBuilder:
                                                        (context, index) {
                                                      return InkWell(
                                                        onTap: () {
                                                          if (list[index]
                                                                  .amount! >
                                                              0) {
                                                            modelInfoDVSC
                                                                .productAttr!
                                                                .productAttrMaterialAttr!
                                                                .add(
                                                                    ProductAttrMaterialAttr(
                                                              id: list[index]
                                                                  .id,
                                                              isApproved: 0,
                                                              code: list[index]
                                                                  .code,
                                                              name: list[index]
                                                                  .name,
                                                              materialAttrId:
                                                                  list[index]
                                                                      .id,
                                                              importPrice: list[
                                                                      index]
                                                                  .importPrice,
                                                              amount: 1,
                                                            ));
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text('Linh kiện đã hết')));
                                                          }

                                                          setState(() {});
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Card(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
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

                                                              list[index].amount! >
                                                                      0
                                                                  ? Text(
                                                                      'Còn hàng',
                                                                      style: StyleApp.textStyle500(
                                                                          color:
                                                                              Colors.green),
                                                                    )
                                                                  : Text(
                                                                      'Hết hàng',
                                                                      style: StyleApp.textStyle500(
                                                                          color:
                                                                              Colors.red),
                                                                    ),
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
                                                            ],
                                                          ),
                                                        )),
                                                      );
                                                    },
                                                    shrinkWrap: true,
                                                    itemCount: list.length,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                  );
                                                }
                                                if (state is Loading) {
                                                  return Text(
                                                      'Đang load, đợi xíu..');
                                                }
                                                if (state is LoadFail) {
                                                  return Text(state.error);
                                                }

                                                return SizedBox();
                                              },
                                              bloc: blocDsLinhKien,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
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
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.print),
                              Text(' In chi tiết'),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {    print( '${modelInfoDVSC.productAttr!.customerCode}');
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text('In hoá đơn'),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    child: const Text('Cỡ to'),
                                    onPressed: () async {
                                      final Uint8List pdfBytes =
                                          await generatePdf(
                                        '${modelInfoDVSC.productAttr!.customerName}',
                                        '${modelInfoDVSC.productAttr!.customerAddress}',
                                        '${modelInfoDVSC.productAttr!.customerCode}',
                                        '${modelInfoDVSC.productAttr!.imei}',
                                        '${modelInfoDVSC.productAttr!.serial}',
                                        '${modelInfoDVSC.productAttr!.title}',
                                        '${note.text}',
                                      );
                                      await Printing.layoutPdf(
                                          format: PdfPageFormat.a4,
                                          usePrinterSettings: true,
                                          onLayout: (PdfPageFormat format) =>
                                              pdfBytes);
                                      // Page
                                    },
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    child: const Text('Cỡ nhỏ'),
                                    onPressed: () async {
                                      final Uint8List pdfBytes =
                                          await generatePdf(
                                        '${modelInfoDVSC.productAttr!.customerName}',
                                        '${modelInfoDVSC.productAttr!.customerAddress}',
                                        '${modelInfoDVSC.productAttr!.customerCode}',
                                        '${modelInfoDVSC.productAttr!.imei}',
                                        '${modelInfoDVSC.productAttr!.serial}',
                                        '${modelInfoDVSC.productAttr!.title}',
                                        '${note.text}',
                                      );

                                      await Printing.sharePdf(bytes: pdfBytes);

                                      //                      Share.share('''
                                      // Họ tên: ${modelInfoDVSC.productAttr!.customerName}
                                      //
                                      // Địa chỉ: ${modelInfoDVSC.productAttr!.customerAddress}
                                      //
                                      // Mã KH: ${modelInfoDVSC.productAttr!.customerCode}
                                      //
                                      // Model: ${modelInfoDVSC.productAttr!.imei}
                                      //
                                      // Seri: ${modelInfoDVSC.productAttr!.serial}
                                      //
                                      // Tình trạng: ${modelInfoDVSC.productAttr!.title}
                                      //
                                      // Ghi Chú: ${note.text}
                                      //                      ''');
                                    },
                                  ),
                                ],
                              );
                            });
                        // final Uint8List pdfBytes = await generatePdf(
                        //   '${modelInfoDVSC.productAttr!.customerName}',
                        //   '${modelInfoDVSC.productAttr!.customerAddress}',
                        //   '${modelInfoDVSC.productAttr!.customerPhone}',
                        //   '${modelInfoDVSC.productAttr!.imei}',
                        //   '${modelInfoDVSC.productAttr!.serial}',
                        //   '${modelInfoDVSC.productAttr!.title}',
                        //   '${note.text}',
                        // );
                        // await Printing.layoutPdf(
                        //   format: const PdfPageFormat(5*PdfPageFormat.cm,7.5*PdfPageFormat.cm),
                        //   usePrinterSettings: true,
                        //     onLayout: (PdfPageFormat format) => pdfBytes);
                        // Page
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
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
                              materialAttribute: listM));
                        },
                        colorButton: ColorApp.blue8F,
                        textColor: ColorApp.whiteF7,
                        textButton: 'Gửi đề xuất',
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
