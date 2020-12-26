class ModelAbsenceType {
  int id;
  String name;
  String description;
  String option;

  ModelAbsenceType({
    this.id,
    this.name,
    this.description,
    this.option,
  });

  factory ModelAbsenceType.fromJson(Map<String, dynamic> json) => ModelAbsenceType(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        option: json["option"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "option": option,
      };
}
