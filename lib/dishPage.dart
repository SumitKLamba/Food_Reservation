import 'package:flutter/material.dart';

class DishPage extends StatefulWidget {
  final Map<String, dynamic> dish;
  DishPage(this.dish);
  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
