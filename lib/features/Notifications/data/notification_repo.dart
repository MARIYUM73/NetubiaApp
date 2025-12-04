// Model import karein (Relative path check kar lein)
import '../domain/notification_model.dart'; 

class NotificationRepository {
  
  // Ye function "Today" ka data return karega
  static List<NotificationModel> getTodayNotifications() {
    return [
      NotificationModel(
        name: "Charlie Gouse",
        message: "Lorem Ipsum is simply dummy text of the printing.",
        time: "02:56am",
        isVerified: true,
        image: "assets/images/profile1.png",
      ),
      NotificationModel(
        name: "Ruben Geidt",
        message: "Lorem Ipsum is simply dummy text of the printing.",
        time: "01:36am",
        isVerified: true,
        image: "assets/images/profile2.png",
      ),
      NotificationModel(
        name: "Abram Westervelt",
        message: "Lorem Ipsum is simply dummy text industry.",
        time: "22 June, 2023",
        isVerified: true,
        image: "assets/images/profile3.png",
      ),
    ];
  }

  // Ye function "Older" ka data return karega
  static List<NotificationModel> getOlderNotifications() {
    return [
      NotificationModel(
        name: "Zain Baptista",
        message: "Lorem Ipsum is simply dummy text.",
        time: "18 June, 2023",
        isVerified: true,
        image: "assets/images/profile4.png",
      ),
      NotificationModel(
        name: "Zaire Bator",
        message: "Lorem Ipsum is simply dummy text.",
        time: "14 June, 2023",
        isVerified: true,
        image: "assets/images/profile5.png",
      ),
    ];
  }
}