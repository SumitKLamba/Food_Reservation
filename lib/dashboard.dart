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
      "description": "Have been going to this restaurant for many years and it never disappoints. Jimmie and his staff are second to none when it comes to the food and service. Any guests I bring with me are always full of praise.",
      "type": "Greek",
      "distance": "0.3 KM",
      "rating": "4.2"
    },
    {
      "name": "The Yellow Chilli",
      "description": "Years ago, on the streets of Meerut, Chef Sanjeev Kapoor chanced upon a yellow chilli amidst a plethora of green and red chillies. The special yellow chilli spice mix the chaatwalas use here adds that extra zing and brings together a confluence of flavours, aroma and colour",
      "type": "Indian",
      "distance": "0.5 KM",
      "rating": "4"
    },
    {
      "name": "The Aura",
      "description": "Years ago, on the streets of Meerut, Chef Sanjeev Kapoor chanced upon a yellow chilli amidst a plethora of green and red chillies. As food connoisseurs are aware, Meerut is the melting pot of unique chaats. The special yellow chilli spice mix the chaatwalas use here adds that extra zing and brings together a confluence of flavours, aroma and colour",
      "type": "Lebanese",
      "distance": "0.7 KM",
      "rating": "4"
    },
    {
      "name": "Westway Bar & Kitchen",
      "description": "Excellent reception from staff. No one was rushing us out as we had both a business meeting and a birthday celebration for a colleague. We were checked on frequently enough to ensure everything was okay.",
      "type": "British",
      "distance": "1.3 KM",
      "rating": "3.7"
    },
    {
      "name": "Rubio",
      "description": "Rubio’s is the best restaurant in Harlesden. Food and service always on point.",
      "type": "Pizzeria",
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
                        color: Color(0xFFf0932b).withOpacity(0.3)
                    ),
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
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Container(
                        height: 0.07.sh,
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 25.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.search,color: Color(0xFFf0932b),),
                              Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: Text('Search'),
                              ),
                              Expanded(child: SizedBox()),
                              Icon(Icons.filter_alt_sharp, color: Color(0xFFf0932b))
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Text(
                        'Explore Categories',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(fontSize: 18.sp)),
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
                                  Text('${itemName[index]}',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600
                                        )
                                    ),
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
                padding: EdgeInsets.symmetric(vertical: 15.sp),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 0.4.sh,
                    width: 0.85.sw,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        'assets/nearby.jpeg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.sp),
                child: Text(
                  'Nearby Restaurants',
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(fontSize: 18.sp)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.sp),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 0.2.sh,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.7,
                  ),
                  items: _restaurants.map((restaurant) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RestaurantPage(restaurant)));
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
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 0.35.sw,
                                        child: Text(restaurant["name"],
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFf0932b)
                                              ),
                                            )),
                                      ),
                                      SizedBox(height: 0.01.sh,),
                                      Text(restaurant["type"],
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
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.black54,
                                            size: 16.sp,
                                          ),
                                          SizedBox(width: 3.sp,),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
