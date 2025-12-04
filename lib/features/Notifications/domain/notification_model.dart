class NotificationModel {
  final String name;
  final String message;
  final String time;
  final bool isVerified;
  final String image;

  // Constructor
  NotificationModel({
    required this.name,
    required this.message,
    required this.time,
    required this.isVerified,
    required this.image,
  });
}