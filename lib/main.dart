import 'package:flutter/material.dart';
import 'package:movie_app/states/authen.dart';
import 'package:movie_app/states/create_accout.dart';
import 'package:movie_app/states/showpage.dart';
import 'package:movie_app/utility/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/showpage': (BuildContext context) => Showpage(),
};

String? intialRoute;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? user = preferences.getString('user');
  print('## user ==> $user');
  if (user?.isEmpty ?? true) {
    intialRoute = AppConstant.routeAuthen;
    runApp(MyApp());
  } else {
    intialRoute = AppConstant.routeShowpage;
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialColor materialColor =
        MaterialColor(0xff883997, AppConstant.mapMaterialColor);
    return MaterialApp(
      title: AppConstant.appName,
      routes: map,
      initialRoute: intialRoute,
      theme: ThemeData(primarySwatch: materialColor),
    );
  }
}
