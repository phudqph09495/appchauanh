import 'package:ChauAnh/screen/home/info/info_tonkho.dart';
import 'package:flutter/material.dart';
import 'package:ChauAnh/widget/item/input/text_filed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/bloc/tonkho/bloc_ListtonKho.dart';
import '../../bloc/event_bloc.dart';
import '../../bloc/state_bloc.dart';
import '../../model/model_tonKho.dart';
import '../../style/init_style.dart';
import 'item/tonkho_item.dart';

class TonKhoScreen extends StatefulWidget {
  @override
  State<TonKhoScreen> createState() => _TonKhoScreenState();
}

class _TonKhoScreenState extends State<TonKhoScreen> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  BlocListTonKho blocListTonKho=BlocListTonKho();

  String a = '';

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
    a = '0';
    blocListTonKho.add(GetData());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Tồn kho'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorApp.linearGradientBanner,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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

            Container(
              color: Color(0xffF3F3F3),
              child: TabBar(
                onTap: (value) {
                  print(value);
                  setState(() {
                    a = value.toString();
                  });
                },
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: StyleApp.textStyle500(fontSize: 16),
                unselectedLabelStyle: StyleApp.textStyle500(
                  fontSize: 16,
                  color: Colors.black,
                ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                tabs: <Widget>[
                  Tab(
                    child: Text('Tất cả'),
                  ),
                  Tab(
                    child: Text('Ngày'),
                  ),
                  Tab(
                    child: Text('Tuần'),
                  ),
                  Tab(
                    child: Text('Tháng'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            BlocBuilder(builder: (_,StateBloc state){
              if(state is LoadSuccess){
                ModelTonKho modeltonKho=state.data;
                return
                ListView.builder(itemBuilder: (context,index){
                  return InkWell(child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${modeltonKho.material! [index].name} -',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.blue8F, fontSize: 14),
                                ),
                                Text(
                                  ' ${modeltonKho.material![index].code}',
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
                                      '${modeltonKho.material![index].totalAmount}',
                                      style: StyleApp.textStyle500(
                                          color: Color(0xffD10563), fontSize: 14),
                                    ),
                                  ],
                                ),
                                Text(
                                  // '${modeltonKho.material![index].averagePrice}',
                                    '${NumberFormat("###,###.###", 'vi_VN').format(double.parse(modeltonKho.material![index].averagePrice ?? '0'))} đ',
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
                  ),onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoTonKho(materials: modeltonKho.material![index],)));
                  },);
                },shrinkWrap: true,itemCount: modeltonKho.material!.length,  physics: NeverScrollableScrollPhysics(),);
              }
              return SizedBox();
            },bloc: blocListTonKho,),

            Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
              child: Column(
                children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tổng tiền', style:
                      StyleApp.textStyle600(color: ColorApp.blue8F, fontSize: 16)),
                BlocBuilder(builder: (_,StateBloc state){
                  if(state is LoadSuccess){
                    ModelTonKho modeltonKho=state.data;
                    double sum=0;
                    for(var item in modeltonKho.material!){
                      sum+=double.parse(item.averagePrice??'0');
                    }
                    return       Text('${NumberFormat("###,###.###", 'vi_VN').format(sum)} đ', style:
                    StyleApp.textStyle600(color: ColorApp.redText, fontSize: 16));
                  }
                  return SizedBox();
                },bloc: blocListTonKho,),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
