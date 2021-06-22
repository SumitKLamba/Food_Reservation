import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resrv_r/screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

class DishPage extends StatefulWidget {
  DishPage(this.dish);
  final Map<String, dynamic> dish;
  int val = 0;

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
                    ),
                    Text(
                      widget.dish["type"],
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontSize: 18.sp)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                color: Color(0xFFf0932b),
                              ),
                              SizedBox(
                                width: 0.02.sw,
                              ),
                              Text(
                                '50 min',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 18.sp)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_border_outlined,
                                color: Color(0xFFf0932b),
                              ),
                              SizedBox(
                                width: 0.02.sw,
                              ),
                              Text(
                                widget.dish["rating"],
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 18.sp)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 0.07.sh,
                      width: 1.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.dish["price"],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp)),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.sp),
                              color: Color(0xFFf0932b).withOpacity(0.3),
                            ),
                            child: StepperSwipe(
                              initialValue: 0,
                              iconsColor: Color(0xFFf0932b),
                              withPlusMinus: true,
                              firstIncrementDuration:
                                  Duration(milliseconds: 300),
                              secondIncrementDuration:
                                  Duration(milliseconds: 200),
                              direction: Axis.horizontal,
                              dragButtonColor: Color(0xFFf0932b),
                              withSpring: true,
                              withFastCount: true,
                              maxValue: 50,
                              minValue: 0,
                              stepperValue: widget.val,
                              onChanged: (int val) => print('New value : $val'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1.sw,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12.sp,
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.sp),
                            child: Text(
                              'About',
                              style: GoogleFonts.roboto(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            widget.dish["description"],
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                color: Colors.black.withOpacity(0.65)),
                          ),
                          SizedBox(
                            height: 12.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.sp),
                            child: Text(
                              'Ingredients',
                              style: GoogleFonts.roboto(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            'Bread, Olive Oil, Onion, Lemon, Carp, Cod and Millet roe',
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                color: Colors.black.withOpacity(0.65)),
                          ),
                        ],
                      ),
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
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: CircleAvatar(
                child: Icon(Icons.chevron_left,
                  color: Color(0xFFf0932b),
                ),
                backgroundColor: Colors.white,
                radius: 18.sp,
              ),
            ),
          ),
        ),
        Positioned(
          right: 12.sp,
          top: 24.sp,
          child: Padding(
            padding: EdgeInsets.all(12.sp),
            child: CircleAvatar(
              child: Icon(Icons.favorite_border,
                color: Color(0xFFf0932b),
              ),
              backgroundColor: Colors.white,
              radius: 18.sp,
            ),
          ),
        ),
      ],
    ));
  }
}
