class DashboardItemModel {
  final String name;
  final String iconPath; // SVG ya Image ka path
  final String url; // Click karne par kahan jayega (Optional)

  DashboardItemModel({
    required this.name,
    required this.iconPath,
    this.url = '',
  });
}