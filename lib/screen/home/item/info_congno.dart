import 'package:flutter/material.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:ChauAnh/widget/item/load_image.dart';

import '../../../style/init_style.dart';
import '../../../widget/item/input/text_filed.dart';
import 'khachhang_item.dart';

class InFoCongNo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.25,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorApp.linearGradientBanner,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
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
                InputText1(
                  colorLabel: const Color(0xffF3F3F3),
                  colorBg: Colors.white.withOpacity(0.4),
                  label: 'Tìm kiếm tên, số điện thoại',
                  hasLeading: true,
                  iconData: Icons.search,
                  radius: 12,
                )
              ],
            ),
          ),
        ),
      ),
      body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              const TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 50),
                isScrollable: true,
                labelStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                indicatorColor: ColorApp.blue8F,
                unselectedLabelStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                labelColor: ColorApp.blue8F,
                unselectedLabelColor: ColorApp.black49,
                tabs: [
                  Tab(text: 'Dịch vụ sửa chữa'),
                  Tab(text: 'Mua linh kiện'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    DVSuaChua(),
                    MuaLinhKien(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class DVSuaChua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 10),  physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'UA32K5500aKXXV - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 10),
                                ),
                                Text(
                                  'LC3284239-3246',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 10),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '01523NAHA73243289',
                              style: StyleApp.textStyle500(
                                  color: ColorApp.blue8F, fontSize: 10),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Lorem ipsum dolor',
                              style: StyleApp.textStyle500(
                                  color: ColorApp.blue8F, fontSize: 10),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('3.000.000 vnđ',   style: StyleApp.textStyle500(
                                color: Color(0xffD10563), fontSize: 10),),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Ngày công nợ đầu tiên',style: StyleApp.textStyle500(
                            color: ColorApp.blue8F, fontSize: 10),),
                            SizedBox(
                              height: 10,
                            ),
                            Text('10/10/2022',style: StyleApp.textStyle500(
                                color: ColorApp.blue8F, fontSize: 10),),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider()
                ],
              );
            }),
        Padding(
          padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng đơn', style:
                  StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                  Text('3', style:
                  StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                ],
              ), SizedBox(height: 10,),  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng tiền', style:
                  StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                  Text('9.000.000 đ', style:
                  StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MuaLinhKien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 10),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Màn hình TV - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 10),
                                ),
                                Text(
                                  'LC3284239-3246',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 10),
                                ),
                                Text(
                                  ' - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 10),
                                ),
                                Text(
                                  '10',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 10),
                                ),
                                Text(
                                  ' - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 10),
                                ),
                                Text(
                                  '1.500.000vnđ',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 10),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Bo mạch - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 10),
                                ),
                                Text(
                                  '01523NAHA73243289',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 10),
                                ),
                                Text(
                                  ' - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 10),
                                ),
                                Text(
                                  '1.500.000vnđ',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 10),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Bo mạch - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 10),
                                ),
                                Text(
                                  '01523NAHA73243289',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 10),
                                ),
                                Text(
                                  ' - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 10),
                                ),
                                Text(
                                  '1.500.000vnđ',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 10),
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text(
                                  'Đã thanh toán   ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 10),
                                ),
                                Text(
                                  '4.500.000 vnđ',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('500.000 vnđ',   style: StyleApp.textStyle500(
                                color: Color(0xffD10563), fontSize: 10),),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Ngày công nợ đầu tiên',style: StyleApp.textStyle500(
                                color: ColorApp.blue8F, fontSize: 10),),
                            SizedBox(
                              height: 10,
                            ),
                            Text('10/10/2022',style: StyleApp.textStyle500(
                                color: ColorApp.blue8F, fontSize: 10),),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider()
                ],
              );
            }),
        Padding(
          padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng đơn', style:
                  StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                  Text('3', style:
                  StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                ],
              ), SizedBox(height: 10,),  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng tiền', style:
                  StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                  Text('9.000.000 đ', style:
                  StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
