import 'package:flutter/material.dart';
import 'package:mobile_timesheet_makara_venge/src/model/model_project.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/loginscreen.dart';
import 'package:percent_indicator/percent_indicator.dart';

String selection;
enum String { pinToDashBoard, edit, complete, delete }

class MyProject extends StatefulWidget {
  @override
  _MyProjectState createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  Widget buildListProject() {
    return FutureBuilder<List<Project>>(
        future: model.fetchProject(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView(
            children: snapshot.data
                .map((Project project) => CardProject(
                      project: project,
                    ))
                .toList(),
          );
        });
  }

  @override
  void initState() {
    model.fetchProject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildListProject();
  }
}

class CardProject extends StatefulWidget {
  final Project project;
  CardProject({this.project});
  @override
  _CardProjectState createState() => _CardProjectState();
}

class _CardProjectState extends State<CardProject> {
  Widget cardProject() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Card(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: InkWell(
              onTap: () {
                print("Cart selected");
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 14),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.work,
                                color: Color(0xff2D9ED8),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                widget.project.project,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuButton<String>(
                          onSelected: (String result) {
                            setState(() {
                              selection = result;
                              print(selection);
                            });
                          },
                          icon: Icon(
                            Icons.more_vert,
                            size: 24,
                          ),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: String.edit,
                              child: Text('Edit'),
                            ),
                            const PopupMenuItem<String>(
                              value: String.complete,
                              child: Text(
                                'Complete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 14),
                    Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Text(widget.project.contact_id.toString() +
                          "% " +
                          "Complete"),
                    ),
                    SizedBox(height: 12),
                    LinearPercentIndicator(
                      lineHeight: 9.0,
                      percent: 0.9,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      progressColor: Color(0xff2D9ED8),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return cardProject();
  }
}
