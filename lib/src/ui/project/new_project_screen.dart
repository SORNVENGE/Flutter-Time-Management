import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_timesheet_makara_venge/src/widget/master.dart';
import 'package:intl/intl.dart';

class NewProject extends StatefulWidget {
  @override
  _NewProjectState createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  TextEditingController textEditTechnologyController =
      new TextEditingController();
  TextEditingController textEditDescriptionController =
      new TextEditingController();
  TextEditingController textEditProjectManagerController =
      new TextEditingController();
  TextEditingController textEditGitlabBoardController =
      new TextEditingController();
  TextEditingController textEditCustomerController =
      new TextEditingController();
  TextEditingController textEditEmailController = new TextEditingController();
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());

  Widget _buildTextFieldTechnology() {
    return IputTextField.buildTextField(
        labelText: 'Technology',
        hintText: 'Name',
        textEditController: textEditTechnologyController);
  }

  Widget _buildTextFieldDescription() {
    return IputTextField.buildTextField(
        labelText: 'Description',
        hintText: 'Name',
        textEditController: textEditDescriptionController);
  }

  Widget _buildTextFieldProjectManager() {
    return IputTextField.buildTextField(
        labelText: 'Project Manager',
        hintText: 'Ex: Antoine',
        textEditController: textEditProjectManagerController);
  }

  Widget _buildTextFieldGitlabBoard() {
    return IputTextField.buildTextField(
        labelText: 'Gitlab Board',
        hintText: 'https://gitlab.com/example',
        textEditController: textEditGitlabBoardController);
  }

  Widget _buildTextFieldCustomer() {
    return IputTextField.buildTextField(
        labelText: 'Customer',
        hintText: 'Ex: Victoria',
        textEditController: textEditCustomerController);
  }

  Widget _buildTextFieldEmail() {
    return IputTextField.buildTextField(
        labelText: 'Email',
        hintText: 'example@gmail.com',
        textEditController: textEditCustomerController);
  }

  Widget _buildDrowpDownListTechnology() {
    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              "Technology",
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          _technology(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: _buildBody(),
      ),
    );
  }

  static DateTime datetime = DateTime.now();
  String startDate = "Start Date";
  String endDate = "End Date";

  var _technologies = [
    'Word press',
    'Laravel',
    'React Native',
    'Flutter',
    'Ruby on Rail',
    '.Net'
  ];
  var _currentSelectedItem = 'Flutter';

  _buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: const Text(
        'New Project',
        style: TextStyle(color: Color(0xff314573), fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.done,
            color: Color(0xff314573),
            size: 32,
          ),
          onPressed: () {
            print("searching");
          },
        )
      ],
    );
  }

  _buildBody() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Description",
            style: TextStyle(
                color: Color(0xff314573),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        _description(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Dates",
            style: TextStyle(
                color: Color(0xff314573),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        _dates(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Tasks",
            style: TextStyle(
                color: Color(0xff314573),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        _tasks(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Team",
            style: TextStyle(
                color: Color(0xff314573),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, bottom: 15),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 48,
                      color: Color(0xff314573),
                    ),
                    Text("Victoria")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 48,
                      color: Color(0xff314573),
                    ),
                    Text("Veng E")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 48,
                      color: Color(0xff314573),
                    ),
                    Text("Veng E")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 48,
                      color: Color(0xff314573),
                    ),
                    Text("Veng E")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 48,
                      color: Color(0xff314573),
                    ),
                    Text("Makara")
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  _description() {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: <Widget>[
          _buildTextFieldTechnology(),
          SizedBox(height: 8),
          _buildTextFieldDescription(),
          SizedBox(height: 8),
          // _buildDrowpDownListTechnology(),
          // SizedBox(
          //   height: 8,
          // ),
          _buildTextFieldProjectManager(),
          SizedBox(height: 8),
          _buildTextFieldGitlabBoard(),
          SizedBox(height: 8),
          _buildTextFieldCustomer(),
          SizedBox(
            height: 8,
          ),
          _buildTextFieldEmail()
        ],
      ),
    );
  }

  _dates() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: RaisedButton(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Start Date: ${(datetime)}",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Icon(
                      Icons.calendar_today,
                      color: Color(0xff314573),
                    )
                  ],
                )),
            onPressed: () {
              _selectDate(context);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: RaisedButton(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "End Date: ${(datetime)}",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Icon(
                      Icons.calendar_today,
                      color: Color(0xff314573),
                    )
                  ],
                )),
            onPressed: () {
              _selectDate(context);
            },
          ),
        )
      ],
    );
  }

  _tasks() {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Text("Installation", style: TextStyle(fontSize: 16)),
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
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4)
                          ],
                          textAlign: TextAlign.center,
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
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Text("Development", style: TextStyle(fontSize: 16)),
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
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4)
                          ],
                          textAlign: TextAlign.center,
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
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Text("Management", style: TextStyle(fontSize: 16)),
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
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4)
                          ],
                          textAlign: TextAlign.center,
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
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Text("Meeting", style: TextStyle(fontSize: 16)),
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
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4)
                          ],
                          textAlign: TextAlign.center,
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
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Text("Testing", style: TextStyle(fontSize: 16)),
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
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4)
                          ],
                          textAlign: TextAlign.center,
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
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Text("Support", style: TextStyle(fontSize: 16)),
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
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4)
                          ],
                          textAlign: TextAlign.center,
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
        ),
      ],
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: datetime,
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    if (picked != null && picked != datetime) {
      setState(() {
        datetime = picked;
      });
    }
  }

  _technology() {
    return Expanded(
      // padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: DropdownButton<String>(
        items: _technologies.map((String dropDownItem) {
          return DropdownMenuItem<String>(
            child: Text(dropDownItem),
            value: dropDownItem,
          );
        }).toList(),
        onChanged: (String newValueSelected) {
          setState(() {
            this._currentSelectedItem = newValueSelected;
          });
        },
        value: _currentSelectedItem,
      ),
    );
  }
}
