import 'package:flutter/material.dart';

import '../../../model/model_local.dart';
import '../../../style/init_style.dart';
import '../../../widget/item/button.dart';
import '../../../widget/item/input/text_filed.dart';
import 'lichsu_khach.dart';

class Info_Khach extends StatefulWidget {


  @override
  State<Info_Khach> createState() => _Info_KhachState();
}

class _Info_KhachState extends State<Info_Khach> {
  List<ModelLocal> multipleSelected = <ModelLocal>[];
  List<ModelLocal> checkListItems = [
    ModelLocal(
      name: 'Khách thợ',
      id: '01',
      value: true
    ),
    ModelLocal(
      name: 'Khách buôn',
      id: '02',
        value: true
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
        title: Text('Thông tin chi tiết'),
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
                label: 'Nguyễn Văn A',
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
                'Mã khách hàng',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
              ),
              SizedBox(
                height: 5,
              ),
            Text('KH00001', style: StyleApp.textStyle500(color: ColorApp.black49),),
              Divider(),
              Text(
                'FaceBook  ',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
              ),
              SizedBox(
                height: 5,
              ),
              InputText1(
                label: 'Điện máy châu anh',
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
                label: '0347589685',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Divider(),
              Text(
                'Địa chỉ  ',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
              ),
              SizedBox(height: 5,),
              InputText1(
                label: 'Yên Bái',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Divider(), Text(
                'Số điện thoại nhà xe ',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
              ),
              SizedBox(height: 5,),
              InputText1(
                keyboardType: TextInputType.phone,
                label: '0478596512' ,
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Divider(),
              Text(
                'Hình thức nhận trả hàng ',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
              ),
              SizedBox(height: 5,),
              InputText1(

                label: 'Nhận trả tại bến Mỹ đình',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Divider(),
              Text(
                'Số ngày công nợ',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
              ),
              SizedBox(
                height: 5,
              ),
              Text('có', style: StyleApp.textStyle500(color: ColorApp.black49),),Divider(),
              Text(
                'Diễn giải ',
                style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),
              ),
              SizedBox(height: 5,),
              InputText1(
maxLine: 3,
                label: 'gsdgsdfgrghtyt',
                width: MediaQuery.of(context).size.width * 0.7,
              ),Divider(),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LichSuKhach()));
              },
              child: Padding(
                padding:EdgeInsets.symmetric(vertical: 5),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('Lịch sử đơn hàng',style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),),
                    Icon(Icons.arrow_right,color: ColorApp.blue00,),

                  ],
                ),
              ),),
              Divider(),
              SizedBox(height: 20,),

              Button1(colorButton: ColorApp.blue00, textColor: Colors.white, textButton: 'Lưu',fontSize: 16,)

            ],
          ),
        ),
      ),
    );
  }
}
