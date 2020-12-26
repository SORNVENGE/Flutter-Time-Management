class Profile {
  int id;
  String name;
  String givenName;
  String khmerName;
  String givenKhmerName;
  String phone;
  String email;
  dynamic employeesId;
  int employeeGroupsId;
  String code;
  dynamic companiesId;
  dynamic contractActive;
  dynamic administrator;
  dynamic photoFileName;
  dynamic photoContentType;
  dynamic photoFileSize;
  dynamic photoUpdatedAt;
  dynamic stringFileName;
  dynamic stringContentType;
  dynamic stringFileSize;
  dynamic stringUpdatedAt;
  dynamic activityId;
  String login;
  dynamic status;
  dynamic ceo;
  int functionId;
  dynamic serviceId;
  DateTime startDate;
  int organizationId;
  String internalCode;
  String countryCode;
  int checkManager;
  String distributeTime;
  dynamic pendiingRequest;
  String title;
  int sendMail;
  int companyId;
  dynamic adminCompany;
  DateTime dateLogin;
  String trial251;

  Profile({
    this.id,
    this.name,
    this.givenName,
    this.khmerName,
    this.givenKhmerName,
    this.phone,
    this.email,
    this.employeesId,
    this.employeeGroupsId,
    this.code,
    this.companiesId,
    this.contractActive,
    this.administrator,
    this.photoFileName,
    this.photoContentType,
    this.photoFileSize,
    this.photoUpdatedAt,
    this.stringFileName,
    this.stringContentType,
    this.stringFileSize,
    this.stringUpdatedAt,
    this.activityId,
    this.login,
    this.status,
    this.ceo,
    this.functionId,
    this.serviceId,
    this.startDate,
    this.organizationId,
    this.internalCode,
    this.countryCode,
    this.checkManager,
    this.distributeTime,
    this.pendiingRequest,
    this.title,
    this.sendMail,
    this.companyId,
    this.adminCompany,
    this.dateLogin,
    this.trial251,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        givenName: json["given_name"],
        khmerName: json["khmer_name"],
        givenKhmerName: json["given_khmer_name"],
        phone: json["phone"],
        email: json["email"],
        employeesId: json["employees_id"],
        employeeGroupsId: json["employee_groups_id"],
        code: json["code"],
        companiesId: json["companies_id"],
        contractActive: json["contract_active"],
        administrator: json["administrator"],
        photoFileName: json["photo_file_name"],
        photoContentType: json["photo_content_type"],
        photoFileSize: json["photo_file_size"],
        photoUpdatedAt: json["photo_updated_at"],
        stringFileName: json["string_file_name"],
        stringContentType: json["string_content_type"],
        stringFileSize: json["string_file_size"],
        stringUpdatedAt: json["string_updated_at"],
        activityId: json["activity_id"],
        login: json["login"],
        status: json["status"],
        ceo: json["ceo"],
        functionId: json["function_id"],
        serviceId: json["service_id"],
        startDate: DateTime.parse(json["start_date"]),
        organizationId: json["organization_id"],
        internalCode: json["internal_code"],
        countryCode: json["country_code"],
        checkManager: json["check_manager"],
        distributeTime: json["distribute_time"],
        pendiingRequest: json["pendiing_request"],
        title: json["title"],
        sendMail: json["send_mail"],
        companyId: json["company_id"],
        adminCompany: json["admin_company"],
        dateLogin: DateTime.parse(json["date_login"]),
        trial251: json["trial251"],
      );
}
