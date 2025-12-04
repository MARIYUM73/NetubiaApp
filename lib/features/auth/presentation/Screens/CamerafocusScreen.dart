import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/Browser/Presentation/Screens/Browser_Screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// --- Imports ---
import 'package:flutter_application_1/Core/Constants/app_colors.dart';
import 'package:flutter_application_1/Core/Common/Widgets/primary_button.dart';
// Pichli screen se SmallPrimaryButton import karein ya yahan dobara define karein

class UploadPhotoVerificationScreen extends StatefulWidget {
  const UploadPhotoVerificationScreen({super.key});

  @override
  State<UploadPhotoVerificationScreen> createState() => _UploadPhotoVerificationScreenState();
}

class _UploadPhotoVerificationScreenState extends State<UploadPhotoVerificationScreen> {
  // Dynamic Verification Code
  final String verificationCode = "#NET4562";

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

                  // --- 1. Top Bar (Back + Skip) ---
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
                           // Navigate to next step (e.g., Home)
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFF000C24),
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

                  // --- 2. Headings ---
                  Text(
                    "STEP 2",
                    style: TextStyle(
                      color: AppColors.offWhiteText,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Upload Photo for\nVerification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteText,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "For verification you would write the code on the\na piece of paper and hold it up to take a picture.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.offWhiteText,
                      fontSize: 12.sp,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 40.h),


             // --- 3. FRAME AREA (Sirf Camera Icon Inside) ---
                  Container(
                    height: 350.h, // Frame Height
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF000C24), // Darker background
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: Stack(
                      children: [
                        // A. Brackets (Corners)
                        Positioned.fill(
                          child: CustomPaint(
                            painter: CornerBracketsPainter(),
                          ),
                        ),
                        
                        // B. Camera Icon (Center of Frame)
                        Center(
                          child: Icon(Icons.camera_alt, color: Colors.white, size: 50.sp),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // --- 4. CONTENT OUTSIDE FRAME (Code + Upload Button) ---
                  Text(
                    "Verification Code",
                    style: TextStyle(
                      color: AppColors.offWhiteText,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    verificationCode,
                    style: TextStyle(
                      color: AppColors.whiteText,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  
                  SizedBox(height: 20.h),
                  
                  // Upload Button
                  SmallPrimaryButton(
                    title: "UPLOAD PHOTO",
                    onPressed: () {
                      print("Upload Verification Photo Clicked");
                    },
                  ),

                  SizedBox(height: 100.h), // Bottom Spacing for Continue Button
                ],
              ),
            ),
            // --- 4. Continue Button (Fixed at bottom) ---
            Positioned(
              bottom: 30.h,
              left: 24.w,
              right: 24.w,
              child: PrimaryButton(
                title: "Continue",
                onPressed: () {
                   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const DashboardScreen()),  );
                 
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Custom Painter for Corner Brackets ---
class CornerBracketsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final double bracketLength = 30.w;
    final double padding = 20.w;

    // Top-Left Corner
    canvas.drawPath(
      Path()
        ..moveTo(padding, padding + bracketLength)
        ..lineTo(padding, padding)
        ..lineTo(padding + bracketLength, padding),
      paint,
    );

    // Top-Right Corner
    canvas.drawPath(
      Path()
        ..moveTo(size.width - padding - bracketLength, padding)
        ..lineTo(size.width - padding, padding)
        ..lineTo(size.width - padding, padding + bracketLength),
      paint,
    );

    // Bottom-Left Corner
    canvas.drawPath(
      Path()
        ..moveTo(padding, size.height - padding - bracketLength)
        ..lineTo(padding, size.height - padding)
        ..lineTo(padding + bracketLength, size.height - padding),
      paint,
    );

    // Bottom-Right Corner
    canvas.drawPath(
      Path()
        ..moveTo(size.width - padding - bracketLength, size.height - padding)
        ..lineTo(size.width - padding, size.height - padding)
        ..lineTo(size.width - padding, size.height - padding - bracketLength),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}