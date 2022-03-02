import 'package:flutter/material.dart';
import 'package:movie_app/states/authen.dart';
import 'package:movie_app/states/create_accout.dart';
import 'package:movie_app/states/movieinfo.dart';
import 'package:movie_app/utility/app_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/movieInfo': (BuildContext context) => MovieInfo(),
};

String? intialRoute;

void main() {
  intialRoute = AppConstant.routeAuthen;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstant.appName,
      routes: map,
      initialRoute: intialRoute,
    );
  }
}
