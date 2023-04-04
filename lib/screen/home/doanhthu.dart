import 'package:flutter/material.dart';
import 'package:ChauAnh/screen/home/item/doanhthu_item.dart';

import '../../style/init_style.dart';
import '../../widget/item/input/text_filed.dart';

class DoanhThuScreen extends StatefulWidget {
  @override
  State<DoanhThuScreen> createState() => _DoanhThuScreenState();
}

class _DoanhThuScreenState extends State<DoanhThuScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String a = '';
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
    a = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doanh Thu'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorApp.linearGradientBanner,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: InputText1(
                  label: 'Tìm kiếm tên, số điện thoại',
                  colorBg: Color(0xff7B7B7B).withOpacity(0.3),
                  hasLeading: true,
                  iconData: Icons.search,
                  radius: 5,
                ),
              ),
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
                      child: Text('Tất cả'),
                    ),
                    Tab(
                      child: Text('Ngày'),
                    ),
                    Tab(
                      child: Text('Tuần'),
                    ),
                    Tab(
                      child: Text('Tháng'),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return DoanhThuItem();
                },
                itemCount: 5,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 10),
                physics: NeverScrollableScrollPhysics(),
              ),
              Card(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tổng thu : ', style:
                          StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16),),SizedBox(height: 5,),
                          Text(
                            'Tổng chi :', style:
                          StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16),
                          ),SizedBox(height: 5,),
                          Text('Lợi nhuận : ',  style:
                          StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('100.000.00 đ', style:
                          StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),SizedBox(height: 5,),
                          Text(
                            '50.000.00 đ', style:
                          StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)
                          ),SizedBox(height: 5,),
                          Text('50.000.000 đ ',style:
                          StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
