import 'package:ChauAnh/bloc/event_bloc.dart';
import 'package:ChauAnh/model/model_local.dart';
import 'package:flutter/material.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../bloc/bloc/congviec/bloc_dvsc.dart';
import '../../bloc/bloc/nhanMay/bloc_fullListNV.dart';
import '../../bloc/state_bloc.dart';
import '../../config/const.dart';
import '../../home.dart';
import '../../model/model_dvsc.dart';
import '../../model/model_listNV.dart';
import '../../style/init_style.dart';
import '../../widget/item/button.dart';
import '../../widget/item/input/text_filed.dart';
import '../../widget/item/load_image.dart';

import '../home/info/info_nhanmay.dart';
import 'item/chonLinhKien.dart';
import 'item/work_item.dart';

class WorkScreen extends StatefulWidget {
  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> with TickerProviderStateMixin {
  TabController? _tabController;
  TabController? _tabController2;
  String trangThai = '';
  String time = '';
  BlocDVSC blocDVSC = BlocDVSC();

  int page = 1;
  BlocDVSC blocDVSC0 = BlocDVSC();
  BlocDVSC blocDVSC1 = BlocDVSC();
  BlocDVSC blocDVSC2 = BlocDVSC();
  BlocDVSC blocDVSC3 = BlocDVSC();
  BlocDVSC blocDVSC4 = BlocDVSC();
  BlocDVSC blocDVSC5 = BlocDVSC();
  BlocDVSC blocDVSC6 = BlocDVSC();
  BlocDVSC blocDVSC7 = BlocDVSC();
  int b = 0;
  TextEditingController NV = TextEditingController();
  String userID='';
  TextEditingController searchNV = TextEditingController();
  String thoigian = 'Tất cả';
  List<ModelLocal> thList = [
    ModelLocal(id: '', name: 'Tất cả'),
    ModelLocal(id: 'day', name: 'Ngày'),
    ModelLocal(id: 'week', name: 'Tuần'),
    ModelLocal(id: 'month', name: 'Tháng')
  ];
  BlocFullListNV blocFullListNV = BlocFullListNV();
  DateTime? TimeStart;
  TextEditingController search_cus = TextEditingController();
  String startTime = Const.formatTime(DateTime.now().millisecondsSinceEpoch,
      format: 'dd/MM/yyyy');
  String endTime = Const.formatTime(DateTime.now().millisecondsSinceEpoch,
      format: 'dd/MM/yyyy');
  @override
  void initState() {
    trangThai = '0';
    b = 0;
    blocDVSC.add(GetData());
    blocFullListNV.add(GetData());


    blocDVSC0.add(GetData(keySearch: ''));
    blocDVSC1.add(GetData(keySearch: '1'));
    blocDVSC2.add(GetData(keySearch: '2'));
    blocDVSC3.add(GetData(keySearch: '3'));
    blocDVSC4.add(GetData(keySearch: '4'));
    blocDVSC5.add(GetData(keySearch: '5'));
    blocDVSC6.add(GetData(keySearch: '6'));
    blocDVSC7.add(GetData(keySearch: '7'));



    _tabController = TabController(length: 8, vsync: this);
    _tabController2 = TabController(length: 4, vsync: this);

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
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(flex: 9,
                        child: InputText1(
                          controller: search_cus,
                          suffix: InkWell(
                            child: Icon(Icons.search_outlined),
                            onTap: () {
                              blocDVSC.add(GetData(
                                  keySearch: trangThai,
                                  search_cus: search_cus.text,
                                  search_time: time,
                                  page: page));

                              blocDVSC0.add(GetData(
                                  keySearch: '',
                                  search_cus: search_cus.text,
                                  search_time: time,
                                  page: page,
                                  search_user: userID));
                              blocDVSC1.add(GetData(
                                  keySearch: '1',
                                  search_cus: search_cus.text,
                                  search_time: time,
                                  page: page,
                                  search_user: userID));
                              blocDVSC2.add(GetData(
                                  keySearch: '2',
                                  search_cus: search_cus.text,
                                  search_time: time,
                                  page: page,
                                  search_user: userID));
                              blocDVSC3.add(GetData(
                                  keySearch: '3',
                                  search_cus: search_cus.text,
                                  search_time: time,
                                  page: page,
                                  search_user: userID));
                              blocDVSC4.add(GetData(
                                  keySearch: '4',
                                  search_cus: search_cus.text,
                                  search_time: time,
                                  page: page,
                                  search_user: userID));
                              blocDVSC5.add(GetData(
                                  keySearch: '5',
                                  search_cus: search_cus.text,
                                  search_time: time,
                                  page: page,
                                  search_user: userID));
                              blocDVSC6.add(GetData(
                                  keySearch: '6',
                                  search_cus: search_cus.text,
                                  search_time: time,
                                  page: page,
                                  search_user: userID));
                              blocDVSC7.add(GetData(
                                  keySearch: '7',
                                  search_cus: search_cus.text,
                                  search_time: time,
                                  page: page,
                                  search_user: userID));

                            },
                          ),
                          colorLabel: Color(0xffF3F3F3),
                          colorBg: Colors.white.withOpacity(0.4),
                          label: 'Tìm kiếm tên, số điện thoại',
                          hasLeading: false,
                          radius: 12,
                        ),
                      ),
                      Expanded(flex: 1,
                        child: InkWell(
                          child: Icon(
                            Icons.qr_code_scanner,
                            size: 30,
                          ),
                          onTap: () async {
                            var res = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const SimpleBarcodeScannerPage(),
                                ));
                            setState(() {
                              if (res is String) {
                                search_cus.text = res;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),

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
                    trangThai = value.toString();
                    setState(() {
                      page = 1;
                    });
                    blocDVSC.add(GetData(
                        keySearch: trangThai,
                        search_cus: search_cus.text,
                        search_time: time,
                        page: page,
                        search_user: userID));

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
                    color: ColorApp.orangeFF,
                  ),
                  tabs: <Widget>[
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text(
                              'Tất cả(${model.productAttrs!.total})',
                              style:
                                  StyleApp.textStyle700(color: ColorApp.blue00),
                            );
                          }
                          return Text('Tất cả');
                        },
                        bloc: blocDVSC0,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text(
                                'Đang xử lý(${model.productAttrs!.total})',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.blue8F));
                          }
                          return Text('Đang xử lý');
                        },
                        bloc: blocDVSC1,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text('Đã xử lý(${model.productAttrs!.total})',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.black));
                          }
                          return Text('Đã xử lý');
                        },
                        bloc: blocDVSC2,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text(
                                'Chờ linh kiện(${model.productAttrs!.total})',
                                style:
                                    StyleApp.textStyle700(color: ColorApp.red));
                          }
                          return Text('Chờ linh kiện');
                        },
                        bloc: blocDVSC3,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text(
                                'Không sửa được(${model.productAttrs!.total})',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.orangeF0));
                          }
                          return Text('Không sửa được');
                        },
                        bloc: blocDVSC4,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text(
                                'Máy nhà mua(${model.productAttrs!.total})',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.grey8B));
                          }
                          return Text('Máy nhà mua');
                        },
                        bloc: blocDVSC5,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text('Bảo hành(${model.productAttrs!.total})',
                                style:
                                    StyleApp.textStyle700(color: Colors.green));
                          }
                          return Text('Bảo hành');
                        },
                        bloc: blocDVSC6,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text(
                                'Hoàn thành(${model.productAttrs!.total})',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.blue00));
                          }
                          return Text('Hoàn thành');
                        },
                        bloc: blocDVSC7,
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   color: Color(0xffF3F3F3),
              //   child: TabBar(
              //     onTap: (value) {
              //       setState(() {
              //         page = 1;
              //       });
              //       switch (value) {
              //         case 0:
              //           // do something
              //           {
              //             time = '';
              //             blocDVSC.add(GetData(
              //                 keySearch: trangThai,
              //                 page: page,
              //                 search_cus: search_cus.text,
              //                 search_time: time));
              //           }
              //           break;
              //         case 1:
              //           {
              //             time = 'day';
              //             blocDVSC.add(GetData(
              //                 keySearch: trangThai,
              //                 page: page,
              //                 search_cus: search_cus.text,
              //                 search_time: time));
              //           }
              //           // do something
              //           break;
              //         case 2:
              //           {
              //             time = 'week';
              //             blocDVSC.add(GetData(
              //                 keySearch: trangThai,
              //                 page: page,
              //                 search_cus: search_cus.text,
              //                 search_time: time));
              //           }
              //           // do something
              //           break;
              //         case 3:
              //           {
              //             time = 'month';
              //             blocDVSC.add(GetData(
              //                 keySearch: trangThai,
              //                 page: page,
              //                 search_cus: search_cus.text,
              //                 search_time: time));
              //           }
              //           // do something
              //           break;
              //       }
              //     },
              //     isScrollable: true,
              //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              //     controller: _tabController2,
              //     indicatorColor: Colors.transparent,
              //     labelColor: Colors.black,
              //     unselectedLabelColor: Colors.grey,
              //     labelStyle: StyleApp.textStyle500(fontSize: 16),
              //     unselectedLabelStyle: StyleApp.textStyle500(
              //       fontSize: 16,
              //       color: Colors.black,
              //     ),
              //     indicator: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Colors.white,
              //     ),
              //     tabs: <Widget>[
              //       Tab(
              //         child: BlocBuilder(
              //           builder: (_, StateBloc state) {
              //             if (state is LoadSuccess) {
              //               ModelDVSC model = state.data;
              //               return Text('Tất cả');
              //             }
              //             return Text('Tất cả');
              //           },
              //           bloc: blocDVSC1,
              //         ),
              //       ),
              //       Tab(
              //         child: BlocBuilder(
              //           builder: (_, StateBloc state) {
              //             if (state is LoadSuccess) {
              //               ModelDVSC model = state.data;
              //               return Text('Ngày');
              //             }
              //             return Text('Ngày');
              //           },
              //           bloc: blocDVSC2,
              //         ),
              //       ),
              //       Tab(
              //         child: BlocBuilder(
              //           builder: (_, StateBloc state) {
              //             if (state is LoadSuccess) {
              //               ModelDVSC model = state.data;
              //               return Text('Tuần');
              //             }
              //             return Text('Tuần');
              //           },
              //           bloc: blocDVSC3,
              //         ),
              //       ),
              //       Tab(
              //         child: BlocBuilder(
              //           builder: (_, StateBloc state) {
              //             if (state is LoadSuccess) {
              //               ModelDVSC model = state.data;
              //               return Text('Tháng');
              //             }
              //             return Text('Tháng');
              //           },
              //           bloc: blocDVSC4,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Nhân viên'),SizedBox(height: 5,),
                      InputText1(
                        controller: NV,
                        readOnly: true,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Center(
                                        child: Text(
                                      'Chọn nhân viên',
                                      style: StyleApp.textStyle500(fontSize: 16),
                                    )),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10.0))),
                                    content: Container(
                                      height: MediaQuery.of(context).size.height * 0.55,
                                      width: MediaQuery.of(context).size.width * 0.9,
                                      child: SingleChildScrollView(
                                        child: BlocBuilder(
                                          builder: (_, StateBloc state) {
                                            if (state is LoadSuccess) {
                                              List<ModelListNV> list = state.data;
                                              return Column(
                                                children: [
                                                  InputText1(
                                                    controller: searchNV,
                                                    label: 'Tìm kiếm',
                                                    hasLeading: true,
                                                    suffix: InkWell(
                                                        onTap: () {
                                                          blocFullListNV.add(GetData(
                                                              keySearch:
                                                                  searchNV.text));
                                                        },
                                                        child: Icon(Icons.search)),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      NV.text = 'Tất cả';
                                                      userID='';
                                                      setState(() {
                                                        page = 1;
                                                      });
                                                      blocDVSC.add(GetData(
                                                          keySearch: trangThai,
                                                          page: page,
                                                          search_cus: search_cus.text,
                                                          search_time: time,
                                                          search_user: userID));

                                                      blocDVSC0.add(GetData(
                                                          keySearch: '',
                                                          page: page,
                                                          search_cus: search_cus.text,
                                                          search_time: time,
                                                          search_user: ''));
                                                      blocDVSC1.add(GetData(
                                                          keySearch: '1',
                                                          page: page,
                                                          search_cus: search_cus.text,
                                                          search_time: time,
                                                          search_user: ''));
                                                      blocDVSC2.add(GetData(
                                                          keySearch: '2',
                                                          page: page,
                                                          search_cus: search_cus.text,
                                                          search_time: time,
                                                          search_user: ''));
                                                      blocDVSC3.add(GetData(
                                                          keySearch: '3',
                                                          page: page,
                                                          search_cus: search_cus.text,
                                                          search_time: time,
                                                          search_user: ''));
                                                      blocDVSC4.add(GetData(
                                                          keySearch: '4',
                                                          page: page,
                                                          search_cus: search_cus.text,
                                                          search_time: time,
                                                          search_user: ''));
                                                      blocDVSC5.add(GetData(
                                                          keySearch: '5',
                                                          page: page,
                                                          search_cus: search_cus.text,
                                                          search_time: time,
                                                          search_user: ''));
                                                      blocDVSC6.add(GetData(
                                                          keySearch: '6',
                                                          page: page,
                                                          search_cus: search_cus.text,
                                                          search_time: time,
                                                          search_user: ''));
                                                      blocDVSC7.add(GetData(
                                                          keySearch: '7',
                                                          page: page,
                                                          search_cus: search_cus.text,
                                                          search_time: time,
                                                          search_user: ''));
                                                      Navigator.pop(context);
                                                    },
                                                    child: Card(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(12.0),
                                                        child: Text(
                                                          'Tất cả',
                                                          style:
                                                              StyleApp.textStyle500(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  ListView.builder(
                                                    itemBuilder: (context, index) {
                                                      return InkWell(
                                                        child: Card(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    12.0),
                                                            child: Text(
                                                              '${list[index].fullName} - ${list[index].phone}',
                                                              style: StyleApp
                                                                  .textStyle500(),
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          NV.text =
                                                              list[index].fullName ??
                                                                  '';
                                                          userID = list[index].id.toString();
                                                          setState(() {
                                                            page = 1;
                                                          });
                                                          blocDVSC.add(GetData(
                                                              keySearch: trangThai,
                                                              page: page,
                                                              search_cus:
                                                                  search_cus.text,
                                                              search_time: time,
                                                              search_user:
                                                                  userID.toString()));


                                                          blocDVSC0.add(GetData(
                                                              keySearch: '',
                                                              page: page,
                                                              search_cus:
                                                              search_cus.text,
                                                              search_time: time,
                                                              search_user:
                                                              userID.toString()));
                                                          blocDVSC1.add(GetData(
                                                              keySearch: '1',
                                                              page: page,
                                                              search_cus:
                                                              search_cus.text,
                                                              search_time: time,
                                                              search_user:
                                                              userID.toString()));
                                                          blocDVSC2.add(GetData(
                                                              keySearch: '2',
                                                              page: page,
                                                              search_cus:
                                                              search_cus.text,
                                                              search_time: time,
                                                              search_user:
                                                              userID.toString()));
                                                          blocDVSC3.add(GetData(
                                                              keySearch: '3',
                                                              page: page,
                                                              search_cus:
                                                              search_cus.text,
                                                              search_time: time,
                                                              search_user:
                                                              userID.toString()));
                                                          blocDVSC4.add(GetData(
                                                              keySearch: '4',
                                                              page: page,
                                                              search_cus:
                                                              search_cus.text,
                                                              search_time: time,
                                                              search_user:
                                                              userID.toString()));
                                                          blocDVSC5.add(GetData(
                                                              keySearch: '5',
                                                              page: page,
                                                              search_cus:
                                                              search_cus.text,
                                                              search_time: time,
                                                              search_user:
                                                              userID.toString()));
                                                          blocDVSC6.add(GetData(
                                                              keySearch: '6',
                                                              page: page,
                                                              search_cus:
                                                              search_cus.text,
                                                              search_time: time,
                                                              search_user:
                                                              userID.toString()));
                                                          blocDVSC7.add(GetData(
                                                              keySearch: '7',
                                                              page: page,
                                                              search_cus:
                                                              search_cus.text,
                                                              search_time: time,
                                                              search_user:
                                                              userID.toString()));
                                                          Navigator.pop(context);
                                                        },
                                                      );
                                                    },
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount: list.length,
                                                  ),
                                                ],
                                              );
                                            }
                                            return Container();
                                          },
                                          bloc: blocFullListNV,
                                        ),
                                      ),
                                    ),
                                  ));
                        },
                        width: 250,
                        borderColor: Colors.white,
                        label: 'Chọn nhân viên',
                        radius: 0,
                      ),
                    ],
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Thời gian'),SizedBox(height: 5,),
                      PopupMenuButton(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Text(thoigian),
                                  Icon(Icons.keyboard_arrow_down_rounded)
                                ],
                              ),
                            ),
                          ),
                          itemBuilder: (context) {
                            return List.generate(
                                thList.length,
                                    (index) => PopupMenuItem(
                                    value: index,
                                    onTap: () {
                                      setState(() {
                                        thoigian = '${thList[index].name}';
                                        page = 1;
                                      });
                                      time = '${thList[index].id}';
                                      blocDVSC.add(GetData(
                                          keySearch: trangThai,
                                          page: page,
                                          search_cus: search_cus.text,
                                          search_time: time,
                                          search_user: userID));


                                      blocDVSC0.add(GetData(
                                          keySearch: '',
                                          page: page,
                                          search_cus: search_cus.text,
                                          search_time: time,
                                          search_user: userID));
                                      blocDVSC1.add(GetData(
                                          keySearch: '1',
                                          page: page,
                                          search_cus: search_cus.text,
                                          search_time: time,
                                          search_user: userID));
                                      blocDVSC2.add(GetData(
                                          keySearch: '2',
                                          page: page,
                                          search_cus: search_cus.text,
                                          search_time: time,
                                          search_user: userID));
                                      blocDVSC3.add(GetData(
                                          keySearch: '3',
                                          page: page,
                                          search_cus: search_cus.text,
                                          search_time: time,
                                          search_user: userID));
                                      blocDVSC4.add(GetData(
                                          keySearch: '4',
                                          page: page,
                                          search_cus: search_cus.text,
                                          search_time: time,
                                          search_user: userID));
                                      blocDVSC5.add(GetData(
                                          keySearch: '5',
                                          page: page,
                                          search_cus: search_cus.text,
                                          search_time: time,
                                          search_user: userID));
                                      blocDVSC6.add(GetData(
                                          keySearch: '6',
                                          page: page,
                                          search_cus: search_cus.text,
                                          search_time: time,
                                          search_user: userID));
                                      blocDVSC7.add(GetData(
                                          keySearch: '7',
                                          page: page,
                                          search_cus: search_cus.text,
                                          search_time: time,
                                          search_user: userID));
                                    },
                                    child: Text('${thList[index].name}')));
                          }),
                    ],
                  ),
                ],
              ),
              BlocBuilder(
                builder: (_, StateBloc state) {
                  if (state is LoadSuccess) {
                    ModelDVSC model = state.data;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Trang'),
                              Text('${page}/'),
                              Text('${model.productAttrs!.lastPage}'),
                              page != 1
                                  ? InkWell(
                                      child: Icon(
                                        Icons.arrow_back_ios_outlined,
                                        color: Colors.red,
                                      ),
                                      onTap: () {
                                        page--;
                                        setState(() {});
                                        blocDVSC.add(GetData(
                                            keySearch: trangThai,
                                            page: page,
                                            search_cus: search_cus.text,
                                            search_time: time,
                                            search_user: userID.toString()));


                                      },
                                    )
                                  : Icon(Icons.arrow_back_ios_outlined,
                                      color: Colors.red.withOpacity(0.5)),
                              page != model.productAttrs!.lastPage
                                  ? InkWell(
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.red,
                                      ),
                                      onTap: () {
                                        page++;
                                        setState(() {});
                                        blocDVSC.add(GetData(
                                            keySearch: trangThai,
                                            page: page,
                                            search_cus: search_cus.text,
                                            search_time: time,
                                            search_user: userID));
                                      },
                                    )
                                  : Icon(Icons.arrow_forward_ios,
                                      color: Colors.red.withOpacity(0.5))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            itemBuilder: (context, index) {
                              Color color = ColorApp.black;
                              switch (model.productAttrs!.data![index].status) {
                                case 'Đang xử lý':
                                  {
                                    color = ColorApp.blue00;
                                  }
                                  break;
                                case 'Đã xử lý':
                                  {
                                    color = ColorApp.blue8F;
                                  }
                                  break;
                                case 'Chờ linh kiện':
                                  {
                                    color = ColorApp.black;
                                  }
                                  break;
                                case 'Không sửa được':
                                  {
                                    color = ColorApp.red;
                                  }
                                  break;
                                case 'Nhà Mua':
                                  {
                                    color = ColorApp.orangeF0;
                                  }
                                  break;
                                case 'Bảo Hành':
                                  {
                                    color = ColorApp.grey8B;
                                  }
                                  break;
                                case 'Hoàn thành':
                                  {
                                    color = Colors.green;
                                  }
                                  break;
                              }
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => InfoNhanMay(
                                                id: '${model.productAttrs!.data![index].id}',
                                              ))).then((value) => blocDVSC.add(
                                      GetData(
                                          keySearch: trangThai,
                                          page: page,
                                          search_user: userID,
                                          search_cus: search_cus.text,
                                          search_time: time)));
                                },
                                child: Card(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  color: ColorApp.whiteF0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          model.productAttrs!.data![index]
                                                  .customerName ??
                                              '',
                                          style: StyleApp.textStyle600(
                                              color: ColorApp.blue8F,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              model.productAttrs!.data![index]
                                                      .imei ??
                                                  '',
                                              style: StyleApp.textStyle600(
                                                  color: ColorApp.blue8F,
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              ' - ',
                                              style: StyleApp.textStyle600(
                                                  color: ColorApp.blue8F,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              child: ListView.builder(
                                                itemBuilder: (context, index1) {
                                                  return Text(
                                                    model
                                                            .productAttrs!
                                                            .data![index]
                                                            .productAttrMaterialAttr![
                                                                index1]
                                                            .code ??
                                                        '',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: false,
                                                    style:
                                                        StyleApp.textStyle600(
                                                            color: ColorApp
                                                                .redText,
                                                            fontSize: 12),
                                                  );
                                                },
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                padding: EdgeInsets.zero,
                                                itemCount: model
                                                    .productAttrs!
                                                    .data![index]
                                                    .productAttrMaterialAttr!
                                                    .length,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          model.productAttrs!.data![index]
                                                  .serial ??
                                              '',
                                          style: StyleApp.textStyle600(
                                              color: ColorApp.blue8F,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          model.productAttrs!.data![index]
                                                  .title ??
                                              '',
                                          style: StyleApp.textStyle600(
                                              color: ColorApp.blue8F,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          model.productAttrs!.data![index]
                                                  .note ??
                                              '',
                                          style: StyleApp.textStyle600(
                                              color: ColorApp.blue8F,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        // Text(model.productAttrs![index].userId![0].fullName??''),
                                        ...List.generate(
                                            model.productAttrs!.data![index]
                                                .userId!.length,
                                            (index1) => Text(model
                                                    .productAttrs!
                                                    .data![index]
                                                    .userId![index1]
                                                    .fullName ??
                                                '')),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: color,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 10),
                                            child: Text(
                                              model.productAttrs!.data![index]
                                                  .status
                                                  .toString(),
                                              style: StyleApp.textStyle600(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: model.productAttrs!.data!.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          ),
                        ],
                      ),
                    );
                  }
                  if (state is Loading) {
                    return Text('Đang load, đợi xíu..');
                  }
                  if (state is LoadFail) {
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text('Phiên đăng nhập đã hết, vui lòng đăng nhập lại'
                              ''),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage(
                                            index: 3,
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(border: Border.all()),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Đăng Nhập',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue00),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return SizedBox();
                },
                bloc: blocDVSC,
              )
            ],
          ),
        ));
  }
}
