import 'dart:convert';

ModelFetchLeaveAbsenc modelFetchLeaveAbsencFromJson(String str) =>
    ModelFetchLeaveAbsenc.fromJson(json.decode(str));

String modelFetchLeaveAbsencToJson(ModelFetchLeaveAbsenc data) =>
    json.encode(data.toJson());

class ModelFetchLeaveAbsenc {
  ModelFetchLeaveAbsenc({
    this.id,
    this.status,
    this.dateStart,
    this.dateEnd,
    this.employeeId,
    this.absenceTypeId,
    this.absenceType,
  });

  int id;
  String status;
  String dateStart;
  String dateEnd;
  int employeeId;
  int absenceTypeId;
  AbsenceType absenceType;

  factory ModelFetchLeaveAbsenc.fromJson(Map<String, dynamic> json) =>
      ModelFetchLeaveAbsenc(
        id: json["id"],
        status: json["status"],
        dateStart: json["date_start"],
        dateEnd: json["date_end"],
        employeeId: json["employee_id"],
        absenceTypeId: json["absence_type_id"],
        absenceType: AbsenceType.fromJson(json["absence_type"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "date_start": dateStart,
        "date_end": dateEnd,
        "employee_id": employeeId,
        "absence_type_id": absenceTypeId,
        "absence_type": absenceType.toJson(),
      };
}

class AbsenceType {
  AbsenceType({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory AbsenceType.fromJson(Map<String, dynamic> json) => AbsenceType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
