class ReportDetail {
  final int status;
  final String message;
  final Data? data; // استخدام ? لأن البيانات قد تكون غير موجودة

  ReportDetail({required this.status, required this.message, this.data});

  factory ReportDetail.fromJson(Map<String, dynamic> json) {
    return ReportDetail(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class Data {
  final int id;
  final String reportName;
  final String createdAt;
  final String status;
  final String description;
  final String note;
  final User? user;
  final Manager? manager;
  final String answer;

  Data({
    required this.id,
    required this.reportName,
    required this.createdAt,
    required this.status,
    required this.description,
    required this.note,
    this.user,
    this.manager,
    required this.answer,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] ?? 0,
      reportName: json['report_name'] ?? '',
      createdAt: json['created_at'] ?? '',
      status: json['status'] ?? '',
      description: json['description'] ?? '',
      note: json['note'] ?? '',
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      manager: json['manager'] != null ? Manager.fromJson(json['manager']) : null,
      answer: json['answer'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'report_name': reportName,
      'created_at': createdAt,
      'status': status,
      'description': description,
      'note': note,
      'user': user?.toJson(),
      'manger': manager?.toJson(),
      'answer': answer,
    };
  }
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String specialist;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.specialist,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      specialist: json['specialist'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'specialist': specialist,
    };
  }
}

class Manager {
  final int id; // تم تغييرها من String إلى int
  final String firstName;
  final String lastName;
  final String specialist;
  final String updatedAt;

  Manager({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.specialist,
    required this.updatedAt,
  });

  factory Manager.fromJson(Map<String, dynamic> json) {
    return Manager(
      id: json['id'] ?? 0, // تحويلها إلى int
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      specialist: json['specialist'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'specialist': specialist,
      'updated_at': updatedAt,
    };
  }
}