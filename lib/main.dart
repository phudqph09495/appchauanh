import 'package:ChauAnh/provider/image_provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'bloc/bloc/auth/bloc_check_login.dart';
import 'bloc/bloc/counter_observer.dart';
import 'bloc/event_bloc.dart';
import 'config/path/share_pref_path.dart';
import 'config/share_pref.dart';

import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  Bloc.observer = CounterObserver();
  await SharedPrefs.saveString('mdh', '0');
  runApp(
       MyApp());
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(), // Wrap your app
  // )
  // );

}

class MyApp extends StatelessWidget {
  // MaterialApp(
  // builder: DevicePreview.appBuilder,
  // debugShowCheckedModeBanner: false,
  // useInheritedMediaQuery: true,
  // home: MyHomePage(),
  // );
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => BlocCheckLogin()..add(GetData())),

        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (_) => ImageAppProvider()..setImage()),
          ],
          child:
          MaterialApp(
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          home: MyHomePage(),
          )
          ,
        ));
  }
}
