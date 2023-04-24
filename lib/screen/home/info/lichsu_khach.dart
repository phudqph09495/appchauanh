import 'package:ChauAnh/bloc/event_bloc.dart';
import 'package:ChauAnh/model/model_historyKH.dart';
import 'package:flutter/material.dart';
import 'package:ChauAnh/screen/home/item/doanhthu_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../bloc/bloc/KhachHang/bloc_LSKH.dart';
import '../../../bloc/state_bloc.dart';
import '../../../home.dart';
import '../../../style/init_style.dart';
import '../../../widget/item/input/text_filed.dart';



class LichSuKhach extends StatefulWidget {
  String id;
  LichSuKhach({required this.id});
  @override
  State<LichSuKhach> createState() => _LichSuKhachState();
}

class _LichSuKhachState extends State<LichSuKhach>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String a = '';
  _launchURL(url) async {

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Lag rồi ............';
    }
  }

  BlocLSKH blocLSKH=BlocLSKH();
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
    a = '0';
    blocLSKH.add(GetData(param: widget.id));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch sử'),
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
                    switch (value) {
                      case 0:  blocLSKH.add(GetData(param: widget.id,keySearch: ''));break;
                      case 1:  blocLSKH.add(GetData(param: widget.id,keySearch: 'day'));break;
                      case 2:  blocLSKH.add(GetData(param: widget.id,keySearch: 'week'));break;
                      case 3:  blocLSKH.add(GetData(param: widget.id,keySearch: 'month'));break;
                    }

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
             BlocBuilder(builder: (_,StateBloc state){
               if(state is LoadSuccess){
                 ModelHistory model=state.data;
                 return  ListView.builder(
                   itemBuilder: (context, index) {
                     return Column(
                       children: [
                         Card(
                           child: Padding(
                             padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       model.customer!.fullName??'',
                                       style:
                                       StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16),
                                     ),
                                     SizedBox(
                                       height: 5,
                                     ),
                                     Row(
                                       children: [
                                         Text(
                                           model.productAttribute![index].serial??'',
                                           style: StyleApp.textStyle600(
                                               color: ColorApp.blue8F, fontSize: 12),
                                         ),
                                         Text(
                                           '- ',
                                           style: StyleApp.textStyle600(
                                               color: ColorApp.blue8F, fontSize: 12),
                                         ),
                                         Text(
                                           model.productAttribute![index].imei??'',
                                           style: StyleApp.textStyle600(
                                               color: ColorApp.redText, fontSize: 12),
                                         ),
                                       ],
                                     ),
                                     SizedBox(
                                       height: 5,
                                     ),
                                     Text(
                                       model.productAttribute![index].title??'',
                                       style:
                                       StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 12),
                                     ),
                                     SizedBox(
                                       height: 5,
                                     ),
                                     Text(
                                       model.productAttribute![index].note??'',
                                       style:
                                       StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 12),
                                     ),
                                     SizedBox(
                                       height: 5,
                                     ),
                                    ...List.generate(model.productAttribute![index].userId!.length, (index1) => Text(model.productAttribute![index].userId![index1].fullName??'')),

                                   ],
                                 ),
                                 InkWell(onTap: ()async{

                                   _launchURL('tel:${model.productAttribute![index].customerPhone}');

                                 },child: Text(model.productAttribute![index].customerPhone??''))
                               ],
                             ),
                           ),
                         ),
                         SizedBox(height: 5,),
                       ],
                     );
                   },
                   itemCount: model.productAttribute!.length,
                   shrinkWrap: true,
                   padding: EdgeInsets.symmetric(vertical: 10),
                   physics: NeverScrollableScrollPhysics(),
                 );
               }
               if(state is Loading){
                 return Text('Đang load, đợi xíu..');
               }
               if(state is LoadFail){
                 return Center(
                   child: Column(
                     children: [
                       SizedBox(height: 100,),
                       Text('Phiên đăng nhập đã hết, vui lòng đăng nhập lại'
                           ''),
                       SizedBox(height: 10,),
                       InkWell(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(index: 3,)));
                         },
                         child: Container(
                           decoration: BoxDecoration(border: Border.all()),
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text('Đăng Nhập',style: StyleApp.textStyle500(color: ColorApp.blue00),textAlign: TextAlign.center,),
                           ),
                         ),
                       ),
                     ],
                   ),
                 );
               }
               return SizedBox();
             },bloc: blocLSKH,)


            ],
          ),
        ),
      ),
    );
  }
}
