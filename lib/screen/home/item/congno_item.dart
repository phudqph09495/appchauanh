import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:ChauAnh/config/path/svg_path.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../style/init_style.dart';
import 'info_congno.dart';

class CongNoItem extends StatefulWidget {
  @override
  State<CongNoItem> createState() => _CongNoItemState();
}

class _CongNoItemState extends State<CongNoItem> {
  _launchURL(url) async {

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Lag rồi ............';
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Column(
        children: [
          Container(
            height: 116,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        ImagePath.logomau,
                        height: 70,
                        width: 70,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nguyễn Văn Bốn',
                            style: StyleApp.textStyle500(
                                fontSize: 16, color: ColorApp.blue8F),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: ()async{

                              _launchURL('tel:${0945678903}');

                            },                            child: Text(
                              '0945678903',
                              style: StyleApp.textStyle500(
                                  fontSize: 14, color: Color(0xff5A5F69)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '12 Khuất Duy Tiến',
                            style: StyleApp.textStyle500(
                                fontSize: 12, color: Color(0xffD72677)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '20.000.000đ',
                            style: StyleApp.textStyle500(
                                fontSize: 14, color: Color(0xff9EA1A5)),
                          ), SizedBox(
                            height: 5,
                          ),
                          Text(
                            '12/10/2022',
                            style: StyleApp.textStyle500(
                                fontSize: 12, color: Color(0xffD72677)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider()
              ],
            ),
          )
        ],
      ),
    );
  }
}
