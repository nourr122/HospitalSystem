class DoctorModel {
  final int id;
  final String firstName;
  final String type;
   final String image;
   final bool? isOnline; 

  DoctorModel({
    required this.id,
    required this.firstName,
    required this.type,
    required this.image,
    this.isOnline,
  });
  factory DoctorModel.fromJson(json){
    return DoctorModel(
      id: json['id'],
      firstName: json['first_name'], 
      type: json['type'], 
     image: json['avatar'], 
      );
  }
}
