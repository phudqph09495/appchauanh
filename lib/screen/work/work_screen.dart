import 'package:ChauAnh/bloc/event_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../bloc/bloc/congviec/bloc_dvsc.dart';
import '../../bloc/state_bloc.dart';
import '../../config/const.dart';
import '../../model/model_dvsc.dart';
import '../../style/init_style.dart';
import '../../widget/item/button.dart';
import '../../widget/item/input/text_filed.dart';
import '../../widget/item/load_image.dart';

import 'item/chonLinhKien.dart';
import 'item/work_item.dart';

class WorkScreen extends StatefulWidget {
  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen>
      with TickerProviderStateMixin {
  TabController? _tabController;
  String a = '';
  TabController? _tabController2;
  TabController? _tabController3;
  BlocDVSC blocDVSC=BlocDVSC();
  int b = 0;
  DateTime? TimeStart;
  TextEditingController qrcode=TextEditingController();
  String startTime=Const.formatTime(DateTime.now().millisecondsSinceEpoch,format: 'dd/MM/yyyy');
  String endTime=Const.formatTime(DateTime.now().millisecondsSinceEpoch,format: 'dd/MM/yyyy');
  @override
  void initState() {
    a = '0';
    b=0;
    blocDVSC.add(GetData());
    _tabController = TabController(length: 8, vsync: this);
    _tabController2 = TabController(length: 2, vsync: this);
    _tabController3 = TabController(length: 5, vsync: this);
    super.initState();

  }


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
          child: Column(
            children: [
              Container(
                color: Color(0xffF3F3F3),
                child: TabBar(
                  onTap: (value) {
                    print(value);
                    setState(() {
                      b = value;
                    });
                  },
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  controller: _tabController2,
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
                      child: Text('Dịch vụ sửa chữa'),
                    ),
                    Tab(
                      child: Text('Lấy linh kiện'),
                    ),


                  ],
                ),
              ),
           b==0?   Container(
                color: Color(0xffF3F3F3),
                child: TabBar(
                  onTap: (value) {
                   blocDVSC.add(GetData(keySearch: value.toString()));
                    setState(() {
                      a = value.toString();

                    });
                  },
                  isScrollable: true,
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
                      child: BlocBuilder(builder: (_,StateBloc state){
                        if(state is LoadSuccess){
                          ModelDVSC model= state.data;
                          return Text('Tất cả(${model.total![0].total})');
                        }
                        return Text('Tất cả');
                        },bloc: blocDVSC,),
                    ),
                    Tab(
                      child: BlocBuilder(builder: (_,StateBloc state){
                        if(state is LoadSuccess){
                          ModelDVSC model= state.data;
                          return Text('Đang xử lý(${model.total![0].dangXuLy})');
                        }
                        return Text('Đang xử lý');
                      },bloc: blocDVSC,),
                    ),
                    Tab(
                      child: BlocBuilder(builder: (_,StateBloc state){
                        if(state is LoadSuccess){
                          ModelDVSC model= state.data;
                          return Text('Đã xử lý(${model.total![0].daXuLy})');
                        }
                        return Text('Đã xử lý');
                      },bloc: blocDVSC,),
                    ),
                    Tab(
                      child: BlocBuilder(builder: (_,StateBloc state){
                        if(state is LoadSuccess){
                          ModelDVSC model= state.data;
                          return Text('Chờ linh kiện(${model.total![0].choLinhKien})');
                        }
                        return Text('Chờ linh kiện');
                      },bloc: blocDVSC,),
                    ),
                    Tab(
                      child: BlocBuilder(builder: (_,StateBloc state){
                        if(state is LoadSuccess){
                          ModelDVSC model= state.data;
                          return Text('Không sửa được(${model.total![0].khongSuaDuoc})');
                        }
                        return Text('Không sửa được');
                      },bloc: blocDVSC,),
                    ),
                    Tab(
                      child: BlocBuilder(builder: (_,StateBloc state){
                        if(state is LoadSuccess){
                          ModelDVSC model= state.data;
                          return Text('Máy nhà mua(${model.total![0].nhaMua})');
                        }
                        return Text('Máy nhà mua');
                      },bloc: blocDVSC,),
                    ),
                    Tab(
                      child: BlocBuilder(builder: (_,StateBloc state){
                        if(state is LoadSuccess){
                          ModelDVSC model= state.data;
                          return Text('Bảo hành(${model.total![0].baoHanh})');
                        }
                        return Text('Bảo hành');
                      },bloc: blocDVSC,),
                    ),
                    Tab(
                      child: BlocBuilder(builder: (_,StateBloc state){
                        if(state is LoadSuccess){
                          ModelDVSC model= state.data;
                          return Text('Hoàn thành(${model.total![0].hoanThanh})');
                        }
                        return Text('Hoàn thành');
                      },bloc: blocDVSC,),
                    ),
                  ],
                ),
              ):
           Container(
             color: Color(0xffF3F3F3),
             child: TabBar(
               onTap: (value) {

                 setState(() {
                   a = value.toString();
                 });
               },
               isScrollable: true,
               padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
               controller: _tabController3,

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
                   child: Text('Tất cả(1600)'),
                 ),
                 Tab(
                   child: Text('Đang xử lý(100)'),
                 ),
                 Tab(
                   child: Text('Đã xử lý(100)'),
                 ),
                 Tab(
                   child: Text('Chờ linh kiện(100)'),
                 ),


                 Tab(
                   child: Text('Hoàn Thành(100)'),
                 ),

               ],
             ),
           ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
DatePicker.showDatePicker(context,
showTitleActions: true,
    locale: LocaleType.vi,currentTime: DateTime.now(),
onConfirm: (date){
  setState(() {
    startTime=Const.formatTime(date.millisecondsSinceEpoch,format: 'dd/MM/yyyy');
    TimeStart=date;
  });
});
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Ngày bắt đầu',style: StyleApp.textStyle600(fontSize: 16),),
                            SizedBox(height: 5,),
                            Text(startTime),
                          ],
                        ),
                      ),

                    ),
                  ),
                  InkWell(
                    onTap: (){
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime:TimeStart ,
                          locale: LocaleType.vi,currentTime: DateTime.now(),
                          onConfirm: (date){
                            setState(() {
                              endTime=Const.formatTime(date.millisecondsSinceEpoch,format: 'dd/MM/yyyy');
                            });
                          });
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Ngày kết thúc',style: StyleApp.textStyle600(fontSize: 16),), SizedBox(height: 5,),
                            Text(endTime),
                          ],
                        ),
                      ),

                    ),
                  ),
                ],
              ),
             BlocBuilder(builder: (_,StateBloc state){
               if(state is LoadSuccess){
                 ModelDVSC model=state.data;
                 return  Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ListView.builder(itemBuilder: (context,index){
                     return Card(
                       margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                       color: ColorApp.whiteF0,
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SizedBox(
                                   height: 5,
                                 ),
                                 Text(
                                   model.productAttrs![index].customerName??'',
                                   style:
                                   StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16),
                                 ),
                                 SizedBox(
                                   height: 5,
                                 ),
                                 InkWell(onTap: (){

                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => ChonLinhKien()));
                                 },
                                   child: Row(
                                     children: [
                                       Text(
                                         model.productAttrs![index].imei??'',
                                         style: StyleApp.textStyle600(
                                             color: ColorApp.blue8F, fontSize: 12),
                                       ),
                                       Text(
                                         ' - ',
                                         style: StyleApp.textStyle600(
                                             color: ColorApp.blue8F, fontSize: 12),
                                       ),
                                       SizedBox(
                                         width: MediaQuery.of(context).size.width * 0.3,
                                         child: Text(
                                           model.productAttrs![index].serial??'',
                                           maxLines: 1,
                                           overflow: TextOverflow.ellipsis,
                                           softWrap: false,
                                           style: StyleApp.textStyle600(
                                               color: ColorApp.redText, fontSize: 12),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                                 SizedBox(
                                   height: 5,
                                 ),
                                 Text(
                                   model.productAttrs![index].title??'',
                                   style:
                                   StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 12),
                                 ),
                                 SizedBox(
                                   height: 5,
                                 ),
                                 Text(
                                   model.productAttrs![index].note??'',
                                   style:
                                   StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 12),
                                 ),
                                 SizedBox(
                                   height: 5,
                                 ),
                                 Text(model.productAttrs![index].userId![0].fullName??''),
                                 SizedBox(
                                   height: 15,
                                 ),
                                 Text(model.productAttrs![index].status.toString()),
                               ],
                             ),
                           ),
                           InkWell(
                             child: Icon(
                               Icons.edit_note_outlined,
                               size: 35,
                               color: Colors.green,
                             ),
                             onTap: () {
                               showDialog(context: context, builder:(_) => AlertDialog( shape: const RoundedRectangleBorder(
                                   borderRadius: BorderRadius.all(
                                       Radius.circular(10.0))),
                                 content: Container(
                                   height:
                                   MediaQuery.of(context).size.height *
                                       0.55,
                                   width: MediaQuery.of(context).size.width *
                                       0.8,
                                   child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                     children: [
                                       Text('Nhập mô tả',style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),),

                                       InputText1(label: 'Nhập mô tả',maxLine: 5,),

                                       Center(child: Button1(colorButton: ColorApp.blue00, textColor: Colors.white, textButton: 'Lưu'),)
                                     ],
                                   ),
                                 ),));
                             },
                           )
                         ],
                       ),
                     );
                   },itemCount: model.productAttrs!.length,shrinkWrap: true,  physics: NeverScrollableScrollPhysics(),),
                 );
               }
               if(state is Loading){
                 return Text('Đang load, đợi xíu..');
               }
               return SizedBox();
             },bloc: blocDVSC,)
            ],
          ),
        ));
  }
}
