import 'package:ChauAnh/home.dart';
import 'package:ChauAnh/model/model_listKH.dart';
import 'package:flutter/material.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:ChauAnh/screen/home/item/khachhang_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../bloc/bloc/KhachHang/bloc_listKH.dart';
import '../../bloc/event_bloc.dart';
import '../../bloc/state_bloc.dart';
import '../../model/model_showKH.dart';
import '../../model/model_local.dart';
import '../../style/init_style.dart';
import '../../widget/item/input/text_filed.dart';
import '../../widget/item/load_image.dart';
import 'info/info_khach.dart';

class KhachHang extends StatefulWidget {
  @override
  State<KhachHang> createState() => _KhachHangState();
}

class _KhachHangState extends State<KhachHang> {
  BlocListKH blocListKH1=BlocListKH();
  BlocListKH blocListKH2=BlocListKH();
  BlocListKH blocListKH3=BlocListKH();
  BlocListKH blocListKH4=BlocListKH();

  refesh(){
    blocListKH1.add(GetData(param: '1'));
    blocListKH2.add(GetData(param: '2'));
    blocListKH3.add(GetData(param: '3'));
    blocListKH4.add(GetData(param: '4'));

  }


  TextEditingController qrcode = TextEditingController();


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    refesh();
  }
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
                Row(
                  children: [
                    Expanded(flex: 9,
                      child: InputText1(controller: qrcode,
                        suffix: InkWell(child: Icon(Icons.search_outlined),onTap: (){
                          blocListKH1.add(GetData(param: '1',keySearch: qrcode.text));
                          blocListKH2.add(GetData(param: '2',keySearch: qrcode.text));
                          blocListKH3.add(GetData(param: '3',keySearch: qrcode.text));
                          blocListKH4.add(GetData(param: '4',keySearch: qrcode.text));
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
      body:
      DefaultTabController(
          length: 4,
          child: Column(
            children: <Widget>[
              const TabBar(
                isScrollable: true,
                labelStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                indicatorColor: ColorApp.red,
                unselectedLabelStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                labelColor: ColorApp.red,
                unselectedLabelColor: ColorApp.black49,
                tabs: [
                  Tab(text: 'Khách thợ'),
                  Tab(text: 'Khách buôn'),
                  Tab(text: 'Khách dân'),
                  Tab(text: 'Nhà cung cấp'),
                ],
              ),


               Expanded(
                child: TabBarView(
                  children: <Widget>[

                    BlocBuilder(bloc: blocListKH1,builder: (_,StateBloc state){
                      if(state is LoadSuccess){
                        ModelListKH model=state.data;
                        final Map<String, List<Customer>> groupedLists = {};
                        for (var person in model.customers!) {

                          if (groupedLists['${person.fullName![0]}'] == null) {
                            groupedLists['${person.fullName![0]}'] = <Customer>[];
                          }
                          groupedLists['${person.fullName![0]}']?.add(person);

                        }
                        return  ListView(
                            children: [
                              for (var entry in groupedLists.entries)
                                SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(entry.key,style: StyleApp.textStyle700(fontSize: 18),),
                                      ),
                                      ListView.builder(itemBuilder: (context,index){
                                        return InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Info_Khach(id: entry.value[index].id.toString(),))).then((value) => refesh());
                                          },
                                          child: ItemKhachHang(
                                              '${entry.value[index].fullName}', '${entry.value[
    index].phone}', '${entry.value[index].code}'),
                                        );
                                      },
                                        itemCount: entry.value.length,shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                      )
                                    ],
                                  ),
                                ),
                            ],
                          );
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
                      return Container();
                    }),
                    BlocBuilder(bloc: blocListKH2,builder: (_,StateBloc state){
                      if(state is LoadSuccess){
                        ModelListKH model=state.data;
                        final Map<String, List<Customer>> groupedLists = {};
                        for (var person in model.customers!) {

                          if (groupedLists['${person.fullName![0]}'] == null) {
                            groupedLists['${person.fullName![0]}'] = <Customer>[];
                          }
                          groupedLists['${person.fullName![0]}']?.add(person);

                        }
                        return  ListView(
                          children: [
                            for (var entry in groupedLists.entries)
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(entry.key,style: StyleApp.textStyle700(fontSize: 18),),
                                    ),
                                    ListView.builder(itemBuilder: (context,index){
                                      return InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Info_Khach(id: entry.value[index].id.toString(),))).then((value) => refesh());
                                        },
                                        child: ItemKhachHang(
                                            '${entry.value[index].fullName}', '${entry.value[
                                        index].phone}', '${entry.value[index].code}'),
                                      );
                                    },
                                      itemCount: entry.value.length,shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                    )
                                  ],
                                ),
                              ),
                          ],
                        );
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
                      return Container();
                    }),
                    BlocBuilder(bloc: blocListKH3,builder: (_,StateBloc state){
                      if(state is LoadSuccess){
                        ModelListKH model=state.data;
                        final Map<String, List<Customer>> groupedLists = {};
                        for (var person in model.customers!) {

                          if (groupedLists['${person.fullName![0]}'] == null) {
                            groupedLists['${person.fullName![0]}'] = <Customer>[];
                          }
                          groupedLists['${person.fullName![0]}']?.add(person);

                        }
                        return  ListView(
                          children: [
                            for (var entry in groupedLists.entries)
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(entry.key,style: StyleApp.textStyle700(fontSize: 18),),
                                    ),
                                    ListView.builder(itemBuilder: (context,index){
                                      return InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Info_Khach(id: entry.value[index].id.toString(),))).then((value) => refesh());
                                        },
                                        child: ItemKhachHang(
                                            '${entry.value[index].fullName}', '${entry.value[
                                        index].phone}', '${entry.value[index].code}'),
                                      );
                                    },
                                      itemCount: entry.value.length,shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                    )
                                  ],
                                ),
                              ),
                          ],
                        );
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
                      return Container();
                    }),
                    BlocBuilder(bloc: blocListKH4,builder: (_,StateBloc state){
                      if(state is LoadSuccess){
                        ModelListKH model=state.data;
                        final Map<String, List<Customer>> groupedLists = {};
                        for (var person in model.customers!) {

                          if (groupedLists['${person.fullName![0]}'] == null) {
                            groupedLists['${person.fullName![0]}'] = <Customer>[];
                          }
                          groupedLists['${person.fullName![0]}']?.add(person);

                        }
                        return  ListView(
                          children: [
                            for (var entry in groupedLists.entries)
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(entry.key,style: StyleApp.textStyle700(fontSize: 18),),
                                    ),
                                    ListView.builder(itemBuilder: (context,index){
                                      return InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Info_Khach(id: entry.value[index].id.toString(),))).then((value) => refesh());
                                        },
                                        child: ItemKhachHang(
                                            '${entry.value[index].fullName}', '${entry.value[
                                        index].phone}', '${entry.value[index].code}'),
                                      );
                                    },
                                      itemCount: entry.value.length,shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                    )
                                  ],
                                ),
                              ),
                          ],
                        );
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
                      return Container();
                    }),



                  ],
                ),
              )
            ],
          )),
    );
  }
}
