import 'package:flutter/material.dart';
import 'package:resrv_r/screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantPage extends StatefulWidget {
  final Map<String, dynamic> restaurant;
  RestaurantPage(this.restaurant);
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    Sizing.init(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            width: 1.sw,
            height: 0.35.sh,
            child: Image.asset('assets/${widget.restaurant["name"]}.jpg',fit: BoxFit.fill,),
          ),
          Container(
            height: 1.sh,
            width: 1.sw,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: SizedBox(),),
                Container(
                  height: 0.68.sh,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50.sp), topRight: Radius.circular(50.sp))
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Text(widget.restaurant["name"],
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFf0932b)
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Text(widget.restaurant["description"],
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, color: Colors.blue, size: 24.sp ),
                                SizedBox(width: 5.sp,),
                                Text(widget.restaurant["distance"],
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp
                                    )
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star_border_outlined, color: Colors.yellow, size: 24.sp ),
                                SizedBox(width: 5.sp,),
                                Text(widget.restaurant["rating"],
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp
                                      )
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.restaurant, color: Colors.pink, size: 24.sp ),
                                SizedBox(width: 5.sp,),
                                Text(widget.restaurant["type"],
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp
                                      )
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )
    ));
  }
}
