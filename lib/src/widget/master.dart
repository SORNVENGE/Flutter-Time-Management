import 'package:flutter/material.dart';

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class ShowSnackBar {
  static showSnackBarMsging(String msg, GlobalKey<ScaffoldState> globalKey) {
    globalKey.currentState.showSnackBar(SnackBar(
        duration: Duration(milliseconds: 1000),
        behavior: SnackBarBehavior.floating,
        content: new Text(msg)));
  }
}

class IputTextField {
  static Widget buildTextField(
      {String labelText,
      String hintText,
      TextEditingController textEditController}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: textEditController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: labelText,
                hintText: hintText),
          ),
        )
      ],
    );
  }

  static Widget buildTextFormFieldWithIcon(
      {TextAlign align = TextAlign.start,
      EdgeInsetsGeometry padding,
      String label,
      bool autoValidate = false,
      bool validator = true,
      TextEditingController controller,
      Widget leading,
      void Function(String) onSaved,
      void Function(String) onValidate,
      bool isPassword = true}) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        autovalidate: autoValidate,
        controller: controller,
        validator: onValidate,
        textAlign: align,
        textDirection: TextDirection.ltr,
        scrollPadding: EdgeInsets.zero,
        obscureText: isPassword,
        onSaved: onSaved,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          labelText: label,
          prefixIcon: leading,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}

class Buttom {
  static FlatButton buildFlatButtom(
      {Function onPress, String title, Color color, TextStyle titleStyle}) {
    return FlatButton(
      child: Text(
        title,
        style: titleStyle,
      ),
      color: color,
      onPressed: onPress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }
}

class SweetAlert {
  static show(BuildContext context,
      {Function cancel,
      double width,
      double height,
      Function ok,
      Image image,
      String content,
      String title}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: width,
              height: height,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.yellow)),
                    child: Center(
                      child: Icon(
                        Icons.report_problem,
                        color: Colors.blue,
                        size: 70,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      content,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                              width: 150,
                              child: Buttom.buildFlatButtom(
                                  onPress: cancel,
                                  title: 'Cancel',
                                  color: hexToColor('#999B9A'),
                                  titleStyle: TextStyle(color: Colors.white))),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 150,
                            child: Buttom.buildFlatButtom(
                                onPress: ok,
                                title: 'Ok',
                                color: hexToColor('#7DC289'),
                                titleStyle: TextStyle(color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
