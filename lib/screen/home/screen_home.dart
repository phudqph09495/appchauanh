import 'package:flutter/material.dart';
import 'package:ChauAnh/screen/home/congno.dart';
import 'package:ChauAnh/screen/home/tonkho.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../config/path/image_path.dart';
import '../../model/model_local.dart';
import '../../style/init_style.dart';
import '../../widget/item/Dropdown1.dart';
import '../../widget/item/input/text_filed.dart';
import '../../widget/item/load_image.dart';
import 'info/info_baogia.dart';
import 'doanhthu.dart';
import '../notify/notify_screen.dart';
import 'info/info_nhanmay.dart';
import 'baogia.dart';
import 'khachhang.dart';
import 'nhanmay.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController qrcode = TextEditingController();
  List<String> listB = ['Đại lý 1', 'Đại lý 2', 'Đại lý 3', 'Đại lý 4'];
  String? daily = 'Chọn đại lý';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.23,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorApp.linearGradientBanner,
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.06,
                left: 10,
                right: 10,
                bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImagePath.logo,
                          height: 70,
                          width: 70,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Xin Chào !',
                              style: StyleApp.textStyle600(
                                  fontSize: 20, color: Colors.white),
                            ),
                           // StatefulBuilder(builder: (BuildContext context,setState){return  PopupMenuButton(
                           //
                           //     child: Container(
                           //         decoration: BoxDecoration(
                           //             borderRadius: BorderRadius.circular(15),
                           //             border:
                           //             Border.all(color: Colors.white)),
                           //         child: Padding(
                           //           padding: const EdgeInsets.all(8.0),
                           //           child: Text(
                           //             daily??'',
                           //             style: StyleApp.textStyle500(
                           //                 color: Colors.white),
                           //           ),
                           //         )),
                           //     itemBuilder: (context2) {
                           //       return List.generate(
                           //           listB.length,
                           //               (index) => PopupMenuItem(
                           //             padding: EdgeInsets.only(left: 20),
                           //             child: Text(
                           //               listB[index],
                           //               textAlign: TextAlign.end,
                           //             ),
                           //             value: index,
                           //             onTap: () {
                           //               setState(() {
                           //                 daily = listB[index];
                           //               });
                           //               print(daily);
                           //
                           //             },
                           //           ));
                           //     });})
                          ],
                        )
                      ],
                    ),
                    // ClipOval(
                    //     child: LoadImage(
                    //   url:
                    //       'https://pbs.twimg.com/profile_images/1576047166275059713/8k-7wKr8_400x400.jpg',
                    //   height: 50,
                    //   width: 50,
                    //   fit: BoxFit.contain,
                    // )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(flex: 9,
                      child: InputText1(controller: qrcode,
                        suffix: InkWell(child: Icon(Icons.search_outlined),onTap: (){
                          print(qrcode.text);
                        },),
                        colorLabel: Color(0xffF3F3F3),
                        colorBg: Colors.white.withOpacity(0.4),
                        label: 'Tìm kiếm tên, số điện thoại',
                        hasLeading: false,

                        radius: 12,
                      ),
                    ),
                    Expanded(flex: 1 ,child: InkWell(child: Icon(Icons.qr_code_scanner,size: 30,), onTap: () async {
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
                    }),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => KhachHang()));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.18,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                            color: Color(0xff6BB3AC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(ImagePath.group),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Khách hàng',
                          style: StyleApp.textStyle400(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CongNoScreen()));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.18,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                            color: Color(0xff7CAA4B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(ImagePath.money),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Công Nợ',
                          style: StyleApp.textStyle400(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NhanMay()));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.18,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                            color: Color(0xffE4B74D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(ImagePath.file),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'DS Nhận máy',
                          style: StyleApp.textStyle400(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DanhSachBaoGia()));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.18,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                            color: Color(0xff65AEBF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(ImagePath.order2),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Báo giá',
                          style: StyleApp.textStyle400(fontSize: 14),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TonKhoScreen()));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.18,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                            color: Color(0xff58B6CF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(ImagePath.warehouse),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tồn kho',
                          style: StyleApp.textStyle400(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoanhThuScreen()));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.18,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                            color: Color(0xff264E89),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(ImagePath.file),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Doanh Thu',
                          style: StyleApp.textStyle400(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.18,
                    width: MediaQuery.of(context).size.width * 0.18,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.18,
                    width: MediaQuery.of(context).size.width * 0.18,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
