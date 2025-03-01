class AllReports {
  int? status;
  String? message;
  List<Data>? data;

  AllReports({this.status, this.message, this.data});

  AllReports.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? reportName;
  String? createdAt;
  String? status;

  Data({this.id, this.reportName, this.createdAt, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reportName = json['report_name'];
    createdAt = json['created_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['report_name'] = this.reportName;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}