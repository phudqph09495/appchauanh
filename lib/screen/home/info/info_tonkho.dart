import 'package:ChauAnh/model/model_tonKho.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../style/init_style.dart';
import '../../../widget/item/input/text_filed.dart';
class InfoTonKho extends StatefulWidget {
  Product materials;
  InfoTonKho({required this.materials});


  @override
  State<InfoTonKho> createState() => _InfoTonKhoState();
}

class _InfoTonKhoState extends State<InfoTonKho> {
  double sum=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sum=widget.materials.totalAmount!.toDouble()*double.parse(widget.materials.averagePrice??'0');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.whiteF7,
        centerTitle: true,
        title: Text(
          '${widget.materials.name}',
          style: StyleApp.textStyle600(color: ColorApp.blue00, fontSize: 18),
        ),
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: ColorApp.blue00,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child:Column(crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15,bottom: 15),
              child: InputText1(
                label: 'Tìm kiếm tên, số điện thoại',
                colorBg: Color(0xff7B7B7B).withOpacity(0.3),
                hasLeading: true,
                iconData: Icons.search,
                radius: 5,
              ),
            ),
            ListView.builder(itemBuilder: (context,index){
              return Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide()),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Ngày nhập - ',style: StyleApp.textStyle500(),),
                              Text(widget.materials.materialAttrs![index].importDate??'',style: StyleApp.textStyle500(color: ColorApp.redText),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text('Số lô - ',style: StyleApp.textStyle500(),),
                              Text(widget.materials.materialAttrs![index].materialId.toString(),style: StyleApp.textStyle500(color: ColorApp.redText),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text('Số lượng - ',style: StyleApp.textStyle500(),),
                              Text(widget.materials.materialAttrs![index].amount.toString(),style: StyleApp.textStyle500(color: ColorApp.redText),)
                            ],
                          ),


                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Giá nhập: ',style: StyleApp.textStyle500(),),
                              Text('${NumberFormat("###,###.###", 'vi_VN').format(double.parse(widget.materials.materialAttrs![index].importPrice ?? '0'))} đ',style: StyleApp.textStyle500(color: ColorApp.redText),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text('Giá bán  : ',style: StyleApp.textStyle500(),),
                              Text('${NumberFormat("###,###.###", 'vi_VN').format(double.parse(widget.materials.materialAttrs![index].salePrice ?? '0'))} đ',style: StyleApp.textStyle500(color: ColorApp.redText),)
                            ],
                          ),



                        ],
                      ),
                    ],
                  ),
                ),
              );
            },itemCount: widget.materials.materialAttrs!.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),),SizedBox(height: 15,),
            Text('Tổng lô: ${NumberFormat("###,###.###", 'vi_VN').format(sum)} đ',style: StyleApp.textStyle500(color: ColorApp.blue3D),)
          ],
        ),
      ),
    );
  }
}
