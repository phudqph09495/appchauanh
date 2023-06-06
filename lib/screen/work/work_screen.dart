import 'package:ChauAnh/bloc/event_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../bloc/bloc/congviec/bloc_dvsc.dart';
import '../../bloc/state_bloc.dart';
import '../../config/const.dart';
import '../../home.dart';
import '../../model/model_dvsc.dart';
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
  BlocDVSC blocDVSC1 = BlocDVSC();
  BlocDVSC blocDVSC2 = BlocDVSC();
  BlocDVSC blocDVSC3 = BlocDVSC();
  BlocDVSC blocDVSC4 = BlocDVSC();
  int b = 0;
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

    blocDVSC1.add(GetData(search_time: ''));
    blocDVSC2.add(GetData(search_time: 'day'));
    blocDVSC3.add(GetData(search_time: 'week'));
    blocDVSC4.add(GetData(search_time: 'month'));

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
                  InputText1(
                    controller: search_cus,
                    suffix: InkWell(
                      child: Icon(Icons.search_outlined),
                      onTap: () {
                        blocDVSC.add(GetData(
                            keySearch: trangThai,
                            search_cus: search_cus.text,
                            search_time: time,
                            page: page));
                        blocDVSC1.add(GetData(
                            search_time: '',
                            keySearch: trangThai,
                            search_cus: search_cus.text));
                        blocDVSC2.add(GetData(
                            search_time: 'day',
                            keySearch: trangThai,
                            search_cus: search_cus.text));

                        blocDVSC3.add(GetData(
                            search_time: 'week',
                            keySearch: trangThai,
                            search_cus: search_cus.text));

                        blocDVSC4.add(GetData(
                            search_time: 'month',
                            keySearch: trangThai,
                            search_cus: search_cus.text));
                      },
                    ),
                    colorLabel: Color(0xffF3F3F3),
                    colorBg: Colors.white.withOpacity(0.4),
                    label: 'Tìm kiếm tên, số điện thoại',
                    hasLeading: false,
                    radius: 12,
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
                    trangThai = value.toString();
                 setState(() {
                   page=1;
                 });
                    blocDVSC.add(GetData(
                        keySearch: trangThai,
                        search_cus: search_cus.text,
                        search_time: time,page: page));
                    blocDVSC1.add(GetData(
                        search_time: '',
                        keySearch: trangThai,
                        search_cus: search_cus.text));
                    blocDVSC2.add(GetData(
                        search_time: 'day',
                        keySearch: trangThai,
                        search_cus: search_cus.text));

                    blocDVSC3.add(GetData(
                        search_time: 'week',
                        keySearch: trangThai,
                        search_cus: search_cus.text));

                    blocDVSC4.add(GetData(
                        search_time: 'month',
                        keySearch: trangThai,
                        search_cus: search_cus.text));
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
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text('Tất cả(${model.total![0].total})');
                          }
                          return Text('Tất cả');
                        },
                        bloc: blocDVSC,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text(
                                'Đang xử lý(${model.total![0].dangXuLy})');
                          }
                          return Text('Đang xử lý');
                        },
                        bloc: blocDVSC,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text('Đã xử lý(${model.total![0].daXuLy})');
                          }
                          return Text('Đã xử lý');
                        },
                        bloc: blocDVSC,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text(
                                'Chờ linh kiện(${model.total![0].choLinhKien})');
                          }
                          return Text('Chờ linh kiện');
                        },
                        bloc: blocDVSC,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text(
                                'Không sửa được(${model.total![0].khongSuaDuoc})');
                          }
                          return Text('Không sửa được');
                        },
                        bloc: blocDVSC,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text(
                                'Máy nhà mua(${model.total![0].nhaMua})');
                          }
                          return Text('Máy nhà mua');
                        },
                        bloc: blocDVSC,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text('Bảo hành(${model.total![0].baoHanh})');
                          }
                          return Text('Bảo hành');
                        },
                        bloc: blocDVSC,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text(
                                'Hoàn thành(${model.total![0].hoanThanh})');
                          }
                          return Text('Hoàn thành');
                        },
                        bloc: blocDVSC,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xffF3F3F3),
                child: TabBar(
                  onTap: (value) {
                    setState(() {
                      page=1;
                    });
                    switch (value) {
                      case 0:
                        // do something
                        {
                          time = '';
                          blocDVSC.add(GetData(
                              keySearch: trangThai,
                              page: page,
                              search_cus: search_cus.text,
                              search_time: time));
                        }
                        break;
                      case 1:
                        {
                          time = 'day';
                          blocDVSC.add(GetData(
                              keySearch: trangThai,
                              page: page,
                              search_cus: search_cus.text,
                              search_time: time));
                        }
                        // do something
                        break;
                      case 2:
                        {
                          time = 'week';
                          blocDVSC.add(GetData(
                              keySearch: trangThai,
                              page: page,
                              search_cus: search_cus.text,
                              search_time: time));
                        }
                        // do something
                        break;
                      case 3:
                        {
                          time = 'month';
                          blocDVSC.add(GetData(
                              keySearch: trangThai,
                              page: page,
                              search_cus: search_cus.text,
                              search_time: time));
                        }
                        // do something
                        break;
                    }
                  },
                  isScrollable: true,
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
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text(
                                'Tất cả(${model.productAttrs!.total})');
                          }
                          return Text('Tất cả');
                        },
                        bloc: blocDVSC1,
                      ),
                    ),
                    Tab(
                      child: BlocBuilder(
                        builder: (_, StateBloc state) {
                          if (state is LoadSuccess) {
                            ModelDVSC model = state.data;
                            return Text(
                                'Ngày(${model.productAttrs!.total})');
                          }
                          return Text('Ngày');
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
                                'Tuần(${model.productAttrs!.total})');
                          }
                          return Text('Tuần');
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
                                'Tháng(${model.productAttrs!.total})');
                          }
                          return Text('Tháng');
                        },
                        bloc: blocDVSC4,
                      ),
                    ),
                  ],
                ),
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
                                      search_time: time));
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
                                      search_time: time));
                                },
                              )
                                  : Icon(Icons.arrow_forward_ios,
                                  color: Colors.red.withOpacity(0.5))
                            ],
                          ),
                          SizedBox(height: 10,),
                          ListView.builder(
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => InfoNhanMay(
                                                id: '${model.productAttrs!.data![index].id}',
                                              )));
                                },
                                child: Card(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  color: ColorApp.whiteF0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          model.productAttrs!.data![index]
                                                  .customerName ??
                                              '',
                                          style: StyleApp.textStyle600(
                                              color: ColorApp.blue8F, fontSize: 16),
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
                                                    overflow: TextOverflow.ellipsis,
                                                    softWrap: false,
                                                    style: StyleApp.textStyle600(
                                                        color: ColorApp.redText,
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
                                          model.productAttrs!.data![index].serial ??
                                              '',
                                          style: StyleApp.textStyle600(
                                              color: ColorApp.blue8F, fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          model.productAttrs!.data![index].title ??
                                              '',
                                          style: StyleApp.textStyle600(
                                              color: ColorApp.blue8F, fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          model.productAttrs!.data![index].note ??
                                              '',
                                          style: StyleApp.textStyle600(
                                              color: ColorApp.blue8F, fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        // Text(model.productAttrs![index].userId![0].fullName??''),
                                        ...List.generate(
                                            model.productAttrs!.data![index].userId!
                                                .length,
                                            (index1) => Text(model
                                                    .productAttrs!
                                                    .data![index]
                                                    .userId![index1]
                                                    .fullName ??
                                                '')),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(model.productAttrs!.data![index].status
                                            .toString()),
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
