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
import '../../bloc/bloc/baoGia/bloc_bgSuaChua.dart';
import '../../bloc/bloc/congviec/bloc_dvsc.dart';
import '../../bloc/bloc/nhanMay/bloc__nhanMay.dart';
import '../../bloc/bloc/nhanMay/bloc_fullListKH.dart';
import '../../bloc/bloc/nhanMay/bloc_fullListKho.dart';
import '../../bloc/bloc/nhanMay/bloc_fullListNV.dart';
import '../../bloc/bloc/nhanMay/bloc_fullListPrd.dart';
import '../../bloc/event_bloc.dart';
import '../../bloc/state_bloc.dart';
import '../../model/model_dvsc.dart';
import '../../model/model_listNV.dart';
import '../../model/model_local.dart';
import '../../style/init_style.dart';
import '../../widget/item/Dropdown1.dart';
import '../../widget/item/button.dart';
import '../../widget/item/input/text_filed.dart';
import 'add_baogia.dart';

class ADD_BGSuaChua extends StatefulWidget {
  @override
  State<ADD_BGSuaChua> createState() => _ADD_BGSuaChuaState();
}

class _ADD_BGSuaChuaState extends State<ADD_BGSuaChua> {
  String? kho;
  TextEditingController qrcode = TextEditingController();
  TextEditingController serial = TextEditingController();
  TextEditingController gia = TextEditingController();
  TextEditingController giaNhap = TextEditingController();
  TextEditingController newNane = TextEditingController();
  TextEditingController newPhone = TextEditingController();
  TextEditingController newAddress = TextEditingController();
  String? trangthai;
  BlocFullListKH blocListKH = BlocFullListKH();

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
  BlocFullListNV blocFullListNV2 = BlocFullListNV();
  TextEditingController NV = TextEditingController();
  TextEditingController NVXuatKho = TextEditingController();
  TextEditingController soLuong = TextEditingController();
  TextEditingController date = TextEditingController();

  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();

  int? proID;
  int? proATRID;
  int? warehouseID;
  int? customerID;
  int? userID;
  int? userID_export;
  BlocbgSuaChua BlocBgSuaChua = BlocbgSuaChua();

  List<ProductAttrMaterialAttr> productAttrMaterialAttr = [];
  BlocDVSC blocDVSC = BlocDVSC();



  TextEditingController searchNVSC=TextEditingController();
  TextEditingController searchNVXK=TextEditingController();
  TextEditingController searchKho=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    blocListKH.add(GetData());
    blocFullListKho.add(GetData());
    blocFullListNV.add(GetData());
    blocFullListNV2.add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Tạo báo giá sửa chữa'),
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
              BlocListener(
                bloc: blocDVSC,
                listener: (_, StateBloc state) {
                  CheckLogState.check(context, state: state, isShowMsg: false,
                      success: () {
                    ModelDVSC model =
                        state is LoadSuccess ? state.data : ModelDVSC();
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Center(
                                  child: Text(
                                'Chọn mã hàng',
                                style: StyleApp.textStyle500(fontSize: 16),
                              )),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              content: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.55,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            '${model.productAttrs!.data![index].importDate} - ${model.productAttrs!.data![index].customerName} - ${model.productAttrs!.data![index].customerPhone} - Serial: ${model.productAttrs!.data![index].serial} - Imei: ${model.productAttrs!.data![index].imei}',
                                            style: StyleApp.textStyle500(),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                        proID=model.productAttrs!.data![index].productId;
                                        proATRID=model.productAttrs!.data![index].id;
                                        date.text = model.productAttrs!.data![index]
                                                .importDate ??
                                            '';
                                        customerID=model
                                            .productAttrs!.data![index].customerId;
                                        customCode=model
                                            .productAttrs!.data![index].customerCode;
                                        cusName.text = model
                                                .productAttrs!.data![index]
                                                .customerName ??
                                            '';
                                        cusAdd.text = model.productAttrs!.data![index]
                                                .customerAddress ??
                                            '';
                                        cusPhone.text = model
                                                .productAttrs!.data![index]
                                                .customerPhone ??
                                            '';
                                        qrcode.text =
                                            model.productAttrs!.data![index].imei ??
                                                '';
                                        serial.text =
                                            model.productAttrs!.data![index].serial ??
                                                '';
                                        gia.text = Const.ConvertPrice.format(
                                                int.parse(model
                                                        .productAttrs!.data![index]
                                                        .exportPrice ??
                                                    '0')) ??
                                            '';
                                        giaNhap.text =
                                            Const.ConvertPrice.format(int.parse(
                                                    model.productAttrs!.data![index]
                                                            .importPrice ??
                                                        '0')) ??
                                                '';

                                        soLuong.text = model
                                            .productAttrs!.data![index].amount
                                            .toString();
                                        note.text =
                                            model.productAttrs!.data![index].note ??
                                                '';
                                        title.text =
                                            model.productAttrs!.data![index].title ??
                                                '';
                                        userID = model
                                            .productAttrs!.data![index].userId![0].id;
                                        NV.text = model.productAttrs!.data![index]
                                                .userId![0].fullName ??
                                            '';
                                        khoName.text = model
                                                .productAttrs!.data![index]
                                                .warehouseId![0]
                                                .name ??
                                            '';
                                        warehouseID = model.productAttrs!.data![index]
                                            .warehouseId![0].id;
                                        typeInt =
                                            model.productAttrs!.data![index].typeId;
                                        if (typeInt == 1) {
                                          type.text = 'Hàng sửa chữa';
                                        } else if (typeInt == 2) {
                                          type.text = 'Hàng Nhập mới';
                                        }
                                      setState(() {
                                        productAttrMaterialAttr = model
                                            .productAttrs!.data![index]
                                            .productAttrMaterialAttr ??
                                            [];
                                      });
                                      },
                                    );
                                  },
                                  shrinkWrap: true,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  itemCount: model.productAttrs!.data!.length,
                                ),
                              ),
                            ));
                  });
                },
                child: InkWell(
                  onTap: () {
                    blocDVSC.add(GetData());
                  },
                  child: Container(
                    decoration: BoxDecoration(color: ColorApp.blue00),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Text(
                        'Chọn mã hàng',
                        style: StyleApp.textStyle500(
                            color: ColorApp.whiteF0, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Ngày',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                controller: date,
                colorBg: ColorApp.whiteF0,
                label: '',
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
              InputText1(
                controller: cusName,
                readOnly: true,
                colorBg: ColorApp.whiteF0,
                width: 250,
                borderColor: Colors.white,
                label: '',
                radius: 0,
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
                readOnly: true,
                colorBg: ColorApp.whiteF0,
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
                readOnly: true,
                colorBg: ColorApp.whiteF0,
                controller: cusPhone,
                keyboardType: TextInputType.phone,
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
                'Số seri',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                readOnly: true,
                colorBg: ColorApp.whiteF0,
                controller: qrcode,
                width: MediaQuery.of(context).size.width * 0.5,
                borderColor: Colors.white,
                label: '',
                radius: 0,
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
                readOnly: true,
                colorBg: ColorApp.whiteF0,
                controller: serial,
                borderColor: Colors.white,
                label: '',
                radius: 0,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Giá bán',
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
                label: '',
                radius: 0,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Giá nhập',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                controller: giaNhap,
                inputformater: [ThousandsSeparatorInputFormatter()],
                keyboardType: TextInputType.number,
                borderColor: Colors.white,
                label: '',
                radius: 0,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Số lượng',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                keyboardType: TextInputType.number,
                controller: soLuong,
                borderColor: Colors.white,
                label: 'Số lượng',
                radius: 0,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tình trạng',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                readOnly: true,
                colorBg: ColorApp.whiteF0,
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
                'Xuất tại kho ',
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
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Container(
                          height: MediaQuery.of(context).size.height *
                              0.55,
                          width:
                          MediaQuery.of(context).size.width * 0.9,
                          child: SingleChildScrollView(
                            child:BlocBuilder(builder: (_,StateBloc state){
                              if(state is LoadSuccess){
                                List<ModelListKho> list=state.data;
                                return  Column(
                                  children: [
                                    InputText1(
                                      controller: searchKho,
                                      label: 'Tìm kiếm',
                                      hasLeading: true,
                                      suffix: InkWell(
                                          onTap: () {
                                            blocFullListKho.add(GetData(
                                                keySearch:
                                                searchKho.text));
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
                            },bloc: blocFullListKho,),
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
                'Nhân viên Sửa chữa',
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
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Container(
                          height: MediaQuery.of(context).size.height *
                              0.55,
                          width:
                          MediaQuery.of(context).size.width * 0.9,
                          child: SingleChildScrollView(
                            child: BlocBuilder(builder: (_,StateBloc state){
                              if(state is LoadSuccess){
                                List<ModelListNV> list=state.data;
                                return Column(
                                  children: [
                                    InputText1(
                                      controller: searchNVSC,
                                      label: 'Tìm kiếm',
                                      hasLeading: true,
                                      suffix: InkWell(
                                          onTap: () {
                                            blocFullListNV.add(GetData(
                                                keySearch:
                                                searchNVSC.text));
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
                                              padding:
                                              const EdgeInsets.all(12.0),
                                              child: Text(
                                                '${list[index].fullName} - ${list[index].phone}',
                                                style: StyleApp.textStyle500(),
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            NV.text =
                                                list[index].fullName ?? '';
                                            userID = list[index].id;
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
                            },bloc: blocFullListNV,),
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
              Divider(),
              Text(
                'Nhân viên xuất kho',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                controller: NVXuatKho,
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
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Container(
                          height: MediaQuery.of(context).size.height *
                              0.55,
                          width:
                          MediaQuery.of(context).size.width * 0.9,
                          child: SingleChildScrollView(
                            child: BlocBuilder(builder: (_,StateBloc state){
                              if(state is LoadSuccess){
                                List<ModelListNV> list=state.data;
                                return Column(
                                  children: [
                                    ListView.builder(
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          child: Card(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(12.0),
                                              child: Text(
                                                '${list[index].fullName} - ${list[index].phone}',
                                                style: StyleApp.textStyle500(),
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            NVXuatKho.text =
                                                list[index].fullName ?? '';
                                            userID_export = list[index].id;
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                      shrinkWrap: true,
                                      physics: AlwaysScrollableScrollPhysics(),
                                      itemCount: list.length,
                                    ),
                                  ],
                                );
                              }
                              return Container();
                            },
                            bloc: blocFullListNV2,),
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
              Text(
                'Diễn giải',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                controller: note,
                borderColor: Colors.white,
                label: 'Nhập diễn giải',
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
                  return Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${productAttrMaterialAttr[index].code} - ${productAttrMaterialAttr[index]!.name}\nGía nhập : ${Const.ConvertPrice.format(int.parse('${productAttrMaterialAttr[index]!.importPrice}'))}  đ'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Số lượng : ${productAttrMaterialAttr[index].amount}')
                      ],
                    ),
                  );
                },
                itemCount: productAttrMaterialAttr.length,
                shrinkWrap: true,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              BlocListener(
                bloc: BlocBgSuaChua,
                listener: (_, StateBloc state) {
                  CheckLogState.check(context, state: state, msg: 'Thành công',
                      success: () {
                    Navigator.pop(context);
                  });
                },
                child: Button1(
                  ontap: () {
                    BlocBgSuaChua.add(BaoGiaSuaChua(
productId: proID,
                      productAttrId: proATRID,
                      imei: qrcode.text,
                      serial: serial.text,
                      title: title.text,
                      exportPrice: gia.text.replaceAll('.', ''),
                      importPrice: giaNhap.text.replaceAll('.', ''),
                      amount: soLuong.text,
                        importDate: date.text,
                      note: note.text,
                      userId: userID.toString(),
                      userExportId: userID_export,
                      customerId: customerID,
                      customerCode: customCode,
                      customerName: cusName.text,
                      customerPhone: cusPhone.text,
                      customerAddress: cusAdd.text,
                      warehouseId: warehouseID

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
