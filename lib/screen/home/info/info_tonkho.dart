import 'package:flutter/material.dart';

import '../../../style/init_style.dart';
import '../../../widget/item/input/text_filed.dart';

class InfoTonKho extends StatefulWidget {


  @override
  State<InfoTonKho> createState() => _InfoTonKhoState();
}

class _InfoTonKhoState extends State<InfoTonKho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF7,
        centerTitle: true,
        title: Text(
          'Chi tiết sản phẩm tồn kho',
          style: StyleApp.textStyle600(color: ColorApp.blue00, fontSize: 18),
        ),
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: ColorApp.blue00,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child:Column(crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15,bottom: 15),
              child: InputText1(
                label: 'Tìm kiếm tên, số điện thoại',
                colorBg: Color(0xff7B7B7B).withOpacity(0.3),
                hasLeading: true,
                iconData: Icons.search,
                radius: 5,
              ),
            ),
            ListView.builder(itemBuilder: (context,index){
              return Column(
                children: [
                  Row(
                    children: [
                      Text('Ngày nhập - ',style: StyleApp.textStyle500(),),
                      Text('07/12/2022',style: StyleApp.textStyle500(color: ColorApp.redText),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Số lô - ',style: StyleApp.textStyle500(),),
                      Text('10',style: StyleApp.textStyle500(color: ColorApp.redText),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Số lượng - ',style: StyleApp.textStyle500(),),
                          Text('10',style: StyleApp.textStyle500(color: ColorApp.redText),)
                        ],
                      ),
                      Text('1.500.000vnđ',style: StyleApp.textStyle500(color: ColorApp.redText),)
                    ],
                  ),
                  Divider()

                ],
              );
            },itemCount: 3,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),),SizedBox(height: 15,),
            Text('Tổng lô: 100.000.000vnđ',style: StyleApp.textStyle500(color: ColorApp.blue3D),)
          ],
        ),
      ),
    );
  }
}
