class NotificationModel {
  final String userName;
  final String photoUrl;
  final String description;
  final String time;
  final bool isNew;

  NotificationModel({
    required this.userName,
    required this.photoUrl,
    required this.description,
    required this.time,
    required this.isNew,
  });
}