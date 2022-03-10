import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/user_model.dart';
import 'package:movie_app/utility/app_constant.dart';
import 'package:movie_app/utility/app_dialog.dart';
import 'package:movie_app/widgets/show_image.dart';
import 'package:movie_app/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                buildImage(size),
                buildAppName(),
                buildUserID(size),
                buildPassword(size),
                buildLogin(size),
                buildCreateAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'NON HAVE AN ACCOUNT?',
          textStyle: AppConstant().h3Style(),
        ),
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, AppConstant.routeCreateAccount),
          child: Text('SIGN UP'),
        ),
      ],
    );
  }

  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            width: size * 0.6,
            child: ElevatedButton(
              style: AppConstant().myButtonStyle(),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  String user = userController.text;
                  String password = passwordController.text;
                  print('##user = $user, password = $password');
                  checkAuthen(user: user, password: password);
                }
              },
              child: Text('Login'),
            )),
      ],
    );
  }

  Future<Null> checkAuthen({String? user, String? password}) async {
    String apiCheckAuthen =
        '${AppConstant.domain}/movieapp/getUserWhereUser.php?isAdd=true&user=$user';
    await Dio().get(apiCheckAuthen).then((value) async {
      print('## Value for API = $value');
      if (value.toString() == 'null') {
        AppDiaLog()
            .normalDialog(context, 'User false!', 'No $user in database');
      } else {
        for (var item in json.decode(value.data)) {
          UserModel model = UserModel.fromMap(item);
          if (password == model.password) {
            //success authen
            String user = model.user;
            print('## Authen success in user => $user');
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setString('user', user);
            Navigator.pushNamedAndRemoveUntil(
                context, AppConstant.routeShowpage, (route) => false);
          } else {
            //fail authen
            AppDiaLog()
                .normalDialog(context, 'Password false', 'Please try again');
          }
        }
      }
    });
  }

  Row buildUserID(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            controller: userController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please fill user in blank';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelStyle: AppConstant().h3Style(),
              labelText: 'User ID',
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: AppConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.6,
          child: TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please fill password in blank';
              } else {
                return null;
              }
            },
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    statusRedEye = !statusRedEye;
                  });
                },
                icon: statusRedEye
                    ? Icon(
                        Icons.remove_red_eye,
                        color: AppConstant.dark,
                      )
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppConstant.dark,
                      ),
              ),
              labelStyle: AppConstant().h3Style(),
              labelText: 'Password',
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: AppConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: AppConstant.appName,
          textStyle: AppConstant().h1Style(),
        ),
      ],
    );
  }

  Row buildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: ShowImage(
            path: AppConstant.image4,
          ),
        ),
      ],
    );
  }
}
