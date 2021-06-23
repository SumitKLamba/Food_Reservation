import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resrv_r/dishPage.dart';
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
  final List<String> timeSlots = <String>[
    "6:30 PM",
    "6:45 PM",
    "7:00 PM",
    "7:15 PM",
    "7:30 PM"
  ];

  List<Map<String, dynamic>> menuItems = [
    {
      "name": "Taramosalata",
      "description":
          "Smoked cod roe dip with olive oil and lemon juice. Served with Hot Pitta",
      "type": "Cold Starters",
      "price": "£3.00",
      "rating": "4.2"
    },
    {
      "name": "Tzatziki",
      "description":
          "SStrained Greek yoghurt, cucumber and garlic dip. Served with Hot Pitta",
      "type": "Salads",
      "price": "£3.00",
      "rating": "4.0"
    },
    {
      "name": "Saganaki",
      "description":
          "Cretan Graviera cheese pan fried drizzled with honey and sesame",
      "type": "Hot Starters",
      "price": "£4.25",
      "rating": "4.6"
    },
    {
      "name": "Chicken Souvlaki",
      "description":
          "Small cubes of marinated chicken on a skewer with onion and pepper chargrilled",
      "type": "Soups",
      "price": "£9.00",
      "rating": "4.3"
    },
  ];

  @override
  Widget build(BuildContext context) {
    Sizing.init(context);
    return Scaffold(
      body: NestedScrollView(
    physics: BouncingScrollPhysics(),
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFf0932b),
          expandedHeight: 0.4.sh,
          elevation: 0,
          pinned: true,
          centerTitle: false,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(12.sp),
            title: Text(
              widget.restaurant["name"],
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            background: Hero(
              tag: 'rimage${widget.restaurant['name']}',
              child: Image.asset(
                'assets/${widget.restaurant["name"]}.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ];
    },
    body: Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.03.sh,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Text(
              widget.restaurant["description"],
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 30.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        color: Color(0xFFf0932b), size: 24.sp),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Text(
                      widget.restaurant["distance"],
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star_border_outlined,
                        color: Color(0xFFf0932b), size: 24.sp),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Text(
                      widget.restaurant["rating"],
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.restaurant,
                        color: Color(0xFFf0932b), size: 24.sp),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Text(
                      widget.restaurant["type"][0],
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp)),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Row(
              children: [
                Icon(Icons.schedule),
                SizedBox(
                  width: 7.sp,
                ),
                Text(
                  'Available Time Slots',
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp)),
                ),
              ],
            ),
          ),
          Container(
            height: 0.08.sh,
            width: 1.sw,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: timeSlots.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 7.sp),
                    child: Container(
                        width: 0.25.sw,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.sp),
                            color: Color(0xFFf0932b)),
                        child: Center(
                            child: Text(
                          timeSlots[index],
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold)),
                        ))),
                  );
                }),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
            child: Row(
              children: [
                Icon(Icons.restaurant_menu),
                SizedBox(
                  width: 7.sp,
                ),
                Text(
                  'Menu',
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp)),
                ),
              ],
            ),
          ),
          ...menuItems.map((element) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DishPage(element)));
              },
              child: Container(
                margin: EdgeInsets.all(12.sp),
                height: 0.17.sh,
                child: Row(
                  children: [
                    SizedBox(
                      width: 0.05.sw,
                    ),
                    CircleAvatar(
                        radius: 50.sp,
                        child: Hero(
                            tag: 'dish${element["name"]}',
                            child: Image.asset('assets/dish.png'))),
                    SizedBox(
                      width: 0.05.sw,
                    ),
                    Container(
                      width: 0.45.sw,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            element["name"],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text(
                            element["type"],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontSize: 15.sp,
                            )),
                          ),
                          SizedBox(
                            height: 0.015.sh,
                          ),
                          Text(
                            element["price"],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            child: Center(child: Icon(Icons.chevron_right, color: Color(0xFFf0932b),)),
                            backgroundColor: Colors.white,
                            radius: 16.sp,
                          ),
                          SizedBox(),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.sp),
                  color: Color(0xFFf0932b).withOpacity(0.3),
                ),
              ),
            );
          }).toList()
        ],
      ),
    ),
      ),
    );
  }
}
