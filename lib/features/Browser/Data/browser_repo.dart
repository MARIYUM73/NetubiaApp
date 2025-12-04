import '../Domain/browser_items_model.dart';

class DashboardRepository {
  static List<DashboardItemModel> getSocialApps() {
    return [
      DashboardItemModel(name: "Facebook", iconPath: "assets/images/F.svg"),
      DashboardItemModel(name: "Instagram", iconPath: "assets/images/insta.svg"),
      DashboardItemModel(name: "Twitter", iconPath: "assets/images/twitter.svg"),
      DashboardItemModel(name: "Pinterest", iconPath: "assets/images/pintrest.svg"),
      // Duplicate items to match the grid in design
      DashboardItemModel(name: "Facebook", iconPath: "assets/images/F.svg"),
      DashboardItemModel(name: "Instagram", iconPath: "assets/images/insta.svg"),
      DashboardItemModel(name: "Twitter", iconPath: "assets/images/twitter.svg"),
      DashboardItemModel(name: "Pinterest", iconPath: "assets/images/pintrest.svg"),
    ];
  }
}