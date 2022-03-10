import 'package:flutter/material.dart';
import 'package:movie_app/bodys/library_movie.dart';
import 'package:movie_app/bodys/news_movie.dart';
import 'package:movie_app/utility/app_constant.dart';
import 'package:movie_app/widgets/show_signout.dart';
import 'package:movie_app/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Showpage extends StatefulWidget {
  const Showpage({Key? key}) : super(key: key);

  @override
  State<Showpage> createState() => _ShowpageState();
}

class _ShowpageState extends State<Showpage> {
  List<Widget> widgets = [ShowNewsMovie(), ShowLibraryMovie()];
  int indexWidget = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Showpage'),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            ShowSignOut(),
            Column(
              children: [
                UserAccountsDrawerHeader(accountName: null, accountEmail: null),
                menuNews(),
                menuLibrary(),
              ],
            ),
          ],
        ),
      ),
      body: widgets[indexWidget],
    );
  }

  ListTile menuNews() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 0;
          Navigator.pop(context);
        });
      },
      leading: Icon(Icons.filter_1_outlined),
      title: ShowTitle(
        title: 'News',
        textStyle: AppConstant().h2Style(),
      ),
      subtitle: ShowTitle(
        title: 'This page will show news about movie news.',
        textStyle: AppConstant().h3Style(),
      ),
    );
  }

  ListTile menuLibrary() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 1;
          Navigator.pop(context);
        });
      },
      leading: Icon(Icons.filter_2_outlined),
      title: ShowTitle(
        title: 'Library',
        textStyle: AppConstant().h2Style(),
      ),
      subtitle: ShowTitle(
        title: 'This page will show you all the movies we recommend.',
        textStyle: AppConstant().h3Style(),
      ),
    );
  }
}
