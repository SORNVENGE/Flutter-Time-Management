import 'dart:convert';
import 'dart:io';
import 'package:mobile_timesheet_makara_venge/src/model/model_project.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/loginscreen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as Http;

mixin ConnectedProject on Model {
  List<Project> listProject = [];
  bool isLoading = false;
}
mixin ProjectModel on ConnectedProject {
  List<Project> get lstProject {
    return listProject;
  }

  Future<List<Project>> fetchProject() async {
    isLoading = true;
    notifyListeners();
    List<Project> _lstProject = [];
    print("Access:" + model.authLogin.access_token);
    var responses = await Http.get(
        "http://timemanagement-stage.s7.bi-kay.com/api/projects?offset=2&limit=10",
        headers: {
          "Authorization": model.authLogin.access_token,
          HttpHeaders.contentTypeHeader: 'application/json',
          "callMethod": "DOCTOR_AVAILABILITY"
        });
    var item = json.decode(responses.body);
    var projectData = item['projects'];
    for (var item in projectData) {
      Project objProject = new Project(
          id: item['id'],
          activity_id: item['activity_id'],
          code: item['code'],
          compnay_id: item['company_id'],
          contact_id: item['contact_id'],
          delete_timesheet: item['delete_timesheet'],
          orginization_id: item['organization_id'],
          photo_content_type: item['photo_content_type'],
          photo_file_name: item['photo_file_name'],
          photo_file_size: item['photo_file_size'],
          photo_upload_at: item['photo_updated_at'],
          project: item['project'],
          project_id: item['project_id'],
          project_type: item['project_type'],
          status: item['status'],
          string_content_type: item['string_content_type'],
          string_file_name: item['string_file_name'],
          trial255: item['trial255']);
      _lstProject.add(objProject);
    }

    listProject = _lstProject;
    isLoading = false;
    notifyListeners();
    return listProject;
  }
}
