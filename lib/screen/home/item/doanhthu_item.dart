import 'package:flutter/material.dart';

import '../../../style/init_style.dart';

class DoanhThuItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nguyễn Văn Ba',
                      style:
                      StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
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
                        Text(
                          'UA32K5500aKXXV',
                          style: StyleApp.textStyle600(
                              color: ColorApp.redText, fontSize: 12),
                        ),
                      ],
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
                      'Lorem ipsum dolor',
                      style:
                      StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 12),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Vũ Đức Huy'),

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Thu : 20.000.000đ',
                      style:
                      StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),


                    Text(
                      'Chi : 10.000.000đ',
                      style:
                      StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tổng : 10.000.000đ',
                      style:
                      StyleApp.textStyle600(color: ColorApp.redText, fontSize: 12),
                    ),


                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5,),
      ],
    );
  }
}
