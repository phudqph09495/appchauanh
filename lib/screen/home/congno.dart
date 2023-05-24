import 'package:ChauAnh/bloc/event_bloc.dart';
import 'package:ChauAnh/model/model_ListcongNo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bloc/bloc/congNo/bloc_ListCongNo.dart';
import '../../bloc/state_bloc.dart';
import '../../config/const.dart';
import '../../config/path/image_path.dart';
import '../../home.dart';
import '../../style/init_style.dart';
import '../../widget/item/input/text_filed.dart';
import '../../widget/item/load_image.dart';
import 'item/congno_item.dart';
import 'item/info_congno.dart';

class CongNoScreen extends StatefulWidget {
  @override
  State<CongNoScreen> createState() => _CongNoScreenState();
}

class _CongNoScreenState extends State<CongNoScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Lag rồi ............';
    }
  }

  String a = '';

  Bloc_ListCongNo bloc_listCongNo = Bloc_ListCongNo();
  TextEditingController qrcode = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    bloc_listCongNo.add(GetData());
    a = '0';
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
                    Expanded(
                      flex: 9,
                      child: InputText1(
                        controller: qrcode,
                        suffix: InkWell(
                          child: Icon(Icons.search_outlined),
                          onTap: () {
                            bloc_listCongNo.add(GetData(param: qrcode.text));
                          },
                        ),
                        colorLabel: Color(0xffF3F3F3),
                        colorBg: Colors.white.withOpacity(0.4),
                        label: 'Tìm kiếm tên, số điện thoại',
                        hasLeading: false,
                        radius: 12,
                      ),
                    ),
                    Expanded(
                      flex: 1,
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
                                qrcode.text = res;
                              }
                            });
                          }),
                    )
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
            BlocBuilder(
              builder: (_, StateBloc state) {
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
                if (state is Loading) {
                  return Text('Đang Load, đợi xíu...');
                }
                if (state is LoadSuccess) {
                  ModelListCongNo model = state.data;
                  int sum = 0;
                  for (var item in model.customerDebt!) {
                    sum += item.totalDebtPrice!;
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Tổng số người nợ',
                                    style: StyleApp.textStyle600(
                                        color: ColorApp.blue8F, fontSize: 16)),
                                Text('${model.customerDebt!.length}',
                                    style: StyleApp.textStyle600(
                                        color: ColorApp.redText, fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Tổng số tiền nợ',
                                    style: StyleApp.textStyle600(
                                        color: ColorApp.blue8F, fontSize: 16)),
                                Text('${Const.ConvertPrice.format(sum)} đ',
                                    style: StyleApp.textStyle600(
                                        color: ColorApp.redText, fontSize: 16))
                              ],
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InFoCongNo(
                                            id: model.customerDebt![index].id
                                                .toString(),
                                        tenKH: '${model.customerDebt![index].fullName} - ${model.customerDebt![index].address}',
                                          )));
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            ImagePath.logomau,
                                            height: 70,
                                            width: 70,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${model.customerDebt![index].fullName}',
                                                style: StyleApp.textStyle500(
                                                    fontSize: 16,
                                                    color: ColorApp.blue8F),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  _launchURL(
                                                      'tel:${model.customerDebt![index].phone}');
                                                },
                                                child: Text(
                                                  '${model.customerDebt![index].phone}',
                                                  style: StyleApp.textStyle500(
                                                      fontSize: 14,
                                                      color: Color(0xff5A5F69)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                child: Text(
                                                  model.customerDebt![index]
                                                              .address !=
                                                          null
                                                      ? '${model.customerDebt![index].address}'
                                                      : '',
                                                  style: StyleApp.textStyle500(
                                                      fontSize: 12,
                                                      color: Color(0xffD72677)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            '${Const.ConvertPrice.format(model.customerDebt![index].totalDebtPrice)} đ',
                                            style: StyleApp.textStyle500(
                                                fontSize: 14,
                                                color: Color(0xff9EA1A5)),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${Const.convertDateFormat('${model.customerDebt![index].createdAt}')}',
                                            style: StyleApp.textStyle500(
                                                fontSize: 12,
                                                color: Color(0xffD72677)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Divider()
                              ],
                            ),
                          );
                        },
                        itemCount: model.customerDebt!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  );
                }
                return SizedBox();
              },
              bloc: bloc_listCongNo,
            ),
          ],
        ),
      ),
    );
  }
}
