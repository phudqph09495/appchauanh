import 'package:flutter/material.dart';

import '../../../style/init_style.dart';

class ItemTonKho extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Màn hình TV - ',
                    style: StyleApp.textStyle500(
                        color: ColorApp.blue8F, fontSize: 14),
                  ),
                  Text(
                    'LC3284239-3246',
                    style: StyleApp.textStyle500(
                        color: Color(0xffD10563), fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Số lượng - ',
                        style: StyleApp.textStyle500(
                            color: ColorApp.blue8F, fontSize: 14),
                      ),
                      Text(
                        '10',
                        style: StyleApp.textStyle500(
                            color: Color(0xffD10563), fontSize: 14),
                      ),
                    ],
                  ),
                  Text(
                    '1.500.000 vnđ',
                    style: StyleApp.textStyle500(
                        color: Color(0xffD10563), fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
