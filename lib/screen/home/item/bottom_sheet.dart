
import 'package:ChauAnh/screen/add/add_khach.dart';
import 'package:flutter/material.dart';

import '../../../style/init_style.dart';
import '../../add/add_baogia.dart';
import '../../add/add_nhanmay.dart';



class BottomSheetAccount extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorApp.blueE2,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          ListTile(
            onTap: () {
            },
            title: Text(
              "Lấy linh kiện",
              style: StyleApp.textStyle500(color: Colors.white,fontSize: 16),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNhanMay()));

            },
            title: Text(
              "Nhận máy",
              style: StyleApp.textStyle500(color: Colors.white,fontSize: 16),
            ),
          ),
          ListTile(
            title: Text(
              "Tạo khách hàng",
              style: StyleApp.textStyle500(color: Colors.white,fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddKhach()));
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBaoGia()));
            },
            title: Text(
              "Tạo báo giá",
              style: StyleApp.textStyle500(color: Colors.white,fontSize: 16),
            ),
          ),

        ],
      ),
    );
  }
}
