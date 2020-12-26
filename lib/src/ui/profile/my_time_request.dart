import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/loginscreen.dart';

class MyTimeRequestScreen extends StatefulWidget {
  @override
  _MyTimeRequestScreenState createState() => _MyTimeRequestScreenState();
}

class _MyTimeRequestScreenState extends State<MyTimeRequestScreen> {
  @override
  void initState() {
    model.fetchTimeSheets(DateFormat("yyyy-MM-dd").format(DateTime.now()).toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Profile",
          style: TextStyle(
              fontFamily: 'oswal',
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color(0xFF314573)),
        ),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: <Widget>[
          //icon and name
          Container(
            color: Color(0xFFC3D7F3),
            padding: EdgeInsets.only(bottom: 30.0),
            child: Column(
              children: <Widget>[
                //Icon and Name
                Container(
                  height: 120.0,
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 80,
                        ),
                      ),
                      Expanded(
                          // padding: EdgeInsets.only(left: 15.0),
                          child: Text("Mr Antoine CALDAGUES",
                              style: TextStyle(
                                  fontFamily: 'oswal',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xFF314573)))),
                    ],
                  ),
                ),
                //TextField
                Container(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Position',
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Manager',
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          //date
           Container(
            height: 300.0,
            padding: EdgeInsets.only(left: 25.0),
            child: Column(
              children: <Widget>[
                //date type status
                Container(
                  height: 50.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Dates",
                          style: TextStyle(
                              fontFamily: 'oswal',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF314573)),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Type",
                          style: TextStyle(
                              fontFamily: 'oswal',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF314573)),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Status",
                          style: TextStyle(
                              fontFamily: 'oswal',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF314573)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "16/07/19",
                          style: TextStyle(
                            fontFamily: 'oswal',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Absence",
                          style: TextStyle(
                            fontFamily: 'oswal',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Approved",
                          style: TextStyle(
                            fontFamily: 'oswal',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 10.0,
                ),
                Container(
                  height: 50.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "24/079/19",
                              style: TextStyle(
                                fontFamily: 'oswal',
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "24/079/19",
                              style: TextStyle(
                                fontFamily: 'oswal',
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Legal Leave",
                          style: TextStyle(
                            fontFamily: 'oswal',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "On Hold",
                              style: TextStyle(
                                fontFamily: 'oswal',
                                fontSize: 18,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/newDayOffScreen');
                              },
                              child: Container(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Icon(
                                    Icons.edit,
                                    color: Color(0xFF314573),
                                    size: 26,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(
                  color: Colors.black,
                  height: 10.0,
                ),

                Container(
                  height: 50.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "16/07/19",
                          style: TextStyle(
                            fontFamily: 'oswal',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Legal Leave",
                          style: TextStyle(
                            fontFamily: 'oswal',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Rejected",
                          style: TextStyle(
                            fontFamily: 'oswal',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.only(right: 30.0, bottom: 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Remaining legal leave",
                            style: TextStyle(fontSize: 16)),
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
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
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
            ),
          ),
          //Remaining legal leave
        ],
      ),
    );
  }
}
