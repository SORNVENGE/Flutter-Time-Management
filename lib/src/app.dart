import 'package:flutter/material.dart';
import 'package:mobile_timesheet_makara_venge/src/routes/route_generator.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // initialRoute: '/loginScreen',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
