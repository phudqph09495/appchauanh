import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../config/path/image_path.dart';
import '../../style/init_style.dart';
import '../../widget/item/input/text_filed.dart';
import '../../widget/item/load_image.dart';
import '../home/item/congno_item.dart';
import 'item/notify_item.dart';

class NotifyScreen extends StatefulWidget {
  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  TextEditingController qrcode=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.25,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorApp.linearGradientBanner,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back,color: Colors.white,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),Row(
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
                            Text(
                              'công việc hôm nay của bạn',
                              style: StyleApp.textStyle400(
                                  fontSize: 13, color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                    // ClipOval(
                    //     child: LoadImage(
                    //       url:
                    //       'https://pbs.twimg.com/profile_images/1576047166275059713/8k-7wKr8_400x400.jpg',
                    //       height: 50,
                    //       width: 50,
                    //       fit: BoxFit.contain,
                    //     )),
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
        child: ListView.builder(itemBuilder: (context, index) {
          return NotifyItem();
        },itemCount: 15,shrinkWrap: true,  physics: NeverScrollableScrollPhysics(),),
      ),
    );
  }
}
