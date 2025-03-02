enum UserType { doctor, hr, receptionist, analysis, manager, nurse }

class UserModel {
  final int? id;
  final String firstName;
  final String lastName;
  final String mobile;
  final String email;
  final String gender;
  final String status;
  final String specialist;
  final UserType type;
  final String birthday;
  final String address;

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.email,
    required this.gender,
    required this.status,
    required this.specialist,
    required this.type,
    required this.birthday,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      mobile: json['mobile'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      status: json['status'] as String,
      specialist: json['specialist'] as String,
      type: UserTypeExtension.fromString(json['type'] as String),
      birthday: json['birthday'] as String,
      address: json['address'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "mobile": mobile,
      "email": email,
      "gender": gender,
      "status": status,
      "specialist": specialist,
      "type": type.toJson(),
      "birthday": birthday,
      "address": address,
    };
  }
}

extension UserTypeExtension on UserType {
  static UserType fromString(String type) {
    switch (type.toLowerCase()) {
      case 'doctor':
      case 'docotr':
        return UserType.doctor;
      case 'hr':
        return UserType.hr;
      case 'receptionist':
        return UserType.receptionist;
      case 'analysis':
        return UserType.analysis;
      case 'manager':
      case 'manger':
        return UserType.manager;
      case 'nurse':
        return UserType.nurse;
      default:
        throw ArgumentError('Invalid user type: $type');
    }
  }

  String toJson() {
    return name;
  }
}
