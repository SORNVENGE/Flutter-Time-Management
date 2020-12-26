import 'dart:convert';
import 'dart:io';
import 'package:mobile_timesheet_makara_venge/src/model/mode_fetch_leave_absence.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/loginscreen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as Http;

mixin ConnectedLeaveAbsence on Model {
  List<ModelFetchLeaveAbsenc> listAbsence = [];
}
mixin LeaveAbsenceModel on ConnectedLeaveAbsence {
  List<ModelFetchLeaveAbsenc> get lstAbsence {
    return listAbsence;
  }

  Future<List<ModelFetchLeaveAbsenc>> fetchTLeaveAbsence() async {
    try {
      notifyListeners();
      List<ModelFetchLeaveAbsenc> _lstAbsence = [];
      var responses = await Http.get(
          "http://timemanagement-stage.s7.bi-kay.com/api/me/absence",
          headers: {
            "Authorization": model.authLogin.access_token,
            HttpHeaders.contentTypeHeader: 'application/json',
            "callMethod": "DOCTOR_AVAILABILITY"
          });
      var responseBody = json.decode(responses.body);
      List absenceRequestData = responseBody['absences'];
      _lstAbsence = absenceRequestData
          .map((e) => ModelFetchLeaveAbsenc.fromJson(e))
          .toList();
      return _lstAbsence;
    } catch (error) {
      print({"error": error});
      throw error;
    }
  }
}
