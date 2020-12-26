import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_timesheet_makara_venge/src/model/model_time_leave.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/homescreen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/loginscreen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/time/timescreen.dart';

class NewDayOffScreen extends StatefulWidget {
  @override
  _NewDayOffScreenState createState() => _NewDayOffScreenState();
}

class _NewDayOffScreenState extends State<NewDayOffScreen> {
  List<String> leaveType = ["Legal Leaves", "Extra work", "Absence"];
  int selectedLeaveType;
  String startDate = 'Start Date';
  String endDate = 'End Date   ';
  DateTime now = DateTime.now();
  TimeOfDay currentTime;
  String timeStartDate = "8:00 AM";
  String timeEndDate = "5:00 PM";
  GlobalKey<ScaffoldState> globalKey = new GlobalKey();
  TextEditingController commentTextEditController = new TextEditingController();

  addLeaveRqeust(BuildContext context) {
    if (startDate == "Start Date" ||
        endDate == "End Date   " ||
        commentTextEditController.text == "") {
      globalKey.currentState.showSnackBar(SnackBar(
          duration: Duration(milliseconds: 1000),
          behavior: SnackBarBehavior.floating,
          content: new Text("Please Select Your Date Time!")));
      return;
    }
    ModelTimeLeave objTimeLeave = new ModelTimeLeave();
    objTimeLeave.dateStart = startDate + " " + timeStartDate;
    objTimeLeave.dateEnd = endDate + " " + timeEndDate;
    objTimeLeave.comment = commentTextEditController.text;
    objTimeLeave.absenceTypeId = selectedLeaveType;
    model.postTimeLeave(objTimeLeave, (msgError) {
      globalKey.currentState.showSnackBar(SnackBar(
          duration: Duration(milliseconds: 1000),
          behavior: SnackBarBehavior.floating,
          content: new Text(msgError)));

      if (msgError == "Success") {
        Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Leave Request",
                style: TextStyle(
                    fontFamily: 'oswal',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.black)),
            IconButton(
              icon: Icon(Icons.check),
              color: Colors.black,
              onPressed: () => addLeaveRqeust(context),
            )
          ],
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildStartDate() {
    return Row(children: [
      Container(
          height: 50.0,
          margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color(0xFFE5E5E5),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: InkWell(
            onTap: () {
              _showDateTimePicker('startDate');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(startDate,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'oswal',
                        color: Colors.black)),
                SizedBox(
                  width: 10.0,
                ),
                InkWell(
                  onTap: () {
                    _showDateTimePicker('startDate');
                  },
                  child: Icon(
                    Icons.calendar_today,
                    size: 27,
                    color: Color(0xFF314573),
                  ),
                )
              ],
            ),
          )),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                height: 50.0,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Row(
                  children: <Widget>[
                    Text(timeStartDate,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'oswal',
                            color: Colors.black)),
                    SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      onTap: () {
                        _selectTime(context, 'startDate');
                      },
                      child: Icon(
                        Icons.access_time,
                        size: 27,
                        color: Color(0xFF314573),
                      ),
                    )
                  ],
                )),
          ],
        ),
      )
    ]);
  }

  Widget _buildEndDate() {
    return Row(children: [
      Container(
          height: 50.0,
          margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 15.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color(0xFFE5E5E5),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: InkWell(
            onTap: () {
              _showDateTimePicker('endDate');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(endDate,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'oswal',
                        color: Colors.black)),
                SizedBox(
                  width: 10.0,
                ),
                InkWell(
                  onTap: () {
                    _showDateTimePicker('endDate');
                  },
                  child: Icon(
                    Icons.calendar_today,
                    size: 27,
                    color: Color(0xFF314573),
                  ),
                )
              ],
            ),
          )),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                height: 50.0,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Row(
                  children: <Widget>[
                    Text(timeEndDate,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'oswal',
                            color: Colors.black)),
                    SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      onTap: () {
                        _selectTime(context, 'endDate');
                      },
                      child: Icon(
                        Icons.access_time,
                        size: 27,
                        color: Color(0xFF314573),
                      ),
                    )
                  ],
                )),
          ],
        ),
      )
    ]);
  }

  Widget _buildComment() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Comments",
            style: TextStyle(
                fontFamily: 'oswal',
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0, top: 10.0),
            decoration: BoxDecoration(
              color: Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: new TextField(
                controller: commentTextEditController,
                maxLines: 6,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  hintText: 'Comment here',
                )),
          )
        ],
      ),
    );
  }

  Widget _buildDrowpLoadListLeaveRequest() {
    return Container(
      height: 70.0,
      padding: EdgeInsets.only(right: 27.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text("Type",
                style: TextStyle(
                    fontFamily: 'oswal', fontSize: 19.0, color: Colors.black)),
          ),
          Container(
            child: DropdownButton(
              hint: Text('Select Leave type',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'oswal',
                      fontSize: 18.0,
                      color: Colors.black)),
              // Not necessary for Option 1
              value: selectedLeaveType,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'oswal',
                  fontSize: 18.0,
                  color: Colors.black),
              onChanged: (newValue) {
                setState(() {
                  selectedLeaveType = newValue;
                });
              },
              items: model.lstAbsenceType.map((location) {
                return DropdownMenuItem(
                  child: new Text(location.name),
                  value: location.id,
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitleLeaveRequest() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(12, 20, 20, 20),
          child: Text(
            "Dates & Hours",
            style: TextStyle(
                fontSize: 18.0, fontFamily: 'oswal', color: Colors.black),
          ),
        ),
      ],
    ));
  }

  _buildBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: ListView(
        children: <Widget>[
          _buildDrowpLoadListLeaveRequest(),
          _buildTitleLeaveRequest(),
          Container(
            child: Column(
              children: <Widget>[
                //  start date

                //Start Date
                _buildStartDate(),
                SizedBox(
                  height: 10.0,
                ),
                //  end date
                _buildEndDate(),
                //  comments
                _buildComment()
              ],
            ),
          )
        ],
      ),
    );
  }

  _showDateTimePicker(String date) async {
    DateTime selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2021),
    );
    print(selected);
    if (selected == null) {
      return;
    }

    setState(() {
      if (date == 'startDate') {
        startDate = DateFormat("yyyy-MM-dd").format(selected);
      } else {
        endDate = DateFormat("yyyy-MM-dd").format(selected);
      }
    });
  }

  Future<Null> _selectTime(BuildContext context, String startOrEndDate) async {
    String convertTimeStartDate;
    String convertTimeEndDate;
    int totalTime;
    String timeSheet;
    TimeOfDay timeThatSelected =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (timeThatSelected != null && timeThatSelected != currentTime) {
      DateTime fullTime = DateTime(now.year, now.month, now.day,
          timeThatSelected.hour, timeThatSelected.minute);
      if (fullTime.hour > 12) {
        totalTime = fullTime.hour - 12;
        timeSheet = ' PM';
      } else {
        totalTime = fullTime.hour;
        timeSheet = ' AM';
      }
      if (startOrEndDate == 'startDate') {
        convertTimeStartDate = DateFormat("h:mm").format(fullTime);
        setState(() {
          timeStartDate = convertTimeStartDate + timeSheet;
        });
      } else if (startOrEndDate == 'endDate') {
        convertTimeEndDate = DateFormat("h:mm").format(fullTime);
        setState(() {
          timeEndDate = convertTimeEndDate + timeSheet;
        });
      }
      print(timeStartDate);
    }
  }
}
