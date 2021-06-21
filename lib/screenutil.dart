import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sizing {
  static void init(context) => ScreenUtil.init(
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    ),
    designSize: Size(360, 690),
    orientation: Orientation.portrait,
  );
}