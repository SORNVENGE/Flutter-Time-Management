class ModelFetchTimesheet {
  int id;
  String dates;
  int projectId;
  int taskId;
  String numberTime;
  Project project;
  Task task;

  ModelFetchTimesheet({
    this.id,
    this.dates,
    this.projectId,
    this.taskId,
    this.numberTime,
    this.project,
    this.task,
  });

  factory ModelFetchTimesheet.fromJson(Map<String, dynamic> json) =>
      ModelFetchTimesheet(
        id: json["id"],
        dates: json["dates"],
        projectId: json["project_id"],
        taskId: json["task_id"],
        numberTime: json["number_time"],
        project: Project.fromJson(json["project"]),
        task: Task.fromJson(json["task"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dates": dates,
        "project_id": projectId,
        "task_id": taskId,
        "number_time": numberTime,
        "project": project.toJson(),
        "task": task.toJson(),
      };
}

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

class Task {
  int id;
  String name;

  Task({
    this.id,
    this.name,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
