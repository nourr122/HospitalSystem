/*class NurseModel {
  final String name;
  final String speciality;
   String image;
   bool isOnline;

    NurseModel({
    required this.name,
    required this.speciality,
    required this.image,
    required this.isOnline,
  });
}*/
//قمت بعمل model ولكن لن نستفيد به باى معلومات لانه فارغ

class NurseModel {
  int? status;
  String? message;

  NurseModel({this.status, this.message});

  NurseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

