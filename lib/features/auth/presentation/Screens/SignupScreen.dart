import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/presentation/Screens/PasswordScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// --- Imports ---
import 'package:flutter_application_1/Core/Constants/app_colors.dart';
import 'package:flutter_application_1/Core/Constants/app_strings.dart';
import 'package:flutter_application_1/Core/Common/Widgets/primary_button.dart';
import 'package:flutter_application_1/Core/Common/Widgets/Custom_textfield.dart';

class RegisterScreen extends StatefulWidget { // <--- Changed from RegisterPage
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Checkbox variable
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background Global Theme se ayega
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),

              // --- 1. Logo ---
              Center(
                child: SvgPicture.asset(
                  AppImages.appLogo,
                  width: 150.w,
                  height: 50.h,
                ),
              ),

              SizedBox(height: 40.h),

              // --- 2. Headings ---
              Text(
                "Register Yourself",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold, // Global White Text
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Please fill up the form to register",
                style: TextStyle(
                  color: AppColors.offWhiteText, // Global OffWhite
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 30.h),

              // --- 3. First Name & Last Name (Row) ---
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(hintText: "First name"),
                  ),
                  SizedBox(width: 15.w), // Beech ma gap
                  Expanded(
                    child: CustomTextField(hintText: "Last name"),
                  ),
                ],
              ),

              SizedBox(height: 15.h),

              // --- 4. Referral Code ---
              const CustomTextField(hintText: "Referral Code"),

              SizedBox(height: 15.h),

              // --- 5. Chattag Name (With Icon) ---
              CustomTextField(
                hintText: "Chattag name",
                // Info Icon
                suffixIcon: Icon(
                  Icons.info_outline,
                  color: AppColors.offWhiteText,
                  size: 20.sp,
                ),
              ),

              SizedBox(height: 15.h),

              // --- 6. Email Address ---
              const CustomTextField(hintText: "Email Address"),

              SizedBox(height: 20.h),

              // --- 7. Terms Checkbox ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.center, // Top align text k liye
                children: [
                  // Custom Theme Checkbox
                  SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: Checkbox(
                      value: _agreeToTerms,
                      activeColor: AppColors.primaryCyan, // Cyan Checkbox
                      side: BorderSide(color: AppColors.offWhiteText, width: 1.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                      onChanged: (value) {
                        setState(() {
                          _agreeToTerms = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  
                  // Text
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: AppColors.offWhiteText, 
                          fontSize: 11.sp,
                          fontFamily: 'Gilroy',
                          height: 1.2
                        ),
                        children: [
                          const TextSpan(text: "Agree to Netubia "),
                          TextSpan(
                            text: "Terms and Conditions & Privacy Policy",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              // --- 8. Register Button ---
              PrimaryButton(
                title: "Register",
                onPressed: () {

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SetPasswordScreen()), );
                },
              ),

              SizedBox(height: 30.h),

              // --- 9. Already a member? Login ---
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigate Back to Login
                    Navigator.pop(context);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already a member? ",
                      style: TextStyle(
                        color: AppColors.offWhiteText, 
                        fontSize: 14.sp, 
                        fontFamily: 'Gilroy'
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: AppColors.primaryCyan, // Blue Highlight
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}