import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:ChauAnh/config/path/svg_path.dart';

import '../../../style/init_style.dart';
import '../../home/item/info_congno.dart';


class NotifyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          'Nguyễn Văn Bốn',
                          style: StyleApp.textStyle500(
                              fontSize: 16, color: ColorApp.blue8F),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '0945678903',
                          style: StyleApp.textStyle500(
                              fontSize: 14, color: Color(0xff5A5F69)),
                        ),
                        SizedBox(
                          height:10,
                        ),
                        Text(
                          'Màn hình SamSung',
                          style: StyleApp.textStyle500(
                              fontSize: 12,color: Color(0xff5A5F69)),
                        )
                      ],
                    ),
                    Text(
                      '1 giờ trước',
                      style: StyleApp.textStyle500(
                          fontSize: 14, color: Color(0xff9EA1A5)),
                    ),
                  ],
                ),
              ),
              Divider()
            ],
          )
        ],
      ),
    );
  }
}
