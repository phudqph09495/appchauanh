import 'package:ChauAnh/model/model_local.dart';
import 'package:ChauAnh/widget/item/button.dart';
import 'package:ChauAnh/widget/item/input/text_filed.dart';
import 'package:flutter/material.dart';

import '../../style/init_style.dart';

class AddKhach extends StatefulWidget {
  @override
  State<AddKhach> createState() => _AddKhachState();
}

class _AddKhachState extends State<AddKhach> {
  List<ModelLocal> multipleSelected = <ModelLocal>[];
  List<ModelLocal> checkListItems = [
    ModelLocal(
      name: 'Khách thợ',
      id: '01',
    ),
    ModelLocal(
      name: 'Khách buôn',
      id: '02',
    ),
    ModelLocal(
      name: 'Khách dân',
      id: '03',
    ),
    ModelLocal(
      name: 'Nhà cung cấp',
      id: '03',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Họ và tên',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
              ),
              SizedBox(
                height: 5,
              ),
              InputText1(
                label: 'Nhập họ và tên',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Divider(),
              Text(
                'Nhóm khách hàng',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
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
                        if (multipleSelected.contains(checkListItems[index])) {
                          multipleSelected.remove(checkListItems[index]);
                        } else {
                          multipleSelected.add(checkListItems[index]);
                        }
                      });
                    },
                  );
                },
                itemCount: checkListItems.length,
              ),
              Divider(),
              Text(
                'FaceBook  ',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
              ),
              SizedBox(
                height: 5,
              ),
              InputText1(
                label: 'Nhập link facebook',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Divider(),
              Text(
                'Số điện thoại  ',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
              ),
              SizedBox(height: 5,),
              InputText1(
                keyboardType: TextInputType.phone,
                label: 'Nhập số điện thoại',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Divider(),
              Text(
                'Địa chỉ  ',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
              ),
              SizedBox(height: 5,),
              InputText1(

                label: 'Nhập địa chỉ',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Divider(), Text(
                'Số điện thoại nhà xe ',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
              ),
              SizedBox(height: 5,),
              InputText1(
                keyboardType: TextInputType.phone,
                label: 'Nhập số điện thoại nhà xe' ,
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Divider(),
              Text(
                'Hình thức nhận trả hàng ',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
              ),
              SizedBox(height: 5,),
              InputText1(

                label: 'Nhập hình thức',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Divider(),
              Text(
                'Diễn giải ',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
              ),
              SizedBox(height: 5,),
              InputText1(

                label: 'Nhập diễn giải',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              SizedBox(height: 20,),
              Button1(colorButton: ColorApp.blue00, textColor: Colors.white, textButton: 'Lưu',fontSize: 16,)

            ],
          ),
        ),
      ),
    );
  }
}
