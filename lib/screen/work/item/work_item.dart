import 'package:ChauAnh/screen/work/item/chonLinhKien.dart';
import 'package:ChauAnh/widget/item/button.dart';
import 'package:ChauAnh/widget/item/input/text_filed.dart';
import 'package:flutter/material.dart';

import '../../../style/init_style.dart';

class ItemWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      color: ColorApp.whiteF0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                'Nguyễn Văn Ba',
                style:
                    StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(onTap: (){

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChonLinhKien()));
              },
                child: Row(
                  children: [
                    Text(
                      'UA32K5500aKXXV ',
                      style: StyleApp.textStyle600(
                          color: ColorApp.blue8F, fontSize: 12),
                    ),
                    Text(
                      '- ',
                      style: StyleApp.textStyle600(
                          color: ColorApp.blue8F, fontSize: 12),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        'UA32K5500aKXXV515g41h51fg5jhfgj5gjhgjfjfgjg',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: StyleApp.textStyle600(
                            color: ColorApp.redText, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '01523NAHA73243289',
                style:
                    StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Mô tả......',
                style:
                    StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Text('Vũ Đức Huy'),
              SizedBox(
                height: 15,
              ),
              Text('Chờ linh kiện'),
            ],
          ),
          InkWell(
            child: Icon(
              Icons.edit_note_outlined,
              size: 35,
              color: Colors.green,
            ),
            onTap: () {
              showDialog(context: context, builder:(_) => AlertDialog( shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0))),
              content: Container(
                height:
                MediaQuery.of(context).size.height *
                    0.55,
                width: MediaQuery.of(context).size.width *
                    0.8,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Nhập mô tả',style: StyleApp.textStyle700(fontSize: 18,color: ColorApp.blue00),),

                    InputText1(label: 'Nhập mô tả',maxLine: 5,),

                    Center(child: Button1(colorButton: ColorApp.blue00, textColor: Colors.white, textButton: 'Lưu'),)
                  ],
                ),
              ),));
            },
          )
        ],
      ),
    );
  }
}
