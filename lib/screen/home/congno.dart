import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../config/path/image_path.dart';
import '../../style/init_style.dart';
import '../../widget/item/input/text_filed.dart';
import '../../widget/item/load_image.dart';
import 'item/congno_item.dart';

class CongNoScreen extends StatefulWidget {
  @override
  State<CongNoScreen> createState() => _CongNoScreenState();
}

class _CongNoScreenState extends State<CongNoScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  String a = '';

  TextEditingController qrcode=TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    a = '0';
  }

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
                          ImagePath.logomau,
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
                    ClipOval(
                        child: LoadImage(
                          url:
                          'https://pbs.twimg.com/media/FsF1CjHacAAW-bR?format=jpg&name=large',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        )),
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
        child: Column(
          children: [
            Container(
              color: Color(0xffF3F3F3),
              child: TabBar(
                onTap: (value) {
                  print(value);
                  setState(() {
                    a = value.toString();
                  });
                },
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: StyleApp.textStyle500(fontSize: 16),
                unselectedLabelStyle: StyleApp.textStyle500(
                  fontSize: 16,
                  color: Colors.black,
                ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                tabs: <Widget>[
                  Tab(
                    child: Text('Công nợ khách hàng'),
                  ),
                  Tab(
                    child: Text('Công nợ nhà cung cấp'),
                  ),


                ],
              ),
            ),
            ListView.builder(itemBuilder: (context, index) {

              return CongNoItem();
            },itemCount: 5,shrinkWrap: true,  physics: NeverScrollableScrollPhysics(),padding: EdgeInsets.zero,),
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tổng số người nợ', style:
                      StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                      Text('5', style:
                      StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                    ],
                  ), SizedBox(height: 10,),  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tổng số tiền nợ', style:
                      StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                      Text('100.000.000 đ', style:
                      StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                    ],
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
