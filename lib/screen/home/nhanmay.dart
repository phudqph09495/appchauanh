import 'package:ChauAnh/bloc/event_bloc.dart';
import 'package:ChauAnh/bloc/state_bloc.dart';
import 'package:ChauAnh/model/model_dvsc.dart';
import 'package:ChauAnh/widget/item/input/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/congviec/bloc_dvsc.dart';
import '../../home.dart';
import '../../style/init_style.dart';
import 'info/info_baogia.dart';
import 'info/info_nhanmay.dart';

class NhanMay extends StatefulWidget {
  @override
  State<NhanMay> createState() => _NhanMayState();
}

class _NhanMayState extends State<NhanMay>with TickerProviderStateMixin {
  TabController? _tabController;
  TabController? _tabController2;
  BlocDVSC blocDVSC=BlocDVSC();
  String b = '';
  String a = '';
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController2 = TabController(length: 2, vsync: this);
    super.initState();
    a = '0';
    b='0';
    blocDVSC.add(GetData());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF7,
        centerTitle: true,
        title: Text(
          'Danh sách nhận máy',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SingleChildScrollView(
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
              InputText1(
                label: 'Tìm kiếm tên, số điện thoại',
                radius: 10,
                colorBg: Colors.grey.withOpacity(0.2),
                colorLabel: ColorApp.blue00,
                hasLeading: true,
                iconData: Icons.search_outlined,
                verti: 7,
              ),
              SizedBox(height: 15,),
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
              SizedBox(height: 10,),
              BlocBuilder(builder: (_,StateBloc state){
                if(state is LoadSuccess){
                  ModelDVSC model=state.data;
                  return ListView.builder(itemBuilder: (context,index){
                    return InkWell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.productAttrs![index].customerName??'',style: StyleApp.textStyle500(color: ColorApp.blue3D,fontSize: 18),),
                          SizedBox(height: 15,),
                          // Text('BG 000011889834',style: StyleApp.textStyle400(fontSize: 16),),
                          SizedBox(height: 10,),
                          Divider()
                        ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoNhanMay(id: '${model.productAttrs![index].id}',))).then((value) => blocDVSC.add(GetData()));
                      },
                    );
                  },itemCount: model.productAttrs!.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),);
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
                if(state is Loading){
                  return Text('Đang Load, đợi xíu...');
                }
                return SizedBox();
              },bloc: blocDVSC,)
            ],
          ),
        ),
      ),
    );
  }
}
