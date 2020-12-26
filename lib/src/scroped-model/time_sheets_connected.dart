import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:mobile_timesheet_makara_venge/src/model/model_fetch_timeSheet.dart';
import 'package:mobile_timesheet_makara_venge/src/model/model_task_by_project.dart';
import 'package:mobile_timesheet_makara_venge/src/model/model_time_leave.dart';
import 'package:mobile_timesheet_makara_venge/src/model/model_time_sheets.dart';
import 'package:mobile_timesheet_makara_venge/src/model/moodel_absence_type.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/loginscreen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as Http;

mixin ConnectedTimeSheets on Model {
  List<Timesheet> listTimeSheet = [];
  List<ModelAbsenceType> listAbsenceType = [];
  bool isLoading = false;
}
mixin TimeSheetsModel on ConnectedTimeSheets {
  List<Timesheet> get lstTimeSheet {
    return listTimeSheet;
  }

  List<ModelAbsenceType> get lstAbsenceType {
    return listAbsenceType;
  }

  Future<List<ModelAbsenceType>> fetchModelAbsenceType() async {
    try {
      isLoading = true;
      notifyListeners();
      List<ModelAbsenceType> _lstAbsenceType = [];
      var responses = await Http.get(
          "http://timemanagement-stage.s7.bi-kay.com/api/absenceTypes",
          headers: {
            "Authorization": model.authLogin.access_token,
            HttpHeaders.contentTypeHeader: 'application/json',
            "callMethod": "DOCTOR_AVAILABILITY"
          });
      var responseBody = json.decode(responses.body);
      List lstObsenceType = responseBody['absences_types'];
      print({"TypeOf Absence": lstObsenceType});
      _lstAbsenceType =
          lstObsenceType.map((e) => ModelAbsenceType.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
      listAbsenceType = _lstAbsenceType;
      return _lstAbsenceType;
    } catch (error) {
      return error;
    }
  }

  Future<String> postTimeLeave(
      ModelTimeLeave objTimeLeave, void Function(String msg) showError) async {
    isLoading = true;
    notifyListeners();
    try {
      var responses = await Http.post(
          "http://timemanagement-stage.s7.bi-kay.com/api/requestLeave",
          body: json.encode(objTimeLeave),
          headers: {
            "Authorization": model.authLogin.access_token,
            "Content-Type": "application/json",
            "Accept": "application/json"
          });
      var getResponse = json.decode(responses.body);
      switch (responses.statusCode) {
        case 200:
          showError('Success');
          break;
        case 406:
          showError(getResponse['error']);
          break;
      }
      isLoading = false;
      notifyListeners();
      return "Success";
    } catch (error) {
      throw error;
      return error;
    }
  }

  Future<String> postTimeSheet(
      Timesheet objTimesSheet, void Function(String msg) showError) async {
    isLoading = true;
    notifyListeners();
    try {
      var responses = await Http.post(
          "http://timemanagement-stage.s7.bi-kay.com//api/timesheet/task",
          body: json.encode(objTimesSheet.timeSheetToJson()),
          headers: {
            "Authorization": model.authLogin.access_token,
            "Content-Type": "application/json",
            "Accept": "application/json"
          });
      var getResponse = json.decode(responses.body);
      switch (responses.statusCode) {
        case 200:
          showError('Success');
          break;
        case 406:
          showError(getResponse['error']);
          break;
      }
      isLoading = false;
      notifyListeners();
      return "success";
    } catch (error) {
      showError(error);
      isLoading = false;
      notifyListeners();
      return error;
    }
  }

  Future<List<ModelTaskByProject>> fetchTaskByProject(String projectId) async {
    try {
      isLoading = true;
      notifyListeners();
      List<ModelTaskByProject> _lstTaskByProject = [];
      var responses = await Http.get(
          "http://timemanagement-stage.s7.bi-kay.com//api/project/tasks?id=" +
              projectId,
          headers: {
            "Authorization": model.authLogin.access_token,
            HttpHeaders.contentTypeHeader: 'application/json',
            "callMethod": "DOCTOR_AVAILABILITY"
          });
      var responseBody = json.decode(responses.body);
      List lstTask = responseBody['tasks'];
      _lstTaskByProject =
          lstTask.map((e) => ModelTaskByProject.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
      return _lstTaskByProject;
    } catch (error) {
      print(error);
    }
  }

  Future<List<ModelFetchTimesheet>> fetchTimeSheets(String date) async {
    try {
      isLoading = true;
      notifyListeners();
      List<ModelFetchTimesheet> _lstTimeSheet = [];
      var responses = await Http.get(
          "http://timemanagement-stage.s7.bi-kay.com//api/me/timesheet?date=" +
              date,
          headers: {
            "Authorization": model.authLogin.access_token,
            HttpHeaders.contentTypeHeader: 'application/json',
            "callMethod": "DOCTOR_AVAILABILITY"
          });
      var responseBody = json.decode(responses.body);
      List timeSheetData = responseBody['timesheet'];

      _lstTimeSheet =
          timeSheetData.map((e) => ModelFetchTimesheet.fromJson(e)).toList();

      isLoading = false;
      notifyListeners();

      return _lstTimeSheet;
    } catch (error) {
      print({"error": error});
      throw error;
    }
  }
}
