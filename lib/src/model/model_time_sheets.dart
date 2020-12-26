class Project {
  int id;
  String project;
  String projectType;

  Project({
    this.id,
    this.project,
    this.projectType,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        project: json["project"],
        projectType: json["project_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "project": project,
        "project_type": projectType,
      };
}

class Timesheet {
  int id;
  int projectId;
  String dates;
  List<Task> tasks;
  int taskId;
  String numberTime;
  Project project;
  Task taskObj;

  Timesheet(
      {this.id,
      this.projectId,
      this.dates,
      this.tasks,
      this.taskId,
      this.numberTime,
      this.project,
      this.taskObj});

  factory Timesheet.GetTimesSheet(Map<String, dynamic> json) => Timesheet(
      id: json["id"],
      dates: json["dates"],
      projectId: json["project_id"],
      taskId: json["task_id"],
      numberTime: json["number_time"],
      project: Project.fromJson(json["project"]),
      taskObj: Task.fromJson(json["task"]));

  timeSheetToJson() =>
      {'project_id': projectId, 'dates': dates, 'tasks': tasks};

  factory Timesheet.fromJson(Map<String, dynamic> json) => Timesheet(
        projectId: json["project_id"],
        dates: json["dates"],
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "project_id": projectId,
        "dates": dates,
        "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
      };
}

class Task {
  int taskId;
  int numberTime;

  Task({this.taskId, this.numberTime});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        taskId: json["task_id"],
        numberTime: json["number_time"],
      );

  toJson() => {
        "task_id": taskId,
        "number_time": numberTime,
      };
}
