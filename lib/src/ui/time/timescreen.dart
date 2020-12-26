import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:intl/intl.dart';
import 'package:mobile_timesheet_makara_venge/src/model/model_fetch_timeSheet.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/loginscreen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/time/new_work_hour_screen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/time/new_day_off_screen.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class TimeScreen extends StatefulWidget {
  bool isFloatingBottonClick = false;

  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  String time_select =
      DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();

  @override
  void initState() {
    model.fetchProject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody(), floatingActionButton: _buildFloatingBottom());
  }

  Widget _buildFloatingBottom() {
    return SpeedDial(child: Icon(Icons.add), children: [
      SpeedDialChild(
          child: Icon(Icons.update),
          label: "Work Hour",
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => NewWorkHourScreen()));
          }),
      SpeedDialChild(
          child: Icon(Icons.av_timer),
          label: "Leave Request",
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => NewDayOffScreen()));
          })
    ]);
  }

  Widget _buildBody() {
    var heightScreen = MediaQuery.of(context).size.height;
    return Container(
      height: heightScreen,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: ListView(
        children: <Widget>[
          _buildDateFilter(),
          Container(height: 450.0, child: buildListTimeSheetHour(time_select))
        ],
      ),
    );
  }

  Widget buildListTimeSheetHour(String tm) {
    return FutureBuilder<List<ModelFetchTimesheet>>(
        future: model.fetchTimeSheets(tm),
        builder: (context, snapshot) {
          if (!snapshot.hasData || model.isLoading == true)
            return Center(child: CircularProgressIndicator());
          return ListView(
            children: snapshot.data
                .map((ModelFetchTimesheet project) => Container(
                    margin: const EdgeInsets.all(8.0),
                    child: SheetTimeWorkHourCard(
                      time: project,
                    )))
                .toList(),
          );
        });
  }

  Widget _buildDateFilter() {
    return Container(
      height: 160.0,
      width: MediaQuery.of(context).size.width,
      child: Calendar(
          onSelectedRangeChange: (range) =>
              print("Range is {range.item1}, {range.item2}"),
          onDateSelected: (date) {
            handleThisScreenCalendar(date);
            setState(() {
              time_select = DateFormat("yyyy-MM-dd").format(date).toString();
            });
          }),
    );
  }

  void handleThisScreenCalendar(date) {
    print("handleThisScreenCalendar ${date}");
  }
}

class SheetTimeWorkHourCard extends StatefulWidget {
  final ModelFetchTimesheet time;
  SheetTimeWorkHourCard({this.time});
  @override
  _SheetTimeWorkHourCardState createState() => _SheetTimeWorkHourCardState();
}

class _SheetTimeWorkHourCardState extends State<SheetTimeWorkHourCard> {
  Widget _buildEachItem() {
    return Container(
      height: 100.0,
      padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(child: Text(widget.time.project.project)),
          ),
          Expanded(
            child: Text(widget.time.project.projectType),
          ),
          Expanded(
            child: Text(widget.time.task.name +
                "-" +
                widget.time.numberTime.toString() +
                "h"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildEachItem();
  }
}
