import 'package:ChauAnh/config/path/image_path.dart';
import 'package:flutter/material.dart';

import '../../../model/model_local.dart';
import '../../../style/init_style.dart';
import '../../../widget/item/Dropdown1.dart';
import '../../../widget/item/button.dart';
import '../../../widget/item/input/text_filed.dart';
import '../../../widget/item/load_image.dart';

class ChonLinhKien extends StatefulWidget {


  @override
  State<ChonLinhKien> createState() => _ChonLinhKienState();
}

class _ChonLinhKienState extends State<ChonLinhKien> {
  String? kho;

  List<ModelLink> multipleSelected = <ModelLink>[];
  List<ModelLink> checkListItems = [
    ModelLink(name: 'Màn hinh tv', id: '01', link: 'LcFDHDFHFDHDF', soLuong: 'Còn hàng'),
    ModelLink(name: 'Bo mach', id: '02', link: 'PFDHDFHIDFHDFHDF', soLuong: 'Hết hàng'),

  ];
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                InputText1(
                  colorLabel: const Color(0xffF3F3F3),
                  colorBg: Colors.white.withOpacity(0.4),
                  label: 'Tìm kiếm tên, số điện thoại',
                  hasLeading: true,
                  iconData: Icons.search,
                  radius: 12,
                )
              ],
            ),
          ),
        ),
      ),
   body:   SingleChildScrollView(
     child: Column(

       children: [
      ListView.builder(itemCount: checkListItems.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (context,index){
        return CheckboxListTile(

          checkboxShape: CircleBorder(),
          activeColor: Colors.green,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          dense: true,
          title:
          Row(
            children: [
              Text(
                checkListItems[index].name,
                style: StyleApp.textStyle500(),
              ),
              Text(' - '),
              Text(
                checkListItems[index].link,
                style: StyleApp.textStyle500(color: ColorApp.redText),
              ),   Text(' - '),
              Text(
                checkListItems[index].soLuong,
                style: StyleApp.textStyle500(color: ColorApp.redText),
              ),
            ],
          ),
          value:
          checkListItems[index].value,
          onChanged: (value) {
            setState(() {
              checkListItems[index].value = value;
              if (multipleSelected.contains(checkListItems[index])) {
                multipleSelected.remove(checkListItems[index]);
              } else {
                multipleSelected.add(checkListItems[index]);
              }
            });
          },
        );
      }),



       ],
     ),
   ),
      bottomSheet: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Button1(colorButton: ColorApp.blue00, textColor: Colors.white, textButton: 'Lưu',radius: 30,width: MediaQuery.of(context).size.width*0.4,),
          Button1(colorButton: Colors.white, textColor: ColorApp.blue00, textButton: 'Huỷ',border: Border.all(color: ColorApp.blue00),radius: 30,width: MediaQuery.of(context).size.width*0.4,),
        ],
      ),
    );
  }
}
