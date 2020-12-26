import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mobile_timesheet_makara_venge/src/model/model_task_by_project.dart';
import 'package:mobile_timesheet_makara_venge/src/model/model_time_sheets.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/homescreen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/loginscreen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/time/timescreen.dart';
import 'package:mobile_timesheet_makara_venge/src/widget/maininterface.dart';
import 'package:mobile_timesheet_makara_venge/src/widget/master.dart';

class NewWorkHourScreen extends StatefulWidget {
  @override
  _NewWorkHourScreenState createState() => _NewWorkHourScreenState();
}

class _NewWorkHourScreenState extends State<NewWorkHourScreen> {
  GlobalKey<ScaffoldState> globalKey = new GlobalKey();

  String selectedProjectName; // Option 2

  DateTime now = DateTime.now();
  String currentDate = '';
  bool obscured = true;
  final formKey = new GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  initState() {
    currentDate = DateFormat("yyyy-MM-dd").format(now).toString();
    super.initState();
  }

  List<Task> _lstTask = [];

  addNewTask(Task objTask) {
    _lstTask.add(objTask);
  }

  addNewTimeHour(BuildContext context) {
    if (selectedProjectName == null) {
      ShowSnackBar.showSnackBarMsging("Please Select Project Name!", globalKey);
      return;
    }
    if (g_lstTask.length == 0) {
      ShowSnackBar.showSnackBarMsging("Please Input Task!", globalKey);
      return;
    }

    Timesheet objTimesHour = new Timesheet();
    objTimesHour.dates = currentDate.toString();
    objTimesHour.projectId = int.parse(selectedProjectName);
    objTimesHour.tasks = g_lstTask;
    model.postTimeSheet(objTimesHour, (msgError) {
      ShowSnackBar.showSnackBarMsging(msgError, globalKey);
      if (msgError == "Success") {
        Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      }
      textTimeHour.text = "";
      g_lstTask.clear();
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
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Hours",
                style: TextStyle(
                    fontFamily: 'oswal',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.black)),
            IconButton(
                onPressed: () {
                  addNewTimeHour(context);
                },
                icon: Icon(Icons.check))
          ],
        ),
      ),
      body: _buildBody(),
    );
  }

  _showDateTimePicker() async {
    try {
      DateTime selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2021),
      );
      if (selected == null) {
        return null;
      }
      setState(() {
        currentDate = DateFormat("yyyy-MM-dd").format(selected);
      });
    } catch (error) {
      print(error);
    }
  }

  Widget _buildListTaskListTimeHour() {
    return FutureBuilder<List<ModelTaskByProject>>(
      future: model.fetchTaskByProject(selectedProjectName),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: Text("Please Select Project"));
        return ListView(
          children: snapshot.data
              .map((ModelTaskByProject modelTaskByProject) => Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: CardTaskHour(
                    taskByProject: modelTaskByProject,
                  )))
              .toList(),
        );
      },
    );
  }

  Widget _buildDropdownListProject() {
    return Container(
      child: DropdownButton(
        hint: Text('Select project name',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'oswal',
                fontSize: 18.0,
                color: Colors.black)),
        // Not necessary for Option 1
        value: selectedProjectName,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'oswal',
            fontSize: 18.0,
            color: Colors.black),
        onChanged: (newValue) {
          setState(() {
            selectedProjectName = newValue;
          });
        },
        items: model.lstProject.map((location) {
          return DropdownMenuItem(
            child: new Text(location.project),
            value: location.project_id,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTitleProject() {
    return Container(
      child: Text("Project",
          style: TextStyle(
              fontFamily: 'oswal', fontSize: 20.0, color: Colors.black)),
    );
  }

  Widget _buildDateFilter() {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 70.0,
            height: 40.0,
            child: Row(
              children: <Widget>[
                Text('Date',
                    style: TextStyle(
                        fontFamily: 'oswal',
                        fontSize: 20.0,
                        color: Colors.black))
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentDate,
                    style: TextStyle(
                        fontFamily: 'oswal',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black))
              ],
            ),
          ),
          Container(
            width: 40.0,
            height: 50.0,
            child: InkWell(
              onTap: () {
                _showDateTimePicker();
              },
              child: Icon(
                Icons.calendar_today,
                size: 21.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleTask() {
    return //Tasks
        Container(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Tasks",
          style: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'oswal',
              color: Color(0xFF2D9ED8)),
        ),
      ],
    ));
  }

  Widget _buildBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 10.0),
      child: ListView(
        children: <Widget>[
          Container(
            height: 70.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildTitleProject(),
                _buildDropdownListProject(),
              ],
            ),
          ),
          _buildDateFilter(),
          SizedBox(
            height: 20.0,
          ),
          _buildTitleTask(),
          SizedBox(
            height: 20.0,
          ),

          Container(
            height: 500,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: _buildListTaskListTimeHour(),
            ),

            // child: _buildListTaskListTimeHour(),
          )

          //Development
        ],
      ),
    );
  }
}

class CardTaskHour extends StatefulWidget {
  final ModelTaskByProject taskByProject;

  CardTaskHour({this.taskByProject});

  @override
  _CardTaskHourState createState() => _CardTaskHourState();
}

TextEditingController textTimeHour = new TextEditingController();

class _CardTaskHourState extends State<CardTaskHour> {
  Widget _buildCardTaskHour() {
    return Container(
      margin: EdgeInsets.only(left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child:
                Text(widget.taskByProject.name, style: TextStyle(fontSize: 16)),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 34,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: TextField(
                      decoration: InputDecoration(border: InputBorder.none),
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(4)],
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        Task objTask = new Task(
                            numberTime: int.parse(value),
                            taskId: widget.taskByProject.id);
                        if (g_lstTask.length > 0) {
                          if (g_lstTask
                                  .where((element) =>
                                      element.taskId == widget.taskByProject.id)
                                  .length >
                              0) {
                            if (value == "0" || value == "") {
                              g_lstTask.removeWhere((element) =>
                                  element.taskId == widget.taskByProject.id);
                            } else {
                              g_lstTask
                                  .firstWhere((element) =>
                                      element.taskId == widget.taskByProject.id)
                                  .numberTime = int.parse(value);
                            }
                          } else {
                            g_lstTask.add(objTask);
                          }
                        } else {
                          g_lstTask.add(objTask);
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color(0xff2D9ED8),
                    alignment: Alignment.center,
                    height: 34,
                    child: Text(
                      "hours",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCardTaskHour();
  }
}
