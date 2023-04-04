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

class BaoGiaInFoScreen extends StatefulWidget {
  @override
  State<BaoGiaInFoScreen> createState() => _BaoGiaInFoScreenState();
}

class _BaoGiaInFoScreenState extends State<BaoGiaInFoScreen> {
  String? kho;
  TextEditingController money=TextEditingController();
  String? trangthai;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo báo giá'),
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
              Text(
                'Số báo giá',
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
                    width: 250,
                    borderColor: Colors.white,
                    label: 'BG 000011889834',
                    radius: 0,
                    readOnly: true,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      ImagePath.bottomBarAdd,
                      width: 50,
                      height: 50,
                    ),
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
                'Ngày báo giá',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputText1(
                    width: 250,
                    borderColor: Colors.white,
                    label: 'Vũ Đức Huy',
                    radius: 0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      ImagePath.bottomBarAdd,
                      width: 50,
                      height: 50,
                    ),
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
                label: 'Số 1 Phạm Hùng, Nam Từ Liêm, Hà Nội',
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
                label: '098766986',
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
                'Mã hàng',
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
                    width: 250,
                    borderColor: Colors.white,
                    label: '098766986',
                    radius: 0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      ImagePath.bottomBarAdd,
                      width: 50,
                      height: 50,
                    ),
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
                'Kho hàng ',
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
                'Tên hàng',
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
                    width: 250,
                    borderColor: Colors.white,
                    label: 'Tivi Samsung',
                    radius: 0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      ImagePath.bottomBarAdd,
                      width: 50,
                      height: 50,
                    ),
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
                'Số lượng',
                style:
                StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                keyboardType: TextInputType.number,
                borderColor: Colors.white,
                label: '20',
                radius: 0,
              ),
              SizedBox(height: 20,),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Trạng thái báo giá ',
                style:
                StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              DropDown2(
                listItem: [
                  ModelLocal(id: "1", name: "Trạng thái 1"),
                  ModelLocal(id: "0", name: "Trạng thái 2"),
                  ModelLocal(id: "2", name: "Trạng thái 3"),
                ],
                hint: 'Trạng thái 2',
                onChanged: (value) {
                  trangthai = value.name;
                },
                value: trangthai,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
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
                label: 'Lorem ipsum dolor',
                radius: 0,
              ),
              SizedBox(height: 20,),
              Divider(), SizedBox(
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
                controller: money,
                keyboardType: TextInputType.number,
                borderColor: Colors.white,
                label: '20.000.000',
                radius: 0,
              ),
              SizedBox(height: 20,),

              Button1(
                colorButton: ColorApp.blue8F,
                textColor: ColorApp.whiteF7,
                textButton: 'Lưu',
                fontSize: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
