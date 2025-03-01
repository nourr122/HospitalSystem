class CaseShow {
  int? status;
  String? message;
  List<CaseModel>? data;

  CaseShow({this.status, this.message, this.data});

  factory CaseShow.fromJson(Map<String, dynamic> json) {
    return CaseShow(
      status: json['status'] ?? 0,
      message: json['message'] ?? "",
      data: json['data'] != null
          ? List<CaseModel>.from(json['data'].map((v) => CaseModel.fromJson(v)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((v) => v.toJson()).toList(),
  };
}

class CaseModel {
  int? id;
  String? patientName;
  String? createdAt;
  String? doctorId;
  int? docId;
  String? nurseId;
  String? analysisId;
  String? status;
  String? caseStatus;
  String? age;
  String? phone;
  String? description;
  String? bloodPressure;
  String? sugarAnalysis;
  String? measurementNote;
  String? image;
  String? medicalRecordNote;

  CaseModel({
    this.id,
    this.patientName,
    this.createdAt,
    this.doctorId,
    this.docId,
    this.nurseId,
    this.analysisId,
    this.status,
    this.caseStatus,
    this.age,
    this.phone,
    this.description,
    this.bloodPressure,
    this.sugarAnalysis,
    this.measurementNote,
    this.image,
    this.medicalRecordNote,
  });

  factory CaseModel.fromJson(Map<String, dynamic> json) {
    return CaseModel(
      id: json['id'] ?? 0,
      patientName: json['patient_name'] ?? "",
      createdAt: json['created_at'] ?? "",
      doctorId: json['doctor_id'] ?? "",
      docId: json['doc_id'] ?? 0,
      nurseId: json['nurse_id'] ?? "",
      analysisId: json['analysis_id'] ?? "",
      status: json['status'] ?? "",
      caseStatus: json['case_status'] ?? "",
      age: json['age'] ?? "",
      phone: json['phone'] ?? "",
      description: json['description'] ?? "",
      bloodPressure: json['blood_pressure'] ?? "",
      sugarAnalysis: json['sugar_analysis'] ?? "",
      measurementNote: json['measurement_note'] ?? "",
      image: json['image'] ?? "",
      medicalRecordNote: json['medical_record_note'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'patient_name': patientName,
    'created_at': createdAt,
    'doctor_id': doctorId,
    'doc_id': docId,
    'nurse_id': nurseId,
    'analysis_id': analysisId,
    'status': status,
    'case_status': caseStatus,
    'age': age,
    'phone': phone,
    'description': description,
    'blood_pressure': bloodPressure,
    'sugar_analysis': sugarAnalysis,
    'measurement_note': measurementNote,
    'image': image,
    'medical_record_note': medicalRecordNote,
  };
}
