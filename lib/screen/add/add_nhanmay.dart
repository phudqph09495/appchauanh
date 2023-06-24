import 'dart:io';
import 'package:ChauAnh/bloc/bloc/add/bloc_addLinkKien.dart';
import 'package:ChauAnh/bloc/bloc/add/event_bloc2.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:ChauAnh/bloc/check_log_state.dart';
import 'package:ChauAnh/model/model_linhKien.dart';
import 'package:ChauAnh/model/model_listKH.dart';
import 'package:ChauAnh/model/model_listKho.dart';
import 'package:ChauAnh/model/model_listPrd.dart';
import 'package:flutter/material.dart';
import 'package:ChauAnh/config/const.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:ChauAnh/config/share_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import '../../bloc/bloc/KhachHang/bloc_addKH.dart';
import '../../bloc/bloc/KhachHang/bloc_listKH.dart';
import '../../bloc/bloc/add/bloc_dsLinhKien.dart';
import '../../bloc/bloc/nhanMay/bloc__nhanMay.dart';
import '../../bloc/bloc/nhanMay/bloc_fullListKH.dart';
import '../../bloc/bloc/nhanMay/bloc_fullListKho.dart';
import '../../bloc/bloc/nhanMay/bloc_fullListNV.dart';
import '../../bloc/bloc/nhanMay/bloc_fullListPrd.dart';
import '../../bloc/event_bloc.dart';
import '../../bloc/state_bloc.dart';
import '../../model/model_listNV.dart';
import '../../model/model_local.dart';
import '../../style/init_style.dart';
import '../../widget/item/Dropdown1.dart';
import '../../widget/item/button.dart';
import '../../widget/item/custom_toast.dart';
import '../../widget/item/input/text_filed.dart';
import 'add_baogia.dart';

class AddNhanMay extends StatefulWidget {
  @override
  State<AddNhanMay> createState() => _AddNhanMayState();
}

class _AddNhanMayState extends State<AddNhanMay> {
  String? kho;

  String khoName2 = 'Chọn kho';
  String khoID = '';
  TextEditingController search = TextEditingController();

  TextEditingController qrcode = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController gia = TextEditingController();
  TextEditingController newNane = TextEditingController();
  TextEditingController newPhone = TextEditingController();
  TextEditingController newAddress = TextEditingController();
  String? trangthai;
  String? kh;
  BlocFullListKH blocListKH = BlocFullListKH();
  List<ModelSp> list = [];
  BlocADDKH blocADDKH = BlocADDKH();
  TextEditingController moneyBuy = TextEditingController();
  TextEditingController type = TextEditingController();
  int? typeInt;
  String? customCode;
  TextEditingController cusName = TextEditingController();
  TextEditingController cusPhone = TextEditingController();
  TextEditingController cusAdd = TextEditingController();
  BlocFullListPrd blocFullListPrd = BlocFullListPrd();
  TextEditingController proName = TextEditingController();
  BlocFullListKho blocFullListKho = BlocFullListKho();
  TextEditingController khoName = TextEditingController();
  BlocFullListNV blocFullListNV = BlocFullListNV();
  TextEditingController NV = TextEditingController();
  TextEditingController soLuong = TextEditingController();
  TextEditingController date = TextEditingController();

  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  BlocDsLinhKien blocDsLinhKien = BlocDsLinhKien();
  int? proID;
  int? warehouseID;
  int? customerID;
  int? userID;
  BlocNhanMay blocNhanMay = BlocNhanMay();
  int sum = 0;
  List<DanhSachLK> danhsachLK = [];

  List<ModelLocal> checkListItems = [
    ModelLocal(
      name: 'Khách thợ',
      id: '1',
    ),
    ModelLocal(
      name: 'Khách buôn',
      id: '2',
    ),
    ModelLocal(
      name: 'Khách dân',
      id: '3',
    ),
    ModelLocal(
      name: 'Nhà cung cấp',
      id: '4',
    ),
  ];

  TextEditingController searchKH = TextEditingController();
  TextEditingController searchNV = TextEditingController();
  TextEditingController searchKho = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date.text = Const.formatTime(DateTime.now().millisecondsSinceEpoch,
        format: 'yyyy-MM-dd  HH:mm:ss');
    blocListKH.add(GetData());
    blocFullListPrd.add(GetData2());
    blocFullListKho.add(GetData());
    blocFullListNV.add(GetData());
    blocDsLinhKien.add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Chi tiết nhận máy'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorApp.linearGradientBanner,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'Mã đơn hàng',
              //   style:
              //       StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // InputText1(
              //   borderColor: Colors.white,
              //   label: 'MĐH000000',
              //   radius: 0,
              //   readOnly: true,
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Divider(),
              // SizedBox(
              //   height: 10,
              // ),
              Text(
                'Ngày nhận máy',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                controller: date,
                onTap: () {
                  DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      locale: LocaleType.vi,
                      currentTime: DateTime.now(), onConfirm: (dateTime) {
                    setState(() {
                      date.text = Const.formatTime(
                          dateTime.millisecondsSinceEpoch,
                          format: 'yyyy-MM-dd  HH:mm:ss');
                    });
                  });
                },
                borderColor: Colors.white,
                label: Const.formatTime(DateTime.now().millisecondsSinceEpoch),
                radius: 0,
                readOnly: true,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
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
                            builder: (context) => AlertDialog(
                                  title: Center(
                                      child: Text(
                                    'Chọn khách hàng',
                                    style: StyleApp.textStyle500(fontSize: 16),
                                  )),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  content: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.55,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: SingleChildScrollView(
                                      child: BlocBuilder(
                                        builder: (_, StateBloc state) {
                                          if (state is LoadSuccess) {
                                            List<Customer> list = state.data;
                                            return Column(
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
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      child: Card(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Text(
                                                            '${list[index].fullName} - ${list[index].address} - ${list[index].phone}',
                                                            style: StyleApp
                                                                .textStyle500(),
                                                          ),
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        cusName.text =
                                                            list[index]
                                                                    .fullName ??
                                                                '';
                                                        customerID =
                                                            list[index].id;
                                                        cusPhone.text =
                                                            list[index].phone ??
                                                                '';
                                                        cusAdd.text =
                                                            list[index]
                                                                    .address ??
                                                                '';
                                                        customCode =
                                                            list[index].code;
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
                                        bloc: blocListKH,
                                      ),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                content: StatefulBuilder(
                                  builder: (context, StateSetter setState) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.75,
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      child: SingleChildScrollView(
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
                                            Text(
                                              'Nhóm khách hàng',
                                              style: StyleApp.textStyle700(
                                                  fontSize: 18,
                                                  color: ColorApp.blue00),
                                            ),
                                            GridView.builder(
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      mainAxisExtent: 50,
                                                      crossAxisCount: 2,
                                                      childAspectRatio: 4,
                                                      crossAxisSpacing: 0),
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return CheckboxListTile(
                                                  checkboxShape: CircleBorder(),
                                                  activeColor: Colors.green,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  dense: true,
                                                  title: Text(
                                                    checkListItems[index]
                                                            .name ??
                                                        '',
                                                    style:
                                                        StyleApp.textStyle500(),
                                                  ),
                                                  value: checkListItems[index]
                                                      .value,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      checkListItems[index]
                                                          .value = value;
                                                      // if (multipleSelected.contains(checkListItems[index])) {
                                                      //   multipleSelected.remove(checkListItems[index]);
                                                      // } else {
                                                      //   multipleSelected.add(checkListItems[index]);
                                                      // }
                                                    });
                                                  },
                                                );
                                              },
                                              itemCount: checkListItems.length,
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            BlocListener(
                                              bloc: blocADDKH,
                                              listener: (_, StateBloc state) {
                                                Customer cus =
                                                    state is LoadSuccess
                                                        ? state.data
                                                        : Customer();
                                                CheckLogState.check(context,
                                                    state: state,
                                                    msg:
                                                        'Thêm khách hàng thành công',
                                                    success: () {
                                                  customerID = cus.id;
                                                  cusName.text =
                                                      cus.fullName ?? '';
                                                  cusPhone.text =
                                                      cus.phone ?? '';
                                                  cusAdd.text =
                                                      cus.address ?? '';
                                                  customCode = cus.code;
                                                  newNane.clear();
                                                  newPhone.clear();
                                                  newAddress.clear();

                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: Button1(
                                                  ontap: () {
                                                    List<int> type = [];
                                                    for (var item
                                                        in checkListItems) {
                                                      if (item.value == true) {
                                                        type.add(int.parse(
                                                            '${item.id}'));
                                                      }
                                                    }
                                                    if (type.length > 0) {
                                                      blocADDKH.add(AddCustomer(
                                                          fullName:
                                                              newNane.text,
                                                          phone: newPhone.text,
                                                          address:
                                                              newAddress.text,
                                                          types: type));
                                                    } else if (type.length ==
                                                        0) {
                                                      CustomToast.showToast(
                                                          context: context,
                                                          msg:
                                                              'Hãy chọn nhóm khách hàng');
                                                    }
                                                  },
                                                  colorButton: ColorApp.blue8F,
                                                  textColor: Colors.white,
                                                  textButton: 'Lưu'),
                                            )
                                          ],
                                        ),
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
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),

              Text(
                'Địa Chỉ',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                controller: cusAdd,
                borderColor: Colors.white,
                label: 'Nhập địa chỉ',
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
                controller: cusPhone,
                keyboardType: TextInputType.phone,
                borderColor: Colors.white,
                label: 'Nhập số điện thoại',
                radius: 0,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mã hàng-tên hàng',
                    style: StyleApp.textStyle500(
                        color: ColorApp.blue8F, fontSize: 18),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),
              BlocBuilder(
                builder: (_, StateBloc state) {
                  if (state is LoadSuccess) {
                    List<ModelListPrd> list = state.data;
                    return InputText1(
                      controller: proName,
                      readOnly: true,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Center(
                                      child: Text(
                                    'Chọn mã hàng',
                                    style: StyleApp.textStyle500(fontSize: 16),
                                  )),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  content: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.55,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          child: Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Text(
                                                '${list[index].code} - ${list[index].name} ',
                                                style: StyleApp.textStyle500(),
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            proName.text =
                                                list[index].name ?? '';
                                            proID = list[index].id;
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                      shrinkWrap: true,
                                      physics: AlwaysScrollableScrollPhysics(),
                                      itemCount: list.length,
                                    ),
                                  ),
                                ));
                      },
                      width: 250,
                      borderColor: Colors.white,
                      label: 'Chọn sản phẩm',
                      radius: 0,
                    );
                  }
                  return SizedBox();
                },
                bloc: blocFullListPrd,
              ),
              SizedBox(
                height: 10,
              ),

              Text(
                'Số seri',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputText1(
                    controller: qrcode,
                    width: MediaQuery.of(context).size.width * 0.5,
                    borderColor: Colors.white,
                    label: 'Nhập số seri',
                    radius: 0,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.qr_code_scanner,
                      size: 40,
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
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Model máy',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                controller: model,
                borderColor: Colors.white,
                label: 'Nhập model máy',
                radius: 0,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Giá dự kiến',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                controller: gia,
                inputformater: [ThousandsSeparatorInputFormatter()],
                keyboardType: TextInputType.number,
                borderColor: Colors.white,
                label: 'Nhập giá',
                radius: 0,
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // Text(
              //   'Số lượng',
              //   style:
              //       StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // InputText1(
              //   keyboardType: TextInputType.number,
              //   controller: soLuong,
              //   borderColor: Colors.white,
              //   label: 'Số lượng',
              //   radius: 0,
              // ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tình trạng nhận máy',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                controller: title,
                borderColor: Colors.white,
                label: 'Nhập tình trạng',
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
                'Kho định ngầm ',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                controller: khoName,
                readOnly: true,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Center(
                                child: Text(
                              'Chọn kho định ngầm',
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
                                    if(state is LoadSuccess){
                                      List<ModelListKho>list=state.data;
                                      return Column(
                                        children: [
                                          InputText1(
                                            controller: searchKho,
                                            label: 'Tìm kiếm',
                                            hasLeading: true,
                                            suffix: InkWell(
                                                onTap: () {
                                                  blocFullListKho.add(GetData(keySearch: searchKho.text));
                                                },
                                                child: Icon(Icons.search)),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          ListView.builder(
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(12.0),
                                                    child: Text(
                                                      ' ${list[index].name} - ${list[index].address}',
                                                      style: StyleApp.textStyle500(),
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  khoName.text =
                                                      list[index].name ?? '';
                                                  warehouseID = list[index].id;
                                                  Navigator.pop(context);
                                                },
                                              );
                                            },
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemCount: list.length,
                                          ),
                                        ],
                                      );
                                    }
                                    return Container();
                                  },
                                  bloc: blocFullListKho,
                                ),
                              ),
                            ),
                          ));
                },
                width: 250,
                borderColor: Colors.white,
                label: 'Chọn kho định ngầm',
                radius: 0,
              ),
              SizedBox(
                height: 20,
              ),

              Divider(),
              Text(
                'Nhân viên sửa chữa',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
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
                                                  userID = list[index].id;
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
              SizedBox(
                height: 20,
              ),
              Divider(),
              Text(
                'Ghi chú',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                controller: note,
                borderColor: Colors.white,
                label: 'Nhập ghi chú',
                radius: 0,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              Text(
                'Giá TV nhà mua',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                inputformater: [ThousandsSeparatorInputFormatter()],
                keyboardType: TextInputType.number,
                controller: moneyBuy,
                borderColor: Colors.white,
                label: 'Nhập giá TV',
                radius: 0,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              Text(
                'Loại Nhập Kho',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                readOnly: true,
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.16,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                    onTap: () {
                                      type.text = 'Hàng sửa chữa';
                                      typeInt = 1;
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                        color: ColorApp.whiteF0,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            'Hàng sửa chữa',
                                            style: StyleApp.textStyle500(),
                                          ),
                                        ))),
                                InkWell(
                                    onTap: () {
                                      type.text = 'Hàng nhập mới';
                                      typeInt = 2;
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                        color: ColorApp.whiteF0,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text('Hàng nhập mới',
                                              style: StyleApp.textStyle500()),
                                        ))),
                              ],
                            ),
                          );
                        });
                      });
                },
                controller: type,
                borderColor: Colors.white,
                label: 'Chọn loại nhập kho',
                radius: 0,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
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
                  con.text = danhsachLK[index].soLuong.toString();
                  return Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                              '${danhsachLK[index].modelLinkKien!.code} - ${danhsachLK[index].modelLinkKien!.name}'),
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
                              setState(() {
                                sum = 0;

                                for (var item in danhsachLK) {
                                  sum += int.parse(
                                          '${item.modelLinkKien!.importPrice}') *
                                      item.soLuong!.toInt();
                                }
                              });
                            },
                            onDecrement: (val) {
                              danhsachLK[index].soLuong = val.toInt();
                              setState(() {
                                sum = 0;

                                for (var item in danhsachLK) {
                                  sum += int.parse(
                                          '${item.modelLinkKien!.importPrice}') *
                                      item.soLuong!.toInt();
                                }
                              });
                            },
                            onIncrement: (val) {
                              danhsachLK[index].soLuong = val.toInt();
                              setState(() {
                                sum = 0;

                                for (var item in danhsachLK) {
                                  sum += int.parse(
                                          '${item.modelLinkKien!.importPrice}') *
                                      item.soLuong!.toInt();
                                }
                              });
                            },
                            onSubmitted: (val) {
                              FocusScope.of(context).unfocus();
                            },
                            scaleHeight: 0.7,
                            scaleWidth: 0.9,
                            controller: con,
                            min: 0,
                            max: danhsachLK[index]
                                .modelLinkKien!
                                .amount!
                                .toInt(),
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: danhsachLK.length,
                shrinkWrap: true,
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
                                                                soLuong: 1));
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
              // Text('Giá nhập linh kiện'),
              // Text('${Const.ConvertPrice.format(sum)} đ'),
              SizedBox(
                height: 20,
              ),
              Divider(),
              BlocListener(
                bloc: blocNhanMay,
                listener: (_, StateBloc state) {
                  CheckLogState.check(context, state: state, msg: 'Thành công',
                      success: () {
                    Navigator.pop(context);
                  });
                },
                child: Button1(
                  ontap: () {
                    sum = 0;
                    List<MaterialAttribute> listM = [];
                    for (var item in danhsachLK) {
                      listM.add(MaterialAttribute(
                          id: item.modelLinkKien!.id, amount: item.soLuong));
                      sum += int.parse('${item.modelLinkKien!.importPrice}') *
                          item.soLuong!.toInt();
                    }

                    blocNhanMay.add(CreateRepairOrder(
                        productId: proID,
                        importPrice: sum.toString(),
                        moneyBuy: moneyBuy.text.replaceAll(".", ""),
                        customerCode: customCode,
                        type: typeInt,
                        warehouseId: warehouseID,
                        customerId: customerID,
                        customerName: cusName.text,
                        customerPhone: cusPhone.text,
                        customerAddress: cusAdd.text,
                        userId: userID,
                        model: model.text,
                        serial: qrcode.text,
                        title: title.text,
                        materialAttribute: listM,
                        exportPrice: gia.text.replaceAll(".", ""),
                        amount: '1',
                        importDate: date.text,
                        note: note.text));
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
