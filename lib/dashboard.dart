import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:resrv_r/restaurantPage.dart';
import 'package:resrv_r/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

// ignore: must_be_immutable
class Dashboard extends KFDrawerContent {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> itemName = <String>[
    'Burger',
    'Pizza',
    'Biryani',
    'Dessert',
    'Beverages'
  ];

  List<Map<String, dynamic>> _restaurants = [
    {
      "name": "Arena Restaurant",
      "description":
          "Have been going to this restaurant for many years and it never disappoints. Jimmie and his staff are second to none when it comes to the food and service. Any guests I bring with me are always full of praise.",
      "type": ["Greek", "Thai"],
      "distance": "0.3 KM",
      "rating": "4.2"
    },
    {
      "name": "The Yellow Chilli",
      "description":
          "Years ago, on the streets of Meerut, Chef Sanjeev Kapoor chanced upon a yellow chilli amidst a plethora of green and red chillies. The special yellow chilli spice mix the chaatwalas use here adds that extra zing and brings together a confluence of flavours, aroma and colour",
      "type": ["Indian", "Bangladeshi", "Srilankan"],
      "distance": "0.5 KM",
      "rating": "4"
    },
    {
      "name": "The Aura",
      "description":
          "Years ago, on the streets of Meerut, Chef Sanjeev Kapoor chanced upon a yellow chilli amidst a plethora of green and red chillies. As food connoisseurs are aware, Meerut is the melting pot of unique chaats. The special yellow chilli spice mix the chaatwalas use here adds that extra zing and brings together a confluence of flavours, aroma and colour",
      "type": ["Lebanese","British"],
      "distance": "0.7 KM",
      "rating": "4"
    },
    {
      "name": "Westway Bar & Kitchen",
      "description":
          "Excellent reception from staff. No one was rushing us out as we had both a business meeting and a birthday celebration for a colleague. We were checked on frequently enough to ensure everything was okay.",
      "type": ["British", "American"],
      "distance": "1.3 KM",
      "rating": "3.7"
    },
    {
      "name": "Rubio",
      "description":
          "Rubio’s is the best restaurant in Harlesden. Food and service always on point.",
      "type": ["Pizzeria","Fast Food"],
      "distance": "1.5 KM",
      "rating": "4.5"
    },
  ];

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    Sizing.init(context);
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: Color(0xFFf0932b).withOpacity(0.3),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFf0932b).withOpacity(0.3)),
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.sp),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.sp),
                      child: Text(
                        'Good Evening! Justin',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Grab your',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 32.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      'delicious meal!',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 42.sp,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 21.sp),
                      child: Container(
                        height: 0.07.sh,
                        child: Padding(
                          padding: EdgeInsets.only(left: 24.sp, right: 12.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.search,
                                color: Color(0xFFf0932b),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: Text(
                                    'What are you looking for?',
                                  style: TextStyle(
                                    color: Colors.black54
                                  ),
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Row(
                                children: [
                                  Text(
                                    '5 KM',
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Color(0xFFf0932b),
                                            fontSize: 14.sp,
                                        ),
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_down,
                                      color: Color(0xFFf0932b),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.sp),
                child: Text(
                  'Nearby Restaurants',
                  style:
                      GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18.sp)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.sp),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 0.18.sh,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.7,
                  ),
                  items: _restaurants.map((restaurant) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    RestaurantPage(restaurant)));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(12.sp),
                                    child: Container(
                                      height: 0.16.sh,
                                      width: 0.26.sw,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Hero(
                                            tag: 'rimage${restaurant['name']}',
                                            child: Image.asset(
                                              'assets/${restaurant["name"]}.jpg',
                                              fit: BoxFit.fill,
                                            ),
                                          )),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 0.34.sw,
                                        child: Text(restaurant["name"],
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFf0932b)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 0.01.sh,
                                      ),
                                      Text(restaurant["type"][0],
                                          style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                      Text(restaurant["distance"],
                                          style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16.sp,
                                          ),
                                          SizedBox(
                                            width: 3.sp,
                                          ),
                                          Text(restaurant["rating"],
                                              style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54,
                                                ),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 25.sp, bottom: 10.sp, right: 25.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore Categories',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontSize: 18.sp)),
                    ),
                    FlatButton(
                      onPressed: () {},
                      color: Color(0xFFf0932b).withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.sp)
                      ),
                      child: Text(
                        'See more',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(fontSize: 14.sp),
                            color: Color(0xFFf0932b)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 0.18.sh,
                width: 1.sw,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: itemName.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => _onSelected(index),
                        child: Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                            width: 0.22.sw,
                            child: Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    radius: 30.sp,
                                    child: Image.asset(
                                        'assets/${itemName[index]}.png'),
                                    backgroundColor: Colors.white,
                                  ),
                                  Text(
                                    '${itemName[index]}',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600)),
                                  )
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(42),
                              color: _selectedIndex != null &&
                                      _selectedIndex == index
                                  ? Color(0xFFf0932b)
                                  : Colors.white,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25.sp, 10.0, 25.0, 10.0),
                child: Text(
                  'Top Restaurants',
                  style:
                      GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18.sp)),
                ),
              ),
              ..._restaurants.map((restaurant) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.sp, vertical: 5.sp),
                  child: Container(
                    width: 0.9.sh,
                    decoration: BoxDecoration(
                        color: Color(0xFFf0932b).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(18.sp)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 0.17.sh,
                          width: 0.9.sh,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18.sp),
                                topRight: Radius.circular(18.sp)),
                            child: Image.asset(
                              'assets/${restaurant["name"]}.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 6.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                restaurant["name"],
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 6.sp),
                                decoration: BoxDecoration(
                                    color: Color(0xFFf0932b),
                                    borderRadius: BorderRadius.circular(8.sp)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(restaurant["rating"],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 2.sp,),
                                      Icon(
                                        Icons.star,
                                        size: 16.sp,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8.sp),
                          width: 0.7.sw,
                          height: 45.sp,
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: restaurant["type"].map<Container>((e) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                                color: Colors.white.withOpacity(0.5)
                              ),

                                margin: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 5.sp,),
                                padding: EdgeInsets.symmetric(horizontal: 8.sp,),
                              child: Center(
                                child: Text(
                                  e,
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: 14.sp, color: Color(0xFFf0932b),
                                    ),
                                  ),
                                ),
                              )
                            ),
                            ).toList(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8.sp,),
                              Text(
                                '${restaurant["distance"]} Away from you',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(fontSize: 14.sp, color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
