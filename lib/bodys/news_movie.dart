import 'package:flutter/material.dart';

class ShowNewsMovie extends StatefulWidget {
  const ShowNewsMovie({Key? key}) : super(key: key);

  @override
  _ShowNewsMovieState createState() => _ShowNewsMovieState();
}

class _ShowNewsMovieState extends State<ShowNewsMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is show news movie'),
    );
  }
}
