class CardModel{
  final int id;
  final String patientName;
  final String createdAt;
  final String status;

  CardModel({required this.id, required this.patientName, required this.createdAt, required this.status}); 
  
  factory CardModel.fromJson(json){
    return CardModel(
      id: json['id'],
      patientName: json['patient_name'], 
      createdAt: json['created_at'], 
      status: json['status']);
  }
}
