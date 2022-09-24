
import 'package:flutter/material.dart';
import 'package:my_experiments/custom_paint/coordinates_basics.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CoordinatesBasics(),
    );
  }
}

