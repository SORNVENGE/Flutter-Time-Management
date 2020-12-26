
import 'package:flutter/material.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/homescreen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/profile/my_time_request.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/project/filter_screen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/loginscreen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/splashscreen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/time/new_day_off_screen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/time/new_work_hour_screen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/time/timescreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/loginScreen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/mainScreen':
        return MaterialPageRoute(builder: (_) =>HomeScreen());
      case '/timeScreen':
        return MaterialPageRoute(builder: (_) => TimeScreen());
      case '/newWorkHourScreen':
        return MaterialPageRoute(builder: (_) => NewWorkHourScreen());
      case '/newDayOffScreen':
        return MaterialPageRoute(builder: (_) => NewDayOffScreen());
      case '/myTimeRequestScreen':
        return MaterialPageRoute(builder: (_) => MyTimeRequestScreen());
      case '/filterScreen':
        return MaterialPageRoute(builder: (_) => FilterScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text("Error"),
        ),
      );
    });
  }
}
