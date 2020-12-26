import 'package:flutter/material.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/analytic/chart.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/profile/profileScreen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/project/project_screen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/loginscreen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/time/timescreen.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  final _pageOptions = [
    TimeScreen(),
    ProjectScreen(),
    ChartScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    model.fetchModelAbsenceType();
    model.fetchProject();
    BackButtonInterceptor.add(myInterceptor);
    super.initState();
  }

  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // appBar: AppBar(
          //   title: Text("Bottom Nav Bar Video"),
          // ),
          body: _pageOptions[_selectedPage],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: Color(0xff314573),
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                primaryColor: Colors.red,
                textTheme: Theme.of(context)
                    .textTheme
                    .copyWith(caption: new TextStyle(color: Colors.yellow))),
            child: BottomNavigationBar(
              currentIndex: _selectedPage,
              onTap: (int index) {
                setState(() {
                  _selectedPage = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.alarm_add), title: Text('Time')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.card_travel), title: Text('Projects')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.timeline), title: Text('Analytics')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), title: Text('Profile')),
              ],
            ),
          )),
    );
  }
}
