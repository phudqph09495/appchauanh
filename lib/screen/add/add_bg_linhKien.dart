import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import '../../bloc/bloc/KhachHang/bloc_addKH.dart';
import '../../bloc/bloc/add/bloc_dsLinhKien.dart';
import '../../bloc/bloc/baoGia/bloc_bgLinhKien.dart';
import '../../bloc/bloc/nhanMay/bloc_fullListKH.dart';
import '../../bloc/bloc/nhanMay/bloc_fullListKho.dart';
import '../../bloc/check_log_state.dart';
import '../../bloc/event_bloc.dart';
import '../../bloc/state_bloc.dart';
import '../../config/const.dart';
import '../../config/path/image_path.dart';
import '../../model/model_linhKien.dart';
import '../../model/model_listKH.dart';
import '../../model/model_listKho.dart';
import '../../style/init_style.dart';
import '../../widget/item/button.dart';
import '../../widget/item/input/text_filed.dart';
import 'add_baogia.dart';

class AddBGLinhKien extends StatefulWidget {
  const AddBGLinhKien({Key? key}) : super(key: key);

  @override
  State<AddBGLinhKien> createState() => _AddBGLinhKienState();
}

class _AddBGLinhKienState extends State<AddBGLinhKien> {
  TextEditingController newNane = TextEditingController();
  TextEditingController newPhone = TextEditingController();
  TextEditingController newAddress = TextEditingController();
  TextEditingController cusName = TextEditingController();
  TextEditingController cusPhone = TextEditingController();
  TextEditingController cusAdd = TextEditingController();
  BlocFullListKH blocListKH = BlocFullListKH();
  BlocADDKH blocADDKH = BlocADDKH();
  int? customerID;
  TextEditingController customCode = TextEditingController();
  TextEditingController search = TextEditingController();
  BlocFullListKho blocFullListKho = BlocFullListKho()..add(GetData());

  String khoName2 = 'Chọn kho';
  String khoID = '';
  BlocDsLinhKien blocDsLinhKien = BlocDsLinhKien();
  List<DanhSachLK> danhsachLK = [];
  BlocbgLK blocbgLK = BlocbgLK();
  TextEditingController searchKH=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blocListKH.add(GetData());
    blocDsLinhKien.add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Tạo báo giá linh kiện'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorApp.linearGradientBanner,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Khách hàng',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InputText1(
                      controller: cusName,
                      readOnly: true,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Center(
                                  child: Text(
                                    'Chọn khách hàng',
                                    style:
                                    StyleApp.textStyle500(fontSize: 16),
                                  )),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0))),
                              content: Container(
                                height:
                                MediaQuery.of(context).size.height *
                                    0.55,
                                width:
                                MediaQuery.of(context).size.width *
                                    0.9,
                                child: SingleChildScrollView(
                                  child:BlocBuilder(builder: (_,StateBloc state){
                                    if(state is LoadSuccess){
                                      List<Customer> list=state.data;
                                      return  Column(
                                        children: [
                                          InputText1(
                                            controller: searchKH,
                                            label: 'Tìm kiếm',
                                            hasLeading: true,
                                            suffix: InkWell(
                                                onTap: () {
                                                  blocListKH.add(GetData(
                                                      keySearch:
                                                      searchKH.text));
                                                },
                                                child:
                                                Icon(Icons.search)),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          ListView.builder(
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                child: Card(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        10.0),
                                                    child: Text(
                                                      '${list[index].fullName} - ${list[index].address} - ${list[index].phone}',
                                                      style:
                                                      StyleApp.textStyle500(),
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  cusName.text =
                                                      list[index].fullName ?? '';
                                                  customerID = list[index].id;
                                                  cusPhone.text =
                                                      list[index].phone ?? '';
                                                  cusAdd.text =
                                                      list[index].address ?? '';
                                                  customCode.text =
                                                      list[index].code ?? '';
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
                                  },bloc: blocListKH,)
                                ),
                              ),
                            ));
                      },
                      width: 250,
                      borderColor: Colors.white,
                      label: 'Chọn khách hàng',
                      radius: 0,
                    ),
                  ),
                  // InputText1(
                  //   onTap: (){},
                  //   width: 250,
                  //   borderColor: Colors.white,
                  //   label: 'Nhập khách hàng',
                  //   radius: 0,
                  // ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Center(
                                    child: Text(
                                  'Tạo khách hàng mới'.toUpperCase(),
                                  style: StyleApp.textStyle500(fontSize: 16),
                                )),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0))),
                                content: Builder(
                                  builder: (context) {
                                    return Container(
                                      height: MediaQuery.of(context).size.height *
                                          0.55,
                                      width:
                                          MediaQuery.of(context).size.width * 0.8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tên',
                                            style: StyleApp.textStyle500(
                                                color: ColorApp.blue8F,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          InputText1(
                                            controller: newNane,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            borderColor: Colors.white,
                                            label: 'Nhập tên KH',
                                            radius: 0,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Số điện thoại',
                                            style: StyleApp.textStyle500(
                                                color: ColorApp.blue8F,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          InputText1(
                                            keyboardType: TextInputType.phone,
                                            controller: newPhone,
                                            borderColor: Colors.white,
                                            label: 'Nhập sđt',
                                            radius: 0,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Địa chỉ',
                                            style: StyleApp.textStyle500(
                                                color: ColorApp.blue8F,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          InputText1(
                                            controller: newAddress,
                                            borderColor: Colors.white,
                                            label: 'Nhập địa chỉ',
                                            radius: 0,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          BlocListener(
                                            bloc: blocADDKH,
                                            listener: (_, StateBloc state) {
                                              Customer cus = state is LoadSuccess
                                                  ? state.data
                                                  : Customer();
                                              CheckLogState.check(context,
                                                  state: state,
                                                  msg:
                                                      'Thêm khách hàng thành công',
                                                  success: () {
                                                customerID = cus.id;
                                                cusName.text = cus.fullName ?? '';
                                                cusPhone.text = cus.phone ?? '';
                                                cusAdd.text = cus.address ?? '';
                                                customCode.text = cus.code ?? '';
                                                newNane.clear();
                                                newPhone.clear();
                                                newAddress.clear();

                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Button1(
                                                ontap: () {
                                                  blocADDKH.add(AddCustomer(
                                                      fullName: newNane.text,
                                                      phone: newPhone.text,
                                                      address: newAddress.text,
                                                      types: [1]));
                                                },
                                                colorButton: ColorApp.blue8F,
                                                textColor: Colors.white,
                                                textButton: 'Lưu'),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ));
                    },
                    child: Image.asset(
                      ImagePath.bottomBarAdd,
                      width: 50,
                      height: 50,
                    ),
                  )
                ],
              ),
              Divider(),
              Text(
                'Mã Khách hàng',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                readOnly: true,
                controller: customCode,
                borderColor: Colors.white,
                label: '',
                radius: 0,
              ),
              Divider(),
              Text(
                'Địa Chỉ',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                readOnly: true,
                controller: cusAdd,
                borderColor: Colors.white,
                label: '',
                radius: 0,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Số điện thoại',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                readOnly: true,
                controller: cusPhone,
                keyboardType: TextInputType.phone,
                borderColor: Colors.white,
                label: '',
                radius: 0,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Danh sách linh kiện',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  TextEditingController con = TextEditingController();
                  TextEditingController gia = TextEditingController();
                  gia.text =Const.ConvertPrice.format(int.parse(danhsachLK[index].price!.replaceAll('.', '')??'0'));
                  con.text = danhsachLK[index].soLuong.toString();
                  return Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                                '${danhsachLK[index].modelLinkKien!.code} - ${danhsachLK[index].modelLinkKien!.name}'),
                            Row(
                              children: [
                                Text('Giá bán: '),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 40,
                                    child: InputText1(
                                      inputformater: [
                                        ThousandsSeparatorInputFormatter()
                                      ],
                                      onChanged: (val){
                                        danhsachLK[index].price = val;
                                        print(val);
                                      },
                                      label: '',
                                      controller: gia,
                                      keyboardType: TextInputType.number,
                                    ))

                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: NumberInputPrefabbed.roundedButtons(
                            initialValue: danhsachLK[index].soLuong!,
                            incDecBgColor: ColorApp.blue00,
                            onChanged: (val) {
                              danhsachLK[index].soLuong = val.toInt();
                            },
                            onDecrement: (val) {
                              danhsachLK[index].soLuong = val.toInt();
                            },
                            onIncrement: (val) {
                              danhsachLK[index].soLuong = val.toInt();
                            },
                            onSubmitted: (val) {
                              FocusScope.of(context).unfocus();
                            },
                            scaleHeight: 0.7,
                            scaleWidth: 0.9,
                            controller: con,
                            min: 0,
                            max: danhsachLK[index].modelLinkKien!.amount!.toInt(),
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: danhsachLK.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        content: StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState1) {
                          return Container(
                            height:
                            MediaQuery.of(context).size.height * 0.75,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: SingleChildScrollView(
                              child: BlocBuilder(
                                builder: (_, StateBloc state) {
                                  if (state is LoadSuccess) {
                                    List<ModelLinkKien> list = state.data;
                                    return SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          InputText1(
                                            controller: search,
                                            label: 'Tìm kiếm',
                                            hasLeading: true,
                                            suffix: InkWell(
                                                onTap: () {
                                                  blocDsLinhKien.add(
                                                      GetData(
                                                          keySearch:
                                                          search.text,
                                                          id: khoID
                                                              .toString()));
                                                },
                                                child: Icon(Icons.search)),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          BlocBuilder(
                                            builder: (_, StateBloc state) {
                                              if (state is LoadSuccess) {
                                                List<ModelListKho> listKho =
                                                    state.data;
                                                listKho.add(ModelListKho(
                                                    name: 'Tất cả'));
                                                return PopupMenuButton(
                                                    child: Card(
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text(khoName2),
                                                            Icon(Icons
                                                                .keyboard_arrow_down_rounded)
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    itemBuilder: (context) {
                                                      return List.generate(
                                                          listKho.length,
                                                              (index) =>
                                                              PopupMenuItem(
                                                                  value:
                                                                  index,
                                                                  onTap:
                                                                      () {
                                                                    setState1(
                                                                            () {
                                                                          khoName2 =
                                                                          '${listKho[index].name}';
                                                                          listKho[index].id != null
                                                                              ? khoID = listKho[index].id.toString()
                                                                              : khoID = '';
                                                                        });
                                                                    blocDsLinhKien.add(GetData(
                                                                        keySearch:
                                                                        search.text,
                                                                        id: khoID.toString()));
                                                                  },
                                                                  child: Text(
                                                                      '${listKho[index].name}')));
                                                    });
                                              }
                                              return SizedBox();
                                            },
                                            bloc: blocFullListKho,
                                          ),
                                          ListView.builder(
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  if (list[index].amount! >
                                                      0) {
                                                    danhsachLK.add(
                                                        DanhSachLK(
                                                            modelLinkKien:
                                                            list[index],
                                                            soLuong: 0,price: list[index].salePrice));
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                        context)
                                                        .showSnackBar(SnackBar(
                                                        content: Text(
                                                            'Linh kiện đã hết')));
                                                  }

                                                  setState(() {});
                                                  Navigator.pop(context);
                                                },
                                                // child: Card(
                                                //     child: Padding(
                                                //   padding:
                                                //       const EdgeInsets.all(
                                                //           5.0),
                                                //   child: Column(
                                                //     crossAxisAlignment:
                                                //         CrossAxisAlignment
                                                //             .start,
                                                //     children: [
                                                //       Text(
                                                //         '${list[index].materialId!.code} - ${list[index].materialId!.name}',
                                                //         style: StyleApp
                                                //             .textStyle500(),
                                                //       ),
                                                //       SizedBox(
                                                //         height: 5,
                                                //       ),
                                                //       Text(
                                                //         'Đối tượng: ${list[index].customerName}',
                                                //         style: StyleApp
                                                //             .textStyle600(),
                                                //       ),
                                                //       SizedBox(
                                                //         height: 5,
                                                //       ),
                                                //       Text(
                                                //           'Giá nhập: ${NumberFormat("###,###.###", 'vi_VN').format(double.parse(list[index].importPrice ?? '0'))}đ',
                                                //           style: StyleApp
                                                //               .textStyle500()),
                                                //       SizedBox(
                                                //         height: 5,
                                                //       ),
                                                //       Text(
                                                //           'Giá bán: ${NumberFormat("###,###.###", 'vi_VN').format(double.parse(list[index].salePrice ?? '0'))}đ',
                                                //           style: StyleApp
                                                //               .textStyle500()),
                                                //       SizedBox(
                                                //         height: 5,
                                                //       ),
                                                //       Text(
                                                //           'Số lượng : ${list[index].amount}',
                                                //           style: StyleApp
                                                //               .textStyle500()),
                                                //       SizedBox(
                                                //         height: 5,
                                                //       ),
                                                //       Text(
                                                //           'Kho: ${list[index].warehouseId!.name} - ${list[index].warehouseId!.projectId!.name}',
                                                //           style: StyleApp
                                                //               .textStyle500()),
                                                //       SizedBox(
                                                //         height: 5,
                                                //       ),
                                                //       Text(
                                                //           'Ghi chú: ${list[index].note}',
                                                //           style: StyleApp
                                                //               .textStyle500())
                                                //     ],
                                                //   ),
                                                // )),
                                                child: Card(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.all(
                                                          5.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            ' ${list[index].materialId!.code} - ${list[index].materialId!.name}',
                                                            style: StyleApp
                                                                .textStyle500(),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),

                                                          list[index].amount! >
                                                              0
                                                              ? Text(
                                                            'Còn hàng',
                                                            style: StyleApp
                                                                .textStyle500(
                                                                color:
                                                                Colors.green),
                                                          )
                                                              : Text(
                                                            'Hết hàng',
                                                            style: StyleApp
                                                                .textStyle500(
                                                                color:
                                                                Colors.red),
                                                          ),
                                                          // Text(
                                                          //     'Số lượng : ${list[index].amount}',
                                                          //     style: StyleApp
                                                          //         .textStyle500()),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              'Kho: ${list[index].warehouseId!.name} - ${list[index].warehouseId!.projectId!.name}',
                                                              style: StyleApp
                                                                  .textStyle500()),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              );
                                            },
                                            shrinkWrap: true,
                                            itemCount: list.length,
                                            physics:
                                            NeverScrollableScrollPhysics(),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return SizedBox();
                                },
                                bloc: blocDsLinhKien,
                              ),
                            ),
                          );
                        }),
                      ));
                },
                child: Image.asset(
                  ImagePath.bottomBarAdd,
                  width: 50,
                  height: 50,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              BlocListener(
                bloc: blocbgLK,
                listener: (_, StateBloc state) {
                  CheckLogState.check(context, state: state, msg:state is LoadSuccess? state.data:'Thành công',
                      success: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
                },
                child: Button1(
                  ontap: () {
                    List<Mattrs> listM = [];
                    for (var item in danhsachLK) {
                      listM.add(Mattrs(
                          id: item.modelLinkKien!.id, amount: item.soLuong,salePrice: item.price!.replaceAll(".", "")));
                    }
                    blocbgLK.add(BaoGiaLK(
                      customerAddress: cusAdd.text,
                      customerPhone: cusPhone.text,
                      customerName: cusName.text,
                      customerId: customerID,
                      customerCode: customCode.text,
                      mattrs: listM
                    ));
                  },
                  colorButton: ColorApp.blue8F,
                  textColor: ColorApp.whiteF7,
                  textButton: 'Lưu',
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
