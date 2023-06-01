import 'package:ChauAnh/bloc/bloc/baoGia/bloc_listBG.dart';
import 'package:ChauAnh/bloc/event_bloc.dart';
import 'package:ChauAnh/model/model_listBG.dart';
import 'package:ChauAnh/widget/item/input/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/baoGia/bloc_detaiBG.dart';
import '../../bloc/check_log_state.dart';
import '../../bloc/state_bloc.dart';
import '../../config/const.dart';
import '../../model/model_detailBG.dart';
import '../../style/init_style.dart';
import 'info/info_baogia.dart';

class DanhSachBaoGia extends StatefulWidget {
  @override
  State<DanhSachBaoGia> createState() => _DanhSachBaoGiaState();
}

class _DanhSachBaoGiaState extends State<DanhSachBaoGia>
    with SingleTickerProviderStateMixin {
  BlocListBG blocListBG = BlocListBG()..add(GetData());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteF0,
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF7,
        centerTitle: true,
        title: Text(
          'Danh sách báo giá',
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
      body: BlocBuilder(
        builder: (_, StateBloc state) {
          if (state is LoadSuccess) {
            ModelListBaoGia modelListBaoGia = state.data;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        isScrollable: true,
                        labelStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                        indicatorColor: ColorApp.red,
                        unselectedLabelStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        labelColor: ColorApp.red,
                        unselectedLabelColor: ColorApp.black49,
                        tabs: [
                          Tab(text: 'Báo giá sửa chữa'),
                          Tab(text: 'Báo giá  linh kiện'),
                        ],
                      ),
                      Expanded(
                          child: TabBarView(children: <Widget>[
                        ListView.builder(
                          itemBuilder: (context, index) {
                            BlocDetailBG blocDetailBg = BlocDetailBG();
                            return BlocListener(
                              listener: (_, StateBloc state) {
                                CheckLogState.check(context,
                                    state: state,
                                    isShowMsg: false, success: () {
                                  ModelDetailBG modelDetail =
                                      state is LoadSuccess
                                          ? state.data
                                          : ModelDetailBG();
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          actions: [
                                            TextButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Quay lại'),
                                            ),
                                          ],
                                          insetPadding: EdgeInsets.all(10),
                                          content: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.8,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            child: SingleChildScrollView(
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Table(
                                                    columnWidths: {
                                                      0: FlexColumnWidth(1),
                                                      1: FlexColumnWidth(1),
                                                    },
                                                    children: [
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Mã Khách hàng')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  '${modelDetail.customerCode}')
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Tên Khách hàng: ')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  '${modelDetail.customerName}')
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Số điện thoại :')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  '${modelDetail.customerPhone}')
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Địa chỉ :')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  '${modelDetail.customerAddress}')
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Loại nhập kho :')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  modelDetail.type==1?  'Hàng sửa chữa':'Hàng nhập mới')
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'NV sửa chữa :')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  '${modelDetail.userId![0].name}')
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Ngày nhập kho :')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  '${modelDetail.importDate}')
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Model :')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  '${modelDetail.imei}')
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Serial :')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  '${modelDetail.serial}')
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Tình trạng :')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  '${modelDetail.title}')
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Giá nhập TV nhà mua :')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  '${Const.ConvertPrice.format(int.parse('${modelDetail.moneyBuy}'))} đ')
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Giá nhập linh kiện :')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  '${Const.ConvertPrice.format(int.parse('${modelDetail.importPrice}'))} đ')
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Giá bán :')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  '${Const.ConvertPrice.format(int.parse('${modelDetail.exportPrice}'))} đ')
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Số lượng :')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  '${modelDetail.amount}')
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              )
                                                            ]),
                                                      ]),
                                                      TableRow(children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Ghi chú :')
                                                            ]),
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  '${modelDetail.note}')
                                                            ]),
                                                      ]),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    'Thông tin linh kiện',
                                                    style:
                                                        StyleApp.textStyle500(),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  ListView.builder(
                                                    itemBuilder:
                                                        (context, index1) {
                                                      return Card(
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                '${modelDetail.orderDetails![index1].code} - ${modelDetail.orderDetails![index1]!.name}\nGía nhập : ${Const.ConvertPrice.format(int.parse('${modelDetail.orderDetails![index1]!.importPrice}'))}  đ'),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                                'Số lượng : ${modelDetail.orderDetails![index1].amount}')
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                    shrinkWrap: true,
                                                    itemCount: modelDetail
                                                        .orderDetails!.length,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                });
                              },
                              bloc: blocDetailBg,
                              child: InkWell(
                                onTap: () {
                                  blocDetailBg.add(GetData(
                                      param: modelListBaoGia
                                          .productAttrQuoteOrders![index].id
                                          .toString()));
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Table(
                                      columnWidths: {
                                        0: FlexColumnWidth(1),
                                        1: FlexColumnWidth(2),
                                      },
                                      children: [
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [Text('Ngày báo giá')]),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${modelListBaoGia.productAttrQuoteOrders![index].importDate}')
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [Text('Đối tượng : ')]),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${modelListBaoGia.productAttrQuoteOrders![index].customerName}')
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [Text('Model :')]),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${modelListBaoGia.productAttrQuoteOrders![index].imei}')
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [Text('Serial :')]),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${modelListBaoGia.productAttrQuoteOrders![index].serial}')
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [Text('Diễn giải :')]),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${modelListBaoGia.productAttrQuoteOrders![index].title}')
                                              ]),
                                        ]),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          shrinkWrap: true,
                          itemCount:
                              modelListBaoGia.productAttrQuoteOrders!.length,
                          physics: AlwaysScrollableScrollPhysics(),
                        ),
                        ListView.builder(
                          itemBuilder: (context, index) {
                          BlocDetailBG blocDetaiBG=BlocDetailBG();
                          blocDetaiBG.add(GetData(param: modelListBaoGia.materialAttrQuoteOrders![index].id.toString()));
                          return BlocBuilder(builder: (_,StateBloc state1){
                            if(state1 is LoadSuccess){
                              ModelDetailBG modelDetail=state1.data;
                              return InkWell(
                                onTap: () {
                                  showDialog(context: context, builder: (context){
                                    return AlertDialog(
                                      insetPadding: EdgeInsets.all(10),
                                      content: Container(
                                        height: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.6,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.9,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Table(
                                                columnWidths: {
                                                  0: FlexColumnWidth(1),
                                                  1: FlexColumnWidth(1),
                                                },
                                                children: [
                                                  TableRow(children: [
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [Text('#')]),
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                              '${modelDetail.id}')
                                                        ]),
                                                  ]),
                                                  TableRow(children: [
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                          )
                                                        ]),
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                          )
                                                        ]),
                                                  ]),
                                                  TableRow(children: [
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [Text('Mã khách hàng')]),
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                              '${Const.convertTime('${modelDetail.createdAt}')}')
                                                        ]),
                                                  ]),
                                                  TableRow(children: [
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                          )
                                                        ]),
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                          )
                                                        ]),
                                                  ]),
                                                  TableRow(children: [
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [Text('Tên Khách Hàng : ')]),
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                              '${modelDetail.customerName}')
                                                        ]),
                                                  ]),
                                                  TableRow(children: [
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                          )
                                                        ]),
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                          )
                                                        ]),
                                                  ]),
                                                  TableRow(children: [
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [Text('Số điện thoại :')]),
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                              '${modelDetail.customerPhone}')
                                                        ]),
                                                  ]),
                                                  TableRow(children: [
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                          )
                                                        ]),
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                          )
                                                        ]),
                                                  ]),
                                                  TableRow(children: [
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [Text('Địa chỉ :')]),
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                              '${modelDetail.customerAddress}')                                                        ]),
                                                  ]),
                                                  TableRow(children: [
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            height: 5,
                                                          )
                                                        ]),
                                                    Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            height: 5,
                                                          )
                                                        ]),
                                                  ]),

                                                ],
                                              ),
                                              SizedBox(height: 15,),
                                              Text('Thông tin vật tư hàng hoá'),
                                              SizedBox(height: 15,),
                                              ListView.builder(
                                                itemBuilder:
                                                    (context, index1) {
                                                  return Card(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                            '${modelDetail.orderDetails![index1].code} - ${modelDetail.orderDetails![index1]!.name}\nGía nhập : ${Const.ConvertPrice.format(int.parse('${modelDetail.orderDetails![index1]!.importPrice}'))}  đ'),
                                                        SizedBox(
                                                        height: 5,
                                                        ),
                                                        Text(
                                                            'Số lượng : ${modelDetail.orderDetails![index1].amount}')
                                                      ],
                                                    ),
                                                  );
                                                },
                                                shrinkWrap: true,
                                                itemCount: modelDetail
                                                    .orderDetails!.length,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                         onPressed: (){
                                           Navigator.pop(context);
                                         },
                                          child: const Text('Quay lại'),
                                        ),
                                      ],
                                    );
                                  });
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Table(
                                      columnWidths: {
                                        0: FlexColumnWidth(1),
                                        1: FlexColumnWidth(2),
                                      },
                                      children: [
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [Text('#')]),
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${modelDetail.id}')
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [Text('Ngày báo giá')]),
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${Const.convertTime('${modelDetail.createdAt}')}')
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [Text('Đối tượng : ')]),
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${modelDetail.customerName}')
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [Text('Model :')]),
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                          ...List.generate(modelDetail.orderDetails!.length, (index0) => Text(modelDetail.orderDetails![index0].code??''))
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [Text('Serial :')]),
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                ...List.generate(modelDetail.orderDetails!.length, (index0) => Text(modelDetail.orderDetails![index0].name??''))
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ]),
                                        ]),
                                        TableRow(children: [
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [Text('Diễn giải :')]),
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${modelDetail.title}')
                                              ]),
                                        ]),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                            return SizedBox();
                          },bloc: blocDetaiBG,);
                          },
                          shrinkWrap: true,
                          itemCount:
                              modelListBaoGia.materialAttrQuoteOrders!.length,
                          physics: AlwaysScrollableScrollPhysics(),
                        ),
                      ]))
                    ],
                  )),
            );
          }
          return SizedBox();
        },
        bloc: blocListBG,
      ),
    );
  }
}
