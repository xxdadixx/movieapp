import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:movie_app/utility/app_constant.dart';
import 'package:movie_app/widgets/show_image.dart';
import 'package:movie_app/widgets/show_title.dart';

class AppDiaLog {
  Future<Null> alertLocationService(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(path: AppConstant.image3),
          title: ShowTitle(
            title: title,
            textStyle: AppConstant().h2Style(),
          ),
          subtitle: ShowTitle(
            title: message,
            textStyle: AppConstant().h3Style(),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await Geolocator.openLocationSettings();
              },
              child: Text('OK'))
        ],
      ),
    );
  }

  Future<Null> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: ShowImage(path: AppConstant.image2),
          title: ShowTitle(
            title: title,
            textStyle: AppConstant().h2Style(),
          ),
          subtitle: ShowTitle(
            title: message,
            textStyle: AppConstant().h3Style(),
          ),
        ),
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
