import 'dart:async';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'indicator.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<PieChartSectionData> pieChartRawSections;
  List<PieChartSectionData> showingSections;

  StreamController<PieTouchResponse> pieTouchedResultStreamController;

  int touchedIndex;


  @override
  void dispose() {
    super.dispose();
    pieTouchedResultStreamController.close();
    tabController.dispose();
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
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

  Widget getTabBar() {
    return TabBar(
        controller: tabController,
        tabs: [
          Tab(text: "Week"),
          Tab(text: "Month"),
          Tab(text: "Year"),
        ],
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: new BubbleTabIndicator(
          indicatorHeight: 32.0,
          indicatorColor: Color(0xff2D9ED8),
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
        ));
  }

  Widget getTabBarPages() {
    return TabBarView(
      controller: tabController,
      children: <Widget>[
        dashboard(),
        dashboard(),
        Container(color: Colors.white)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: SafeArea(
            child: getTabBar(),
          ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        ),
        body: getTabBarPages());
  }

  dashboard() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
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

}
