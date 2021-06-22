import 'package:flutter/material.dart';
import 'package:resrv_r/screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DishPage extends StatefulWidget {
  final Map<String, dynamic> dish;
  DishPage(this.dish);
  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  @override
  Widget build(BuildContext context) {
    Sizing.init(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 0.4.sh,
          color: Color(0xFFf0932b).withOpacity(0.8),
        ),
        Column(
          children: [
            Expanded(
              child: SizedBox(),
            ),
            Container(
              height: 0.75.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.sp),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.12.sh,
                    ),
                    Text(
                      widget.dish["name"],
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 30.sp, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 0.15.sh,
          child: Container(
            width: 1.sw,
            child: CircleAvatar(
              child: Hero(
                  tag: 'dish${widget.dish["name"]}',
                  child: Image.asset('assets/dish.png')),
              radius: 80.sp,
            ),
          ),
        ),
        Positioned(
          left: 12.sp,
          top: 24.sp,
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: CircleAvatar(
              child: Icon(Icons.chevron_left),
              backgroundColor: Colors.white,
              radius: 16.sp,
            ),
          ),
        ),
        Positioned(
          right: 12.sp,
          top: 24.sp,
          child: CircleAvatar(
            child: Icon(Icons.favorite_border),
            backgroundColor: Colors.white,
            radius: 16.sp,
          ),
        ),
      ],
    ));
  }
}
