class UserModel {
  final int id;
  final int status;
  final String token;
  final String? firstName;
  final String? lastName;
  final String email;

  UserModel({required this.id, required this.status, required this.token,required this.firstName, required this.lastName, required this.email});


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? 0,
      status: json["status"],
      token:json["data"]?["access_token"] ?? "",
      firstName: json["data"]?["first_name"] ?? "",
      lastName: json["data"]?["last_name"] ?? "",
      email: json["data"]?["email"] ?? "",
    );
  }
}
