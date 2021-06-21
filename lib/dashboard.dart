import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resrv_r/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> itemName = <String>['Burger', 'Pizza', 'Biryani', 'Dessert', 'Beverages'];

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    Sizing.init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 1.sw,
          height: 1.sh,
          color: Color(0xFFf0932b).withOpacity(0.3),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0.1.sh),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
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
                      textStyle:
                          TextStyle(fontSize: 35.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'delicious meal!',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 45.sp,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.sp),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Container(
                      height: 0.07.sh,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.search),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Search'),
                            ),
                            Expanded(child: SizedBox()),
                            Icon(Icons.filter_alt_sharp)
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Explore Categories',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 18.sp
                        )
                      ),
                    ),
                  ),
                  Container(
                    height: 0.18.sh,
                    width: 1.sw,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: itemName.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => _onSelected(index),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 0.21.sw,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(radius: 30.sp,
                                        child: Image.asset('assets/${itemName[index]}.png'),
                                        backgroundColor: Colors.white,
                                      ),
                                      Text('${itemName[index]}')
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(42),
                                  color:  _selectedIndex != null && _selectedIndex == index
                                      ? Color(0xFFf0932b)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 0.4.sh,
                        width: 0.8.sw,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset('assets/nearby.jpeg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text('Nearby Restaurants',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 18.sp
                        )
                    ),
                  ),
                  Container(
                    height: 0.2.sh,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemName.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 0.6.sw,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
