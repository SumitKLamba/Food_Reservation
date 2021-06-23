import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resrv_r/screenutil.dart';
import 'classbuilder.dart';

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('Dashboard'),
      items: [
        // KFDrawerItem.initWithPage(
        //   text: Text('MAIN', style: TextStyle(color: Colors.white)),
        //   icon: Icon(Icons.home, color: Colors.white),
        //   page: MainPage(),
        // ),
        // KFDrawerItem.initWithPage(
        //   text: Text(
        //     'CALENDAR',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   icon: Icon(Icons.calendar_today, color: Colors.white),
        //   page: CalendarPage(),
        // ),
        // KFDrawerItem.initWithPage(
        //   text: Text(
        //     'SETTINGS',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   icon: Icon(Icons.settings, color: Colors.white),
        //   page: ClassBuilder.fromString('SettingsPage'),
        // ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    Sizing.init(context);
    return Container(
      color: Color(0xffffbe76),
      child: SafeArea(
        child: Scaffold(
          body: KFDrawer(
            animationDuration: Duration(milliseconds: 200),
            controller: _drawerController,
            header: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(14.sp),
                          margin: EdgeInsets.all(14.sp),
                          child: Icon(
                            Icons.person,
                            color: Color(0xFFf0932b),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffffbe76),
                              shape: BoxShape.circle
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Justin Tranter",
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ),
                            Text(
                              "Justin@email.com",
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 34.sp,),
                    Container(
                      margin: EdgeInsets.only(left: 18.sp),
                      height: 0.23.sh,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(width: 6.sp,),
                              Text(
                                "Nearby Restaurants",
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white.withOpacity(0.87)
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.info,
                                color: Colors.white,
                              ),
                              SizedBox(width: 6.sp,),
                              Text(
                                "About us",
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white.withOpacity(0.87)
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.help,
                                color: Colors.white,
                              ),
                              SizedBox(width: 6.sp,),
                              Text(
                                "Help",
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white.withOpacity(0.87)
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              SizedBox(width: 6.sp,),
                              Text(
                                "Rate us",
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white.withOpacity(0.87)
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
            footer: KFDrawerItem(
              text: Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.input,
                color: Colors.white,
              ),
              onPressed: () {
                // Navigator.of(context).push(CupertinoPageRoute(
                //   fullscreenDialog: true,
                //   builder: (BuildContext context) {
                //     return AuthPage();
                //   },
                // ));
              },
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xffe67e22), Color(0xFFf0932b).withOpacity(0.6)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}