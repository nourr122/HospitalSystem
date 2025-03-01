class CallDetailsModel {
  final int id;
  final String createdAt;
  final String doctorId;
  final String description;

  CallDetailsModel({required this.id ,required this.createdAt, required this.doctorId, required this.description});
  
  factory CallDetailsModel.fromJson(json){
    return CallDetailsModel(
      id: json['id'],
      createdAt: json['created_at'], 
      doctorId: json['doctor_id'], 
      description: json['description']);
  }
}