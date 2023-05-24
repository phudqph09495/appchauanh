import 'package:ChauAnh/bloc/event_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ChauAnh/config/path/image_path.dart';
import 'package:ChauAnh/widget/item/load_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc/congNo/bloc_detailCOngNo.dart';
import '../../../bloc/state_bloc.dart';
import '../../../config/const.dart';
import '../../../model/model_detailCongNo.dart';
import '../../../style/init_style.dart';
import '../../../widget/item/input/text_filed.dart';
import 'khachhang_item.dart';

class InFoCongNo extends StatefulWidget {
  String id;
  String tenKH;
  InFoCongNo({required this.id,required this.tenKH});
  @override
  State<InFoCongNo> createState() => _InFoCongNoState();
}

class _InFoCongNoState extends State<InFoCongNo> {
  Bloc_DetailCongNo bloc_detailCongNo=Bloc_DetailCongNo();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc_detailCongNo.add(GetData(param: widget.id));
  }
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
Container(width: MediaQuery.of(context).size.width*0.7,child: Text(widget.tenKH,style: StyleApp.textStyle700(fontSize: 16,color: Colors.white),)),
              ],
            ),
          ),
        ),
      ),
      body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              const TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 50),
                isScrollable: true,
                labelStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                indicatorColor: ColorApp.blue8F,
                unselectedLabelStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                labelColor: ColorApp.blue8F,
                unselectedLabelColor: ColorApp.black49,
                tabs: [
                  Tab(text: 'Dịch vụ sửa chữa'),
                  Tab(text: 'Mua linh kiện'),
                ],
              ),
          BlocBuilder(builder: (_,StateBloc state){
            if(state is LoadSuccess){
              Model_DetailCongNo model=state.data;
              int dvscSum=0;
              int mLKSum=0;
              for(var item in model.exProductAttrOrders!){
                dvscSum+=int.parse('${item.totalPrice}');
              }
              for(var item in model.exMaterialAttrOrders!){
                mLKSum+=item.priceOwed!;
              }
              return     Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Column(
                      children: [
                        ListView.builder(
                            padding: EdgeInsets.only(top: 10),  physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:model.exProductAttrOrders!.length ,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '${model.exProductAttrOrders![index].imei} - ',
                                                  style: StyleApp.textStyle500(
                                                      color: ColorApp.blue8F, fontSize: 11),
                                                ),
                                                Text(
                                                  '${model.exProductAttrOrders![index].serial}',
                                                  style: StyleApp.textStyle500(
                                                      color: Color(0xffD10563), fontSize: 11),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '${model.exProductAttrOrders![index].title}',
                                              style: StyleApp.textStyle500(
                                                  color: ColorApp.blue8F, fontSize: 11),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              model.exProductAttrOrders![index].note??'',
                                              style: StyleApp.textStyle500(
                                                  color: ColorApp.blue8F, fontSize: 11),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text('${Const.ConvertPrice.format(int.parse('${model.exProductAttrOrders![index].totalPrice}'))} đ',   style: StyleApp.textStyle500(
                                                  color: Color(0xffD10563), fontSize: 14),),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text('Ngày công nợ đầu tiên',style: StyleApp.textStyle500(
                                                  color: ColorApp.blue8F, fontSize: 11),),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text('${Const.convertDateFormat('${model.exProductAttrOrders![index].createdAt}')}',style: StyleApp.textStyle500(
                                                  color: ColorApp.blue8F, fontSize: 14),),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider()
                                ],
                              );
                            }),
                        Padding(
                          padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tổng đơn', style:
                                  StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                                  Text('${model.exProductAttrOrders!.length}', style:
                                  StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                                ],
                              ), SizedBox(height: 10,),  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tổng tiền', style:
                                  StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                                  Text('${Const.ConvertPrice.format(dvscSum)} đ', style:
                                  StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(top: 10),
                            shrinkWrap: true,
                            itemCount: model.exMaterialAttrOrders!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                         ...List.generate(model.exMaterialAttrOrders![index].orderDetails!.length, (index2) =>
                                             Column(
                                               children: [
                                                 Row(
                                                   children: [
                                                     Text(
                                                       model.exMaterialAttrOrders![index].orderDetails![index2].name??'',
                                                       style: StyleApp.textStyle500(
                                                           color: ColorApp.blue8F, fontSize: 10),
                                                     ),
                                                     Text(
                                                       ' - ',
                                                       style: StyleApp.textStyle500(
                                                           color: ColorApp.blue8F, fontSize: 10),
                                                     ),
                                                     Text(
                                                       model.exMaterialAttrOrders![index].orderDetails![index2].code??'',
                                                       style: StyleApp.textStyle500(
                                                           color: Color(0xffD10563), fontSize: 10),
                                                     ),
                                                     Text(
                                                       '-',
                                                       style: StyleApp.textStyle500(
                                                           color: ColorApp.blue8F, fontSize: 10),
                                                     ),
                                                     Text(
                                                       '${ model.exMaterialAttrOrders![index].orderDetails![index2].amount}',
                                                       style: StyleApp.textStyle500(
                                                           color: Color(0xffD10563), fontSize: 10),
                                                     ),
                                                     Text(
                                                       '-',
                                                       style: StyleApp.textStyle500(
                                                           color: ColorApp.blue8F, fontSize: 10),
                                                     ),
                                                     Text(
                                                       '${ Const.ConvertPrice.format(int.parse('${model.exMaterialAttrOrders![index].orderDetails![index2].salePrice}'))}đ',
                                                       style: StyleApp.textStyle500(
                                                           color: Color(0xffD10563), fontSize: 10),
                                                     )
                                                   ],
                                                 ),
                                                 SizedBox(height: 10,),
                                               ],
                                             ),),
                                            Row(
                                              children: [
                                                Text(
                                                  'Đã thanh toán   ',
                                                  style: StyleApp.textStyle500(
                                                      color: ColorApp.blue8F, fontSize: 10),
                                                ),
                                                Text(
                                                  '${ Const.ConvertPrice.format(int.parse('${model.exMaterialAttrOrders![index].totalPriceGet}'))} đ',
                                                  style: StyleApp.textStyle500(
                                                      color: Color(0xffD10563), fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text('${Const.ConvertPrice.format(model.exMaterialAttrOrders![index].priceOwed)} đ',   style: StyleApp.textStyle500(
                                              color: Color(0xffD10563), fontSize: 10),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('Ngày công nợ đầu tiên',style: StyleApp.textStyle500(
                                              color: ColorApp.blue8F, fontSize: 10),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('${Const.convertDateFormat('${model.exMaterialAttrOrders![index].createdAt}')}',style: StyleApp.textStyle500(
                                              color: ColorApp.blue8F, fontSize: 10),),
                                        ],
                                      )
                                    ],
                                  ),
                                  Divider()
                                ],
                              );
                            }),
                        Padding(
                          padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tổng đơn', style:
                                  StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                                  Text('${model.exMaterialAttrOrders!.length}', style:
                                  StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                                ],
                              ), SizedBox(height: 10,),  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tổng tiền', style:
                                  StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                                  Text('${Const.ConvertPrice.format(mLKSum)} đ', style:
                                  StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return SizedBox();
          },bloc: bloc_detailCongNo,)
            ],
          )),
    );
  }
}

class DVSuaChua extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 10),  physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'UA32K5500aKXXV - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 11),
                                ),
                                Text(
                                  'LC3284239-3246',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 11),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '01523NAHA73243289',
                              style: StyleApp.textStyle500(
                                  color: ColorApp.blue8F, fontSize: 11),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Lorem ipsum dolor',
                              style: StyleApp.textStyle500(
                                  color: ColorApp.blue8F, fontSize: 11),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('3.000.000 đ',   style: StyleApp.textStyle500(
                                  color: Color(0xffD10563), fontSize: 14),),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Ngày công nợ đầu tiên',style: StyleApp.textStyle500(
                              color: ColorApp.blue8F, fontSize: 11),),
                              SizedBox(
                                height: 10,
                              ),
                              Text('10/10/2022',style: StyleApp.textStyle500(
                                  color: ColorApp.blue8F, fontSize: 14),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider()
                ],
              );
            }),
        Padding(
          padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng đơn', style:
                  StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                  Text('3', style:
                  StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                ],
              ), SizedBox(height: 10,),  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng tiền', style:
                  StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                  Text('9.000.000 đ', style:
                  StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MuaLinhKien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 10),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Màn hình TV - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 11),
                                ),
                                Text(
                                  'LC3284239-3246',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 11),
                                ),
                                Text(
                                  ' - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 11),
                                ),
                                Text(
                                  '10',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 11),
                                ),
                                Text(
                                  ' - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 11),
                                ),
                                Text(
                                  '1.500.000đ',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 11),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Bo mạch - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 11),
                                ),
                                Text(
                                  '01523NAHA73243289',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 11),
                                ),
                                Text(
                                  ' - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 11),
                                ),
                                Text(
                                  '1.500.000đ',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 11),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Bo mạch - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 11),
                                ),
                                Text(
                                  '01523NAHA73243289',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 11),
                                ),
                                Text(
                                  ' - ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 11),
                                ),
                                Text(
                                  '1.500.000đ',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 11),
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text(
                                  'Đã thanh toán   ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 11),
                                ),
                                Text(
                                  '4.500.000 đ',
                                  style: StyleApp.textStyle500(
                                      color: Color(0xffD10563), fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('500.000 đ',   style: StyleApp.textStyle500(
                                  color: Color(0xffD10563), fontSize: 14),),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Ngày công nợ đầu tiên',style: StyleApp.textStyle500(
                                  color: ColorApp.blue8F, fontSize: 11),),
                              SizedBox(
                                height: 10,
                              ),
                              Text('10/10/2022',style: StyleApp.textStyle500(
                                  color: ColorApp.blue8F, fontSize: 14),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider()
                ],
              );
            }),
        Padding(
          padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng đơn', style:
                  StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                  Text('3', style:
                  StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                ],
              ), SizedBox(height: 10,),  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng tiền', style:
                  StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                  Text('9.000.000 đ', style:
                  StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
