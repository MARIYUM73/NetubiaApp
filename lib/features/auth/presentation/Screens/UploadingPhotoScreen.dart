import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/presentation/Screens/CamerafocusScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// --- Imports ---
import 'package:flutter_application_1/Core/Constants/app_colors.dart';
import 'package:flutter_application_1/Core/Common/Widgets/primary_button.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({super.key});

  @override
  State<UploadPhotoScreen> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color handled by global theme (Navy Blue)
      body: SafeArea(
        child: Stack(
          children: [
            // --- Scrollable Content ---
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),

                  // --- 1. Custom App Bar (Back + Skip) ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios, color: AppColors.whiteText, size: 20.sp),
                      ),
                      // Skip Button
                      GestureDetector(
                        onTap: () {
                           print("Skip Clicked");
                           // Navigate to next step
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFF000C24), // Darker container
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(color: Colors.white.withOpacity(0.1)),
                          ),
                          child: Text(
                            "Skip",
                            style: TextStyle(color: AppColors.whiteText, fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 50.h),

                  // --- 2. STEP 1 ---
                  Text(
                    "STEP 1",
                    style: TextStyle(
                      color: AppColors.offWhiteText,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // --- 3. Title & Subtitle ---
                  Text(
                    "Upload Photo",
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteText,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Please upload your photo",
                    style: TextStyle(
                      color: AppColors.offWhiteText,
                      fontSize: 14.sp,
                    ),
                  ),

                  SizedBox(height: 40.h),

                  // --- 4. Profile Image Placeholder ---
                  Container(
                    width: 160.w,
                    height: 160.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // Light blue gradient background for placeholder
                      gradient: const LinearGradient(
                        colors: [Color(0xFF89CFF0), Color(0xFF00C6FF)], 
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(color: Colors.white, width: 4.w),
                    ),
                    // Replace with Image.file or Image.network after upload
                    child: Icon(
                      Icons.person,
                      size: 110.sp,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // --- 5. User Info ---
                  Text(
                    "Cooper Lubin", // Dynamic Name
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteText,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "cooper.lubin@example.com", // Dynamic Email
                    style: TextStyle(
                      color: AppColors.offWhiteText,
                      fontSize: 14.sp,
                    ),
                  ),

                  SizedBox(height: 25.h),

                  // --- 6. Small Upload Button ---
                  SmallPrimaryButton(
                    title: "UPLOAD PHOTO",
                    onPressed: () {
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UploadPhotoVerificationScreen()), );
                },
                      // Image Picker logic here
                   
                  ),

                  SizedBox(height: 120.h), // Extra space for bottom button
                ],
              ),
            ),

            // --- 7. Continue Button (Fixed at bottom) ---
            Positioned(
              bottom: 30.h,
              left: 24.w,
              right: 24.w,
              child: PrimaryButton(
                title: "Continue to Step 2",
                onPressed: () {
                  // Navigate to Step 2
                  print("Continue to Step 2 Clicked");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- New Widget: Small Primary Button (For "UPLOAD PHOTO") ---
class SmallPrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SmallPrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Same gradient as PrimaryButton
        gradient: const LinearGradient(
          colors: [AppColors.primaryCyan, AppColors.primaryBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 12.h), // Smaller padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.sp, // Smaller font size
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy',
          ),
        ),
      ),
    );
  }
}