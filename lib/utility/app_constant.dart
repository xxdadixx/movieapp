import 'package:flutter/material.dart';

class AppConstant {
  //General
  static String appName = 'Movie Index';
  static String domain =
      'http://9427-2001-fb1-10a-df53-4f8-6941-6364-5b4e.ngrok.io';

  //Route
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createAccount';
  static String routeShowpage = '/showpage';

  //Image
  static String image1 = 'assets/images/image1.png';
  static String image2 = 'assets/images/image2.png';
  static String image3 = 'assets/images/image3.png';
  static String image4 = 'assets/images/image4.png';
  static String avatar = 'assets/images/avatar.png';

  //Color
  static Color primary = Color(0xffba68c8);
  static Color dark = Color(0xff883997);
  static Color light = Color(0xffee98fb);
  static Map<int, Color> mapMaterialColor = {
    50: Color.fromRGBO(255, 136, 57, 0.1),
    100: Color.fromRGBO(255, 136, 57, 0.2),
    200: Color.fromRGBO(255, 136, 57, 0.3),
    300: Color.fromRGBO(255, 136, 57, 0.4),
    400: Color.fromRGBO(255, 136, 57, 0.5),
    500: Color.fromRGBO(255, 136, 57, 0.6),
    600: Color.fromRGBO(255, 136, 57, 0.7),
    700: Color.fromRGBO(255, 136, 57, 0.8),
    800: Color.fromRGBO(255, 136, 57, 0.9),
    900: Color.fromRGBO(255, 136, 57, 1.0),
  };

  //Style
  TextStyle h1Style() => TextStyle(
        fontSize: 24,
        color: dark,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2Style() => TextStyle(
        fontSize: 16,
        color: dark,
        fontWeight: FontWeight.w700,
      );
  TextStyle h2WhiteStyle() => TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );
  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );
  TextStyle h3WhiteStyle() => TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      );
  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: AppConstant.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
}
