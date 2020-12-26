class ModelTaskByProject {
  int id;
  String name;
  String subname;
  int totalHour;
  String startDate;
  String endDate;
  int projectId;

  ModelTaskByProject({
    this.id,
    this.name,
    this.subname,
    this.totalHour,
    this.startDate,
    this.endDate,
    this.projectId,
  });

  factory ModelTaskByProject.fromJson(Map<String, dynamic> json) =>
      ModelTaskByProject(
        id: json["id"],
        name: json["name"],
        subname: json["subname"],
        totalHour: json["total_hour"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        projectId: json["project_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "subname": subname,
        "total_hour": totalHour,
        "start_date": startDate,
        "end_date": endDate,
        "project_id": projectId,
      };
}
