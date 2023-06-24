import 'package:flutter/material.dart';

import '../../../config/path/image_path.dart';
import '../../../model/model_local.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemKhachHang extends StatelessWidget {

  _launchURL(url) async {

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Lag rồi ............';
    }
  }
 String name;
 String phone;
 String id;
 ItemKhachHang(this.name,this.phone,this.id);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Row(

          children: [
            Expanded(flex: 1,child: Image.asset(ImagePath.notebook)),
            Expanded(flex: 1,child: SizedBox()),
            Expanded(flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  SizedBox(height: 5,),
                  Text(id)
                ],
              ),
            ),
            Expanded(flex: 3,
              child: InkWell(onTap: ()async{

                  _launchURL('tel:${phone}');

              },child: Text(phone)),
            ),
          ],
        ),
      ),
    );
  }
}
