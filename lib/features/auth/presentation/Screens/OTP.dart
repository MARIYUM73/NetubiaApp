import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/presentation/Screens/UploadingPhotoScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart'; // OTP Input Package

// --- Imports ---
import 'package:flutter_application_1/Core/Constants/app_colors.dart';
import 'package:flutter_application_1/Core/Common/Widgets/primary_button.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    
   // --- OTP Field Styling ---
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 55.w, // Thora lamba kiya taaky shape wazeh ho
      textStyle: TextStyle(
        fontSize: 22.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF000C24), // Dark Container
        
        // --- SHAPE LOGIC (Upar se Gol, Neechay se Seedha) ---
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
          bottomLeft: Radius.circular(4.r), // Thora sa round (Smoothness k liye)
          bottomRight: Radius.circular(4.r),
        ),
        
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
    );

    // Focused State (Cyan Border + Thora Glow effect optional)
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primaryCyan),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
          bottomLeft: Radius.circular(4.r),
          bottomRight: Radius.circular(4.r),
      ),
    );

    // --- 3. SUBMITTED THEME (Filled with Gradient) ---
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        // 1. Gradient (Solid Color ki jagah)
        gradient: const LinearGradient(
          colors: [
            AppColors.primaryCyan, // Start Color (Light)
            AppColors.primaryBlue, // End Color (Dark)
          ],
          begin: Alignment.topCenter,    // Uper se shuru
          end: Alignment.bottomCenter,   // Neechy khatam
        ),
        
        // 2. Shape Logic (Wohi purani wali - Top Rounded)
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
          bottomLeft: Radius.circular(4.r),
          bottomRight: Radius.circular(4.r),
        ),
        
        // 3. Border (Optional: Gradient k sath border usually transparent rakhty hain)
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              // --- 1. Back Button ---
              GestureDetector(
               onTap: () {
                  Navigator.pop(context); // <--- YE RAHA WAPIS JANY KA CODE
                },
                child: Icon(Icons.arrow_back_ios, color: AppColors.whiteText, size: 20.sp),
              ),

              SizedBox(height: 40.h),

              // --- 2. Headings ---
              Text(
                "OTP Verification",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: AppColors.offWhiteText, fontSize: 14.sp, height: 1.5, fontFamily: 'Gilroy'),
                  children: [
                    const TextSpan(text: "Please enter 6-digit code we have sent you on your phone "),
                    TextSpan(
                      text: "+123 456789", // Dynamic number yahan ayega
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              // --- 3. OTP Input Fields (Pinput) ---
              Center(
                child: Pinput(
                  length: 6, // 6 Digits OTP
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  // Keyboard Type
                  keyboardType: TextInputType.number,
                  // Cursor
                  showCursor: true,
                  onCompleted: (pin) => print("OTP Entered: $pin"),
                ),
              ),

              const Spacer(), // Push content down

              // --- 4. Resend Timer ---
              Center(
                child: Text(
                  "Resend in 00:48",
                  style: TextStyle(color: AppColors.offWhiteText, fontSize: 14.sp),
                ),
              ),

              SizedBox(height: 20.h),

              // --- 5. Verify Button ---
              PrimaryButton(
                title: "Continue", // Button text as per image
                onPressed: () {
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UploadPhotoScreen()), );
                },
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}