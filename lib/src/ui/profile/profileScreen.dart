import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_timesheet_makara_venge/src/model/mode_fetch_leave_absence.dart';
import 'package:mobile_timesheet_makara_venge/src/model/model_user_profile.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/loginscreen.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/time/new_day_off_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isClickOnTimeRequest = false;
  @override
  void initState() {
    model.fetchUserProfile();
    model.fetchTLeaveAbsence();
    super.initState();
  }

  Widget _buildProfileUser() {
    return FutureBuilder<List<Profile>>(
        future: model.fetchUserProfile(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView(
            children: snapshot.data
                .map(
                    (Profile profile) => _buildBodyController(profile: profile))
                .toList(),
          );
        });
  }

  Widget _buildBodyController({Profile profile}) {
    TextEditingController emailTextEdit = new TextEditingController();
    TextEditingController phoneTextEdit = new TextEditingController();
    emailTextEdit.text = profile.email;
    phoneTextEdit.text = profile.phone;
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: <Widget>[
          Container(
            height: 50.0,
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 5.0, left: 20.0),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          fontFamily: 'oswal',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xFF314573)),
                    ))
              ],
            ),
          ),
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
                          child: Text(
                              "  " +
                                  profile.name.toUpperCase() +
                                  " " +
                                  profile.givenName.toUpperCase(),
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
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
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
                        controller: emailTextEdit,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextField(
                        controller: phoneTextEdit,
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
            height: 20.0,
          ),

          isClickOnTimeRequest ? SizedBox() : _buildButtonTimeRequest(),
          isClickOnTimeRequest ? _timeAbsence() : SizedBox(),
          // _timeAbsence()
        ],
      ),
    );
  }

  Widget _buildAbsenceController({ModelFetchLeaveAbsenc absence}) {
    return Container(
      child: Column(
        children: [
          Text(
            "Display Absence List",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _timeAbsences() {
    return FutureBuilder<List<ModelFetchLeaveAbsenc>>(
      future: model.fetchTLeaveAbsence(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return ListView(
          children: snapshot.data
              .map((ModelFetchLeaveAbsenc absence) =>
                  _buildAbsenceController(absence: absence))
              .toList(),
        );
      },
    );
  }

  Widget _timeAbsence() {
    return Container(
      height: 400,
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
                        // onTap: () {
                        //   Navigator.of(context).pushNamed('/newDayOffScreen');
                        // },
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewDayOffScreen()));
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
    );
  }

  Widget _buildButtonTimeRequest() {
    return Container(
      height: 50.0,
      // margin: EdgeInsets.only(top: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                isClickOnTimeRequest = !isClickOnTimeRequest;
              });
            },
            child: Container(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
              child: Text(
                "My Time Requests",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF314573)),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildProfileUser());
  }
}
