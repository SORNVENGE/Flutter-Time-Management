class ModelTimeLeave {
  int absenceTypeId;
  String dateStart;
  String dateEnd;
  String comment;

  ModelTimeLeave({
    this.absenceTypeId,
    this.dateStart,
    this.dateEnd,
    this.comment,
  });

  factory ModelTimeLeave.fromJson(Map<String, dynamic> json) => ModelTimeLeave(
        absenceTypeId: json["absence_type_id"],
        dateStart: json["date_start"],
        dateEnd: json["date_end"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "absence_type_id": absenceTypeId,
        "date_start": dateStart,
        "date_end": dateEnd,
        "comment": comment,
      };
}
