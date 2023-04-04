import 'package:flutter/material.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:ChauAnh/widget/item/load_image.dart';

import '../../style/init_style.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          ImagePath.logomau,
          width: 60,
          height: 60,
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorApp.linearGradientBanner,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    ClipOval(
                        child: LoadImage(
                      url:
                          'https://pbs.twimg.com/profile_images/1576047166275059713/8k-7wKr8_400x400.jpg',
                      height: 150,
                      width: 150,
                      fit: BoxFit.contain,
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Fei QinYuan',
                      style: StyleApp.textStyle700(fontSize: 22),
                    ),
                  ],
                ),
              ),SizedBox(height: 15,),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Phone Number',
                style:
                    StyleApp.textStyle600(fontSize: 18, color: ColorApp.blue8F),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '+845455 4546',
                style:
                    StyleApp.textStyle400(fontSize: 15, color: ColorApp.grey8B),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Email',
                style:
                StyleApp.textStyle600(fontSize: 18, color: ColorApp.blue8F),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'paige@compnay.com',
                style:
                StyleApp.textStyle400(fontSize: 15, color: ColorApp.grey8B),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Text(
                'Chức vụ',
                style:
                StyleApp.textStyle600(fontSize: 18, color: ColorApp.blue8F),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Kỹ thuật viên',
                style:
                StyleApp.textStyle400(fontSize: 15, color: ColorApp.grey8B),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Chí nhánh',
                style:
                StyleApp.textStyle600(fontSize: 18, color: ColorApp.blue8F),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '13 Khuất Duy Tiến',
                style:
                StyleApp.textStyle400(fontSize: 15, color: ColorApp.grey8B),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
