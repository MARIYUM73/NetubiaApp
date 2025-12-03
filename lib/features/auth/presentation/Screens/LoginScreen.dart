import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// --- Imports ---
import 'package:flutter_application_1/Core/Constants/app_colors.dart';
import 'package:flutter_application_1/Core/Constants/app_strings.dart';
import 'package:flutter_application_1/Core/Common/Widgets/primary_button.dart';
import 'package:flutter_application_1/Core/Common/Widgets/Custom_textfield.dart'; 
// Apna naya widget
import 'package:country_code_picker/country_code_picker.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Password show/hide k liye variable
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor, // #021232
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),

              // --- 1. Logo (Center Aligned) ---
              Center(
                child: SvgPicture.asset(
                  AppImages.appLogo,
                  width: 150.w,
                  height: 50.h,
                ),
              ),

              SizedBox(height: 50.h),

              // --- 2. Headings ---
              Text(
                "Login",
                style: TextStyle(
                  color: AppColors.whiteText,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Welcome back! You've been missed!",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 30.h),

              // --- 3. Mobile Number Input ---
              // Design ma Country flag + Code hai
            // --- 3. Mobile Number Input (Dynamic Country Picker) ---
             // --- 3. Mobile Number Input (FIXED) ---
              CustomTextField(
                hintText: "Mobile Number",
                // FIX 1: prefixIcon k andar Container laga kar width fix ki
                // Taaky "RenderFlex Overflow" na aye.
                prefixIcon: Container(
                  width: 115.w, // Fixed width for Flag+Code area
                  padding: EdgeInsets.only(left: 10.w),
                  alignment: Alignment.centerLeft,
                  child: CountryCodePicker(
                    onChanged: (country) {
                      print("Selected: ${country.dialCode}");
                    },
                    initialSelection: 'US',
                    favorite: const ['+1', 'US', 'PK'],
                    
                    // Search Box Style
                    searchDecoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search Country",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    dialogTextStyle: const TextStyle(color: Colors.black),
                    dialogBackgroundColor: Colors.white,

                    // Custom Flag Builder
                    builder: (countryCode) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Flag
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            clipBehavior: Clip.hardEdge,
                            // Note: Agar Image error aye to App STOP kr k chalayen
                            child: Image.asset(
                              countryCode!.flagUri!,
                              package: 'country_code_picker', 
                              width: 24.w,
                              height: 18.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          // Arrow
                          Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18.sp),
                          SizedBox(width: 6.w),
                          // Code (+1)
                          Text(
                            countryCode.dialCode!,
                            style: TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                          SizedBox(width: 10.w),
                          // Divider Line
                          Container(
                            height: 20.h,
                            width: 1,
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 15.h),

              // --- 4. Password Input ---
              CustomTextField(
                hintText: "Password",
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),

              // --- 5. Forgot Password ---
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // --- 6. Login Button ---
              PrimaryButton(
                title: "Login",
                onPressed: () {
                  print("Login Clicked");
                },
              ),

              SizedBox(height: 30.h),

              // --- 7. Divider (Or continue with) ---
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.withOpacity(0.3))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text("Or continue with", style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                  ),
                  Expanded(child: Divider(color: Colors.grey.withOpacity(0.3))),
                ],
              ),

              SizedBox(height: 30.h),

              // --- 8. Social Media Buttons ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSocialButton(AppImages.google), // Google
                  _buildSocialButton(AppImages.apple),        // Apple
                  _buildSocialButton(AppImages.facebook),     // Facebook
                ],
              ),

              SizedBox(height: 40.h),

              // --- 9. Register Text ---
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Not a member? ",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    children: [
                      TextSpan(
                        text: "Register Yourself",
                        style: TextStyle(
                          color: AppColors.primaryCyan, // Cyan color highlight
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20.h), // Bottom Safe Area
            ],
          ),
        ),
      ),
    );
  }

  // Social Button Helper Method (Local Widget)
 // Social Button Helper Method
  Widget _buildSocialButton(String assetPath) {
    return Container(
      // 1. Container Dimensions from Design
      width: 60.w,  
      height: 60.h,
      
      // 2. Icon ko Center karne k liye zaroori hai
      alignment: Alignment.center, 
      
      decoration: BoxDecoration(
        color: const Color(0xFF000C24), // Hex code from design
        
        // 3. Radius from Design (18px)
        borderRadius: BorderRadius.circular(18.r),
        
        // Subtle border styling
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      
      // 4. SVG Icon Logic
      child: SvgPicture.asset(
        assetPath,
        // Icon ka size Container se chota hona chahiye taaky wo center ma acha lagay.
        // Design visual ma icon container ka 40-50% hai.
        width: 28.w, 
        height: 28.h,

        fit: BoxFit.contain, // Icon shape maintain rahy
      ),
    );
  }
}