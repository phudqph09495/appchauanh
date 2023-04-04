import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ChauAnh/config/const.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:ChauAnh/config/share_pref.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import '../../model/model_local.dart';
import '../../style/init_style.dart';
import '../../widget/item/Dropdown1.dart';
import '../../widget/item/button.dart';
import '../../widget/item/input/text_filed.dart';

class AddBaoGia extends StatefulWidget {
  @override
  State<AddBaoGia> createState() => _AddBaoGiaState();
}

class _AddBaoGiaState extends State<AddBaoGia> {
  String? kho;
String? trangthai;
TextEditingController money=TextEditingController();
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
                    label: 'Nhập khách hàng',
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
                    label: 'Nhập mã hàng',
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
                hint: 'Danh sách kho',
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
                    label: 'Nhập tên hàng',
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
                label: 'Nhập số lượng',
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
                  ModelLocal(id: "1", name: "Kho 1"),
                  ModelLocal(id: "0", name: "Kho 2"),
                  ModelLocal(id: "2", name: "Kho 3"),
                ],
                hint: 'Danh sách trạng thái',
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
                label: 'Nhập diễn giải',
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
                controller: money,
                inputformater: [ThousandsSeparatorInputFormatter()],
                keyboardType: TextInputType.number,
                borderColor: Colors.white,
                label: 'Nhập giá dự kiến',
                radius: 0,
              ),
              SizedBox(height: 20,),

              Button1(
                ontap: (){
                  print(money.text);
                },
                colorButton: ColorApp.blue8F,
                textColor: ColorApp.whiteF7,
                textButton: 'Lưu ',
                fontSize: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = '.'; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
