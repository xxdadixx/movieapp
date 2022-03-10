import 'package:flutter/material.dart';

class ShowLibraryMovie extends StatefulWidget {
  const ShowLibraryMovie({Key? key}) : super(key: key);

  @override
  _ShowLibraryMovieState createState() => _ShowLibraryMovieState();
}

class _ShowLibraryMovieState extends State<ShowLibraryMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is show library movie'),
    );
  }
}
