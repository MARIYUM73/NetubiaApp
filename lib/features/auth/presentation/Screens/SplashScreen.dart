import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // SVG Package
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ScreenUtil Package

// --- Imports from Core (Make sure paths are correct) ---
import 'package:flutter_application_1/Core/Constants/app_colors.dart';
import 'package:flutter_application_1/Core/Constants/app_strings.dart'; // Image Strings yahan honi chahiyen
import 'package:flutter_application_1/Core/Common/Widgets/primary_button.dart';
import 'LoginScreen.dart'; // Login Screen k liye

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Note: Ab humein MediaQuery.of(context) ki zaroorat nahi, 
    // kyunke hum ScreenUtil (.h, .w) use kar rahy hain.

    return Scaffold(
      backgroundColor: Colors.transparent, 
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // 1. Background Gradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.bgcolor, AppColors.bgcolor],
          ),
        ),
        child: Column(
          // CrossAxisAlignment.center se Logo horizontally center ho jayega 
          // (Jo design ma Left: 64px calculate ho raha tha)
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            
            // --- 2. Top Spacing (Layout: Top 363px) ---
            SizedBox(height: 363.h), 

            // --- 3. Logo (Layout: W 246px, H 64px) ---
            SvgPicture.asset(
              AppImages.appLogo,
              width: 246.w, 
              height: 64.h,
              fit: BoxFit.contain,
            ),
            
            // Spacer: Ye bachi hui jagah le lega aur button ko neechy push karega
            const Spacer(), 

            // --- 4. Button ---
            // Horizontal Padding 24px (Responsive)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: PrimaryButton(
                title: "Get Started", 
                onPressed: () {
                  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
                },
              ),
            ),
            
            // --- 5. Bottom Spacing ---
            // Neechy se thora gap (approx 40-50px achi lagti ha)
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}