import 'package:ChauAnh/bloc/bloc/doanhThu/bloc_doanhThu.dart';
import 'package:ChauAnh/bloc/event_bloc.dart';
import 'package:ChauAnh/config/const.dart';
import 'package:flutter/material.dart';
import 'package:ChauAnh/screen/home/item/doanhthu_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_bloc.dart';
import '../../home.dart';
import '../../model/model_DoanhThu.dart';
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
  String time='';
  Bloc_DoanhThu bloc_doanhThu=Bloc_DoanhThu();
  TextEditingController search=TextEditingController();
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    bloc_doanhThu.add(GetData());

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
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: InputText1(
                  label: 'Tìm kiếm tên, số điện thoại',
                  colorBg: Color(0xff7B7B7B).withOpacity(0.3),
                  hasLeading: true,
                  controller: search,
                 onChanged: (val){
                   bloc_doanhThu.add(GetData(param: time,keySearch: search.text));

                 },
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
                    switch(value){
                      case 0: {
                        time='';
                        bloc_doanhThu.add(GetData(param: time,keySearch: search.text));
                      }
                      break;
                      case 1: {
                        time='day';
                        bloc_doanhThu.add(GetData(param: time,keySearch: search.text));
                      }
                      break;
                      case 2: {
                        time='week';
                        bloc_doanhThu.add(GetData(param: time,keySearch: search.text));
                      }
                      break;
                      case 3: {
                        time='month';
                        bloc_doanhThu.add(GetData(param: time,keySearch: search.text));
                      }
                    break;

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
         BlocBuilder(builder: (_,StateBloc state ){

           if(state is LoadSuccess){
             ModelDoanhThu model=state.data;
             return      Column(
               children: [
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
                               'Tổng chi : ', style:
                             StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16),
                             ),SizedBox(height: 5,),
                             Text('Lợi nhuận : ',  style:
                             StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16),)
                           ],
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
                           children: [
                             Text('${Const.ConvertPrice.format(model.orderTotalPrice)} đ', style:
                             StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),SizedBox(height: 5,),
                             Text(
                                 '${Const.ConvertPrice.format(model.orderTotalImportPrice)} đ', style:
                             StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)
                             ),SizedBox(height: 5,),
                             Text('${Const.ConvertPrice.format(model.orders)} đ ',style:
                             StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                           ],
                         ),

                       ],
                     ),
                   ),
                 ),
                 ListView.builder(

                   itemBuilder: (context, index) {
                     return  Column(
                       children: [
                         Card(
                           child: Padding(
                             padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Expanded(flex: 5,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         '${model.orders![index].customerName}',
                                         style:
                                         StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16),
                                       ),
                                       SizedBox(
                                         height: 5,
                                       ),
                                       Row(
                                         children: [
                                           Text(
                                             '${model.orders![index].imei} ',
                                             style: StyleApp.textStyle600(
                                                 color: ColorApp.blue8F, fontSize: 12),
                                           ),
                                           Text(
                                             '- ',
                                             style: StyleApp.textStyle600(
                                                 color: ColorApp.blue8F, fontSize: 12),
                                           ),
                                           Text(
                                             '${model.orders![index].serial}',
                                             style: StyleApp.textStyle600(
                                                 color: ColorApp.redText, fontSize: 12),
                                           ),
                                         ],
                                       ),
                                       SizedBox(
                                         height: 5,
                                       ),
                                       Text(
                                         '${model.orders![index].title}',
                                         style:
                                         StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 12),
                                       ),
                                       SizedBox(
                                         height: 5,
                                       ),
                                       Text(
                                         '${model.orders![index].note}',
                                         style:
                                         StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 12),
                                       ),
                                       SizedBox(
                                         height: 5,
                                       ),
                                       // Text('${model.orders![index].userId![0].fullName}'),
                                       ...List.generate(model.orders![index].userId!.length, (index1) => Text('${model.orders![index].userId![index1].fullName}'))

                                     ],
                                   ),
                                 ),
                                 Expanded(flex: 2,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.end,
                                     children: [
                                       Text(
                                         'Thu : ${Const.ConvertPrice.format(int.parse('${model.orders![index].totalPrice}'))} đ',
                                         style:
                                         StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 12),
                                       ),
                                       SizedBox(
                                         height: 10,
                                       ),


                                       Text(
                                         'Chi : ${Const.ConvertPrice.format(int.parse('${model.orders![index].totalImportPrice}'))} đ',
                                         style:
                                         StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 12),
                                       ),
                                       SizedBox(
                                         height: 10,
                                       ),
                                       Text(
                                         'Tổng : ${Const.ConvertPrice.format(model.orders![index].revenue)} đ',
                                         style:
                                         StyleApp.textStyle600(color: ColorApp.redText, fontSize: 12),
                                       ),


                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         SizedBox(height: 5,),
                       ],
                     );
                   },
                   itemCount: model.orders!.length,
                   shrinkWrap: true,
                   padding: EdgeInsets.zero,
                   physics: NeverScrollableScrollPhysics(),
                 ),

               ],
             );
           }
           if(state is LoadFail2){
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
           if(state is LoadFail){
             return Text(state.error);
           }
           if(state is Loading){
             return Text('Đang Load, đợi xíu...');
           }

           return SizedBox();
         },bloc: bloc_doanhThu,),

            ],
          ),
        ),
      ),
    );
  }
}
