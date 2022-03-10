import 'package:flutter/material.dart';
import 'package:movie_app/utility/app_constant.dart';
import 'package:movie_app/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowSignOut extends StatelessWidget {
  const ShowSignOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.clear().then(
                  (value) => Navigator.pushNamedAndRemoveUntil(
                      context, AppConstant.routeAuthen, (route) => false),
                );
          },
          tileColor: AppConstant.dark,
          leading: Icon(
            Icons.logout_outlined,
            size: 36,
            color: Colors.white,
          ),
          title: ShowTitle(
            title: 'Sign out',
            textStyle: AppConstant().h2WhiteStyle(),
          ),
          subtitle: ShowTitle(
            title: 'Sign out and go to login screen',
            textStyle: AppConstant().h3WhiteStyle(),
          ),
        ),
      ],
    );
  }
}
