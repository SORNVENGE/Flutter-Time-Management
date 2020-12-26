import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'indicator.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  List<PieChartSectionData> pieChartRawSections;
  List<PieChartSectionData> showingSections;

  StreamController<PieTouchResponse> pieTouchedResultStreamController;

  int touchedIndex;

  @override
  void initState() {
    super.initState();

    final section1 = PieChartSectionData(
      color: Color(0xff0293ee),
      value: 40,
      title: "40%",
      radius: 50,
      titleStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );

    final section2 = PieChartSectionData(
      color: Color(0xfff8b250),
      value: 30,
      title: "30%",
      radius: 50,
      titleStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );

    final section3 = PieChartSectionData(
      color: Color(0xff845bef),
      value: 15,
      title: "15%",
      radius: 50,
      titleStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );

    final section4 = PieChartSectionData(
      color: Color(0xff13d38e),
      value: 15,
      title: "15%",
      radius: 50,
      titleStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );

    final items = [
      section1,
      section2,
      section3,
      section4,
    ];

    pieChartRawSections = items;

    showingSections = pieChartRawSections;

    pieTouchedResultStreamController = StreamController();
    pieTouchedResultStreamController.stream.distinct().listen((details) {
      print(details);
      if (details == null) {
        return;
      }

      touchedIndex = -1;
      if (details.sectionData != null) {
        touchedIndex = showingSections.indexOf(details.sectionData);
      }

      setState(() {
        if (details.touchInput is FlLongPressEnd) {
          touchedIndex = -1;
          showingSections = List.of(pieChartRawSections);
        } else {
          showingSections = List.of(pieChartRawSections);

          if (touchedIndex != -1) {
            final TextStyle style = showingSections[touchedIndex].titleStyle;
            showingSections[touchedIndex] =
                showingSections[touchedIndex].copyWith(
              titleStyle: style.copyWith(
                fontSize: 24,
              ),
              title: "40%",
              radius: 60,
            );
          }
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pieTouchedResultStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'Analytics',
        style: TextStyle(color: Color(0xff314573), fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      bottom: TabBar(
        tabs: [
          Padding(
            child: Text(
              "DASH",
              style: TextStyle(color: Color(0xff2D9ED8), fontSize: 16),
            ),
            padding: EdgeInsets.only(top: 10, bottom: 10),
          ),
          Padding(
            child: Text(
              "Chart 1",
              style: TextStyle(color: Color(0xff2D9ED8), fontSize: 16),
            ),
            padding: EdgeInsets.all(10),
          ),
          Padding(
            child: Text(
              "Chart 2",
              style: TextStyle(color: Color(0xff2D9ED8), fontSize: 16),
            ),
            padding: EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }

  bool isClickOnWeek = true;
  bool isClickOnMonth = false;
  bool isClickOnYear = false;

  _buildBody() {
    return TabBarView(
      children: [
        Dashboard(),
        _chart1(),
        _chart2(),
      ],
    );
  }

  dashboard() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 18,
            ),
            Container(
              child: AspectRatio(
                aspectRatio: 1,
                child: FlChart(
                  chart: PieChart(
                    PieChartData(
                        pieTouchData: PieTouchData(
                            touchResponseStreamSink:
                                pieTouchedResultStreamController.sink),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 70,
                        sections: showingSections),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 24.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Indicator(
                    color: Color(0xff0293ee),
                    text: "Impact Explorer",
                    isSquare: true,
                  ),
                  Indicator(
                    color: Color(0xfff8b250),
                    text: "Bi-Kay Time management",
                    isSquare: true,
                  ),
                  Indicator(
                    color: Color(0xff845bef),
                    text: "Bi-Kay internal",
                    isSquare: true,
                  ),
                  Indicator(
                    color: Color(0xff13d38e),
                    text: "NSSF",
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  // Indicator(
                  //   color: Color(0xff13d38e),
                  //   text: "Fifth",
                  //   isSquare: true,
                  // ),
                  // Indicator(
                  //   color: Color(0xff13d38e),
                  //   text: "Sixth",
                  //   isSquare: true,
                  // ),
                  // Indicator(
                  //   color: Color(0xff13d38e),
                  //   text: "Seventh",
                  //   isSquare: true,
                  // ),
                ],
              ),
            ),
            SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

  _chart1() {
    return Container(
      child: dashboard(),
    );
  }

  _chart2() {
    return Container(
      child: dashboard(),
    );
  }
}
