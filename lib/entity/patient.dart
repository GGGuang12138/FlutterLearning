class PatientPagesListResponseEntity {
    double patientId;
    String patientName;
    int patientGender;
    int patientWard;
    int patientBed;
    DateTime patientDate;
    String patientContent;
    int isReaded;


    PatientPagesListResponseEntity({
        this.patientId,
        this.patientName,
        this.patientGender,
        this.patientWard,
        this.patientBed,
        this.patientDate,
        this.patientContent,
        this.isReaded,
    });

    factory PatientPagesListResponseEntity.fromJson(Map<String, dynamic> json) => PatientPagesListResponseEntity(
        patientId: json["patientId"].toDouble(),
        patientName: json["patientName"],
        patientGender: json["patientGender"],
        patientWard: json["patientWard"],
        patientBed: json["patientBed"],
        patientDate: DateTime.parse(json["patientDate"]),
        patientContent: json["patientContent"],
        isReaded: json["isReaded"],
    );

    Map<String, dynamic> toJson() => {
        "patientId": patientId,
        "patientName": patientName,
        "patientGender": patientGender,
        "patientWard": patientWard,
        "patientBed": patientBed,
        "patientDate": "${patientDate.year.toString().padLeft(4, '0')}-${patientDate.month.toString().padLeft(2, '0')}-${patientDate.day.toString().padLeft(2, '0')}",
        "patientContent": patientContent,
        "isReaded": isReaded,
    };
}