import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ChauAnh/config/const.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:ChauAnh/config/share_pref.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import '../../model/model_local.dart';
import '../../style/init_style.dart';
import '../../widget/item/Dropdown1.dart';
import '../../widget/item/button.dart';
import '../../widget/item/input/text_filed.dart';
import 'add_baogia.dart';

class AddNhanMay extends StatefulWidget {
  @override
  State<AddNhanMay> createState() => _AddNhanMayState();
}

class _AddNhanMayState extends State<AddNhanMay> {
  String? kho;
  TextEditingController qrcode = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController gia = TextEditingController();
  String? trangthai;
  List<ModelSp> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo đơn'),
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
              Text(
                'Mã đơn hàng',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                borderColor: Colors.white,
                label: 'MĐH000000',
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
                'Ngày',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
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
                  InputText1(
                    width: 250,
                    borderColor: Colors.white,
                    label: 'Nhập khách hàng',
                    radius: 0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      ImagePath.bottomBarAdd,
                      width: 50,
                      height: 50,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
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
              // Text(
              //   'Số seri',
              //   style:
              //       StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     InputText1(
              //       controller: qrcode,
              //       width: 250,
              //       borderColor: Colors.white,
              //       label: 'Nhập số seri',
              //       radius: 0,
              //     ),
              //     InkWell(
              //       child: Icon(
              //         Icons.qr_code_scanner,
              //         size: 40,
              //       ),
              //       onTap: () async {
              //         var res = await Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) =>
              //                   const SimpleBarcodeScannerPage(),
              //             ));
              //         setState(() {
              //           if (res is String) {
              //             qrcode.text = res;
              //           }
              //         });
              //       },
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Divider(),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   'Model máy',
              //   style:
              //       StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // InputText1(
              //
              //   borderColor: Colors.white,
              //   label: 'Nhập model máy',
              //   radius: 0,
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Divider(),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   'Giá dự kiến',
              //   style:
              //       StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // InputText1(
              //   inputformater: [ThousandsSeparatorInputFormatter()],
              //   keyboardType: TextInputType.number,
              //   borderColor: Colors.white,
              //   label: 'Nhập giá',
              //   radius: 0,
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nhập thông tin sản phẩm',
                    style: StyleApp.textStyle500(
                        color: ColorApp.blue8F, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                content: Builder(
                                  builder: (context) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.55,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Số seri',
                                            style: StyleApp.textStyle500(
                                                color: ColorApp.blue8F,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InputText1(
                                                controller: qrcode,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
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
                                                },
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Model máy',
                                            style: StyleApp.textStyle500(
                                                color: ColorApp.blue8F,
                                                fontSize: 18),
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
                                            style: StyleApp.textStyle500(
                                                color: ColorApp.blue8F,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          InputText1(
                                            controller: gia,
                                            inputformater: [
                                              ThousandsSeparatorInputFormatter()
                                            ],
                                            keyboardType: TextInputType.number,
                                            borderColor: Colors.white,
                                            label: 'Nhập giá',
                                            radius: 0,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Button1(
                                              ontap: () {
                                                list.add(ModelSp(
                                                    model: model.text,
                                                    gia: gia.text,
                                                    seri: qrcode.text));
                                                setState(() {});
                                                print(list.length);
                                                model.clear();
                                                gia.clear();
                                                qrcode.clear();
                                              },
                                              colorButton: ColorApp.blue8F,
                                              textColor: Colors.white,
                                              textButton: 'Lưu')
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
              list.length == 0
                  ? SizedBox()
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Text(
                            list[index].model,
                            style: StyleApp.textStyle500(fontSize: 18),
                          ),
                          onTap: () {
                            model.text = list[index].model;
                            qrcode.text = list[index].model;
                            gia.text = list[index].gia;
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      content: Builder(
                                        builder: (context) {
                                          return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.55,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Số seri',
                                                  style: StyleApp.textStyle500(
                                                      color: ColorApp.blue8F,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InputText1(
                                                      controller: qrcode,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.5,
                                                      borderColor: Colors.white,
                                                      label: list[index].seri,
                                                      radius: 0,
                                                    ),
                                                    InkWell(
                                                      child: Icon(
                                                        Icons.qr_code_scanner,
                                                        size: 40,
                                                      ),
                                                      onTap: () async {
                                                        var res =
                                                            await Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
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
                                                  style: StyleApp.textStyle500(
                                                      color: ColorApp.blue8F,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                InputText1(
                                                  controller: model,
                                                  borderColor: Colors.white,
                                                  label: list[index].model,
                                                  radius: 0,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Giá dự kiến',
                                                  style: StyleApp.textStyle500(
                                                      color: ColorApp.blue8F,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                InputText1(
                                                  controller: gia,
                                                  inputformater: [
                                                    ThousandsSeparatorInputFormatter()
                                                  ],
                                                  keyboardType:
                                                      TextInputType.number,
                                                  borderColor: Colors.white,
                                                  label: list[index].gia,
                                                  radius: 0,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Button1(
                                                        ontap: () {
                                                          list[index].gia =
                                                              gia.text;
                                                          list[index].seri =
                                                              qrcode.text;
                                                          list[index].model =
                                                              model.text;
                                                          setState(() {});
                                                          print(list.length);
                                                          model.clear();
                                                          gia.clear();
                                                          qrcode.clear();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        colorButton:
                                                            ColorApp.blue8F,
                                                        textColor: Colors.white,
                                                        textButton: 'Lưu'),
                                                    Button1(
                                                      border: Border.all(color: ColorApp.blue8F),
                                                      colorButton: Colors.white,
                                                      textColor:
                                                          ColorApp.blue8F,
                                                      textButton: 'Xoá',
                                                      ontap: () {
                                                        list.removeAt(index);

                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ));
                          },
                        );
                      },
                      itemCount: list.length,
                      shrinkWrap: true,
                    ),
              SizedBox(
                height: 10,
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
              DropDown2(
                listItem: [
                  ModelLocal(id: "1", name: "Kho 1"),
                  ModelLocal(id: "0", name: "Kho 2"),
                  ModelLocal(id: "2", name: "Kho 3"),
                ],
                hint: 'Danh sách kho',
                onChanged: (value) {
                  kho = value.name;
                },
                value: kho,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
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
                borderColor: Colors.white,
                label: 'Nhập tình trạng',
                radius: 0,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              Text(
                'Nhân viên',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                borderColor: Colors.white,
                label: 'Nhập tên nhân viên',
                radius: 0,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              Text(
                'Diễn giải',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              InputText1(
                borderColor: Colors.white,
                label: 'Nhập diễn giải',
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
                'Trạng thái',
                style:
                    StyleApp.textStyle500(color: ColorApp.blue8F, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              DropDown2(
                listItem: [
                  ModelLocal(id: "0", name: "Đang xử lý"),
                  ModelLocal(id: "1", name: "Đã xử lý"),
                  ModelLocal(id: "2", name: "Chờ linh kiện"),
                  ModelLocal(id: "3", name: "Bảo hành"),
                  ModelLocal(id: "4", name: "Không sửa được"),
                  ModelLocal(id: "5", name: "Hoàn thành"),
                ],
                hint: 'Trạng thái',
                onChanged: (value) {
                  trangthai = value.name;
                },
                value: trangthai,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),

              Button1(
                colorButton: ColorApp.blue8F,
                textColor: ColorApp.whiteF7,
                textButton: 'Lưu',
                fontSize: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
