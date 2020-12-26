import 'dart:convert';
import 'dart:io';
import 'package:mobile_timesheet_makara_venge/src/model/model_user_profile.dart';
import 'package:mobile_timesheet_makara_venge/src/ui/splashscreen/loginscreen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as Http;

mixin ConnectedUserProfile on Model {
  List<Profile> listProfile = [];
}
mixin UserProfileModel on ConnectedUserProfile {
  List<Profile> get lstProfile {
    return listProfile;
  }

  Future<List<Profile>> fetchUserProfile() async {
    print({model.authLogin.access_token});
    notifyListeners();
    List<Profile> _listProfile = [];
    var responses = await Http.get(
        "http://timemanagement-stage.s7.bi-kay.com/api/profile",
        headers: {
          "Authorization": model.authLogin.access_token,
          HttpHeaders.contentTypeHeader: 'application/json',
          "callMethod": "DOCTOR_AVAILABILITY"
        });
    var profileResult = json.decode(responses.body);
    var profileData = profileResult['profile'];
    for (var item in profileData) {
      Profile objProfile = new Profile(
          id: item["id"],
          name: item["name"],
          givenName: item["given_name"],
          khmerName: item["khmer_name"],
          givenKhmerName: item["given_khmer_name"],
          phone: item["phone"],
          email: item["email"],
          employeesId: item["employees_id"],
          employeeGroupsId: item["employee_groups_id"],
          code: item["code"],
          companiesId: item["companies_id"],
          contractActive: item["contract_active"],
          administrator: item["administrator"],
          photoFileName: item["photo_file_name"],
          photoContentType: item["photo_content_type"],
          photoFileSize: item["photo_file_size"],
          photoUpdatedAt: item["photo_updated_at"],
          stringFileName: item["string_file_name"],
          stringContentType: item["string_content_type"],
          stringFileSize: item["string_file_size"],
          stringUpdatedAt: item["string_updated_at"],
          activityId: item["activity_id"],
          login: item["login"],
          status: item["status"],
          ceo: item["ceo"],
          functionId: item["function_id"],
          serviceId: item["service_id"],
          startDate: DateTime.parse(item["start_date"]),
          organizationId: item["organization_id"],
          internalCode: item["internal_code"],
          countryCode: item["country_code"],
          checkManager: item["check_manager"],
          distributeTime: item["distribute_time"],
          pendiingRequest: item["pendiing_request"],
          title: item["title"],
          sendMail: item["send_mail"],
          companyId: item["company_id"],
          adminCompany: item["admin_company"],
          dateLogin: DateTime.parse(item["date_login"]),
          trial251: item["trial251"]);

      _listProfile.add(objProfile);
    }
    listProfile = _listProfile;
    notifyListeners();
    return listProfile;
  }
}
