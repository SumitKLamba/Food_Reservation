import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:resrv_r/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   KFDrawerController _drawerController;
//
//   @override
//   void initState() {
//     super.initState();
//     _drawerController = KFDrawerController(
//       initialPage: Dashboard(),
//       items: [
//         KFDrawerItem.initWithPage(
//           text: Text('MAIN', style: TextStyle(color: Colors.white)),
//           icon: Icon(Icons.home, color: Colors.white),
//           page: Dashboard(),
//         ),
//         KFDrawerItem.initWithPage(
//           text: Text(
//             'CALENDAR',
//             style: TextStyle(color: Colors.white),
//           ),
//           icon: Icon(Icons.calendar_today, color: Colors.white),
//           // page: CalendarPage(),
//         ),
//         KFDrawerItem.initWithPage(
//           text: Text(
//             'SETTINGS',
//             style: TextStyle(color: Colors.white),
//           ),
//           icon: Icon(Icons.settings, color: Colors.white),
//           // page: ClassBuilder.fromString('SettingsPage'),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: KFDrawer(
//         controller: _drawerController,
//         header: Align(
//           alignment: Alignment.centerLeft,
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 16.0),
//             width: MediaQuery.of(context).size.width * 0.6,
//             child: Image.asset(
//               'assets/logo.png',
//               alignment: Alignment.centerLeft,
//             ),
//           ),
//         ),
//         footer: KFDrawerItem(
//           text: Text(
//             'SIGN IN',
//             style: TextStyle(color: Colors.white),
//           ),
//           icon: Icon(
//             Icons.input,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             // Navigator.of(context).push(CupertinoPageRoute(
//             //   fullscreenDialog: true,
//             //   builder: (BuildContext context) {
//             //     return AuthPage();
//             //   },
//             // ));
//           },
//         ),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xffff9f43),
//               Color(0xfffeca57),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
