import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: const Text(
        'Filters',
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
            print("done");
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
            "Status",
            style: TextStyle(
                color: Color(0xff314573),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        _status(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Technology",
            style: TextStyle(
                color: Color(0xff314573),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        _technology(),
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
            "Team",
            style: TextStyle(
                color: Color(0xff314573),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        _teams(),
        SizedBox(height: 16.0,),
        _btnRestoreDefault(),
      ],
    );
  }

  _status() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RadioListTile(
          groupValue: selectedRadioTile,
          title: Text("All"),
          onChanged: (value) {
            setSelectedRadioTile(value);
          },
          value: 1,
        ),
        RadioListTile(
          groupValue: selectedRadioTile,
          title: Text("Not Started"),
          onChanged: (value) {
            setSelectedRadioTile(value);
          },
          value: 2,
        ),
        RadioListTile(
          groupValue: selectedRadioTile,
          title: Text("Active"),
          onChanged: (value) {
            setSelectedRadioTile(value);
          },
          value: 3,
        ),
        RadioListTile(
          groupValue: selectedRadioTile,
          title: Text("Completed"),
          onChanged: (value) {
            setSelectedRadioTile(value);
          },
          value: 4,
        ),
      ],
    );
  }

  _technology() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RadioListTile(
          groupValue: selectedRadioTile,
          title: Text("Word Press"),
          onChanged: (value) {
            setSelectedRadioTile(value);
          },
          value: 5,
        ),
        RadioListTile(
          groupValue: selectedRadioTile,
          title: Text("Laravel"),
          onChanged: (value) {
            setSelectedRadioTile(value);
          },
          value: 6,
        ),
        RadioListTile(
          groupValue: selectedRadioTile,
          title: Text("React Native"),
          onChanged: (value) {
            setSelectedRadioTile(value);
          },
          value: 7,
        ),
        RadioListTile(
          groupValue: selectedRadioTile,
          title: Text("Ruby On Rail"),
          onChanged: (value) {
            setSelectedRadioTile(value);
          },
          value: 8,
        ),
        RadioListTile(
          groupValue: selectedRadioTile,
          title: Text("Flutter"),
          onChanged: (value) {
            setSelectedRadioTile(value);
          },
          value: 9,
        ),
        RadioListTile(
          groupValue: selectedRadioTile,
          title: Text(".Net"),
          onChanged: (value) {
            setSelectedRadioTile(value);
          },
          value: 10,
        ),
      ],
    );
  }

  String startDate = "Start Date";
  String endDate = "End Date";
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

  static DateTime datetime = DateTime.now();
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

  var _team = [
    'Kongsun,Antoine,Veng E',
    'Vitoria, Noun, Soheng',
    'Penh, Nano, Sopharuth'
  ];
  var _currentTeamSelected = 'Penh, Nano, Sopharuth';
  _teams() {
    return Container(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: DropdownButton<String>(
        items: _team.map((String dropDownItem) {
          return DropdownMenuItem<String>(
            child: Text(dropDownItem),
            value: dropDownItem,
          );
        }).toList(),
        onChanged: (String newValueSelected) {
          setState(() {
            this._currentTeamSelected = newValueSelected;
          });
        },
        value: _currentTeamSelected,
      ),
    );
  }

  _btnRestoreDefault() {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Text(
          "RESTORE DEFAULT",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {},
    );
  }
}
