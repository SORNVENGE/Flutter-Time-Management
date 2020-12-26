import 'package:flutter/material.dart';
import 'package:mobile_timesheet_makara_venge/src/model/model_project.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/loginscreen.dart';
import 'new_project_screen.dart';
import 'widgets/my_project_tab.dart';
import 'filter_screen.dart';

class ProjectScreen extends StatefulWidget {
  final Project project;
  ProjectScreen({this.project});
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  void initState() {
    model.fetchProject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewProject()));
              },
              child: Icon(Icons.add),
              backgroundColor: Color(0xff314573)),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        '  Project Screen',
        style: TextStyle(color: Color(0xff314573), fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          onPressed: () {
            print("searching");
          },
        )
      ],
      bottom: TabBar(
        tabs: [
          Padding(
            child: Text(
              "MY PROJECTS",
              style: TextStyle(color: Color(0xff2D9ED8), fontSize: 16),
            ),
            padding: EdgeInsets.all(10),
          ),
          Padding(
            child: Text(
              "ALL PROJECTS",
              style: TextStyle(color: Color(0xff2D9ED8), fontSize: 16),
            ),
            padding: EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }

  _buildBody() {
    return TabBarView(
      children: [MyProject(), _buildListAllProject()],
    );
  }

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

  Widget _buildListAllProject() {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: <Widget>[
          allProject(),
          Expanded(
            child: buildListProject(),
          )
        ],
      ),
    );
  }

  allProject() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilterScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 0.0, 0.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.format_list_numbered_rtl,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "FILTERS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color(0xff314573)),
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
