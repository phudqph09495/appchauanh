import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ChauAnh/bloc/state_bloc.dart';
import 'package:ChauAnh/screen/auth/account_screen.dart';
import 'package:ChauAnh/screen/auth/login_screen.dart';
import 'package:ChauAnh/screen/home/item/bottom_sheet.dart';
import 'package:ChauAnh/screen/home/screen_home.dart';
import 'package:ChauAnh/screen/notify/notify_screen.dart';
import 'package:ChauAnh/screen/work/work_screen.dart';

import 'package:ChauAnh/style/init_style.dart';
import 'bloc/bloc/auth/bloc_check_login.dart';

import 'bloc/event_bloc.dart';
import 'config/path/image_path.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlocCheckLogin>().add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BlocCheckLogin, StateBloc>(
        builder: (context, StateBloc state) {
          final     check = state is LoadSuccess ? state.data as bool : false;
          return IndexedStack(
            index: index,
            children: [
              HomeScreen(),
              WorkScreen(),
            NotifyScreen(),
            check? AccountScreen():LoginScreen()
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(ImagePath.bottomBarHome)),
              label: "Home"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(ImagePath.bottomBarDon)),
              label: "Công việc"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined),
              label: "Thông báo"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(ImagePath.bottomBarAccount)),
              label: "Tài khoản"),
        ],
        onTap: (val) {
          index = val;
          setState(() {});
        },
        backgroundColor: Colors.white,
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorApp.main,
        selectedLabelStyle:
            StyleApp.textStyle400(color: ColorApp.main, fontSize: 14),
        unselectedItemColor: ColorApp.black,
        unselectedLabelStyle:
            StyleApp.textStyle400(color: ColorApp.black, fontSize: 14),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          //desired action command
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              elevation: 0,
              context: context, builder: (context) => BottomSheetAccount());
        },
        child: Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          child: Image.asset(ImagePath.bottomBarAdd),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
