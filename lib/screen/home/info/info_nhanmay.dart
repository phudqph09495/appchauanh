import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ChauAnh/config/const.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:ChauAnh/config/share_pref.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import '../../../model/model_local.dart';
import '../../../style/init_style.dart';
import '../../../widget/item/Dropdown1.dart';
import '../../../widget/item/button.dart';
import '../../../widget/item/input/text_filed.dart';
import '../../add/add_baogia.dart';

class InfoNhanMay extends StatefulWidget {
  @override
  State<InfoNhanMay> createState() => _InfoNhanMayState();
}

class _InfoNhanMayState extends State<InfoNhanMay> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? kho;
  String? trangthai;
  TextEditingController qrcode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin đơn'),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Ngày',
                style:
                StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputText1(width: 250,
                    borderColor: Colors.white,
                    label: 'Nguyễn Văn Nam',
                    radius: 0,
                  ),
                  InkWell(
                    onTap: (){},
                    child: Image.asset(ImagePath.bottomBarAdd,width: 50,height: 50,),
                  )
                ],
              ),
              SizedBox(
                height: 20,
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
                borderColor: Colors.white,
                label: 'Khu 8- Trường Thịnh-Thanh Mai',
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
                keyboardType: TextInputType.phone,
                borderColor: Colors.white,
                label: '0347589685',
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
                'Số seri',
                style:
                StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputText1(
                    controller: qrcode,
                    width: 250,
                    borderColor: Colors.white,
                    label: '145269874',
                    radius: 0,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.qr_code_scanner,
                      size: 40,
                    ),
                    onTap: () async {
                      var res = await Navigator.push(
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
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Model máy',
                style:
                StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(

                borderColor: Colors.white,
                label: 'Samsung 014511',
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
                'Giá dự kiến',
                style:
                StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                inputformater: [ThousandsSeparatorInputFormatter()],
                keyboardType: TextInputType.number,
                borderColor: Colors.white,
                label: '150000',
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
              DropDown2(
                listItem: [
                  ModelLocal(id: "1", name: "Kho 1"),
                  ModelLocal(id: "0", name: "Kho 2"),
                  ModelLocal(id: "2", name: "Kho 3"),
                ],
                hint: 'Kho 2',
                onChanged: (value) {
                  kho = value.name;
                },
                value: kho,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
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
                borderColor: Colors.white,
                label: 'Hơi móp',
                radius: 0,
              ),
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
              InputText1(
                borderColor: Colors.white,
                label: 'Trần Văn Bình',
                radius: 0,
              ),
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
                borderColor: Colors.white,
                label: 'Móp do vận chuyển',
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
                ],
                hint: 'Không sửa được',
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

              Button1(colorButton: ColorApp.blue8F, textColor: ColorApp.whiteF7, textButton: 'Lưu',fontSize: 16,)
            ],
          ),
        ),
      ),
    );
  }
}
