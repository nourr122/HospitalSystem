class CreateCallModel {
  final String patientName;
  final String doctorId;
  final String age;
  final String phone;
  final String description;

  CreateCallModel({
    required this.patientName,
    required this.doctorId,
    required this.age,
    required this.phone,
    required this.description,
  });
  factory CreateCallModel.fromJson(json){
    return CreateCallModel(
      patientName: json['patient_name'], 
      doctorId: json['doctor_id'], 
      age: json['age'], 
      phone: json['phone'], 
      description: json['description']);
  }
}
