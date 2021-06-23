import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resrv_r/screen.dart';

import 'classbuilder.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainWidget(),
    );
  }
}