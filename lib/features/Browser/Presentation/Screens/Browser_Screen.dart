import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/Browser/Presentation/Screens/Profile_link_screen.dart';
import 'package:flutter_application_1/features/Browser/Presentation/Screens/Search_chat.dart';
import 'package:flutter_application_1/features/Messages/presentation/Screens/messagesScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// --- Imports ---
import 'package:flutter_application_1/Core/Constants/app_colors.dart';
import '../../Domain/browser_items_model.dart';
import '../../Data/browser_repo.dart';
import 'package:flutter_application_1/Core/Constants/app_strings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<DashboardItemModel> socialApps;
  int _selectedIndex = 0; // Bottom Nav Selection

  @override
  void initState() {
    super.initState();
    socialApps = DashboardRepository.getSocialApps();
  }

// Screens list for navigation
final List<Widget> _screens = [
  DashboardScreen(),      // index 0
  MessagesScreen(),     // index 1
 // AddChatScreen(),      // index 2
 // ProfileScreen(),      // index 3
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom Bottom Bar with FAB location
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: 60.w,
          height: 60.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [AppColors.primaryCyan, AppColors.primaryBlue]),
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(),
      
      body: SafeArea(
        child: SingleChildScrollView( 
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),

                // --- 1. Top Logo ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    SvgPicture.asset(
                      AppImages.appLogo, // Make sure AppImages class exists
                      width: 212.w, 
                      height: 54.h,
                      fit: BoxFit.contain,
                    ), 
                  ],
                ),

                SizedBox(height: 30.h),

                // --- 2. Action Buttons ---
                Row(
                  children: [
                    Expanded(child: _buildGradientCard(icon: Icons.person_search, label: "Search User's Chat",// --- Navigation Logic ---
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchUserChatScreen(),
                          ),
                        );
                      },)),
                    SizedBox(width: 15.w),
                    Expanded(child: _buildGradientCard(icon: Icons.language, label: "Link your Profile", onTap: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LinkProfile(),
                          ),
                        );
                      // Add navigation or action here
                    })),
                  ],
                ),

                SizedBox(height: 30.h),

                // --- 3. Grid of Apps ---
                GridView.builder(
                  shrinkWrap: true, // Important for scrolling inside Column
                  physics: const NeverScrollableScrollPhysics(), // Important
                  itemCount: socialApps.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, 
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 20.h,
                    childAspectRatio: 0.7, 
                  ),
                  itemBuilder: (context, index) {
                    final app = socialApps[index];
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: const Color(0xFF000C24),
                            borderRadius: BorderRadius.circular(18.r),
                            border: Border.all(color: Colors.white.withOpacity(0.05)),
                          ),
                          child: SvgPicture.asset(
                            app.iconPath,
                            width: 24.w,
                            height: 24.w,
                            // colorFilter removed to show original colors
                          ), 
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          app.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.offWhiteText, fontSize: 10.sp),
                        ),
                      ],
                    );
                  },
                ),
                
                // Bottom padding
                SizedBox(height: 80.h), 
              ],
            ),
          ),
        ),
      ),
    );
  }

// --- Helper: Gradient Card (Clickable) ---
  Widget _buildGradientCard({
    required IconData icon, 
    required String label, 
    required VoidCallback onTap, // <--- Naya Parameter added
  }) {
    return GestureDetector( // <--- Wrap kiya taaky click ho saky
      onTap: onTap,
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primaryCyan, AppColors.primaryBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [ // Optional: Thora shadow for button feel
            BoxShadow(
              color: AppColors.primaryBlue.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 24.sp),
            SizedBox(height: 5.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }

 // --- Helper: Custom Bottom Nav Bar (FIXED HEIGHT) ---
  Widget _buildBottomNavBar() {
    return BottomAppBar(
      color: Colors.transparent, 
      elevation: 0,
      shape: const CircularNotchedRectangle(), 
      notchMargin: 6.0, // Notch margin thora kam kiya (8 -> 6)
      child: Container(
        // Height wapis normal ki (60.h) taaky ziada bara na lagy
        height: 60.h, 
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: const Color(0xFF000C24), 
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Icons
            _buildNavItem("assets/images/browser.svg", "Browser", 0),
            _buildNavItem("assets/images/message.svg", "Messages", 1, badge: "9+"),
            
            // Middle Space (FAB)
            SizedBox(width: 40.w), 
            
            // Right Icons
            _buildNavItem(AppImages.chat, "Add Chat", 2),
            _buildNavItem(AppImages.profile, "Profile", 3),
          ],
        ),
      ),
    );
  }

  // --- Updated Helper: Nav Item ---
  Widget _buildNavItem(String iconPath, String label, int index, {String? badge}) {
    final isSelected = _selectedIndex == index;
    
    return GestureDetector(
     onTap: () {
      setState(() => _selectedIndex = index);   // color update
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => _screens[index]),
      );                                        // navigate
    },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          // 1. Icon Stack
          Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 20.w, 
                height: 20.w,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.primaryCyan : Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              if (badge != null)
                Positioned(
                  right: -6,
                  top: -6,
                  child: Container(
                    padding: EdgeInsets.all(3.w),
                    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    child: Text(badge, style: TextStyle(color: Colors.white, fontSize: 7.sp, fontWeight: FontWeight.bold)),
                  ),
                )
            ],
          ),
          
          SizedBox(height: 3.h), 
          
         
        ],
      ),
    );
  }
}