import 'package:flutter/material.dart';

class AppConstant {
  //General
  static String appName = 'Movie Index';

  //Route
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createAccount';
  static String routeMovieInfo = '/movieInfo';

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
  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );

  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: AppConstant.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
}
